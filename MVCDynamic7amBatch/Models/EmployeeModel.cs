using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCDynamic7amBatch.Models
{
    public class EmployeeModel
    {
        public int EmpId { get; set; }
        [Display(Name ="Emplloyee Name")]
        public string EmpName { get; set; }
        public int EmpSalary { get; set; }
    }
}