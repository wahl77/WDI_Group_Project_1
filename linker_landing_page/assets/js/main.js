function onClickBody(e) {
    var target = $(e.target);
    if (!target.parents('.modal-container').length && !target.hasClass('modal-container') && $("#downloadModal").is(":visible")) {
        e.preventDefault();
        hideModal();
    }
}

function displayModal() {
    $("#downloadModal").show();
    setTimeout(function() {
        $("body").click(onClickBody);
    }, 500);
}

function hideModal() {
    $("#downloadModal").hide();
    $("body").unbind('click', onClickBody);
}

function directToAppDownload() {
    var ua = navigator.userAgent.toLowerCase();
    var isAndroid = ua.indexOf('android') > -1;
    if (isAndroid) {
        location.href = "https://play.google.com/store/apps/details?id=com.littleinc.MessageMe";
        return;
    }
    var isIos = ua.match(/(ipad|iphone|ipod)/g) != null;
    if (isIos) {
        location.href = "https://itunes.apple.com/us/app/messageme/id562075622?mt=8&uo=4";
        return;
    }

    displayModal();
}

$(document).ready(function() {
    $("#downloadFooterButton").click(function(e) {
        e.preventDefault();
        directToAppDownload();
    });
    $(".modal-close").click(function(e) {
        e.preventDefault();
        hideModal();
    });
});
