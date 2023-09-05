# EmployeeSQL

## Table of Contents

- [Background](#background)
- [Data_Modeling](#Data_Modeling)
- [Data_Engineering](#Data_Engineering)
- [Data_analysis](#Data_Analysis)
- [Questions](#Questions)
- [Contributing](#contributing)


# Background
It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

For this project, you’ll design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. That is, you’ll perform data modeling, data engineering, and data analysis, respectively.

# Data_Modeling
Utilizing the six CSV files that I was provided, I made an Entity Relationship Diagram or (ERD) for Pewlett Hackard's company.  [See below]
![image](QuickDBD-export.png)

# Data_Engineering
Using the ERD I then created a table schema for each of the six CSV files on hand.  I specified the Data Types, Primary Keys, and the Foreign keys.  Each Table was created so that the following tables would be able to utilize the Primary Keys as Foreign Keys.

# Data_Analysis
There were multiple questions that I was tasked with answering.  Each of these questions were saved as a 'Views' in my database EmployeeSQL for Pewlett Hackard.

# Questions
1) List the employee number, last name, first name, sex, and salary of each employee.
View : employee_data

![image](<data/Images/Employee_Data.png>)

2) List the first name, last name, and hire date for the employees who were hired in 1986.
View : employee_hire_1986

![image](<data/Images/Employee_Hire_1986.png>)

3) List the manager of each department along with their department number, department name, employee number, last name, and first name.
View : department_manager_data

![image](<data/Images/department_manager_data.png>)

4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
View : department_employee_data

![image](<data/Images/department_employee_data.png>)

5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
View : EmployeeName_data

![image](<data/Images/Employee_Name_Data.png>)

6) List each employee in the Sales department, including their employee number, last name, and first name.
View : Sales_Department_employees

![image](<data/Images/Sales_Department_Employees.png>)

7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
View : Sales_Development_employees

![image](<data/Images/Sales_Development_Employees.png>)

8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
View : frequency_employee_lastnames

![image](<data/Images/Frequency_Employee_Lastnames.png>)

