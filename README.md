# CRUD Operations with MySQL using Python

This project demonstrates **Create, Read, Update, and Delete (CRUD)** operations using Python with a **MySQL database**.

## Prerequisites

Before running this project, ensure you have the following installed:

1. **Python 3.x**
   
2. **MySQL Server**  

4. **mysql-connector-python** (Install via pip)  
   ```bash
   pip install mysql-connector-python
   ```

---

---

## Setup

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd project-root
   ```

2. **Set Up MySQL Database**  
   - Create a new MySQL database:
     ```sql
     CREATE DATABASE crud_db;
     ```
   - Use the following command to switch to the database:
     ```sql
     USE crud_db;
     ```
   - Create a sample table:
     ```sql
     CREATE TABLE users (
         id INT AUTO_INCREMENT PRIMARY KEY,
         name VARCHAR(100) NOT NULL,
         email VARCHAR(100) UNIQUE NOT NULL,
         age INT NOT NULL
     );
     ```

3. **Configure Database Connection**  
   Update the `config.py` file with your database credentials:

   ```python
   # config.py
   DB_HOST = "localhost"
   DB_USER = "your_username"
   DB_PASSWORD = "your_password"
   DB_NAME = "crud_db"
   ```

4. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

---

## Usage

Run the `crud.py` file to perform operations:

```bash
python crud.py
```

Here is a basic example of what you can expect from the program:

```
1. Create a new user
2. Read all users
3. Update a user
4. Delete a user
5. Exit
Select an option:
```

---

## CRUD Operations

1. **Create:** Insert a new user record.
2. **Read:** Retrieve and display all user records.
3. **Update:** Modify an existing user’s details.
4. **Delete:** Remove a user from the database.

### Example Code Snippet for Inserting Data

```python
import mysql.connector
from config import DB_HOST, DB_USER, DB_PASSWORD, DB_NAME

# Connect to MySQL
connection = mysql.connector.connect(
    host=DB_HOST,
    user=DB_USER,
    password=DB_PASSWORD,
    database=DB_NAME
)

cursor = connection.cursor()

# Example: Insert a new user
insert_query = "INSERT INTO users (name, email, age) VALUES (%s, %s, %s)"
data = ("Alice", "alice@example.com", 30)
cursor.execute(insert_query, data)
connection.commit()

print("User added successfully!")

cursor.close()
connection.close()
```

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Feel free to modify the code and structure as needed for your use case. Happy coding! 🚀
