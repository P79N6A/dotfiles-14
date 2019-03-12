chrome.extension.sendMessage({}, function (response) {
  var readyStateCheckInterval = setInterval(function () {
    if (document.readyState === "complete") {
      clearInterval(readyStateCheckInterval);

      // ----------------------------------------------------------
      // This part of the script triggers when page is done loading
      console.log("Hello. This message was sent from scripts/inject.js");
      // ----------------------------------------------------------

      // var defaultOptions = {
      //   'request': null,
      //   'sender': null,
      //   'sendResponse': null,
      // };
      // options = Object.assign(defaultOptions, options);
      const request = response.request;
      const sender = response.sender;

      // console.log(request);
      // console.log(sender);
      console.log(response);
      console.log(this);
      console.log(chrome);

    }
  }, 10);
});
