document.addEventListener("turbolinks:load",function(){firebase_data_user()});var firebase_data_user=function(){firebase.auth().onAuthStateChanged(function(a){if(a){firebase.database().ref("users/"+a.uid).on("value",function(a){showdata(a.val())})}})},showdata=function(a){console.log(a.nombre),$("#nombres").html(a.nombre.charAt(0).toUpperCase().slice(1)+" "),$("#Nombre_u").val(a.nombre),$("#nombres_ua").val(a.nombre+" "+a.apellidoP+" "+a.apellidoM),$("#apellidos").html(a.apellidoP+" "+a.apellidoM),$("#AP_u").val(a.apellidoP),$("#AM_u").val(a.apellidoM);var e=a.Fecha.slice(0,4),l=a.Fecha.slice(5,7),i=a.Fecha.slice(8,10);$("#A\xf1o_u").val(e),$("#Mes_u").val(l),$("#Dia_u").val(i),$("#Ide_u").val(a.Ide),$("#Identificacion_u").val(a.Identificacion),$("#CURP_u").val(a.CURP),$("#RFC_u").val(a.RFC),$("#Estado_u").val(a.Estado),$("#Ciudad_u").val(a.Ciudad),$("#Calle_u").val(a.Calle),$("#Colonia_u").val(a.Colonia),$("#CP_u").val(a.CP),$("#TF_u").val(a.TF),$("#TM_u").val(a.TM),$("#B1_u").val(a.B1),$("#B2_u").val(a.B2),$("#CB_u").val(a.CB),firebase.auth().onAuthStateChanged(function(a){a&&($("#emails").html(a.email),$("#email_u").val(a.email))})};