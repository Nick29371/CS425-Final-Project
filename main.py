import mysql.connector

db = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "graduation",
    database = 'project'
)


mycursor = db.cursor()

mycursor.execute("SELECT * FROM genre")

myresult = mycursor.fetchall()

for x in myresult:
  print(x)