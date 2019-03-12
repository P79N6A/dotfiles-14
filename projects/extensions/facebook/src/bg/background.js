// if you checked "fancy-settings" in extensionizr.com, uncomment this lines

// var settings = new Store("settings", {
//     "sample_setting": "This is how you use Store.js to remember values"
// });


//example of using a message handler from the inject scripts
chrome.extension.onMessage.addListener(function (request, sender, sendResponse) {
  console.clear();
  // chrome.pageAction.show(sender.tab.id);
  sendResponse({
    'request': request,
    'sender': sender,
  });
  // sendResponse();
});


window.onload = function () {
  // chrome.windows.getCurrent(function (currentWindow) {
  //   chrome.tabs.query({
  //     active: true,
  //     windowId: currentWindow.id,
  //   }, function (activeTabs) {
  //     chrome.tabs.executeScript(activeTabs[0].id, {
  //       file: 'send_links.js',
  //       allFrames: true,
  //     });
  //   });
  // });
  // chrome.windows.getCurrent(function (w) {
  //   console.log('Get Info:');
  //   console.log(w);
  // });
};

// Called when the commands' called on the browser.
// chrome.commands.onCommand.addListener(function(command) {
//   console.log('onCommand event received for message: ', command);
// });

// Called when the user clicks on the browser action.
chrome.browserAction.onClicked.addListener(function (tab) {
  console.clear();
  // No tabs or host permissions needed!
  console.log(tab);
  console.log('Turning ' + tab.url + ' red!');
  alert(document.body.style.backgroundColor);
  chrome.tabs.executeScript({
    code: 'document.body.style.backgroundColor="red"'
  });
});
