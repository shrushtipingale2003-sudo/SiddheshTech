const express = require("express");
const app = express();

app.use(express.json());

// Simple GET API
app.get("/", (req, res) => {
    res.send("Hello 👋 Your first Node API is working!");
});

// GET users
app.get("/users", (req, res) => {
    res.json([
        { id: 1, name: "Shrushti" },
        { id: 2, name: "Hitesh" }
    ]);
});

// POST user
app.post("/users", (req, res) => {
    const user = req.body;
    res.json({
        message: "User added successfully",
        data: user
    });
});

const PORT = 3000;

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});