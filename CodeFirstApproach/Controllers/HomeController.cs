using CodeFirstApproach.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

        public ActionResult Edit(int? id)
        {
           var emp= db.EmployeeModels.Find(id);
            return View(emp);
        }

        [HttpPost]
        public ActionResult Edit(EmployeeModel emp)
        {
            db.Entry(emp).State=EntityState.Modified;
            int i = db.SaveChanges();

            if (i > 0)
            {
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Delete(int? id)
        {
            var emp = db.EmployeeModels.Find(id);
            return View(emp);
        }

        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeleteConfirmed(int? id)
        {
            var emp = db.EmployeeModels.Find(id);

            db.EmployeeModels.Remove(emp);
            int i = db.SaveChanges();

            if (i > 0)
            {
                return RedirectToAction("Index");
            }
            return View();
        }


    }
}