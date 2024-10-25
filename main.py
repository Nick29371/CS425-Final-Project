import mysql.connector

db = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "graduation",
    database = 'project'
)
# mycursor = db.cursor()
# mycursor.execute("SELECT * FROM genre")

# def create():
  
#   pass

# def read(table):
#  # mycursor.execute("SELECT * FROM "+table)
#   pass

# def update():
#   pass

# def delete():
#   pass


def ask():
  print("Welcome to Apple Music Database")
  while True:
    print('Welcome to the Menu')
    print('1. read data')
    print('2. write data')
    print('3. insert data')
    print('4. update data')
    print('5. others')
    print('6. Exit')
    choice = input("Enter your choice:")
    if choice == '1':
      print("Choose the Table you want:")
      print("0. album")
      print("1. artist")
      print("2. genre")
      print("3. playlist")
      print("4. playlist_song")
      print("5. song")
      print("6. song_review")
      print("7. subscription")
      print("8. user")
      print("9. user_contact")
    
      #mycursor.execute("show tables")
      # print('1. Genre')
  #     # print('2. Artists')
  # input = input()
  # if input in ['1','2','3','4','5','6']:
  #   return int(input)
  # else:
  #   return None



# myresult = mycursor.fetchall()

# for x in myresult:
#   print(x)
ask()
