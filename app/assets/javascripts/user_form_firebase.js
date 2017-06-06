$(document).ready(function(){
  $(".next-form").on("click", function(){
      var op = $(this).attr("alt");
      switch (op) {
          case '1':
              $(".1").fadeOut('fast');
              $(".2").fadeIn("slow");
              break;
          case '2':
              $(".2").fadeOut('fast');
              $(".3").fadeIn('slow');
              break;
          
          default:
              // code
      }
   });
   
   $(".atras").on("click", function(){
      var op2 = $(this).attr("alt");
      switch (op2) {
          case '3':
              $(".3").fadeOut("fast");
              $(".2").fadeIn("slow");
              break;
          case '2':
              $(".2").fadeOut("fast");
              $(".1").fadeIn('slow');
          break;
          default:
              // code
      }
   });
});

var dataUser = function dataUser() {
    var AP;
    var CT;
    var id = $("#id_user").val();
    var nombre = $("#nombre").val();
    var apellidoP = $("#apellidoP").val();
    var apellidoM = $("#apellidoM").val();
    var CURP = $("#CURP").val();
    var RFC = $("#RFC").val();
    var FechaAño = $("#FechaAño").val();
    var FechaMes = $("#FechaMes").val();
    var FechaDia = $("#FechaDia").val();
    var Ide = $("#Ide").val();
    var Identificacion = $("#Identificacion").val();
    
    var Estado = $("#Estado").val();
    var Ciudad = $("#Ciudad").val();
    var Calle = $("#Calle").val();
    var Colonia = $("#Colonia").val();
    var CP = $("#CP").val();
    var TF = $("#TF").val();
    var TM = $("#TM").val();
    
    

    // Concatenar Fecha
    var Fecha = FechaAño+"-"+FechaMes+"-"+FechaDia;
    
    
    //Banca
    var CB = $("#CB").val();
    var B1 = $("#B1").val();
    var B2 = $("#B2").val();
    var Plan = $("#Plan").val();
    
  
        if ($('input:checkbox[name=t1]:checked').val() == "true") {
            AP = true;
        }else{
            AP = false;
        }

        if ($('input:checkbox[name=c1]:checked').val() == "true") {
            CT = true;
        }else{
            CT = false;
        }
        
     
    if (AP && CT) {
        writeUserData(
              id,
        nombre,
        apellidoP,
        apellidoM,
        CURP,
        RFC,
        Fecha,
        Ide,
        Identificacion,
        Estado,
        Ciudad,
        Calle,
        Colonia,
        CP,
        TF,
        TM,
        CB,
        B1,
        B2,
        Plan
            );
               swal(
              'Buen Trabajo!',
              'Bienvenido a Fidei',
              'success'
                )
                
        return false;
      
    }else{
        alert("Aun no has Aceptado terminos y condiciones o el contrato.")
        return false;
    }
    
}

var writeUserData = function writeUserData(
        id,
        nombre,
        apellidoP,
        apellidoM,
        CURP,
        RFC,
        Fecha,
        Ide,
        Identificacion,
        Estado,
        Ciudad,
        Calle,
        Colonia,
        CP,
        TF,
        TM,
        CB,
        B1,
        B2,
        Plan

) {
    
  firebase.database().ref('users/' + id).set({
    nombre: nombre,
    apellidoP: apellidoP,
    apellidoM: apellidoM,
    CURP: CURP,
    RFC: RFC,
    Fecha: Fecha,
    Ide: Ide,
    Identificacion: Identificacion,
    Ciudad: Ciudad,
    Colonia: Colonia,
    Calle: Calle,
    CP: CP,
    TF: TF,
    TM: TM,
    CB: CB,
    B1: B1,
    B2: B2,
    Plan: Plan,
   
  });
}



