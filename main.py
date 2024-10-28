import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="graduation",
    database='project'
)
cursor = db.cursor()


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
        elif choice == '3':
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

            choiceofTable = input("Enter what you want: ")

            if choiceofTable == '2':
              input_genre_data()     
            elif choiceofTable == '1':
              input_artist_data()
            elif choiceofTable == '0':
              input_album_data()
            elif choiceofTable == '8':
              input_user_data()
            elif choiceofTable == '3':
              input_playlist_data()
            elif choiceofTable == '5':
              input_song_data()
            elif choiceofTable == '6':
              input_song_review()
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

def create_genre(genre_name):
    cursor = db.cursor() 
    cursor.execute('''
    INSERT INTO genre (genre_name)
    VALUES (%s)
    ''', (genre_name,))
    db.commit()  

def create_artist(artist_name, listeners_no, photo_cover, birth_date, hometown_state, bio, GID):
    cursor = db.cursor()
    cursor.execute('''
    INSERT INTO Artist (artist_name, listeners_no, photo_cover, birth_date, hometown_state, bio, GID)
    VALUES (%s, %s, %s, %s, %s, %s, %s)
    ''', (artist_name, listeners_no, photo_cover, birth_date, hometown_state, bio, GID))
    db.commit()

def create_album(title_album, release_date, photo, release_type,artist_ID, GID):
    cursor = db.cursor()
    cursor.execute('''
    INSERT INTO Album (title_album, release_date, photo, release_type,artist_ID, GID)
    VALUES (%s, %s, %s, %s, %s, %s)
    ''', (title_album, release_date, photo, release_type,artist_ID, GID))
    db.commit()

def create_user(user_name, email, password, birthday_user, followers_no, following_no, subscription_ID, profile_picture, street_address, city, state, zip_code):
    cursor = db.cursor()
    cursor.execute(''' INSERT INTO User (user_name, email, password, birthday_user, followers_no, following_no, subscription_ID, profile_picture, street_address, city, state, zip_code)
    VALUES (%s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s,%s)
    ''', (user_name, email, password, birthday_user, followers_no, following_no, subscription_ID, profile_picture, street_address, city, state, zip_code))
    db.commit()

def create_playlist(playlist_name, UID):
    cursor = db.cursor()
    cursor.execute(''' INSERT INTO Playlist ( playlist_name, UID)
    VALUES (%s, %s)
    ''', (playlist_name, UID))
    db.commit()

def create_song(sname, duration, artist_ID, album_ID, GID):
    cursor = db.cursor()
    cursor.execute(''' INSERT INTO Song (sname, duration, artist_ID, album_ID, GID)
    VALUES (%s, %s, %s, %s, %s)
    ''', (sname, duration, artist_ID, album_ID, GID))
    db.commit()

def create_song_review(rating, review_date, review_text, UID, SID):
    cursor = db.cursor()
    cursor.execute(''' INSERT INTO Song_Review (rating, review_date, review_text, UID, SID)
    VALUES (%s, %s, %s, %s, %s)
    ''', (rating, review_date, review_text, UID, SID))
    db.commit()

def input_genre_data():
    genre_name = input("Enter the name of the genre: ")
    create_genre(genre_name)  # Call create function
    print(f"Genre '{genre_name}' added")

def input_song_review():
    SID = input("Enter the Song ID: ")
    UID = input("Enter the User ID: ")
    rating = input ("Enter your rating: ")
    review_text = input ("Enter the Text Review: ")
    review_date = input ("Enter the Date of the Review: ")
    create_song_review (rating, review_date, review_text, UID, SID)
    print(f"Song_Review: '{review_text}' added")


def input_song_data():  
    sname = input("Enter the Song Name: ")
    duration = input("Enter the Duration of the Song: ")
    artist_ID = input("Enter the Artist_ID: ")
    album_ID = input("Enter the Album ID: ")
    GID = input("Enter the Gender ID: ")
    create_song(sname, duration, artist_ID, album_ID, GID)
    print(f"Song '{sname}' added")

def input_album_data():
    title_album = input ("Enter the Album Name: ")
    release_date = input ("Tell me the Date it was realeased: ")
    photo = input ("Introduce a photo: ")
    release_type = input("What is the Release Type: ")
    artist_ID = input("What is the Artist ID ? :")
    GID = input ("what is the Genre ID: ")
    create_album(title_album, release_date, photo, release_type,artist_ID, GID)
    print(f"Album '{title_album}' added")

def input_artist_data():
    artist_name = input("Enter the artist's name: ")
    listeners_no = input("Enter the number of listeners: ")
    photo_cover = input("Enter the artist's photo cover URL: ")
    birth_date = input("Enter the artist's birth date (YYYY-MM-DD): ")
    hometown_state = input("Enter the artist's hometown state: ")
    bio = input("Enter the artist's bio: ")
    GID = input("Enter the Genre ID (GID) of the artist: ")

    create_artist(artist_name, listeners_no, photo_cover, birth_date, hometown_state, bio, GID)
    print(f"Artist '{artist_name}' added")

def input_user_data():
    user_name = input("Enter the user's name: ")
    email = input("Enter the user's email: ")
    password = input("Enter the user's password: ")
    birthday_user = input("Enter the user's birth date (YYYY-MM-DD): ")
    followers_no = input("Enter the number of followers: ")
    following_no = input("Enter the number of following: ")
    subscription_ID = input("Enter the subscription ID: ")
    profile_picture = input("Enter the profile picture URL (optional): ")
    street_address = input("Enter the street address: ")
    city = input("Enter the city: ")
    state = input("Enter the state: ")
    zip_code = input("Enter the zip code: ")

    create_user(user_name, email, password, birthday_user, followers_no, following_no, subscription_ID, profile_picture, street_address, city, state, zip_code)
    print(f"User '{user_name}' added")

def input_playlist_data(): 
    playlist_name = input("Enter the Playlist Name: ")
    UID = input("Enter the USER ID: ")
    create_playlist(playlist_name, UID)
    print(f"Playlist '{playlist_name}' added")
