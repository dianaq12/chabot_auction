// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
    $(".product-submit").on("click", productSubmit);
});

function productSubmit(e) {
    e.preventDefault();
    var parent = $(this).parents(".product-container");
    var form =  $(this).parents("form");
    var bidUrl = $(this).data("product-url");
    $.post( bidUrl,$(form).serialize() )
        .done(function( data ) {
            $(parent).html(data);
            $(".product-submit").on("click", productSubmit);
        })
        .fail(function() {
            alert( "Bid failed to submit.  Please try again." );
        });

}
