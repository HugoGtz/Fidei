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
               $(".barValue").text("$0");
               $(".monto").text("$0");
               break;
           case "25":
                $(".barValue").text("$6000");
                $(".monto").text("$60000");
               break;
           case "50":
               $(".barValue").text("$20000");
               $(".monto").text("$200000");
               break;
           case "75":
           $(".barValue").text("$50000");
           $(".monto").text("$500000");
               break;
           case "100":
               $(".barValue").text("$   100000");
               $(".monto").text("$  1000000");
               break;
               
           default:
               // code
       }
       
   });
    
    
}