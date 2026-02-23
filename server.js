const http = require("http");

const server = http.createServer((req, res) => {

    if (req.url === "/") {
        res.writeHead(200, { "Content-Type": "text/html" });
        res.end(`
            <html>
                <head>
                    <title>My First HTTP Server</title>
                    <style>
                        body {
                            font-family: Arial;
                            text-align: center;
                            margin-top: 100px;
                            background: linear-gradient(to right, #df13b2, #f5a9ee);
                            color: white;
                        }
                        h1 {
                            font-size: 40px;
                        }
                        p {
                            font-size: 20px;
                        }
                        button {
                            padding: 10px 20px;
                            font-size: 16px;
                            border: none;
                            border-radius: 5px;
                            cursor: pointer;
                        }
                    </style>
                </head>
                <body>
                    <h1> Welcome Shrushti!</h1>
                    <p>Your HTTP Server is running successfully </p>
                    <button onclick="alert('Node.js is Successful!')">
                        Click Me
                    </button>
                </body>
            </html>
        `);
    } 
    else {
        res.writeHead(404, { "Content-Type": "text/html" });
        res.end("<h1>404 - Page Not Found</h1>");
    }

});

server.listen(5000, () => {
    console.log("Server running at http://localhost:5000");
});