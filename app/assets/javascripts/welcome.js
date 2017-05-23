$(document).ready(function(){
    barValue();
});
var barValue = function  barValue(){
   $("#barValue").on('input change', function(){
       var 
       element = $("#barValue"),
       value = element.val(),
       step;
       
       switch (value) {
           case "0":
               $(".barValue").text("$ 0");
               $(".monto").text("$ 0");
               break;
           case "25":
                $(".barValue").text("$ 6,000");
                $(".monto").text("$ 30,000");
               break;
           case "50":
               $(".barValue").text("$ 20,000");
               $(".monto").text("$ 100,000");
               break;
           case "75":
           $(".barValue").text("$ 50,000");
           $(".monto").text("$ 250,000");
               break;
           case "100":
               $(".barValue").text("$ 100,000");
               $(".monto").text("$ 500,000");
               break;
               
           default:
               // code
       }
       
   });
    
    
}