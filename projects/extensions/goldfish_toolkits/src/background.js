// if you checked "fancy-settings" in extensionizr.com, uncomment this lines

// var settings = new Store("settings", {
//     "sample_setting": "This is how you use Store.js to remember values"
// });


//example of using a message handler from the inject scripts
chrome.extension.onMessage.addListener(function (request, sender, sendResponse) {
  document.body.setAttribute('data-href', window.location.href);

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

const TextReplacementList = {
  'DefaultEmail': 'nopphasin.arayasirikul@gmail.com',
  'DefaultName': 'Nopphasin Arayasirikul',
  'DefaultAddressEn': '26/354 Moo 4 Soi Khao Makok 1, Huay Yai, Banglamung, Chonburi 20150',
  'DefaultAddressTh': '26/354 หมู่ 4 ซอยเขามะกอก 1 ต.ห้วยใหญ่ อ.บางละมุง จ.ชลบุรี 20150',
  'GctEmail': 'goldfishcreative.thailand@gmail.com',
  'GctName': 'Goldfish Creative',
  'ArtEmail': 'fineartdeveloper@gmail.com',
  'ArtName': 'Fineart Developer',
  'ArtCompanyName': 'Reproduction Galleries LLC',
  'ReproductionGalleryWeb': 'reproduction-gallery.com',
};

function get_code(info) {
  var code = '';
  var replacement = TextReplacementList[info.menuItemId];
  code = 'var selectedText = document.getSelection(); if (selectedText != \'\') { document.activeElement.value = document.activeElement.value.replace(selectedText, \''+ replacement +'\'); } else { document.activeElement.value = \''+ replacement +'\'; }';

  return code;
}

function menu_item_exists(menuItemId = '') {
  if (!menuItemId) {
    return false;
  }

  const arr = Object.keys(TextReplacementList);
  const hasItem = arr.filter(function (id) {
    if (menuItemId == id) {
      return true;
    }
    return false;
  });

  return hasItem.length || false;
}

chrome.runtime.onInstalled.addListener(function () {
  var SaveImageToDownload = chrome.contextMenus.create({
    'id': 'SaveImageToDownload',
    'title': 'Save Image',
    'contexts': [
      'image',
    ],
  });
  var OpenFrameInTab = chrome.contextMenus.create({
    'id': 'OpenFrameInTab',
    'title': 'Open Frame in tab',
    'contexts': [
      'frame',
    ],
  });
  var OpenGoogleTranslate = chrome.contextMenus.create({
    'id': 'OpenGoogleTranslate',
    'title': 'Open Google Translate',
    'contexts': [
      'page', 'selection',
    ],
  });
  var TextReplacement = chrome.contextMenus.create({
    'id': 'TextReplacement',
    'title': 'Text Replacement',
    'contexts': [
      'editable', 'selection',
    ],
    'type': 'normal',
  });

  for (var index in TextReplacementList) {
    if (TextReplacementList.hasOwnProperty(index)) {
      chrome.contextMenus.create({
        'id': ''+ index +'',
        'title': TextReplacementList[index],
        'contexts': [
          'editable', 'selection',
        ],
        'type': 'normal',
        'parentId': 'TextReplacement',
      });
    }
  }
});





chrome.contextMenus.onClicked.addListener(function(info, tab) {
  // alert('pageUrl: '+ info.pageUrl +'');
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
  document.addEventListener('click', function (e) {
    console.log(e);
  });

  if (info.menuItemId == 'OpenFrameInTab') {
    if (typeof info.frameUrl != 'undefined' && info.frameUrl) {
      chrome.tabs.create({
        'url': ''+ info.frameUrl +'',
        'index': openerTab.index + 1,
        'active': true,
      });
    }
  } else if (menu_item_exists(info.menuItemId) && menu_item_exists(info.menuItemId) != false) {
    chrome.tabs.executeScript({
      code: get_code(info),
    });
  } else if (info.menuItemId == 'SaveImageToDownload') {
    if (info.mediaType == 'image') {
      if (info.srcUrl) {
        chrome.downloads.download({
          'url': info.srcUrl,
        });
      }
    }
  } else if (info.menuItemId == 'OpenGoogleTranslate') {
    var selectionText = '';
    if (typeof info.selectionText != 'undefined') {
      selectionText = info.selectionText;
    }

    chrome.tabs.create({
      'url': 'https://translate.google.com/#view=home&op=translate&sl=auto&tl=th&text='+ selectionText +'',
      'index': openerTab.index + 1,
      'active': true,
    });
  } else {
    if (typeof tab.openerTabId == 'undefined' || tab.openerTabId == '') {
      //
    } else {
      if (typeof info.linkUrl == 'undefined' || info.linkUrl == '') {
        //
      } else {
        if (typeof tab.openerTabId == 'undefined' || !tab.openerTabId) {
          //
        } else {
          chrome.tabs.update({
            'url': info.linkUrl,
          });
        }
      }
    }
  }
});
