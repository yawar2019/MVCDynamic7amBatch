using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DatabaseApproach.Models
{
    public class EmpDept
    {
        public int EmpId { get; set; }
        public string EmpName { get; set; }
        public Nullable<int> EmpSalary { get; set; }
        public string DeptName { get; set; }

    }
}