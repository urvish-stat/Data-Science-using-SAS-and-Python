# # import PyMySQL
#
# # Open Database Connection
# db = PyMySQL.connect("localhost","testuser","test123","TESTDB")
#
# # Prepare a cursor object
# cursor = db.cursor()
#
# # Execute the SQL query using execute() method
# cursor.execute("SELECT VERSION()")
#
# # Fetch single row using fetchone() method
# data = cursor.fetchone()
#
# print "Database connection: %s " % data
#
# # Disconnect from SQL
# db.close()
#
# # Creating DATABASE Table
# db = PyMySQL.connect("localhost","testuser","test123","TESTDB")
# cursor = db.cursor()
# sql = """ CREATE TABLE EMPLOYEE
#           (FIRST_NAME CHAR(20) NOT NULL,
#           LAST_NAME CHAR(20),
#           AGE INT,
#           SEX CHAR(1),
#           INCOME FLOAT)"""
# cursor.execute(sql)
# db.close()
#
# # INSERT Operation
# db = PyMySQL.connect("localhost","testuser","test123","TESTDB")
# cursor = db.cursor()
# sql = """ INSERT INTO EMPLOYEE(FIRST_NAME,
#           LAST_NAME, AGE, SEX, INCOME)
#           VALUES ('Mac','Mohan',20,'M',20000)"""
# try:
#     cursor.execute(sql)
#     db.commit()
# except:
#     # Rollback in case any error
#     db.rollback()
#
# # READ Operation
# db = PyMySQL.connect("localhost","testuser","test123","TESTDB")
# cursor = db.cursor()
# sql = """ SELECT * FROM EMPLOYEE
#           WHERE INCOME > 1000 """
# try:
#     cursor.execute(sql)
#     results = cursor.fetchall()
#     for row in results:
#         fname = row[0]
#         lname = row[1]
#         sex = row[2]
#         age = row[3]
#         income = row[4]
#         print fname, lname, sex, age, income
# except:
#     print "ERROR: Unable to fetch data"
# db.close()
#
# # UPDATE Operation
# db = PyMySQL.connect("localhost","testuser","test123","TESTDB")
# cursor = db.cursor()
# sql = """ UPDATE EMPLOYEE
#           SET AGE = AGE + 1 WHERE SEX = "M" """
# try:
#     cursor.execute(sql)
#     db.commit()
#
# except:
#     db.rollback()
# db.close()
