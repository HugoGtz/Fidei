 // Get data user.
var logUp = function dataUser(){
    var email = $('#email').val();
    var password = $('#password').val();
    newUser(email,password);
}

// Send data to firebase.
var newUser = function newUser(email,password){
firebase.auth().createUserWithEmailAndPassword(email, password).catch(function(error) {
  // Handle Errors here.
  var errorCode = error.code;
  var errorMessage = error.message;
  
});
 
 firebase.auth().onAuthStateChanged(function(user) {
  if (user) {
   forms();
  } else {
    // No user is signed in.
  }
});    

}

var forms = function fomrs(){
    $(".registroEmail").fadeOut('low');
    $(".UserData").fadeIn("fast");
}

var saveDataUser = function writeUserData() {
    var userId, name, apellido, imageUrl;
    name =$("#nombre").val();
    apellido = $("#apellido").val();
    
  firebase.database().ref('users/' + 2).set({
    apellido: apellido,
    name: name
   
  });
}

