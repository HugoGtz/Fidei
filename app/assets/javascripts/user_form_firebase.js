document.addEventListener("turbolinks:load", function() {
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
    // var Plan = $("#Plan").val();
    
  
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
        
        
        // exp reg
        
        var exptel = /[0-9]{10}/ // expreg para los telefonos 10 digitos.
        var expcurp = /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9][12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/ //exp regular para curp
        var expCb = /[0-9]{18}/
        var expRfc = /^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))([A-Z\d]{3})?$/
        
        if ((exptel.test(TF)) && (validarInput(CURP)))
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
        B2
            );
               swal(
              'Buen Trabajo!',
              'Bienvenido a Fidei',
              'success'
                )
                
        return true;
      
    }else{
        alert("Aun no has Aceptado terminos y condiciones o el contrato.")
        return false;
    }
        else{
            swal("Algun dato no esta correcto porfavor verifique los telefonos, curp, cuenta interbancaria o RFC");
        }
    
}



var writeUserData = function writeUserData(
    id, nombre, apellidoP, apellidoM, CURP, RFC, Fecha, Ide, Identificacion, Estado, Ciudad, Calle, Colonia, CP, TF, TM, CB, B1, B2
) {
    
  
  firebase.auth().onAuthStateChanged(function(user) {

  var adaRef = firebase.database().ref('users/' + user.uid);
  adaRef.set({
    nombre: nombre,
    apellidoP: apellidoP,
    apellidoM: apellidoM,
    CURP: CURP,
    RFC: RFC,
    Fecha: Fecha,
    Ide: Ide,
    Identificacion: Identificacion,
    Estado: Estado,
    Ciudad: Ciudad,
    Colonia: Colonia,
    Calle: Calle,
    CP: CP,
    TF: TF,
    TM: TM,
    CB: CB,
    B1: B1,
    B2: B2,
  }).then(function() {
    $.ajax({
      type: "GET",
      url: "/user_form_firebase/changeFormStatus"
    });
  })
  .catch(function(error) {
    return false;
  });
  });
}




function curpValida(curp) {
    var re = /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/,
        validado = curp.match(re);
	
    if (!validado)  //Coincide con el formato general?
    	return false;
    
    //Validar que coincida el dígito verificador
    function digitoVerificador(curp17) {
        //Fuente https://consultas.curp.gob.mx/CurpSP/
        var diccionario  = "0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZ",
            lngSuma      = 0.0,
            lngDigito    = 0.0;
        for(var i=0; i<17; i++)
            lngSuma = lngSuma + diccionario.indexOf(curp17.charAt(i)) * (18 - i);
        lngDigito = 10 - lngSuma % 10;
        if (lngDigito == 10) return 0;
        return lngDigito;
    }
  
    if (validado[2] != digitoVerificador(validado[1])) 
    	return false;
        
    return true; //Validado
}


//Handler para el evento cuando cambia el input
//Lleva la CURP a mayúsculas para validarlo
function validarInput(input) {
    var curp = input.toUpperCase(),
        resultado = document.getElementById("resultado"),
        valido = "No válido";
        
    if (curpValida(curp)) { // ⬅️ Acá se comprueba

        return true;
    } else {
    	return false
    }
        
}