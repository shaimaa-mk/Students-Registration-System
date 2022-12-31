from mysql import connector
gsg_std_sys = connector.connect(user='root', password='password', host='localhost', db='gsg_std_sys')
cursor = gsg_std_sys.cursor()
if gsg_std_sys:
    print("Connected Successfully")
else:
    print("Something Wrong")


def new_student(std_id, std_name, cont_id, addr_id, levl,  bood):
    query = "INSERT INTO student (std_id, student_name, contact_id, address_id, level_id, BOD) " \
            "VALUES (%s, %s, %s, %s, %s, %s);"
    cursor.execute(query, [std_id, std_name, cont_id, addr_id, levl, bood, ])
    gsg_std_sys.commit()
    print("Student created Successfully.")


def new_contact(con_id, mobi, ema):
    query = "INSERT INTO contact (contact_id, mobile_number, email ) VALUES (%s, %s, %s);"
    cursor.execute(query, [con_id, mobi, ema, ])
    gsg_std_sys.commit()
    print("Contact created Successfully.")


def new_address(add_id, stat, cit, stre):
    query = "INSERT INTO address (address_id, state, city, street ) VALUES (%s, %s, %s, %s);"
    cursor.execute(query, [add_id, stat, cit, stre, ])
    gsg_std_sys.commit()
    print("Address created Successfully.")


def new_level():
    query = "INSERT INTO level (level_id, level_name) VALUES (1,'First'),(2,'Second'),(3,'Third'), (4,'Fourth');"
    cursor.execute(query)
    gsg_std_sys.commit()
    print("Levels created Successfully.")


incremental = 0
while True:

    print("Student Registration System\n"
          "1.Register New Student\n"
          "2.Enroll Course\n"
          "3.Create New Course\n"
          "4.Create New Schedule\n"
          "5.Display Student Courses Schedule")
    choice = input("Enter the service number: ")

    if choice == 1:
        name = input("Student Name: ")
        BOD = input("Student BOD:")
        level = input("Current Level:")
        mobile = input("Mobile Number: ")
        email = input("Student Email: ")
        state = input("State: ")
        city = input("City: ")
        street = input("Street: ")
        new_contact(incremental, mobile, email)
        new_address(incremental, state, city, street)
        new_student(incremental, name, incremental, incremental, 2, BOD)
        print("Student wit ID {} Registered Successfully.")

    elif choice == 2:
        pass
    elif choice == 3:
        pass
    elif choice == 4:
        pass
    elif choice == 5:
        pass
    elif choice == 6:
        break




