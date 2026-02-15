let tasks = JSON.parse(localStorage.getItem("tasks")) || [];

function saveTasks() {
    localStorage.setItem("tasks", JSON.stringify(tasks));
}

function displayTasks() {
    const taskList = document.getElementById("taskList");
    const taskCount = document.getElementById("taskCount");
    taskList.innerHTML = "";

    tasks.forEach((task, index) => {
        const li = document.createElement("li");
        li.textContent = task.text;

        if (task.completed) {
            li.classList.add("completed");
        }

        li.onclick = () => {
            tasks[index].completed = !tasks[index].completed;
            saveTasks();
            displayTasks();
        };

        const deleteBtn = document.createElement("button");
        deleteBtn.textContent = "❌";
        deleteBtn.classList.add("delete-btn");

        deleteBtn.onclick = (e) => {
            e.stopPropagation();
            tasks.splice(index, 1);
            saveTasks();
            displayTasks();
        };

        li.appendChild(deleteBtn);
        taskList.appendChild(li);
    });

    taskCount.textContent = `📌 Total Tasks: ${tasks.length}`;
}

function addTask() {
    const input = document.getElementById("taskInput");
    const taskText = input.value.trim();

    if (taskText === "") {
        alert("Please enter a task!");
        return;
    }

    tasks.push({ text: taskText, completed: false });
    saveTasks();
    displayTasks();
    input.value = "";
}

displayTasks();
