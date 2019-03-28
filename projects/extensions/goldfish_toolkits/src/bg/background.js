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


// A generic onclick callback function.
function genericOnClick(info, tab) {
  console.log('item ' + info.menuItemId + ' was clicked');
  console.log('info: ' + JSON.stringify(info));
  console.log('tab: ' + JSON.stringify(tab));
}

chrome.runtime.onInstalled.addListener(function () {
  var parent = chrome.contextMenus.create({
    'id': 'GCTContextMenu-1',
    'title': 'Open in current tab',
    'contexts': [
      'link',
    ],
  });

  // var child1 = chrome.contextMenus.create({
  //   'type': 'normal',
  //   'id': 'GCTContextMenu-2',
  //   'title': 'New Tab On Right',
  //   'contexts': [
  //     'all',
  //   ],
  // });
});





chrome.contextMenus.onClicked.addListener(function(info, tab) {
  // alert('CLICKED');
  // alert(''+ info.toString() +'');
  /*
  (integer|string) menuItemId
  (integer|string) parentMenuItemId
  (string:image|audio|video) mediaType
  (string) linkUrl
  (string) srcUrl
  (string) pageUrl
  (string) frameUrl
  (string) frameId
  (string) selectionText
  */

  // console.log(info, tab);

  var openerTab = tab;
  if (typeof tab.openerTabId == 'undefined' || tab.openerTabId == '') {
    //
  } else {
    if (typeof info.linkUrl == 'undefined' || info.linkUrl == '') {
      //
    } else {
      if (typeof tab.openerTabId == 'undefined' || !tab.openerTabId) {
        //
      } else {
        // chrome.tabs.create({
        //   'url': ''+ info.linkUrl +'',
        //   'active': true,
        //   'index': openerTab.index,
        // });

        // chrome.tabs.remove([
        //   tab.openerTabId,
        // ]);

        chrome.tabs.update({
          'url': info.linkUrl,
        });
      }
    }
  }
});


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
