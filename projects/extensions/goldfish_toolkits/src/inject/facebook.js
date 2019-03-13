chrome.extension.sendMessage({}, function (response) {
  var readyStateCheckInterval = setInterval(function () {
    if (document.readyState == "complete") {
      clearInterval(readyStateCheckInterval);

      // ----------------------------------------------------------
      // This part of the script triggers when page is done loading
      // console.log("Hello. This message was sent from scripts/inject.js");
      // ----------------------------------------------------------

      var request = response.request;
      var sender = response.sender;

      if (sender.tab.active == true) {
        activeTab = sender.tab;
      }

    }
  }, 100);
});


var downloadHref = '';
var interval = '';
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

function valid_url(str = '') {
  var is_valid = false;
  var pattern = new RegExp('^(https?:\\/\\/)?'+ // protocol
    '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+ // domain name
    '((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
    '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path
    '(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string
    '(\\#[-a-z\\d_]*)?$','i'); // fragment locator

  is_valid = pattern.test(str);
  return is_valid;
}

function set_download_url(path = '') {
  if (!path) {
    return '';
  }
  return 'https://www.facebook.com' + path;
}

function get_attribute(el, attribute) {
  return el.getAttribute(attribute);
}

function set_attribute(el, attribute, value = '') {
  el.setAttribute(attribute, value);
  return value;
}

function get_start() {
  dataStart = document.querySelector('body').getAttribute('data-start');
  if (typeof dataStart == 'undefined' || !dataStart) {
    dataStart = '';
  }
  return dataStart;
}

function get_current() {
  dataCurrent = document.querySelector('body').getAttribute('data-current');
  if (typeof dataCurrent == 'undefined' || !dataCurrent) {
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

  window.addEventListener('load', function () {
    alert('ready');
  });

  var interval1 = setInterval(function () {
    clearInterval(interval1);

    button.click();

    var interval2 = setInterval(function () {
      clearInterval(interval2);

      control = button.getAttribute('aria-controls');
      download = document.querySelector('.fbPhotosPhotoActionsMenu[id="'+ control +'"] a[data-action-type="download_photo"]');
      download.click();
      // downloadHref = set_download_url(get_attribute(download, 'href'));
      // if (!downloadHref) {
      //   return false;
      // }

      // window.location.href = downloadHref;
      // window.open(downloadHref, '_parent');

      // chrome.tabs.create({
      //   'url': downloadHref,
      //   'active': false,
      //   'selected': false,
      //   'pinned': false,
      //   'openerTabId': sender.tab.id,
      // }, function (tab) {
      //   //
      // });

      var interval3 = setInterval(function () {
        clearInterval(interval3);

        // button.click();

        navigation = document.querySelector('.fbPhotoSnowliftContainer');
        prev = navigation.querySelector('.snowliftPager.prev');
        next = navigation.querySelector('.snowliftPager.next');

        next.click();

        var interval4 = setInterval(function () {
          clearInterval(interval4);

          if (window.location.href == get_start()) {
            console.log('————————— END —————————');
            return false;
          } else {
            set_current(window.location.href);
            _download();
          }
        }, 1000);

      }, 1000);

    }, 1000);

  }, 400);
}

window.addEventListener('load', function () {
  set_start('');
  set_current('');

  console.log('load');
});

document.onreadystatechange = function () {
  if (document.readyState === 'complete') {
    console.log('ready');
  }
}

window.addEventListener('keypress', function (evt) {
  code = evt.code;

  if (code == 'KeyS' && evt.ctrlKey == true) {
    if (typeof get_start() == 'undefined' || get_start() == '' || !get_start()) {
      let sign = prompt('Please provide URL to start');

      if (typeof sign != 'undefined' && sign && sign != '' && sign != null) {
        if (valid_url(sign) == true) {
          set_start(sign);
          set_current('');
          _download();
        } else {
          alert('Invalid url please try again!');
        }
      } else {
        // cancel
      }
    } else {
      set_current('');
      _download();
    }
  }

  if (code == 'KeyD' && evt.ctrlKey == true) {
    activeTab = null;
    button = null;
    code = '';
    control = '';
    set_current('');
    // current_url = get_current();
    download = '';
    navigation = '';
    next = '';
    prev = '';
    set_start(window.location.href);
    // start = get_start();

    _download();
  }
});
