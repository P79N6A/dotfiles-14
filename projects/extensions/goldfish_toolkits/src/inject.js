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

      document.body.setAttribute('data-href', window.location.href);
    }
  }, 10);
});


function get_images(index = 0) {
  var snowlift = document.querySelector('#photos_snowlift');
  if (!snowlift) {
    return false;
  }

  if (snowlift.classList.contains('hidden_elem') == true) {
    return false;
  }

  var buttonOption = document.querySelector('#photos_snowlift a[data-action-type="open_options_flyout"]');
  if (!buttonOption) {
    return false;
  }
  buttonOption.click();
  var checkButtonOptionInterval = setInterval(function () {
    clearInterval(checkButtonOptionInterval);
    var buttonDownload = document.querySelector('#photos_snowlift a[data-action-type="download_photo"]');
    if (!buttonDownload) {
      return false;
    }
    buttonDownload.click();
  }, 400);

  return;

  var images = [];
  var spotlight = document.querySelectorAll('#photos_snowlift .stageWrapper .stage img');
  if (spotlight.length == 0) {
    return null;
  }

  for (var i = 0; i < spotlight.length; i++) {
    var image = spotlight[i];
    var src = null;
    if (typeof image.attributes.src != 'undefinded') {
      src = image.attributes.src.value;
      images += src;
    }
  }

  if (images.length == 0) {
    return null;
  }

  if (index > 0) {
    return images[index];
  }

  return images;
}


document.addEventListener('DOMSubtreeModified', function (evt) {
  if (document.body.getAttribute('data-href') != window.location.href) {
    document.body.setAttribute('data-href', window.location.href);
    // console.log('DOMSubtreeModified');
    // if (get_images()) {
    //   console.log(get_images());
    //   console.log('download');
    //   window.open(get_images(), '_top');
    // }
  }
  // console.log(evt);
  evt.stopPropagation();
});


document.addEventListener('keypress', function (evt) {
  if (evt.code == 'KeyS' && evt.ctrlKey == true) {
    if (!get_images()) {
      return false;
    }

    console.log('download');
    console.log(get_images());

    // window.open(get_images(), '_top');

    var link = document.createElement('a');
    link.href = get_images();
    // link.download = 'Download.jpg';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }
});


window.addEventListener('load', function (evt) {
  if (document.body.getAttribute('data-href') != window.location.href) {
    document.body.setAttribute('data-href', window.location.href);
    // console.log('load');
    // if (get_images()) {
    //   console.log(get_images());
    //   console.log('download');
    //   window.open(get_images(), '_top');
    // }
  }
  // var w = evt.currentTarget;
  // var d = w.document;
  // var spotlight = [];
  // if (d.querySelectorAll('img.spotlight').length > 0) {
  //   spotlight = d.querySelectorAll('img.spotlight');
  //
  //   for (var i = 0; i < spotlight.length; i++) {
  //     var image = spotlight[i];
  //     var src = null;
  //     if (typeof image.attributes.src != 'undefinded') {
  //       src = image.attributes.src.value;
  //     }
  //     // console.log(image);
  //     console.log(src);
  //   }
  // }
  // console.log(evt);
  // console.log(w);
  // console.log(d);
  // console.log(spotlight);
});
