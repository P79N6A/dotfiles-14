// set endpoint and your access key
// var ip = '134.201.250.155';
// var access_key = '3e838d405e314c1e648cb91bed732780';
var queryString = {
  url: 'http://api.ipapi.com/api/{{ip}}',
  ip: '134.201.250.155',
  access_key: '3e838d405e314c1e648cb91bed732780',
  hostname: '1',
  security: '1',
  output: 'json',
};

// get the API result via jQuery.ajax
$.ajax({
  url: 'http://api.ipapi.com/api/'+ ip +'?access_key='+ access_key +'&hostname='+ hostname +'&security='+ security +'&output='+ output +'',
  success: function(response) {
    alert(response.location.calling_code);
  },
});



var ip = '134.201.250.155';
var url = 'http://api.ipapi.com/api/'+ ip +'';
var query = '';
var params = {
  access_key: '3e838d405e314c1e648cb91bed732780',
  hostname: '',
  security: '',
  output: 'json',
};
var data = [];

Object.keys(params).map(function (key, index) {
  var value = params[key];
  data.push(([key, encodeURI(value)]).join('='));
});

if (typeof data !== 'undefined' && data && data.length > 0) {
  data = data.join('&');
  query = '?'+ data +'';
}

console.log(url + query);

window.open(url + query, '_top');

// $.ajax({
//   url: ''+ url + query +'',
//   dataType: ''+ params.output +'',
//   success: function(response) {
//     console.log(JSON.stringify(response));
//   },
// });
