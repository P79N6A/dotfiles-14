function getCallerId() {
  return 'inject_' + getCallerId.caller.name;
}

/* for (let i = 0; i < 1e7; i++) {}

// All the below will evaluate to true
1e0 === 1;
1e1 === 10;
1e2 === 100;
1e3 === 1000;
1e4 === 10000;
1e5 === 100000; */

/* function logArrayElements(element, index, array) {
  console.log("a[" + index + "] = " + element);
}
[2, 5, 9].forEach(logArrayElements); */


/* throw new Error('Missing parameter!'); */

var readyStateCheckInterval = null;

var buttonOption = (function () {
  var el = document.querySelector('.fbPhotoSnowliftDropdownButton[data-action-type="open_options_flyout"]');
  if (typeof el == 'undefined' || !el) {
    return;
  }

  el.getDownloadId = (function () {
    return ((typeof el.getAttribute('aria-controls') != 'undefined' && el.getAttribute('aria-controls')) || '') || '';
  });

  return el;
});

var buttonDownload = (function () {
  var el = document.querySelector('#'+ buttonOption().getDownloadId() +'.fbPhotosPhotoActionsMenu .fbPhotosPhotoActionsItem a[data-action-type="download_photo"]');
  if (typeof el == 'undefined' || !el) {
    return;
  }

  el.getHref = (function () {
    if (typeof el.attributes.href != 'undefined' && el.attributes.href && el.attributes.href.value && el.attributes.href.value != '' && el.attributes.href.value != '#') {
      return el.attributes.href.value;
    }
    return;
  });

  return el;
});

var modifiedCheckInterval = null;
var modifiedCheckIntervalDefault = 40;
var modifiedCheckIntervalTime = modifiedCheckIntervalDefault;
var downloadCheckInterval = null;


/* chrome.extension.sendMessage({}, function (response) {
  readyStateCheckInterval = setInterval(function () {
    if (document.readyState === "complete") {
      clearInterval(readyStateCheckInterval);

      // ----------------------------------------------------------
      // This part of the script triggers when page is done loading
      // console.log("Hello. This message was sent from scripts/inject.js");
      // ----------------------------------------------------------

      var request = response.request;
      var sender = response.sender;

      // console.log(request);
      // console.log(sender);
      // console.log(response);

      document.body.setAttribute('data-href', window.location.href);
    }
  }, 10);
}); */


function get_url() {
  alert(window.location.href);
}


function get_images(index = 0) {
  var callerId = getCallerId();

  if (buttonOption()) {
    buttonOption().click();
    buttonOption().click();

    modifiedCheckInterval = setInterval(function () {
      modifiedCheckIntervalTime -= 1;

      if (modifiedCheckIntervalTime <= 0) {
        clearInterval(modifiedCheckInterval);

        if (!buttonOption().getDownloadId()) {
          console.info('Cannot find photo ID.');
          return false;
        }

        if (buttonDownload()) {
          if (!buttonDownload().getHref()) {
            console.info('Download URL not found.');
            return false;
          }

          // window.open(buttonDownload().getHref(), '_self');
          chrome.extension.sendMessage({
            'callerId': callerId,
            'url': buttonDownload().getHref(),
          }, function (response) {
            console.log(response);
          });

          downloadCheckInterval = setInterval(function () {
            clearInterval(downloadCheckInterval);

            console.log('Downloaded.');
            console.log(buttonDownload().getHref());

            return buttonDownload().getHref();
          }, 200);
        }
      }
    }, 10);
  }
}


document.addEventListener('DOMSubtreeModified', function (evt) {
  evt.stopPropagation();
  modifiedCheckIntervalTime = modifiedCheckIntervalDefault;
});


document.addEventListener('keypress', function (evt) {
  if (evt.code == 'KeyS' && evt.ctrlKey == true) {
    get_images();
  }

  if (evt.code == 'KeyC' && evt.ctrlKey == true && evt.metaKey == true) {
    get_url();
  }
});


window.addEventListener('load', function (evt) {
  //
});
