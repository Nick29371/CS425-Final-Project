import mysql.connector
from mysql.connector import IntegrityError, ProgrammingError, InterfaceError

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="graduation",
    database='project'
)
cursor = db.cursor()


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
        print('5. delete data')
        print('6. others')
        print('7. Exit')
        choice = input("Enter your choice: ")
        if choice == '1':
            print("Choose the Table you want: ")
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
        elif choice == '5':
            delete()
            break

            #mycursor.execute("show tables")
            # print('1. Genre')
    #     # print('2. Artists')
    # input = input()
    # if input in ['1','2','3','4','5','6']:
    #   return int(input)
    # else:
    #   return None


def delete():
    print("Choose the Table you want: ")
    print("0. Album")
    print("1. Artist")
    print("2. Genre")
    print("3. Playlist")
    print("4. Playlist_Song")
    print("5. Song")
    print("6. Song_Review")
    print("7. Subscription")
    print("8. User")
    print("9. User_Contact")
    tables = ['Album', 'Artist', 'Genre', 'Playlist_Song', 'Song', 'Song_Review', 'Subscription', 'User', 'User_Contact']
    choice = input("Enter your choice: ")
    table = tables[int(choice)]
    sql_command = 'SELECT * FROM ' + table
    cursor.execute(sql_command)
    results = cursor.fetchall()
    choices = []
    print('Delete options: ')
    for i in range(len(results)):
        print('{0}. {1}'.format(i, results[i][1]))
        choices.append([results[i][0], results[i][1]])
    print(choices)
    choice = input("Enter your choice: ")
    sql_command = "SHOW COLUMNS FROM " + table
    cursor.execute(sql_command)
    id = cursor.fetchall()[0][0]
    sql_command = "DELETE FROM " + table + " WHERE " + id + ' = ' + str(choices[int(choice)][0])
    cursor.execute(sql_command)
    db.commit()
    print('Deleted ' + choices[int(choice)][1] + ' from database')
    return 0


# for x in myresult:
#   print(x)
ask()
