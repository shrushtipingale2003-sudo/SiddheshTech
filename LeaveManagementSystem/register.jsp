<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - Leave Management System</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: 'Poppins', sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background: url('https://images.unsplash.com/photo-1521790797524-b2497295b8a0') no-repeat center center/cover;
    position:relative;
}

/* Keep same dark overlay */
body::before{
    content:"";
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.65);
    z-index:0;
}

/* 🔥 Updated Glass Box */
.container{
    width:420px;
    padding:45px;
    border-radius:20px;
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(18px);
    -webkit-backdrop-filter:blur(18px);
    border:1px solid rgba(255,255,255,0.3);
    box-shadow:0 25px 50px rgba(0,0,0,0.6);
    position:relative;
    z-index:1;
    animation: float 4s ease-in-out infinite;
}

@keyframes float {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-10px); }
    100% { transform: translateY(0px); }
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:rgb(151, 211, 243);
    font-weight:600;
}

input{
    width:100%;
    padding:12px;
    margin:12px 0;
    border-radius:12px;
    border:none;
    outline:none;
    background:rgba(255,255,255,0.85);
    font-size:14px;
    transition:0.3s;
}

input:focus{
    box-shadow:0 0 12px rgba(0,114,255,0.6);
}

button{
    width:100%;
    padding:12px;
    border:none;
    border-radius:12px;
    background:linear-gradient(45deg,#0a449a,#00c6ff);
    color:white;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    transform:scale(1.05);
    box-shadow:0 0 15px rgba(0,198,255,0.7);
}

.footer{
    text-align:center;
    margin-top:18px;
    font-size:14px;
    color:rgb(255, 253, 253);
}

.footer a{
    text-decoration:none;
    color:#09fd21;
    font-weight:500;
}
</style>
</head>

<body>

<div class="container">
    <h2>Employee Registration</h2>

    <form action="<%=request.getContextPath()%>/RegisterServlet" method="post">


        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email Address" required>
        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Register</button>

        <div class="footer">
            Already have account? <a href="login.jsp">Login</a>
        </div>
    </form>
</div>

</body>
</html>
