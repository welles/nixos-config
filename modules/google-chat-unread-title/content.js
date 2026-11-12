// Google Chat reports its unread count with navigator.setAppBadge(), which
// Chrome doesn't show on Linux. This script runs in the page before Chat's
// own scripts, catches the count and puts it in the title of the
// top frame, which window lists can read. Without a number
// (setAppBadge() as plain flag) the count is 1. Gmail already supplies its
// count in the page title.
(() => {
  const isChat = location.hostname === "chat.google.com" || location.pathname.startsWith("/chat/");
  const appName = isChat ? "Google Chat" : "Gmail";
  const prefix = new RegExp(`^${appName}(?: \\(\\d+\\))? - `);
  const plainTitle = (title) => {
    const plain = title.replace(prefix, "");
    return isChat ? plain.replace(/^\(\d+\) /, "") : plain;
  };
  const titleProperty = Object.getOwnPropertyDescriptor(Document.prototype, "title");
  let count = 0;

  const decorate = (title) => {
    const plain = plainTitle(title);
    // Chrome 157 hides a standalone app's page title unless it starts with
    // the installed app name. Keep the count after that name so Cinnamon
    // can read it. Drop this prefix when Chrome exposes page titles again.
    if (count > 0) return `${appName} (${count}) - ${plain}`;
    return plain.startsWith(appName) ? plain : `${appName} - ${plain}`;
  };

  const apply = (doc) => {
    const current = titleProperty.get.call(doc);
    const wanted = decorate(current);
    if (current !== wanted) titleProperty.set.call(doc, wanted);
  };

  const setCount = (value) => {
    count = value;
    // Share the count with the top frame's copy of this script, which keeps
    // the prefix when Chat changes the title there.
    try {
      window.top.postMessage({googleChatUnreadTitle: value}, location.origin);
    } catch {
      // A cross-origin top frame gets no message.
    }
    if (window === window.top) apply(document);
  };

  const badgeMethods = isChat ? [
    ["setAppBadge", (args) => (args[0] === undefined ? 1 : Number(args[0]))],
    ["clearAppBadge", () => 0],
  ] : [];
  for (const [name, countOf] of badgeMethods) {
    const original = Navigator.prototype[name];
    if (!original) continue;
    Navigator.prototype[name] = function (...args) {
      setCount(countOf(args));
      return original.apply(this, args);
    };
  }

  if (window !== window.top) return;

  window.addEventListener("message", (event) => {
    // Gmail's embedded Chat must not replace Gmail's own unread count.
    if (isChat && event.origin === location.origin && typeof event.data?.googleChatUnreadTitle === "number") {
      count = event.data.googleChatUnreadTitle;
      apply(document);
    }
  });

  // Chat sets its title through document.title: getter without, setter with
  // the prefix, so Chat itself never sees it.
  Object.defineProperty(document, "title", {
    configurable: true,
    get() {
      return plainTitle(titleProperty.get.call(this));
    },
    set(value) {
      titleProperty.set.call(this, decorate(String(value)));
    },
  });

  // Titles changed in the <title> element directly get the prefix too. Only
  // <head> is watched, Chat changes the rest of the page all the time; at
  // document_start it may not exist yet.
  const watchHead = () => {
    apply(document);
    new MutationObserver(() => apply(document)).observe(document.head, {
      subtree: true,
      childList: true,
      characterData: true,
    });
  };
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
