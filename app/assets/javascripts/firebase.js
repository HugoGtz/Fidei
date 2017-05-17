$(document).ready(function(){
   
  $("#inicioUser").submit(function(){
    console.log("funciono");
    var email = $('#email').val();
    var password = $('#password').val();
    return sessionEmail(email,password);
  });
});

