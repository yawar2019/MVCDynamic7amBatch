using AdoNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AdoNet.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        EmployeeContext db = new EmployeeContext(); 
        public ActionResult Index()
        {
            return View(db.getEmployeeData());
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(EmployeeModel emp)
        {
            int result = db.SaveEmployee(emp);
            if (result > 0)
            {
                return RedirectToAction("Index");
            }
            return View();
        }
        public ActionResult Edit(int ? id)
        {
            EmployeeModel emp = db.getEmployeeDataById(id);
            return View(emp);
        }

        [HttpPost]
        public ActionResult Edit(EmployeeModel emp)
        {
            int result = db.UpdateEmployee(emp);
            if (result > 0)
            {
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Delete(int? id)
        {
            EmployeeModel emp = db.getEmployeeDataById(id);
            return View(emp);
        }

        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeleteById(int? id)
        {
            int result = db.DeleteById(id);
            if (result > 0)
            {
                return RedirectToAction("Index");
            }
            return View();
        }
    }
}