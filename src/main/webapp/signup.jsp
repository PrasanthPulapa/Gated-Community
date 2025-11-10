<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin SignUp</title>
</head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Signup |Prasanth Gated Community</title>
  <style>
    body {
      margin: 0;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #8360c3, #2ebf91);
      color: #fff;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .container {
      background: rgba(255, 255, 255, 0.1);
      padding: 40px 35px;
      border-radius: 16px;
      box-shadow: 0 8px 30px rgba(0,0,0,0.3);
      width: 420px;
      text-align: center;
      backdrop-filter: blur(8px);
    }
    h2 {
      margin-bottom: 15px;
    }
    label {
      display: block;
      text-align: left;
      margin-top: 12px;
      font-size: 14px;
    }
    input {
      width: 100%;
      padding: 12px;
      margin-top: 6px;
      border-radius: 10px;
      border: none;
      outline: none;
      font-size: 15px;
    }
    input[type="text"], input[type="email"], input[type="password"] {
      background: rgba(255, 255, 255, 0.9);
      color: #333;
    }
    .btn {
      width: 100%;
      padding: 14px;
      margin-top: 20px;
      border: none;
      border-radius: 12px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      background: linear-gradient(90deg, #2ebf91, #8360c3);
      color: #fff;
      transition: 0.3s;
    }
    .btn:hover {
      transform: scale(1.05);
    }
    .login {
      margin-top: 18px;
      font-size: 14px;
      color: #ddd;
    }
    .login a {
      color: #ffeb3b;
      text-decoration: none;
      font-weight: bold;
    }
    .login a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Admin Signup</h2>
    <form method="post" action="signup">
      <label for="username">Username :</label>
      <input type="text" name="name" placeholder="Enter your name" required />

      <label for="email">Email :</label>
      <input type="email" name="email" placeholder="Enter your email" required />

      <label for="phone">Phone Number :</label>
      <input type="text" name="phone" placeholder="Enter your phone number" required />
      
      <label for="role">Role :</label>
      <div class="roles">
        <label><input type="radio" name="role" value="Admin" required /> Admin</label>
        <label><input type="radio" name="role" value="Resident" required /> Resident</label>
      </div>

      <label for="password">Password :</label>
      <input type="password" name="password" placeholder="Enter your password" required />

      <label for="confirm-password">Confirm Password :</label>
      <input type="password" name="confirmPassword" placeholder="Enter your password again" required />

      <button type="submit" class="btn">Sign Up</button>
    </form>

    <div class="login">
      Already have an account? <a href="admin.jsp">Login here</a>
    </div>
  </div>
</body>
</html>