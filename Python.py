#1.EmployeeClass
class Employee:
    def __init__(self, name, id_number, department, job_title):
        self.name = name
        self.id_number = id_number
        self.department = department
        self.job_title = job_title

def main():
    # Create three Employee objects
    employee1 = Employee("Susan Meyers", 47899, "Accounting", "Vice President")
    employee2 = Employee("Mark Jones", 39119, "IT", "Programmer")
    employee3 = Employee("Joy Rogers", 81774, "Manufacturing", "Engineer")

    # Display the data for each employee
    print("Employee 1:")
    print(f"Name: {employee1.name}")
    print(f"ID number: {employee1.id_number}")
    print(f"Department: {employee1.department}")
    print(f"Title: {employee1.job_title}\n")

    print("Employee 2:")
    print(f"Name: {employee2.name}")
    print(f"ID number: {employee2.id_number}")
    print(f"Department: {employee2.department}")
    print(f"Title: {employee2.job_title}\n")

    print("Employee 3:")
    print(f"Name: {employee3.name}")
    print(f"ID number: {employee3.id_number}")
    print(f"Department: {employee3.department}")
    print(f"Title: {employee3.job_title}")

if __name__ == "__main__":
    main()
#2.wordFrequently
  def main():
    string = input("Enter a string: ")
    count = [0] * 26

    for char in string:
        index = ord(char.lower()) - ord('a')
        if 0 <= index and index < 26:
            count[index] += 1

    frequent = 0
    max_count = 0
    for i in range(26):
        if count[i] > max_count:
            frequent = i
            max_count = count[i]

    print(f"The character that appears most frequently in the string is {chr(frequent + ord('a')).upper()}.")


main()
#3.
def string_total(string):
  total = 0
  for char in string:
    digit = int(char)
    total += digit
  return total

def main():
  string = input("Enter a sequence of digits with nothing separating them: ")
  total = string_total(string)
  print(f"The total of the digits in the string you entered is {total}")

main()
#4
def string_total(string):
  total = 0
  for char in string:
    digit = int(char)
    total += digit
  return total

def main():
  string = input("Enter a sequence of digits with nothing separating them: ")
  total = string_total(string)
  print(f"The total of the digits in the string you entered is {total}")

main()
