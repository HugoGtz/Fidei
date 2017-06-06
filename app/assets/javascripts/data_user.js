$(document).ready(function(){
	firebase_data_user();
});

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
	$("#apellidos").html(data.apellidoP+" "+data.apellidoM);
	firebase.auth().onAuthStateChanged(function(user) {
		  if (user) {
		  	$("#emails").html(user.email);
		  }
	});
}