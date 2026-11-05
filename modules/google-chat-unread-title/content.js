// Google Chat reports its unread count with navigator.setAppBadge(), which
// Chrome doesn't show on Linux. This script runs in the page before Chat's
// own scripts, catches the count and puts it in front of the title of the
// top frame as "(3) ", which window lists can read. Without a number
// (setAppBadge() as plain flag) the title shows "(1) ".
(() => {
  const prefix = /^\(\d+\) /;
  const titleProperty = Object.getOwnPropertyDescriptor(Document.prototype, "title");
  let count = 0;

  // The document whose title the window shows: the top frame, if Chat
  // calls setAppBadge from a frame of the same origin.
  const topDocument = () => {
    try {
      return window.top.document;
    } catch {
      return document;
    }
  };

  const decorate = (title) => {
    const plain = title.replace(prefix, "");
    return count > 0 ? `(${count}) ${plain}` : plain;
  };

  const apply = (doc) => {
    const current = titleProperty.get.call(doc);
    const wanted = decorate(current);
    if (current !== wanted) titleProperty.set.call(doc, wanted);
  };

  const setCount = (value) => {
    count = value;
    const doc = topDocument();
    // Share the count with the top frame's copy of this script, which keeps
    // the prefix when Chat changes the title there.
    try {
      window.top.postMessage({googleChatUnreadTitle: value}, location.origin);
    } catch {
      // A cross-origin top frame gets no message.
    }
    apply(doc);
  };

  for (const [name, countOf] of [
    ["setAppBadge", (args) => (args[0] === undefined ? 1 : Number(args[0]))],
    ["clearAppBadge", () => 0],
  ]) {
    const original = Navigator.prototype[name];
    if (!original) continue;
    Navigator.prototype[name] = function (...args) {
      setCount(countOf(args));
      return original.apply(this, args);
    };
  }

  if (window !== window.top) return;

  window.addEventListener("message", (event) => {
    if (event.origin === location.origin && typeof event.data?.googleChatUnreadTitle === "number") {
      count = event.data.googleChatUnreadTitle;
      apply(document);
    }
  });

  // Chat sets its title through document.title: getter without, setter with
  // the prefix, so Chat itself never sees it.
  Object.defineProperty(document, "title", {
    configurable: true,
    get() {
      return titleProperty.get.call(this).replace(prefix, "");
    },
    set(value) {
      titleProperty.set.call(this, decorate(String(value)));
    },
  });

  // Titles changed in the <title> element directly get the prefix too. Only
  // <head> is watched, Chat changes the rest of the page all the time; at
  // document_start it may not exist yet.
  const watchHead = () =>
    new MutationObserver(() => apply(document)).observe(document.head, {
      subtree: true,
      childList: true,
      characterData: true,
    });
  if (document.head) {
    watchHead();
  } else {
    new MutationObserver((_, observer) => {
      if (!document.head) return;
      observer.disconnect();
      watchHead();
    }).observe(document, {subtree: true, childList: true});
  }
})();
