﻿using MVCDynamic7amBatch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCDynamic7amBatch.Controllers
{
    public class NewController : Controller
    {
        // GET: New
        public string GetWishes()
        {
            return "help";
        }

        public ActionResult GetMeView()
        {
            return Redirect("http://www.google.com");
        }

        //new/getEmpId/1211
        public string getEmpId(int? eid)
        {
            return "Your Employee Id" + eid;
        }
        [Route("Student/Name")]
        [Route("Actor/Name")]
        [Route("Lawyor/Name")]
        [Route("New/GetName")]
        public string GetName()
        {
            return "James Bond";
        }

        //new/getEmpInfo/1211?Name=test
        public string getEmpInfo(int? id,string Name)
        {
            return "Your Employee Id:" + id+" Name is:"+Name;
        }

        public ActionResult getMeEmployeeData()
        {
            //id,name,salary
            EmployeeModel emp = new EmployeeModel();
            emp.EmpId = 1;
            emp.EmpName = "Srikanth";
            emp.EmpSalary = 570000;

            ViewBag.info = emp;

            return View();

        }

        public ActionResult getMeEmployees()
        {
            //id,name,salary

            List<EmployeeModel> ListObj = new List<EmployeeModel>();//initially null

            EmployeeModel emp = new EmployeeModel();
            emp.EmpId = 1;
            emp.EmpName = "Srikanth";
            emp.EmpSalary = 570000;

            EmployeeModel emp1 = new EmployeeModel();
            emp1.EmpId = 2;
            emp1.EmpName = "Shivangi";
            emp1.EmpSalary = 80000;

            EmployeeModel emp2 = new EmployeeModel();
            emp2.EmpId = 3;
            emp2.EmpName = "Kamal";
            emp2.EmpSalary = 90000;

            ListObj.Add(emp);
            ListObj.Add(emp1);
            ListObj.Add(emp2);


            ViewBag.info = ListObj;
            

            return View();

        }

        public ActionResult getMeEmployeeDataUsingModel()
        {
            //id,name,salary
            EmployeeModel emp = new EmployeeModel();
            emp.EmpId = 1;
            emp.EmpName = "Srikanth";
            emp.EmpSalary = 570000;


            return View(emp);

        }

        public ActionResult getMeListEmployees()
        {
            //id,name,salary

            List<EmployeeModel> ListObj = new List<EmployeeModel>();//initially null

            EmployeeModel emp = new EmployeeModel();
            emp.EmpId = 1;
            emp.EmpName = "Srikanth";
            emp.EmpSalary = 570000;

            EmployeeModel emp1 = new EmployeeModel();
            emp1.EmpId = 2;
            emp1.EmpName = "Shivangi";
            emp1.EmpSalary = 80000;

            EmployeeModel emp2 = new EmployeeModel();
            emp2.EmpId = 3;
            emp2.EmpName = "Kamal";
            emp2.EmpSalary = 90000;

            ListObj.Add(emp);
            ListObj.Add(emp1);
            ListObj.Add(emp2);




            return View("getMeEmployeeDataUsingModel", ListObj);

        }


        public ActionResult getMeListEmployeesAndDepartment()
        {
            //id,name,salary

            List<EmployeeModel> ListObj = new List<EmployeeModel>();//initially null

            EmployeeModel emp = new EmployeeModel();
            emp.EmpId = 1;
            emp.EmpName = "Srikanth";
            emp.EmpSalary = 570000;

            EmployeeModel emp1 = new EmployeeModel();
            emp1.EmpId = 2;
            emp1.EmpName = "Shivangi";
            emp1.EmpSalary = 80000;

            EmployeeModel emp2 = new EmployeeModel();
            emp2.EmpId = 3;
            emp2.EmpName = "Kamal";
            emp2.EmpSalary = 90000;

            ListObj.Add(emp);
            ListObj.Add(emp1);
            ListObj.Add(emp2);

            DepartmentModel dept = new Models.DepartmentModel();
            dept.DeptId = 1211;
            dept.DeptName = "IT";


            DepartmentModel dept1 = new Models.DepartmentModel();
            dept1.DeptId = 1212;
            dept1.DeptName = "Network";

            List<DepartmentModel> listDept = new List<DepartmentModel>();
            listDept.Add(dept);
            listDept.Add(dept1);


            EmpDept empDept = new Models.EmpDept();
            empDept.Emp =ListObj;
            empDept.dept =listDept;



            return View(empDept);

        }


    }
}