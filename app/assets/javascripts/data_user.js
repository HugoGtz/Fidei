$(document).ready(function(){
	firebase_data_user();
});

var firebase_data_user = function firebase_data_user(){
	var user = $("#id_user_to_data").val();
	var commentsRef = firebase.database().ref('users/' + user);
	commentsRef.on('value', function(data) {
		showdata(data.val().nombre, data.val().CEL);
	});
	
	
}
var showdata = function(nombre,cel){
	console.log(nombre);
	console.log(cel);
}