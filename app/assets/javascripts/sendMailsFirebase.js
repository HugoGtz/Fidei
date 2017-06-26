
// Function para restablecer contraseña
var restablecer = function(){

    var auth = firebase.auth();
    auth.sendPasswordResetEmail(emailAddress).then(function() {
        success_reset();
    }, function(error) {
      // An error happened.
    });

   
}







// Succces de envio de email para recuperar contraseña firebase.
var success_reset = function(){
    swal(
  'Correcto',
  'Se a enviado un email para recuperar tu contraseña.',
  'success'
        )
}