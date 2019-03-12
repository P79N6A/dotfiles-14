// Copyright (c) 2013 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/**
* Register a callback function with the commands api, which will be called when
* one of our registered commands is detected.
*/
chrome.commands.onCommand.addListener(function(command) {
  // Call 'update' with an empty properties object to get access to the current
  // tab (given to us in the callback function).
  chrome.tabs.query({
    'currentWindow': true,
    'active': true,
  }, function (tabs) {
    let activeTab = tabs[0];

    if (command == 'duplicate-tab') {
      chrome.tabs.duplicate(activeTab.id);
    } else if (command == 'move-tab-left') {
      chrome.tabs.move(activeTab.id, {
        'index': parseInt(activeTab.index) - 1,
        'windowId': parseInt(activeTab.windowId),
      });
    } else if (command == 'move-tab-right') {
      chrome.tabs.move(activeTab.id, {
        'index': parseInt(activeTab.index) + 1,
        'windowId': parseInt(activeTab.windowId),
      });
    }
  });
});
