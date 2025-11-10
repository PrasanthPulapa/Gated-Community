<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Resident Login | Prasanth Gated Community</title>
<style>
body {
	margin: 0;
	font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #43cea2, #185a9d);
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
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
	width: 360px;
	text-align: center;
	backdrop-filter: blur(8px);
}

h2 {
	margin-bottom: 10px;
}

p {
	font-size: 14px;
	margin-bottom: 20px;
	color: #e0e0e0;
}

input {
	width: 100%;
	padding: 12px;
	margin: 10px 0;
	border-radius: 10px;
	border: none;
	outline: none;
	font-size: 15px;
}

input[type="text"], input[type="password"] {
	background: rgba(255, 255, 255, 0.9);
	color: #333;
}

.btn {
	width: 100%;
	padding: 14px;
	margin-top: 12px;
	border: none;
	border-radius: 12px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	background: linear-gradient(90deg, #43e97b, #38f9d7);
	color: #fff;
	transition: 0.3s;
}

.btn:hover {
	transform: scale(1.05);
}

.signup {
	margin-top: 16px;
	font-size: 14px;
	color: #ddd;
}

.signup a {
	color: #ffeb3b;
	text-decoration: none;
	font-weight: bold;
}

.signup a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Resident Login</h2>
		<p>Welcome back! Please login to your account</p>

		<!-- Login Form -->
		<form action="login" method="post">
			<input type="email" name="email" placeholder="email" required /> <input
				type="password" name="password" placeholder="Password" required />
			<button type="submit" class="btn">Login</button>
		</form>

		<div class="SignUp">
			Don’t have an account? <a href="register.jsp">Sign up here</a><br>
			<a href="index.html" class="back-btn">← Back to Dashboard</a>
		</div>
	</div>
</body>
</html>