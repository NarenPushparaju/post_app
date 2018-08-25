$( document ).ready(function() {

    // hide spinner
    $(".spinner").hide();


    // show spinner on AJAX start
    $(document).ajaxStart(function(){
        $(".spinner").show();
    });

    // hide spinner on AJAX stop
    $(document).ajaxStop(function(){
        $(".spinner").delay(3000000000).hide(0);
    });

});