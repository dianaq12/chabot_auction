// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
    $(".product-submit").on("click", productSubmit);
    $(".nav-tabs li a").on("click",persistTab);
    $(".new-bid").bind("ajax:complete", productSubmit);
});

function productSubmit(evt, data, status, xhr) {
    if (data.status == 200) {
        var parent = $(this).parents(".product-container");
        $(parent).html(data.responseText);
        $(".new-bid").bind("ajax:complete", productSubmit);
    } else { alert( "Bid failed to submit.  Please try again." ); }
}

function persistTab() {
    $.cookie('product_tab',$(this).attr("href"),{expires:30,path:'/'});
}
