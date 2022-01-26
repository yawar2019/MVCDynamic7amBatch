using MVCDynamic7amBatch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

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
    }
}