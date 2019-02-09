var G = window.G = null;
var e = null,
    w = null,
    d = null,
    b = null,
    w_timeout = null;

var init = function () {
    G = {
        e: e,
        w: w,
        b: b,
        d: d,
    };

    // console.log(b.parentElement.previousSibling.querySelector('html#facebook'));
    // console.log(b.parentElement.previousSibling);
    // console.log(b.parentElement.prototype);
    // console.log(b.parentElement);
    // console.log(w.prototype);
    // console.log(w.__prototype__);
    // d.addEventListener('ready', function () {
    //     console.log('clicked');
    // });
    // console.log(w.window);
    // console.log(G);

    return G;
};

// document.addEventListener('readystatechange', function (evt) {
//     if (evt.target.readyState === 'complete') {
//         w_timeout = setTimeout(function () {
//             e = evt;
//             w = e.target.documentElement;
//             d = w.ownerDocument;
//             b = d.body;

//             clearTimeout(w_timeout);
//             w_timeout = null;
//             init();
//         }, 1000);
//     }
// });

parent.parent.parent.addEventListener('load', function () {
    var evt = event;
    var t = evt.target;

    w_timeout = setTimeout(function () {
        for (item in t.links) {
            if (t.links.hasOwnProperty(item)) {
                item_link = t.links[item];
                var item_link_id = '';
                var attrs = new Array;

                if (item_link.hasAttribute('id') == true) {
                    item_link_id = item_link.attributes.id.value;
                    console.log(item_link_id);
                }

                if (item_link.hasAttribute('data-action-type') == true && item_link.attributes['data-action-type'].value == 'open_options_flyout') {
                    item_link.addEventListener('click', function () {
                        console.log('clicked');
                        setTimeout(function () {
                            var popup = t.querySelector('.uiContextualLayerPositioner[data-ownerid="'+ item_link_id +'"]');
                            if (typeof popup != 'undefined' && popup) {
                                var download = popup.querySelector('a[data-action-type="download_photo"]');
                                if (typeof download != 'undefined' && download) {
                                    download.click();
                                }
                            }
                            console.log(popup);
                            console.log(item_link_id);
                        }, 1000);
                    });
                    item_link.click();
                    break;
                }
            }
        }
        // e = evt;
        // w = e.target.documentElement;
        // d = w.ownerDocument;
        // b = d.body;

        clearTimeout(w_timeout);
        w_timeout = null;
        // init();
    }, 1000);

    // window.document.querySelector('a[data-action-type="open_options_flyout"]').click();
});
