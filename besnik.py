import mysql.connector

db = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    password = 'graduation',
    database = 'project'
)
mycursor = db.cursor()

def execute_sql_query(query):
  mycursor.execute(query)
  myresult = mycursor.fetchall()
  lst = []
  for x in myresult:
    lst.append(x)
  return lst

def choose(choice, message, range):
  while choice not in range:
    print('Wrong choice; Try again')
    choice = int(input(message))
  return choice    

def start_message():
  print('Welcome to Apple Music Database')
  print('Menu:')
  print('1. read data')
  print('2. write data')
  print('3. insert data')
  print('4. update data')
  print('5. others')
  print('6. Exit')
  return int(input('Enter your choice: '))

def pick_table():
  result = execute_sql_query('show tables')
  print(result)
  message = 'Choose a table: '
  response = choose(int(input(message)),message,range(len(result)))
  return result[response][0]

def pick_column(table):
  result = [i[0] for i in execute_sql_query('show columns from '+table)]
  print(result)
  message = 'Choose column: '
  response = choose(int(input(message)),message,list(range(len(result))))
  return result[response]

def pick_column_verbose(table):
  result = execute_sql_query('show columns from '+table)
  print(result)
  message = 'Choose column: '
  response = choose(int(input(message)),message,list(range(len(result))))
  return result[response]

def read():
  table = pick_table()
  column = pick_column(table)
  print(execute_sql_query('select '+column+' from '+table))
  return
 
def create():
  table = pick_table()
  attributes = execute_sql_query('show columns from '+table)
  for i in attributes:
    print(i)
  response = input("Enter the new row (separated by whitespace): ")
  lst = response.split()
  for i in range(len(lst)):
    if lst[i].isnumeric():
      lst[i] = int(lst[i])
  lst = tuple(lst)
  execute_sql_query("INSERT INTO "+table+" VALUES "+ str(lst))

create()

def update():
  pass

def delete():
  pass


def run():
  choice = int(start_message())-1
  while choice in range(6):
    if choice == 0:
      read()
      return
    if choice == 1:
      pass
    if choice == 2:
      pass
    if choice == 3:
      pass
    if choice == 4:
      pass
    if choice == 5:
      pass
  return 



# run()
