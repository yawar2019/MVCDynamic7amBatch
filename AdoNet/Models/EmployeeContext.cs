using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AdoNet.Models
{
    public class EmployeeContext
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCon"].ToString());
        public List<EmployeeModel> getEmployeeData()
        {
            List<EmployeeModel> listObj = new List<EmployeeModel>();
            SqlCommand cmd = new SqlCommand("sp_employee", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                EmployeeModel emp = new EmployeeModel();
                emp.EmpId = Convert.ToInt32(dr[0]);
                emp.EmpName = Convert.ToString(dr[1]);
                emp.EmpSalary = Convert.ToInt32(dr[2]);
                listObj.Add(emp);
            }

            return listObj;
        }

        public int SaveEmployee(EmployeeModel emp)
        {
            SqlCommand cmd = new SqlCommand("sp_CreateEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("EmpName", emp.EmpName);
            cmd.Parameters.AddWithValue("EmpSalary", emp.EmpSalary);
            con.Open();
            int i = cmd.ExecuteNonQuery();//execute  query and return nos of rows effected
            con.Close();
            return i;
        }



        public EmployeeModel getEmployeeDataById(int? id)
        {
            EmployeeModel emp = new EmployeeModel();

            SqlCommand cmd = new SqlCommand("sp_RajagetEmployeeById", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmpId", id);


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                emp.EmpId = Convert.ToInt32(dr[0]);
                emp.EmpName = Convert.ToString(dr[1]);
                emp.EmpSalary = Convert.ToInt32(dr[2]);

            }

            return emp;
        }


        public int UpdateEmployee(EmployeeModel emp)
        {

            SqlCommand cmd = new SqlCommand("sp_RajaUpdateEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmpId", emp.EmpId);
            cmd.Parameters.AddWithValue("@EmpName", emp.EmpName);
            cmd.Parameters.AddWithValue("@EmpSalary", emp.EmpSalary);
            con.Open();
            int i = cmd.ExecuteNonQuery();//execute  query and return nos of rows effected
            con.Close();
            return i;
        }
        public int DeleteById(int? id)
        {

            SqlCommand cmd = new SqlCommand("sp_DeleteNeerjaEmployees", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmpId", id);
           
            con.Open();
            int i = cmd.ExecuteNonQuery();//execute  query and return nos of rows effected
            con.Close();
            return i;
        }
        
    }
}