var ctrlPressed = false;
var altPressed = false;
var shiftPressed = false;
var metaPressed = false;
var pressed = '';
var released = '';
var keypressed = function (evt) {
  pressed = evt.code;

  if (evt.key == 'Control') {
    ctrlPressed = true;
  }
  if (evt.key == 'Alt') {
    altPressed = true;
  }
  if (evt.key == 'Shift') {
    shiftPressed = true;
  }
  if (evt.key == 'Meta') {
    metaPressed = true;
  }
};
var keyreleased = function (evt) {
  released = evt.code;

  if (evt.key == 'Control') {
    ctrlPressed = false;
  }
  if (evt.key == 'Alt') {
    altPressed = false;
  }
  if (evt.key == 'Shift') {
    shiftPressed = false;
  }
  if (evt.key == 'Meta') {
    metaPressed = false;
  }
};


function cancelDefaultEvent(evt) {
  evt.preventDefault();
  evt.stopPropagation();
}

function newTabToRight() {
  var callerId = getCallerId();
  chrome.extension.sendMessage({
    'callerId': callerId,
  });
}

function duplicateCurrentTab() {
  var callerId = getCallerId();
  chrome.extension.sendMessage({
    'callerId': callerId,
  });
}

function moveTabLeft() {
  var callerId = getCallerId();
  chrome.extension.sendMessage({
    'callerId': callerId,
  });
}

function moveTabRight() {
  var callerId = getCallerId();
  chrome.extension.sendMessage({
    'callerId': callerId,
  });
}

function pinCurrentTab() {
  var callerId = getCallerId();
  chrome.extension.sendMessage({
    'callerId': callerId,
  });
}

window.onkeydown = function (evt) {
  // console.log(evt);
  keypressed(evt);

  if (evt.ctrlKey && evt.metaKey && evt.code === "KeyP") {
    cancelDefaultEvent(evt);
    pinCurrentTab();
  }

  if (evt.ctrlKey && evt.metaKey && evt.code === "KeyT") {
    cancelDefaultEvent(evt);
    newTabToRight();
  }

  if (evt.ctrlKey && evt.metaKey && evt.code === "KeyD") {
    cancelDefaultEvent(evt);
    duplicateCurrentTab();
  }

  if (evt.ctrlKey && evt.shiftKey && evt.code === "ArrowLeft") {
    cancelDefaultEvent(evt);
    moveTabLeft();
  }

  if (evt.ctrlKey && evt.shiftKey && evt.code === "ArrowRight") {
    cancelDefaultEvent(evt);
    moveTabRight();
  }
};

window.onkeyup = function (evt) {
  // console.log(evt);
  keyreleased(evt);
};
