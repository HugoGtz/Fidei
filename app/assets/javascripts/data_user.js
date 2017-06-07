document.addEventListener("turbolinks:load", function() {
  firebase_data_user();
})

var firebase_data_user = function firebase_data_user(){
	var user = $("#id_user_to_data").val();
	var commentsRef = firebase.database().ref('users/' + user);
	commentsRef.on('value', function(data) {
		showdata(data.val());
		
	});
	
	
}
var showdata = function(data){
	console.log(data.nombre);
	$("#nombres").html(data.nombre);
	$("#Nombre_u").val(data.nombre);
	$("#apellidos").html(data.apellidoP+" "+data.apellidoM);
	$("#AP_u").val(data.apellidoP);
	$("#AM_u").val(data.apellidoM);
    var año = (data.Fecha).slice(0,4);
    var mes = (data.Fecha).slice(5,7);
    var dia = (data.Fecha).slice(8,10);
	$("#Año_u").val(año);
	$("#Mes_u").val(mes);
	$("#Dia_u").val(dia);
	$("#Ide_u").val(data.Ide);
	$("#Identificacion_u").val(data.Identificacion);
	$("#CURP_u").val(data.CURP);
	$("#RFC_u").val(data.RFC);
	// $("#Estado_u").val(data.Estado);
	$("#Ciudad_u").val(data.Ciudad);
	$("#Calle_u").val(data.Calle);
	$("#Colonia_u").val(data.Colonia);
	$("#CP_u").val(data.CP);
	$("#TF_u").val(data.TF);
	$("#TM_u").val(data.TM);
	$("#B1_u").val(data.B1);
	$("#B2_u").val(data.B2);
	$("#CB_u").val(data.CB);
	firebase.auth().onAuthStateChanged(function(user) {
		  if (user) {
		  	$("#emails").html(user.email);
		  }
	});
}

