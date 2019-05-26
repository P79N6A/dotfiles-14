// Copyright (c) 2013 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/**
* Register a callback function with the commands api, which will be called when
* one of our registered commands is detected.
*/

var hasPinTabs = false;
var windowTabs = null;
var firstTab = null;
var lastTab = null;
var firstPinTab = null;
var lastPinTab = null;
var firstIndex = 0;
var lastIndex = -1;
var firstPinIndex = 0;
var lastPinIndex = -1;

chrome.commands.onCommand.addListener(function(command) {
  // Call 'update' with an empty properties object to get access to the current
  // tab (given to us in the callback function).
  chrome.tabs.query({
    'currentWindow': true,
    'pinned': false,
  }, function (tabs) {
    windowTabs = tabs;
    if (windowTabs.length > 0) {
      firstTab = windowTabs[0];
      lastTab = windowTabs[(windowTabs.length - 1)];
    }
  });

  chrome.tabs.query({
    'currentWindow': true,
    'pinned': true,
  }, function (tabs) {
    windowPinTabs = tabs;
    if (windowPinTabs.length > 0) {
      hasPinTabs = true;
      firstPinTab = windowPinTabs[0];
      lastPinTab = windowPinTabs[(windowPinTabs.length - 1)];
    }
  });

  if (hasPinTabs == true) {
    firstIndex = firstTab.index;
    lastIndex = lastTab.index;
    firstPinIndex = firstPinTab.index;
    lastPinIndex = lastPinTab.index;
  }

  chrome.tabs.query({
    'currentWindow': true,
    'active': true,
  }, function (tabs) {
    var activeTab = tabs[0];

    if (command == 'duplicate-tab') {
      chrome.tabs.duplicate(activeTab.id);
    } else if (command == 'create-tab') {
      chrome.tabs.query({
        active: true,
        currentWindow: true,
      }, function(tabs) {
        chrome.tabs.executeScript(tabs[0].id, {
          code: 'document.body.style.backgroundColor = "red";'
        });
      });

      chrome.tabs.create({
        active: true,
        pinned: activeTab.pinned,
        index: parseInt(activeTab.index) + 1,
        openerTabId: parseInt(activeTab.id),
      });
    } else if (command == 'pin-tab') {
      var pinned = true;
      if (activeTab.pinned == true) {
        pinned = false;
      }

      chrome.tabs.update(activeTab.id, {
        active: true,
        pinned: pinned,
      });
    } else if (command == 'move-tab-left') {
      var newIndex = parseInt(activeTab.index) - 1;

      if (activeTab.pinned == true) {
        if (newIndex < firstPinIndex) {
          newIndex = lastPinIndex;
        }
      } else {
        if (newIndex < firstIndex) {
          newIndex = lastIndex;
        }
      }

      chrome.tabs.move(activeTab.id, {
        'index': newIndex,
        'windowId': parseInt(activeTab.windowId),
      });
    } else if (command == 'move-tab-right') {
      var newIndex = parseInt(activeTab.index) + 1;

      if (activeTab.pinned == true) {
        if (newIndex > lastPinIndex) {
          newIndex = firstPinIndex;
        }
      } else {
        if (newIndex > lastIndex) {
          newIndex = firstIndex;
        }
      }

      chrome.tabs.move(activeTab.id, {
        'index': newIndex,
        'windowId': parseInt(activeTab.windowId),
      });
    } else if (command == 'download-photo') {
      // alert(command);
      console.log(activeTab);
      alert(window.location.href);


      // chrome.tabs.query({
      //   'currentWindow': true,
      //   'active': true,
      // }, function (tabs) {
      //   if (tabs.length > 0) {
      //     var tab = tabs[0];
      //     // run_app(tab);
      //     console.log(event);
      //     console.log(this);
      //     console.log(window.document);
      //   }
      // });

      // chrome.tabs.query({currentWindow: true}, function(tabs) {
      //   // Sort tabs according to their index in the window.
      //   tabs.sort((a, b) => { return a.index < b.index; });
      //   let activeIndex = tabs.findIndex((tab) => { return tab.active; });
      //   let lastTab = tabs.length - 1;
      //   let newIndex = -1;
      //   if (command === 'flip-tabs-forward')
      //     newIndex = activeIndex === 0 ? lastTab : activeIndex - 1;
      //   else  // 'flip-tabs-backwards'
      //     newIndex = activeIndex === lastTab ? 0 : activeIndex + 1;
      //   chrome.tabs.update(tabs[newIndex].id, {active: true, highlighted: true});
      // });
    }
  });
});


var run_app = function (tab) {
  // alert(window.location.href);
  // document.querySelector('body').setAttribute('data-start', 'start');
  // alert(document.querySelector('body').getAttribute('data-start'));

  // alert('run');
  // var btnOption = document.querySelector('#fbPhotoSnowliftActions');
  // alert(btnOption);
  // console.log(tab);
  // console.log(window.chrome.tabs.getCurrent());
}.bind(this);
