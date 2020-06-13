# Creating CLASS
class employee:
    "Common base class for all employees"
    emp_count = 0  # Class Variable
    total_salary = 0 # Class Variable

    # INIT Method/Attributes
    def __init__(self, name, salary):
        self.name = name  # Instance Variable
        self.salary = salary  # Instance Variable
        employee.emp_count += 1
        global temp
        temp = 1
        employee.total_salary += salary

    # Other Attributes/Methods
    def displaycount(self):
        print "Total Employees: ", employee.emp_count

    def displayemployee(self):
        print "Name: ", self.name, "Salary: ", self.salary

    def tot_salary(self):
        print "Total Salary: ", employee.total_salary, temp

# Creating Instance/Objects
emp1 = employee("Zara",5000)
emp2 = employee("Manni",5000)
emp3 = employee("Jhon",5000)

# Accessing/Calling Attributes/Methods
emp1.displayemployee()
emp2.displayemployee()
emp3.displayemployee()
emp3.displaycount()
emp3.tot_salary()

