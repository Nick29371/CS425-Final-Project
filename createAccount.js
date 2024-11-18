document.getElementById("createAccountBtn").addEventListener("click", function () {
    const container = document.getElementById("dynamicContainer");
    document
      .getElementById("createAccountForm")
      .addEventListener("submit", function (event) {
        event.preventDefault();
        alert("Account created successfully!");
      });
  });
  
