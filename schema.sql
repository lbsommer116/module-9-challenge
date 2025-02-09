DROP TABLE "Department_Employee";
DROP TABLE "Department_Manager";
DROP TABLE "Departments";
DROP TABLE "Employees";
DROP TABLE "Salaries";
DROP TABLE "Titles";

CREATE TABLE "Employees" (
    "emp_no" VARCHAR(10) NOT NULL,
    "emp_title_id" VARCHAR(10) NOT NULL,
    "birth_date" DATE,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "sex" VARCHAR(10) NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY ("emp_no")
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(10) NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY ("title_id")
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(4) NOT NULL,
    "dept_name" VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY ("dept_no")
);

CREATE TABLE "Department_Employee" (
    "emp_no" VARCHAR(10) NOT NULL,
    "dept_no" VARCHAR(4) NOT NULL,
    CONSTRAINT "pk_Department_Employee" PRIMARY KEY ("emp_no", "dept_no")
);

CREATE TABLE "Department_Manager" (
    "dept_no" VARCHAR(4) NOT NULL,
    "emp_no" VARCHAR(10) NOT NULL,
    CONSTRAINT "pk_Department_Manager" PRIMARY KEY ("dept_no", "emp_no")
);

CREATE TABLE "Salaries" (
    "emp_no" VARCHAR(10) NOT NULL,
    "salary" INT NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY ("emp_no")
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");