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
  // console.log('start: ' + start);
  // console.log('current_url: ' + current_url);
  if (start == current_url) {
    console.log('————————— END —————————');
    return false;
  }

  button = d.querySelector('.fbPhotoSnowliftDropdownButton');
  button.click();

  setTimeout(function () {
    control = button.getAttribute('aria-controls');
    download = d.querySelector('.fbPhotosPhotoActionsMenu[id="'+ control +'"] a[data-action-type="download_photo"]');
    download.click();
    button.click();

    setTimeout(function () {
      navigation = d.querySelector('.fbPhotoSnowliftContainer');
      prev = navigation.querySelector('.snowliftPager.prev');
      next = navigation.querySelector('.snowliftPager.next');
      next.click();

      setTimeout(function () {
        current_url = w.location.href;
        _download(d, w);
      }, 400);
    }, 400);
  }, 400);
}

window.addEventListener('keypress', function (evt) {
  var code = evt.code;
  if (code == 'KeyS' && evt.altKey == true) {
    start = window.location.href;
    _download(document, window);
  }

  if (code == 'KeyD' && evt.altKey == true) {
    start = window.location.href;
  }
});
