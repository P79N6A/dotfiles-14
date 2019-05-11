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

      // console.log(request);
      // console.log(sender);
      // console.log(response);

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

  var buttonOption = snowlift.querySelector('a[data-action-type="open_options_flyout"]');
  if (!buttonOption) {
    return false;
  }
  buttonOption.click();
  var checkButtonOptionInterval = setInterval(function () {
    clearInterval(checkButtonOptionInterval);
    var downloadId = buttonOption.getAttribute('aria-controls');
    var buttonDownload = snowlift.querySelector('#'+ downloadId +' a[data-action-type="download_photo"]');
    if (!buttonDownload) {
      return false;
    }
    buttonDownload.click();
    // window.open(buttonDownload.attributes.href.value, '_blank');

    var checkButtonDownloadInterval = setInterval(function () {
      clearInterval(checkButtonDownloadInterval);
      var next = snowlift.querySelector('#photos_snowlift a.snowliftPager.next');
      if (!next) {
        return false;
      }
      next.click();
    }, 400);
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
  // evt.stopPropagation();
});


document.addEventListener('keypress', function (evt) {
  if (evt.code == 'KeyS' && evt.ctrlKey == true) {
    if (!get_images()) {
      return false;
    }

    console.log('download');
    // console.log(get_images());
    //
    // var keyboardEvent = document.createEvent("KeyboardEvent");
    // var initMethod = typeof keyboardEvent.initKeyboardEvent !== 'undefined' ? "initKeyboardEvent" : "initKeyEvent";
    // keyboardEvent[initMethod](
    //   "keydown", // event type : keydown, keyup, keypress
    //   true, // bubbles
    //   false, // cancelable
    //   window, // viewArg: should be window
    //   false, // ctrlKeyArg
    //   false, // altKeyArg
    //   false, // shiftKeyArg
    //   true, // metaKeyArg
    //   83, // keyCodeArg : unsigned long the virtual key code, else 0
    //   0, // charCodeArgs : unsigned long the Unicode character associated with the depressed key, else 0
    // );
    // document.dispatchEvent(keyboardEvent);
    //
    // // console.log(window);
    // // console.log(chrome);
    //
    // chrome.extension.sendMessage({}, function (response) {
    //   chrome.downloads.download({
    //     'url': get_images(),
    //     'overwrite': true,
    //   });
    // });

    // window.open(get_images(), '_top');
    // https://scontent.fbkk2-6.fna.fbcdn.net/v/t1.0-9/53026249_1988341741461246_5356360036757012480_n.jpg?_nc_cat=107&_nc_ht=scontent.fbkk2-6.fna&oh=528346753f3570bed6539a618428ba78&oe=5D6F219C
    // https://www.facebook.com/photo/download/?fbid=1988341734794580&ext=1557821224&hash=AeSOG9FsMc1vkAFS
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
