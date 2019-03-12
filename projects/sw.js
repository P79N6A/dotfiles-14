var button = '';
var control = '';
var download = '';
var navigation = '';
var prev = '';
var next = '';
var start = '';
var btnTimeout = '';
var current_url = '';

function _download(d, w) {
  button = d.querySelector('.fbPhotoSnowliftDropdownButton');
  button.click();

  setTimeout(function () {
    control = button.getAttribute('aria-controls');
    download = d.querySelector('.fbPhotosPhotoActionsMenu[id="'+ control +'"] a[data-action-type="download_photo"]');
    current_url = download.getAttribute('href');

    if (current_url && start && start == current_url) {
      button.click();
      console.log('————————— END —————————');
      return false;
    } else {
      download.click();
      button.click();
    }

    if (current_url && start == '') {
      start = current_url;
    }

    setTimeout(function () {
      button.click();
      navigation = d.querySelector('.fbPhotoSnowliftContainer');
      prev = navigation.querySelector('.snowliftPager.prev');
      next = navigation.querySelector('.snowliftPager.next');
      next.click();

      setTimeout(function () {
        _download(d, w);
      }, 400);
    }, 400);
  }, 400);
}

window.addEventListener('keypress', function (evt) {
  var code = evt.code;
  if (code == 'KeyS' && evt.altKey == true) {
    button = '';
    control = '';
    download = '';
    navigation = '';
    prev = '';
    next = '';
    start = '';
    btnTimeout = '';
    current_url = '';

    _download(document, window);
  }

  if (code == 'KeyD' && evt.altKey == true) {
    start = window.location.href;
  }
});
