using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Dapper;
namespace DapperExample.Models
{
    public class EmployeeContext
    {
        SqlConnection con = new SqlConnection(@"Data Source=AZAM-PC\SQLEXPRESS;Initial Catalog=Employee;Integrated Security=true;");
        public List<EmployeeModel> getEmployees()
        {
            var Employees = con.Query<EmployeeModel>("select EmpId,EmpName,EmpSalary from dbo.employeeDetails").ToList();
            return Employees;
        }
    }
}