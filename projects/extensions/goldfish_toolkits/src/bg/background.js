function tab_query(options = {}) {
  var defaultOptions = {
    'currentWindow': true,
  };
  options = Object.assign(defaultOptions, options);

  console.log(window, options);

  // chrome.tabs.query(options, function (tabs) {
  //   if (tabs.length > 0) {
  //     return tabs;
  //   }
  //   return;
  // });
}

chrome.runtime.onInstalled.addListener(function () {
  chrome.contextMenus.create({
    "id": "GCTContextMenu",
    "title": "Sample Context Menu",
    "contexts": [
      "all",
    ],
  });
});

// Called when the user clicks on the browser action.
chrome.browserAction.onClicked.addListener(function (tab) {
  // console.log('browserAction.onClicked');
  // No tabs or host permissions needed!
  // console.log(tab);
  // console.log('Turning ' + tab.url + ' red!');
  // alert(document.body.style.backgroundColor);
  // chrome.tabs.executeScript({
  //   code: 'document.body.style.backgroundColor="red"'
  // });
  // chrome.tabs.executeScript({
  //   code: 'window.tab_query();',
  // });
});

// chrome.runtime.onMessage.addListener(function (message, callback) {
//   if (message.data == 'setAlarm') {
//     // chrome.alarms.create({delayInMinutes: 5})
//   } else if (message.data == 'runLogic') {
//     // chrome.tabs.executeScript({file: 'logic.js'});
//   } else if (message.data == 'changeColor') {
//     chrome.tabs.executeScript({
//       code: 'document.body.style.backgroundColor="orange"',
//     });
//   };
// });


// if you checked "fancy-settings" in extensionizr.com, uncomment this lines

// var settings = new Store("settings", {
//     "sample_setting": "This is how you use Store.js to remember values"
// });


//example of using a message handler from the inject scripts
chrome.extension.onMessage.addListener(function (request, sender, sendResponse) {
  sendResponse({
    'request': request,
    'sender': sender,
    'sendResponse': sendResponse,
  });
  // chrome.pageAction.show(sender.tab.id);
  // sendResponse();
});

chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  sendResponse({
    'request': request,
    'sender': sender,
    'sendResponse': sendResponse,
  });
  // chrome.pageAction.show(sender.tab.id);
  // sendResponse();
});

// Called when the commands' called on the browser.
// chrome.commands.onCommand.addListener(function (command) {
//   console.log('onCommand event received for message: ', command);
// });
