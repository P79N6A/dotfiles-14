// Copyright (c) 2013 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/**
* Register a callback function with the commands api, which will be called when
* one of our registered commands is detected.
*/

let hasPinTabs = false;
let windowTabs = null;
let firstTab = null;
let lastTab = null;
let firstPinTab = null;
let lastPinTab = null;
let firstIndex = 0;
let lastIndex = -1;
let firstPinIndex = 0;
let lastPinIndex = -1;

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
    let activeTab = tabs[0];

    if (command == 'duplicate-tab') {
      chrome.tabs.duplicate(activeTab.id);
    } else if (command == 'move-tab-left') {
      let newIndex = parseInt(activeTab.index) - 1;

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
      let newIndex = parseInt(activeTab.index) + 1;

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
    }
  });
});
