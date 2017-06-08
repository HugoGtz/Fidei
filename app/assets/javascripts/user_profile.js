document.addEventListener("turbolinks:load", function() {
    $(".qwert").on('click', function(){
       $(".qwert").removeClass('active');
       $(this).addClass("active");
    });
});