var isProgress = false;

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
  'ReproductionGalleriesWeb': 'reproduction-galleries.com',
  'MailReproductionGallerySales': 'sales@reproduction-gallery.com',
};

// A generic onclick callback function.
function genericOnClick(info, tab) {
  console.log('item ' + info.menuItemId + ' was clicked');
  console.log('info: ' + JSON.stringify(info));
  console.log('tab: ' + JSON.stringify(tab));
}

function executeScript(info, tab, openerTab) {
  chrome.tabs.executeScript({
    code: get_code(info),
  });
}

function openGoogleTranslate(info, tab, openerTab) {
  var selectionText = '';
  if (typeof info.selectionText != 'undefined') {
    selectionText = info.selectionText;
  }

  chrome.tabs.create({
    'url': 'https://translate.google.com/#view=home&op=translate&sl=auto&tl=th&text='+ selectionText +'',
    'index': openerTab.index + 1,
    'active': true,
  });
}

function saveImageToDownload(info, tab) {
  if (info.mediaType == 'image') {
    if (typeof info.srcUrl != 'undefined' && info.srcUrl) {
      chrome.downloads.download({
        'url': info.srcUrl,
      });
    }
  }
}

function openLinkInCurrentTab(info, tab) {
  var linkToOpen = '';
  var selectedText = '';

  if (typeof info.linkUrl != 'undefined' && info.linkUrl) {
    linkToOpen = info.linkUrl;
  } else if (typeof info.frameUrl != 'undefined' && info.frameUrl) {
    linkToOpen = info.frameUrl;
  } else if (typeof info.selectionText != 'undefined' && info.selectionText) {
    selectedText = info.selectionText;
    var isMatches = selectedText.match("^http\:\/\/|https\:\/\/|www\.");
    if (isMatches && isMatches.length > 0) {
      linkToOpen = selectedText;
    }
  }

  if (linkToOpen) {
    chrome.tabs.update({
      'url': ''+ linkToOpen +'',
      'active': true,
    });
  }
}

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

function downloadFacebookImage(url) {
  if (url === 'undefined' || !url || url === '#' || url === '/') {
    alert('No image URL');
    return;
  }

  chrome.downloads.download({
    url: url,
  });

  // chrome.tabs.query({
  //   active: true,
  //   currentWindow: true,
  // }, function(tabs) {
  //   var tab = tabs[0];
  //
  //   chrome.tabs.create({
  //     active: false,
  //     index: parseInt(tab.index) + 1,
  //     openerTabId: parseInt(tab.id),
  //     url: url,
  //   });
  // });
}

function getFacebookDownloadUrl(path) {
  if (path === 'undefined' || !path || path === '#' || path === '/') {
    return;
  }

  let isMatches = path.match("^(http|https)\:\/\/");
  if (isMatches && isMatches.length > 0) {
    return path;
  }
  return 'https://www.facebook.com' + path;
}


function createContextMenus() {
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
  var OpenLinkInCurrentTab = chrome.contextMenus.create({
    'id': 'OpenLinkInCurrentTab',
    'title': 'Open Link In Current Tab',
    'contexts': [
      'link', 'frame', 'selection',
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
}


chrome.runtime.onInstalled.addListener(function () {

  createContextMenus();

});


chrome.downloads.onChanged.addListener(function (downloadItem) {
  if (downloadItem.state) {
    var downloadState = downloadItem.state.current;
    if (downloadState == 'complete') {
      isProgress = false;
    }
  }
});


chrome.extension.onMessage.addListener(function (message, sender, reply) {
  readyStateCheckInterval = setInterval(function () {
    if (document.readyState === "complete") {
      clearInterval(readyStateCheckInterval);

      document.body.setAttribute('data-href', window.location.href);

      reply({
        message: message.valueOf(),
        sender: sender.valueOf(),
      });

      var tab = sender.tab;

      if (message.callerId === 'inject_get_images') {
        if (!isProgress) {
          isProgress = true;
          downloadFacebookImage(getFacebookDownloadUrl(message.url));
        } else {

        }
      }
    }
  }, 10);
});


chrome.contextMenus.onClicked.addListener(function(info, tab) {
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

  var openerTab = tab;

  if (info.menuItemId == 'OpenFrameInTab') {
    if (typeof info.frameUrl != 'undefined' && info.frameUrl) {
      chrome.tabs.create({
        'url': ''+ info.frameUrl +'',
        'index': openerTab.index + 1,
        'active': true,
      });
    }
  } else if (info.menuItemId == 'OpenLinkInCurrentTab') {
    openLinkInCurrentTab(info, tab);
  } else if (menu_item_exists(info.menuItemId) && menu_item_exists(info.menuItemId) != false) {
    executeScript(info, tab, openerTab);
  } else if (info.menuItemId == 'SaveImageToDownload') {
    saveImageToDownload(info, tab);
  } else if (info.menuItemId == 'OpenGoogleTranslate') {
    openGoogleTranslate(info, tab, openerTab);
  } else {

  }
});


chrome.commands.onCommand.addListener(function (command) {
  /* chrome.tabs.query({currentWindow: true}, function(tabs) {
    // Sort tabs according to their index in the window.
    tabs.sort((a, b) => { return a.index < b.index; });
    let activeIndex = tabs.findIndex((tab) => { return tab.active; });
    let lastTab = tabs.length - 1;
    let newIndex = -1;
    if (command === 'flip-tabs-forward')
      newIndex = activeIndex === 0 ? lastTab : activeIndex - 1;
    else  // 'flip-tabs-backwards'
      newIndex = activeIndex === lastTab ? 0 : activeIndex + 1;
    chrome.tabs.update(tabs[newIndex].id, {active: true, highlighted: true});
  }); */
});
