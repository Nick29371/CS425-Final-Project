document.getElementById("createAccountBtn").addEventListener("click", function () {
    const container = document.getElementById("dynamicContainer");
    container.innerHTML = `
      <div id="createAccountContainer">
        <h2>Create an Account</h2>
        <form id="createAccountForm">
          <label for="username">Username:</label>
          <input type="text" id="username" name="username" required>
          
          <label for="name">Full Name:</label>
          <input type="text" id="name" name="name" required>
          
          <label for="email">Email:</label>
          <input type="email" id="email" name="email" required>
          
          <label for="password">Password:</label>
          <input type="password" id="password" name="password" required>
          
          <label for="birthday">Birthday:</label>
          <input type="date" id="birthday" name="birthday" required>
          
          <label for="subscriptionType">Subscription Type:</label>
          <select id="subscriptionType" name="subscriptionType" required>
            <option value="individual">Individual</option>
            <option value="family">Family</option>
            <option value="student">Student</option>
          </select>
          
          <label for="city">City:</label>
          <input type="text" id="city" name="city" required>
          
          <label for="state">State:</label>
          <input type="text" id="state" name="state" required>
          
          <label for="zipcode">Zipcode:</label>
          <input type="text" id="zipcode" name="zipcode" required>
          
          <button type="submit">Submit</button>
        </form>
      </div>
    `;
  
    document
      .getElementById("createAccountForm")
      .addEventListener("submit", function (event) {
        event.preventDefault();
        alert("Account created successfully!");
      });
  });
  