 // Get data user.
var logUp = function dataUser(){
    var email = $('#email').val();
    var password = $('#password').val();
    newUser(email,password);
}

var logIn = function logIn(){
    var email = $('#email').val();
    var password = $('#password').val();
    sessionEmail(email,password);
    
}

var sessionEmail = function sessionEmail(email,password){
    firebase.auth().signInWithEmailAndPassword(email, password).catch(function(error) {
  // Handle Errors here.
  var errorCode = error.code;
  var errorMessage = error.message;
  console.log(errorCode);
  console.log(errorMessage);
  if (errorMessage) {
      errorRegister(errorMessage);
  }else{
   success();
  }
  // ...
});
}

var success = function success(){
          swal(
  'Good job!',
  'Bienvenido a Fidei',
  'Hola.'
    )
}
// Send data to firebase.
var newUser = function newUser(email,password){
firebase.auth().createUserWithEmailAndPassword(email, password).catch(function(error) {
  // Handle Errors here.
  var errorCode = error.code;
  var errorMessage = error.message;
  if (errorMessage) {
      errorRegister(errorMessage);
  }
  
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
      swal(
  'Good job!',
  'You clicked the button!',
  'success'
    )
}

var errorRegister = function errorRegister(errorMessage){
    swal(
  'Oops...',
  errorMessage,
  'error'
);
}