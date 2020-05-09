CREATE TABLE Department (
    dept_no VARCHAR PRIMARY KEY NOT NULL
    ,dept_name VARCHAR NOT NULL
);

CREATE TABLE Employees (
    emp_no INTEGER PRIMARY KEY NOT NULL
    ,birth_date DATE NOT NULL
    ,first_name VARCHAR NOT NULL
    ,last_name VARCHAR NOT NULL
    ,gender VARCHAR(1) NOT NULL
    ,hire_date DATE NOT NULL
);

CREATE TABLE Department_Employee (
    emp_no INTEGER NOT NULL
    ,dept_no VARCHAR NOT NULL
    ,from_date DATE NOT NULL
    ,to_date DATE NOT NULL
    ,FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
    ,FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);

CREATE TABLE Department_Manager (
    dept_no VARCHAR NOT NULL
    ,emp_no INTEGER NOT NULL
    ,from_date DATE NOT NULL
    ,to_date DATE NOT NULL
    ,FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
    ,FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);

CREATE TABLE Salaries (
    emp_no INTEGER NOT NULL
    ,salary INTEGER NOT NULL
    ,from_date DATE NOT NULL
    ,to_date DATE NOT NULL
    ,FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Titles (
    emp_no INTEGER NOT NULL
    ,title VARCHAR NOT NULL
    ,from_date DATE NOT NULL
    ,to_date DATE NOT NULL
    ,FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

