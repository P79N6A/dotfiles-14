window.onkeypress = function (evt) {
  console.log(evt)

  if (evt.metaKey === true) {
    alert('meta');
  }
};
