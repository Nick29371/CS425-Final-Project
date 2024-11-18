import mysql.connector
import sys

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
    choice = int(input('\n'+message))
  return choice    

def start_message():
  print()
  print('Welcome to Apple Music Database')
  print('Menu:')
  print('1. read data')
  print('2. write data')
  print('3. insert data')
  print('4. update data')
  print('5. save data')
  print('6. Exit')
  return int(input('\n'+'Enter your choice: '))

def pick_table():
  result = execute_sql_query('show tables')
  for i in result:
    print(i)
  message = 'Choose a table (starting from 0): '
  response = choose(int(input('\n'+message)),message,range(len(result)))
  return result[response][0]

def pick_column(table):
  result = [i[0] for i in execute_sql_query('show columns from '+table)]
  for i in result:
    print(i)
  message = 'Choose column (starting from 0): '
  response = choose(int(input('\n'+message)),message,list(range(len(result))))
  return result[response]

def pick_column_verbose(table):
  result = execute_sql_query('show columns from '+table)
  for i in result:
    print(i)
  message = 'Choose column (starting from 0): '
  response = choose(int(input('\n'+message)),message,list(range(len(result))))
  return result[response]

def read():
  table = pick_table()
  column = pick_column(table)
  for i in execute_sql_query('select '+column+' from '+table):
    print(i)
  return
 
def create():
  table = pick_table()
  attributes = execute_sql_query('show columns from '+table)
  for i in attributes:
    print(i)
  response = input('\n'+"Enter the new row (separated by whitespace): ")
  lst = response.split()
  for i in range(len(lst)):
    if lst[i].isnumeric():
      lst[i] = int(lst[i])
  lst = tuple(lst)
  execute_sql_query("INSERT INTO "+table+" VALUES "+ str(lst))
  return

def update():
  table = pick_table()
  column = pick_column(table)
  attributes = execute_sql_query('show columns from '+table)
  for i in attributes:
    print(i)
  response = input('\n'+"Enter the new value for "+column+": ")
  if not response.isnumeric():
    response = "'"+response+"'"
  execute_sql_query("UPDATE "+table+" SET "+column+" = "+response)
  return

def delete():
  table = pick_table()
  execute_sql_query("DELETE FROM "+table)
  return

def save():
  db.commit()
  return

def main(func):
    func()

if __name__ == "__main__":    # file needs to be ran with CRUD argument
    func = sys.argv[1]
    main(func)
