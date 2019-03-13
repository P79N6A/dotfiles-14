var _w = (function (w) {
  return w;
})(window);
var _d = (function (d) {
  return d;
})(document);
var _evt = null;
var viewport = null;

function register_events() {
  _d.addEventListener('keydown', function (evt) {
    // console.log(evt.which);
    // console.log(evt);

    var code = evt.code;
    var isCtrlPressed = evt.ctrlKey;
    var isAltPressed = evt.altKey;
    var isShiftPressed = evt.shiftKey;
    var isMetaPressed = evt.metaKey;
    var target = evt.target;

    bind_navigation({
      'code': code,
      'isCtrlPressed': isCtrlPressed,
      'isAltPressed': isAltPressed,
      'isShiftPressed': isShiftPressed,
      'isMetaPressed': isMetaPressed,
      'target': target,
    }, evt);
  });
}

function bind_navigation(options = {}, evt) {
  var defaultOptions = {
    'code': null,
    'isCtrlPressed': false,
    'isAltPressed': false,
    'isShiftPressed': false,
    'isMetaPressed': false,
    'target': null,
  };
  options = Object.assign(defaultOptions, options);

  viewport = _d.querySelector('#viewport #pagination-form');

  var pagination = viewport.querySelector('.pagination-buttons');
  var prev = pagination.querySelector('.pagination-prev');
  var next = pagination.querySelector('.pagination-next');

  if (options.code === 'ArrowLeft' && options.isCtrlPressed === true && options.isShiftPressed === false) {
    prev.click();
  } else if (options.code === 'ArrowRight' && options.isCtrlPressed === true && options.isShiftPressed === false) {
    next.click();
  }
}

function init(d, w) {
  register_events();
  bind_navigation();
}


chrome.extension.sendMessage({}, function (response) {
  var readyStateCheckInterval = setInterval(function () {
    if (document.readyState === "complete") {
      clearInterval(readyStateCheckInterval);

      init(document, window);
    }
  }, 10);
});
