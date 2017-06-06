
$(document).ready(function(){
   
  /*$("#inicioUser").submit(function(){
    console.log("funciono");
    var email = $('#email').val();
    var password = $('#password').val();
    
    setTimeout(sessionEmail(email,password),5000)
    return true;
  });*/
  
  $("#formSigUp").submit(function(){
     var email = $("#email").val();
     var password = $("#password").val();
     return newUser(email,password);
  });
});
