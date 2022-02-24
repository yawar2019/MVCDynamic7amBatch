using MVCDynamic7amBatch.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Dapper;
namespace MVCDynamic7amBatch.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login

        EmployeeEntities db = new EmployeeEntities();
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(UserDetail user)
        {
            var userdetail = db.UserDetails.Where(s => s.UserName == user.UserName && s.Password == user.Password).SingleOrDefault();
            if (userdetail != null)
            {
                FormsAuthentication.SetAuthCookie(user.UserName, false);
                return RedirectToAction("Dashboard","Login");
            }
            else
            {
                ViewBag.Result = "Login Failed";
                return View();

            }
        }
        [Authorize(Roles="Admin,Manager")]
        public ActionResult DashBoard()
        {
            return View();
        }

        [Authorize(Roles="Admin")]
        public ActionResult AboutUS()
        {
            return View();
        }
        [Authorize(Roles="Manager")]
        public ActionResult ContactUs()
        {
            return View();
        }

        public ActionResult SignOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Dashboard", "Login");
        }

        public ActionResult SearchByUserName()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SearchByUserName(string Name)
        {
            var userdetail = db.UserDetails.Where(s => s.UserName == Name).ToList();
            if (userdetail != null)
            {

                return View(userdetail);

            }
            else
            { 
                return View();

            }
        }

        public ActionResult SearchByDate()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SearchByDate(DateTime dob)
        {
        SqlConnection con = new SqlConnection(@"Data Source=AZAM-PC\SQLEXPRESS;Initial Catalog=Employee;Integrated Security=true;");
            var param = new DynamicParameters();
            param.Add("@date", dob.ToString("yyyy-MM-dd"));
            var result= con.Query<employeeDetail>("usp_DateofBIRTH",param: param, commandType:System.Data.CommandType.StoredProcedure);
            if (result != null)
            {

                return View(result);

            }
            else
            {
                return View();

            }
        }
    }
}