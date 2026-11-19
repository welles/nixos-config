chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  const source = URL.parse(sender.origin ?? "");
  const destination = typeof message?.url === "string" ? URL.parse(message.url) : null;
  if (!source || !destination || !["http:", "https:"].includes(source.protocol) ||
      !["http:", "https:"].includes(destination.protocol) || source.origin === destination.origin) {
    sendResponse({opened: false});
    return;
  }

  chrome.runtime.sendNativeMessage("org.nixos.chrome_pwa_external_links", {url: destination.href})
    .then(sendResponse, () => sendResponse({opened: false}));
  return true;
});
