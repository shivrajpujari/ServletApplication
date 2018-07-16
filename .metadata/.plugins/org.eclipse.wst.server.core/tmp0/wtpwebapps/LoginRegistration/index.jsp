  <%@ page import="com.bridgeIt.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="index.css"/>

<script type="text/javascript">


var validEmail = function(value){
    // var email = document.myForm.emailId.value;
    var email = value;
    var emailRegEx = /^[a-zA-Z]+[a-zA-Z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;
    var emailMessage = document.getElementById("emailMsg");
        if(emailRegEx.test(email)==false){
          emailMessage.innerHTML = "*Invalid mail id";
        }else{
          console.log(true);
          emailMessage.innerHTML = "";
        }

  }

  var validPassword = function(value){
  var password= value;
  var passwordMessage = document.getElementById("passwordMsg");
  if(password.length < 3){
  passwordMessage.innerHTML = "*Password should contain atleast 4 characters";
  }else{
  console.log(true);
  passwordMessage.innerHTML = "";
  }
  }



var validation = function() {
    var email = document.myForm.emailId.value;
    var password = document.myForm.password.value;
    var emailMessage = document.getElementById("emailMsg");
    var passwordMessage = document.getElementById("passwordMsg");
   // console.log(email + " " + password);
    //var emailRegEx = new RegExp("^[a-zA-z0-9,+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
    //var emailRegEx = new RegExp( "/^[^\s@_]+[^\s]+@[^\s@]+\.[^\s@]{2,}$/"); 
      var emailRegEx = /^[a-zA-Z]+[a-zA-Z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;


    if (emailRegEx.test(email) && password.length > 3) {
    	 console.log(email + " " + password);
        return true;

    } else if (emailRegEx.test(email) == false) {
        // alert("email id or password is incorrect");
        emailMessage.innerHTML = "*Invalid mail id";
        return false;
    } else if (password.length < 4) {

        passwordMessage.innerHTML = "*Password should contain atleast 4 characters";
        return false;
    }
}


</script>


</head>
<body>

<% 

response.setContentType("text/html");
User user = (User)session.getAttribute("user");
 if (user!=null){
	
	 request.getRequestDispatcher("UserHome.jsp").forward(request, response);
}

 String warning = "";

 if(request.getAttribute("warning")!=null){
	 warning=(String)request.getAttribute("warning");
	 
 }

%>


<div class="tableDiv">
  	<h3 class ="heading" > User LogIn </h3>
	<form action="login" method="post" name="myForm" onsubmit="return validation()">
          <table class="loginTabel">
               
         	  <tr>
 	 		<td colspan="2"><span style="color:red;font-size: 15px;padding-left:100px;"> <%= warning %> </span></td>
   				</tr>
             	<tr>
                    <td> Email id:- </td>
                    <td> <input type="email" name="emailId" required onchange="validEmail(this.value)"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2" ><span id="emailMsg"></span></td>
                </tr>
                <tr>
                    <td>Password :- </td>
                    <td> <input type="password" name="password" required onchange="validPassword(this.value)"/> </td>
                </tr>
                <tr>
               
                    <td colspan="2"><span id="passwordMsg"></span></td>
                </tr>
                <tr>
                    <td colspan="2" class="submitButton"> <input class="btn" type="submit" value="login " /></td>
                </tr>
                <tr>
                    <td colspan="2" class="register"><a href="Registration.jsp">Register</a></td>
                </tr>

            </table>
</form>
</div>
</body>
</html>



