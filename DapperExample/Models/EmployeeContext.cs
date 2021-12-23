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
            var Employees = con.Query<EmployeeModel>("sp_employee", commandType: CommandType.StoredProcedure).ToList();
            return Employees;
        }

        public int SaveEmployees(EmployeeModel emp)
        {
            var paramater = new DynamicParameters();
            paramater.Add("@EmpName", emp.EmpName);
            paramater.Add("@Empsalary", emp.EmpSalary);

            int result = con.Execute("sp_CreateEmployee", param: paramater, commandType: CommandType.StoredProcedure);
            return result;
        }

        public EmployeeModel getEmployeesById(int id)
        {
            var paramater = new DynamicParameters();
            paramater.Add("@EmpId", id);

            EmployeeModel result = con.QuerySingle<EmployeeModel>("sp_RajagetEmployeeById", param: paramater, commandType: CommandType.StoredProcedure);
            return result;
        }

        public int UpdateEmployees(EmployeeModel emp)
        {
            var paramater = new DynamicParameters();
            paramater.Add("@EmpId", emp.EmpId);
            paramater.Add("@EmpName", emp.EmpName);
            paramater.Add("@Empsalary", emp.EmpSalary);

            int result = con.Execute("sp_RajaUpdateEmployee", param: paramater, commandType: CommandType.StoredProcedure);
            return result;
        }


        public int DeleteEmployee(int id)
        {
            var paramater = new DynamicParameters();
            paramater.Add("@EmpId", id);
            int result = con.Execute("sp_DeleteNeerjaEmployees", param: paramater, commandType: CommandType.StoredProcedure);
            return result;
        }
    }
}