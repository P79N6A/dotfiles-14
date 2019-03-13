var activeTab = null;
var button = null;
var code = '';
var control = '';
var current_url = '';
var download = '';
var navigation = '';
var next = '';
var prev = '';
var start = '';
var dataStart = '';
var dataCurrent = '';

window.addEventListener('load', function () {
  console.log('loaded');
});

document.addEventListener('ready', function () {
  console.log('ready');
});

document.addEventListener('readystatechange', function () {
  console.log('readystatechange');
});

function get_start() {
  dataStart = document.querySelector('body').getAttribute('data-start');
  if (typeof dataStart === 'undefined' || !dataStart) {
    dataStart = '';
  }
  return dataStart;
}

function get_current() {
  dataCurrent = document.querySelector('body').getAttribute('data-current');
  if (typeof dataCurrent === 'undefined' || !dataCurrent) {
    dataCurrent = '';
  }
  return dataCurrent;
}

function set_start(value = '') {
  document.querySelector('body').setAttribute('data-start', value);
  return value;
}

function set_current(value = '') {
  document.querySelector('body').setAttribute('data-current', value);
  return value;
}

function _download() {
  button = document.querySelector('.fbPhotoSnowliftDropdownButton');

  setTimeout(function () {
    button.click();

    setTimeout(function () {
      control = button.getAttribute('aria-controls');
      download = document.querySelector('.fbPhotosPhotoActionsMenu[id="'+ control +'"] a[data-action-type="download_photo"]');
      download.click();
      button.click();

      setTimeout(function () {
        navigation = document.querySelector('.fbPhotoSnowliftContainer');
        prev = navigation.querySelector('.snowliftPager.prev');
        next = navigation.querySelector('.snowliftPager.next');
        next.click();

        setTimeout(function () {
          if (document.URL === get_start()) {
            console.log('————————— END —————————');
            return false;
          } else {
            set_current(document.URL);
            current_url = get_current();
            _download();
          }
        }, 400);

      }, 400);

    }, 1000);

  }, 400);
}

document.addEventListener('keypress', function (evt) {
  code = evt.code;

  if (code === 'KeyS' && evt.ctrlKey === true) {
    set_current('');

    if (get_start() === '') {
      alert('Please restart again!');
    } else {
      _download();
    }
  }

  if (code === 'KeyD' && evt.ctrlKey === true) {
    activeTab = null;
    button = null;
    code = '';
    control = '';
    set_current('');
    current_url = get_current();
    download = '';
    navigation = '';
    next = '';
    prev = '';
    set_start(document.URL);
    start = get_start();

    _download();
  }
});


chrome.extension.sendMessage({}, function (response) {
  var readyStateCheckInterval = setInterval(function () {
    if (document.readyState === "complete") {
      clearInterval(readyStateCheckInterval);

      // ----------------------------------------------------------
      // This part of the script triggers when page is done loading
      // console.log("Hello. This message was sent from scripts/inject.js");
      // ----------------------------------------------------------

      var request = response.request;
      var sender = response.sender;

      console.log('complete');

      set_start('');
      set_current('');

      // if (sender.tab.active === true) {
      //   activeTab = sender.tab;
      // }

      // console.log(request);
      // console.log(sender);
      // console.log(response);
      // console.log(this);
      // console.log(chrome);

      // console.log(sender);

    }
  }, 10);
});
