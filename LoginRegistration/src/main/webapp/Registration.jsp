<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="register.css">
    <script type="text/javascript">

    var validEmail = function(value){
      // var email = document.myForm.emailId.value;
      var email = value;
      var emailRegEx = /^[a-zA-Z]+[a-zA-Z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;
      var emailMessage = document.getElementById("email");
          if(emailRegEx.test(email)==false){
            emailMessage.innerHTML = "*Invalid mail id";
          }else{
            console.log(true);
            emailMessage.innerHTML = "";
          }

    }

    var validPassword = function(value){
    var password = value;
    var passwordMessage = document.getElementById("password");
    if(password.length < 3){
    passwordMessage.innerHTML = "*Password should contain atleast 4 characters";
    }else{
    console.log(true);
    passwordMessage.innerHTML = "";
    }
    }

  var validUserName = function(value){

    var userName = value;
    var userNameMessage = document.getElementById("username");
    if(userName.length < 4){
    userNameMessage.innerHTML = "*username must contain more then 3 characters";
    }else{
    console.log(true);
    userNameMessage.innerHTML = "";
    }

  }



    var validation = function() {

            var userName = document.registerForm.userName.value;
            var pass1 = document.registerForm.pass1.value;
            var pass2 = document.registerForm.pass2.value;
            var email = document.registerForm.emailId.value;
            console.log(email);
            var emailRegEx = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (userName.length > 3 && pass1 === pass2 && emailRegEx.test(email)) {

                return true;

            }

            if (userName.length < 4) {
                document.getElementById("username").innerHTML = "username must contain more then 3 characters";
            }
            if (pass1 != pass2) {
                document.getElementById("password").innerHTML = "password doesn't matches plz enter again";
            }
            if (!emailRegEx.test(email)) {
                document.getElementById("email").innerHTML = "invalid email entered";
            }
            console.log(false);
            return false;
        }
    </script>

</head>
<body>



<%
  HttpSession session1 = request.getSession(false);
String warning="";
if(session1.getAttribute("warning")!=null){
 warning = (String)session1.getAttribute("warning");
	session.setAttribute("warning", null);
} 

%>

<div class="tableDiv">
        <form action="registerUser" method="post" name="registerForm" onsubmit="return validation()">
            <table class="loginTabel">
      
               <tr>
 	 		<td colspan="2"><span style="color:red;font-size: 15px;padding-left:100px;"> <%= warning %> </span></td>
   				</tr>
            
                <tr>

                    <td> UserName:- </td>
                    <td> <input type="text" name="userName" required onchange="validUserName(this.value)"> </td>
                </tr>

                <tr>

                    <td colspan="2"> <span id="username" class="message"></span> </td>

                </tr>

                <tr>
                    <td> FullName:- </td>
                    <td> <input type="text" name="fullName" required > </td>
                </tr>

                <tr>
                    <td colspan="2"> <span id="fullNameMessage">  </span> </td>
                </tr>

                <tr>
                    <td> Email:- </td>
                    <td> <input type="text" name="emailId" required onchange="validEmail(this.value)"> </td>
                </tr>

                <tr>
                    <td colspan="2"><span id="email" class="message"></span></td>
                </tr>

                <tr>
                    <td> Password:- </td>
                    <td> <input type="password" name="pass1" required onchange="validPassword(this.value)"> </td>
                </tr>

                <tr>
                    <td colspan="2"> <span id="password" class="message"></span> </td>
                </tr>

                <tr>
                    <td> Retype-Password:- </td>
                    <td> <input type="password" name="pass2" required> </td>
                </tr>

                <tr>
                    <td colspan="2"> <input type="submit" value="register"> </td>
                </tr>

            </table>

        </form>
    </div>

</body>      
   
</html>