<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leave Management System</title>

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

/* Dark overlay for professional look */
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

.container{
    display:flex;
    width:900px;
    height:500px;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 25px 50px rgba(0,0,0,0.6);
    position:relative;
    z-index:1;
}

.left{
    flex:1;
    background: linear-gradient(to bottom right,#6dc7df,#010c19);
    color:white;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    padding:40px;
    text-align:center;
}

.left h1{
    font-size:32px;
    margin-bottom:20px;
}

.left p{
    font-size:14px;
    opacity:0.9;
}

.right{
    flex:1;
    background:rgba(255,255,255,0.95);
    display:flex;
    justify-content:center;
    align-items:center;
}

.login-box{
    width:300px;
}

.login-box h2{
    margin-bottom:25px;
    text-align:center;
    font-weight:600;
}

.input-box{
    margin-bottom:15px;
}

.input-box input,
.input-box select{
    width:100%;
    padding:10px;
    border-radius:8px;
    border:1px solid #ccc;
    outline:none;
    transition:0.3s;
}

.input-box input:focus,
.input-box select:focus{
    border-color:#0072ff;
    box-shadow:0 0 8px rgba(0,114,255,0.4);
}

button{
    width:100%;
    padding:10px;
    border:none;
    border-radius:8px;
    background:#01060d;
    color:white;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#0056cc;
    transform:scale(1.05);
}

.footer{
    margin-top:15px;
    text-align:center;
    font-size:13px;
}
.footer a{
    text-decoration:none;
    color:#e62727;
    font-weight:500;
}
</style>
</head>

<body>

<div class="container">

    <div class="left">
        <h1>Leave Management System</h1>
        <p>Manage employee leaves efficiently with a secure and modern system.</p>
    </div>

    <div class="right">
        <div class="login-box">
            <h2>Login</h2>

            <form action="<%=request.getContextPath()%>/LoginServlet" method="post">


                <div class="input-box">
                    <input type="text" name="email" placeholder="Enter Username" required>
                </div>

                <div class="input-box">
                    <input type="password" name="password" placeholder="Enter Password" required>
                </div>

                <div class="input-box">
                    <select name="role" required>
                        <option value="">Select Role</option>
                        <option value="admin">Admin</option>
                        <option value="employee">Employee</option>
                    </select>
                </div>

                <button type="submit">Login</button>

                <div class="footer">
                    Don't have account? <a href="register.jsp">Register</a>
                </div>

            </form>
        </div>
    </div>

</div>

</body>
</html>
