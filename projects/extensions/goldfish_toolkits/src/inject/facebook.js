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

function _download() {
  button = document.querySelector('.fbPhotoSnowliftDropdownButton');

  setTimeout(function () {
    if (current_url === start) {
      console.log('————————— END —————————');
      return false;
    }

    button.click();

    setTimeout(function () {
      control = button.getAttribute('aria-controls');
      download = document.querySelector('.fbPhotosPhotoActionsMenu[id="'+ control +'"] a[data-action-type="download_photo"]');
      download.click();

      // if (current_url === start) {
      //   button.click();
      //   console.log('————————— END —————————');
      //   return false;
      // } else {
      //   download.click();
      //   button.click();
      // }

      setTimeout(function () {
        navigation = document.querySelector('.fbPhotoSnowliftContainer');
        prev = navigation.querySelector('.snowliftPager.prev');
        next = navigation.querySelector('.snowliftPager.next');
        next.click();

        setTimeout(function () {
          current_url = document.URL;
          _download();
        }, 200);

      }, 200);

    }, 200);

  }, 200);
}

document.addEventListener('keypress', function (evt) {
  code = evt.code;

  if (code === 'KeyS' && evt.ctrlKey === true) {
    // console.log('S');

    if (start === '') {
      alert('Please restart again!');
    } else {
      current_url = '';
      _download();
    }
  }

  if (code === 'KeyD' && evt.ctrlKey === true) {
    // console.log('D');

    activeTab = null;
    button = null;
    code = '';
    control = '';
    current_url = '';
    download = '';
    navigation = '';
    next = '';
    prev = '';
    start = document.URL;

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
