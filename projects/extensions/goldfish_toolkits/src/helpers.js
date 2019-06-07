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

function getCallerId() {
  return getCallerId.caller.name;
  // return 'inject_' + getCallerId.caller.name;
}

function getCallerName(callerId) {
  if (typeof callerId == 'undefined' || !callerId) {
    return null;
  }

  return callerId.replace('inject_', '');
}

function helper_run() {
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
}

function helper_newTabToRight() {
  chrome.tabs.query({
    active: true,
    currentWindow: true,
  }, function(tabs) {
    var activeTab = tabs[0];

    chrome.tabs.create({
      active: true,
      pinned: activeTab.pinned,
      index: parseInt(activeTab.index) + 1,
      openerTabId: parseInt(activeTab.id),
    });
  });
}

function helper_duplicateCurrentTab() {
  chrome.tabs.query({
    active: true,
    currentWindow: true,
  }, function(tabs) {
    var activeTab = tabs[0];

    chrome.tabs.duplicate(activeTab.id);
  });
}

function helper_moveTabLeft() {
  chrome.tabs.query({
    currentWindow: true,
    active: true,
  }, function (tabs) {
    var activeTab = tabs[0];
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
  });
}

function helper_moveTabRight() {
  chrome.tabs.query({
    currentWindow: true,
    active: true,
  }, function (tabs) {
    var activeTab = tabs[0];
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
  });
}


function helper_pinCurrentTab() {
  chrome.tabs.query({
    currentWindow: true,
    active: true,
  }, function (tabs) {
    var activeTab = tabs[0];
    var pinned = true;

    if (activeTab.pinned == true) {
      pinned = false;
    }

    chrome.tabs.update(activeTab.id, {
      active: true,
      pinned: pinned,
    });
  });
}
