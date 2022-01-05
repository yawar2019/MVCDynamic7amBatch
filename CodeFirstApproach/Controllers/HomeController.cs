using CodeFirstApproach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CodeFirstApproach.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        EmployeeContext db = new EmployeeContext();
        public ActionResult Index()
        {
            return View(db.EmployeeModels.ToList());
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(EmployeeModel emp)
        {
            db.EmployeeModels.Add(emp);//insert query generated emp values assign
            //db.departmentModels.Add(dept);//insert query generated emp values assign
            int i = db.SaveChanges();//similar to execute nonquery

            if (i > 0)
            {
                return RedirectToAction("Index");
            }
            return View();
        }
        

    }
}