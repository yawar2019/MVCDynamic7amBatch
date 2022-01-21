using MVCDynamic7amBatch.Models;
using System;
using System.Collections.Generic;
using System.IO;
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


        public ViewResult getMeListEmployeesAndDepartment(int? id ,string Name)
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

        public RedirectResult GetMeOutput()
        {
            return Redirect("http://www.google.com");
        }
        public RedirectResult GetMeOutput2()
        {
            return Redirect("~/new/getMeListEmployeesAndDepartment?id=1&Name=Anil");
        }

        public ViewResult MyPartialViewExample1()
        {
            EmployeeModel emp = new EmployeeModel();
            emp.EmpName = "Sagar";

            EmployeeModel emp1 = new EmployeeModel();
            emp1.EmpName = "Pavan";

            EmployeeModel emp2 = new EmployeeModel();
            emp2.EmpName = "Vidya";

            List<EmployeeModel> ListObj = new List<EmployeeModel>();//initially null
            ListObj.Add(emp);
            ListObj.Add(emp1);
            ListObj.Add(emp2);

            return View(ListObj);
        }

        public PartialViewResult MyPartialViewExample2()
        {
            EmployeeModel emp = new EmployeeModel();
            emp.EmpName = "Sagar";

            EmployeeModel emp1 = new EmployeeModel();
            emp1.EmpName = "Pavan";

            EmployeeModel emp2 = new EmployeeModel();
            emp2.EmpName = "Vidya";

            List<EmployeeModel> ListObj = new List<EmployeeModel>();//initially null
            ListObj.Add(emp);
            ListObj.Add(emp1);
            ListObj.Add(emp2);

            return PartialView("_MyPartialView",ListObj);
        }

        public FileResult getMeFile(int? id)
        {
            return File("~/Web.config", "text/plain");
        }

        public FileResult getMeFile2(EmployeeModel emp)
        {
            return File("~/ActionResult.pdf", "application/pdf");
        }

        public FileResult getMeFile3()
        {
            return File("~/ActionResult.pdf", "application/pdf", "ActionResult.pdf");
        }

        public RedirectToRouteResult redirectToMyRoad()
        {
            return RedirectToAction("getMeFile",new {id=1});
        }

        public RedirectToRouteResult redirectToMyRoad2()
        {
            EmployeeModel emp2 = new EmployeeModel();
            emp2.EmpId = 3;
            emp2.EmpName = "Kamal";
            emp2.EmpSalary = 90000;

            return RedirectToAction("getMeFile2",emp2);
        }

        public RedirectToRouteResult GetToRoute()
        {
            return RedirectToRoute("Tom");
        }

        public JsonResult getJsonData()
        {
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
            empDept.Emp = ListObj;
            empDept.dept = listDept;

            return Json(empDept, JsonRequestBehavior.AllowGet);

        }

        public ActionResult GetMeJsondata2()
        {
            return View();
        }

        public ContentResult getContent(int? id)
        {
            if (id == 1)
            {
                return Content("Hello World");
            }
            else if (id == 2)
            {
                return Content("<p style=color:red>Hello Word</p>");
            }
            else
            {
                return Content("<script>alert('Hello World')</script>");
            }
        }

        public ActionResult HtmlHelperExample()
        {
            EmployeeEntities db = new Models.EmployeeEntities();

            ViewBag.Employees = new SelectList(db.employeeDetails,"EmpId","EmpName",65035);
            return View();
        }
        [HttpPost]
        public ActionResult HtmlHelperExample(string UserName,string pwd,string Gender,string CourseCsharp,string Employees,string Address,string dob)
        {
            EmployeeEntities db = new Models.EmployeeEntities();

            ViewBag.Employees = new SelectList(db.employeeDetails, "EmpId", "EmpName", 65035);
            return View();
        }

        [HttpPost]
        public ActionResult FileUploadExample(HttpPostedFileBase fileupload)
        {
            string filename = Path.GetFileName(fileupload.FileName);
            string path = Server.MapPath("~/upload");
            fileupload.SaveAs(Path.Combine(path, filename));
            ViewBag.msg = "uploaded successfully";

            return View();

        }

        public ActionResult ValidationExample()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ValidationExample(RegisterModel reg)
        {
            return Redirect("~/new/ValidationExample");
        }

        public ActionResult GetMyBlog()
        {
            return View();
        }
    }
}