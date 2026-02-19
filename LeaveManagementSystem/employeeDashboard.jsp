<%
String role = (String) session.getAttribute("role");
if(role == null || !role.equals("employee")){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:url('https://images.unsplash.com/photo-1497366216548-37526070297c') no-repeat center center/cover;
    min-height:100vh;
    position:relative;
}

/* Dark overlay */
body::before{
    content:"";
    position:absolute;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.6);
    z-index:0;
}

/* Navbar */
.navbar{
    position:relative;
    z-index:1;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 40px;
    background:rgba(0,0,0,0.5);
    color:white;
}

.logout{
    background:#ff4b5c;
    padding:8px 15px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    color:white;
}

/* Center Container */
.container{
    position:relative;
    z-index:1;
    min-height:85vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* Glass Card */
.card{
    background:rgba(255,255,255,0.15);
    backdrop-filter:blur(15px);
    padding:40px;
    border-radius:20px;
    width:450px;
    box-shadow:0 25px 50px rgba(0,0,0,0.5);
    color:white;
    text-align:center;
}

input, textarea{
    width:100%;
    padding:10px;
    margin:10px 0;
    border-radius:10px;
    border:none;
}

button{
    padding:10px 20px;
    border:none;
    border-radius:10px;
    background:#00c6ff;
    color:white;
    cursor:pointer;
}

button:hover{
    background:#0072ff;
}
</style>
</head>

<body>

<div class="navbar">
    <h2>Employee Dashboard</h2>
    <a href="login.jsp"><button class="logout">Logout</button></a>
</div>

<div class="container">

    <div class="card">
        <h3>Apply For Leave</h3>

        <form action="<%=request.getContextPath()%>/ApplyLeaveServlet" method="post">
            <input type="date" name="fromDate" required>
            <input type="date" name="toDate" required>
            <textarea name="reason" placeholder="Reason for leave" required></textarea>
            <button type="submit">Apply Leave</button>
        </form>
    </div>

</div>

</body>
</html>
