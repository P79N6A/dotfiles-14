// set endpoint and your access key
var ip = '134.201.250.155'
var access_key = 'YOUR_ACCESS_KEY';

// get the API result via jQuery.ajax
$.ajax({
    url: 'http://api.ipapi.com/api/134.201.250.155?access_key=3e838d405e314c1e648cb91bed732780&hostname=1&security=1&output=xml&fields=location',
    dataType: 'jsonp',
    success: function(json) {

        // output the "calling_code" object inside "location"
        alert(json.location.calling_code);

    }
});
