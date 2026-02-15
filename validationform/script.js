const form = document.getElementById("myForm");

form.addEventListener("submit", function(event) {

    event.preventDefault(); // Stop form submission

    let isValid = true;

    // Get values
    const name = document.getElementById("name").value.trim();
    const phone = document.getElementById("phone").value.trim();
    const email = document.getElementById("email").value.trim();

    // Clear previous errors
    document.getElementById("nameError").innerText = "";
    document.getElementById("phoneError").innerText = "";
    document.getElementById("emailError").innerText = "";

    // Name validation
    if (name === "") {
        document.getElementById("nameError").innerText = "Name cannot be empty";
        isValid = false;
    }

    // Phone validation (only numbers)
    const phonePattern = /^[0-9]+$/;
    if (!phonePattern.test(phone)) {
        document.getElementById("phoneError").innerText = "Phone must contain only numbers";
        isValid = false;
    }

    // Email validation
    const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if (!emailPattern.test(email)) {
        document.getElementById("emailError").innerText = "Enter valid email with @";
        isValid = false;
    }

    if (isValid) {
        alert("Form Submitted Successfully 🎉");
        form.reset();
    }

});
