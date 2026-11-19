const appWindow = window.matchMedia(
  "(display-mode: standalone), (display-mode: minimal-ui), (display-mode: window-controls-overlay)"
);

window.addEventListener("click", async (event) => {
  if (!appWindow.matches || !event.isTrusted || event.defaultPrevented ||
      event.button !== 0 || event.altKey || event.ctrlKey || event.metaKey || event.shiftKey) {
    return;
  }

  const link = event.composedPath().find((element) => element instanceof HTMLAnchorElement);
  if (!link?.hasAttribute("href") || link.hasAttribute("download")) {
    return;
  }

  const url = URL.parse(link.href);
  if (!url || !["http:", "https:"].includes(url.protocol) ||
      url.origin === location.origin || Array.from(location.ancestorOrigins).includes(url.origin)) {
    return;
  }

  event.preventDefault();
  event.stopImmediatePropagation();
  try {
    const result = await chrome.runtime.sendMessage({url: url.href});
    if (result?.opened) {
      return;
    }
  } catch {
    // Fall back to the link's usual action if the native host is unavailable.
  }
  link.click();
}, {capture: true});
