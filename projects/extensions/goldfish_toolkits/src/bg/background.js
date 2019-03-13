// if you checked "fancy-settings" in extensionizr.com, uncomment this lines

// var settings = new Store("settings", {
//     "sample_setting": "This is how you use Store.js to remember values"
// });


//example of using a message handler from the inject scripts
chrome.extension.onMessage.addListener(function (request, sender, sendResponse) {
  sendResponse({
    'request': request,
    'sender': sender,
  });
  // chrome.pageAction.show(sender.tab.id);
  // sendResponse();
});


/* chrome.runtime.onInstalled.addListener(function () {
  chrome.contextMenus.create({
    "id": "GCTContextMenu",
    "title": "Sample Context Menu",
    "contexts": [
      "all",
    ],
  });
}); */


// Called when the user clicks on the browser action.
/* chrome.browserAction.onClicked.addListener(function (tab) {
  // No tabs or host permissions needed!
  console.log(tab);
  console.log('Turning ' + tab.url + ' red!');
  // alert(document.body.style.backgroundColor);
  chrome.tabs.executeScript({
    code: 'document.body.style.backgroundColor="red"'
  });
}); */
