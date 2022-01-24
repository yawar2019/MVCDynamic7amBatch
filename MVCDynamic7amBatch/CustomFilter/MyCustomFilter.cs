using MVCDynamic7amBatch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCDynamic7amBatch.CustomFilter
{
    
    public class MyCustomFilter:ActionFilterAttribute 
    {

        public override void OnActionExecuting(ActionExecutingContext filterContext)//1
        {
            base.OnActionExecuting(filterContext);
        }

        public override void OnResultExecuting(ResultExecutingContext filterContext)//4
        {
            (filterContext.Result as ViewResult).ViewBag.Player = "Virat Kohli";
            
            ((MVCDynamic7amBatch.Models.EmployeeModel)((filterContext.Result as ViewResult).Model)).EmpName = "Vidya";


        }
        public override void OnResultExecuted(ResultExecutedContext filterContext)//5
        {
            base.OnResultExecuted(filterContext);
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)//3
        {
            base.OnActionExecuted(filterContext);
        }

    }
}