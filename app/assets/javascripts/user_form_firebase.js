$(document).ready(function(){
   $("#dataUser").submit(function(){
        dataUser();
        return false;
   });
});

var dataUser = function dataUser() {
    var terminos;
    var contrato;
    var id = $("#id_user").val();
    var nombre = $("#nombre").val();
    var apellidoP = $("#apellidoP").val();
    var apellidoM = $("#apellidoM").val();
    var RFC = $("#RFC").val();
    var identifiacion = $("#identifiacion").val();
    var ciudad = $("#Ciudad").val();
    var colonia = $("#Colonia").val();
    var calle = $("#calle").val();
    var CP = $("#CP").val();
    var TP = $("#TP").val();
    var CEL = $("#Cel").val();
    var CURP = $("#CURP").val();
    var Monto = $('input:radio[name=monto]:checked').val();
    console.log(Monto);
        
        if ($('input:checkbox[name=t1]:checked').val() == "true") {
            terminos = true;
        }else{
            terminos = false;
        }

        if ($('input:checkbox[name=c1]:checked').val() == "true") {
            contrato = true;
        }else{
            contrato = false;
        }
        
     console.log(terminos);
     console.log(contrato);
     
    if (terminos && contrato) {
        writeUserData(id,nombre,apellidoP,apellidoM,RFC,identifiacion,ciudad,colonia,calle,CP,TP,CEL,CURP,Monto);
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

var writeUserData = function writeUserData(id,nombre,apellidoP,apellidoM,RFC,identifiacion,ciudad,colonia,calle,CP,TP,CEL,CURP,Monto) {
    
  firebase.database().ref('users/' + id).set({
    nombre: nombre,
    apellidoP: apellidoP,
    apellidoM: apellidoM,
    RFC: RFC,
    identifiacion: identifiacion,
    ciudad: ciudad,
    colonia: colonia,
    calle: calle,
    CP: CP,
    TP: TP,
    CEL: CEL,
    CURP: CURP,
    Monto: Monto
   
  });
}