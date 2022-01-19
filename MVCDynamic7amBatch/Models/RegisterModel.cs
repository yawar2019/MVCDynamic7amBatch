using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCDynamic7amBatch.Models
{
    public class RegisterModel
    {
        public int CustomerId { get; set; }
        [Required(ErrorMessage ="Customer Name Cannot be Empty")]
        public string CustomerName { get; set; }
        [Required(ErrorMessage = "Password Cannot be Empty")]
        public string Password { get; set; }
        [Compare("Password",ErrorMessage ="Password and Confirm Password Doesn't Match")]
        public string ConfirmPwd { get; set; }
        [Range(18,45,ErrorMessage ="Age Should Be Between 18-45")]
        public int Age { get; set; }
        [DataType(DataType.EmailAddress,ErrorMessage ="Emaild is not valid format")]
        public string EmailId { get; set; }
        [StringLength(10,ErrorMessage="Address should be 10 characters")]
        public string Address { get; set; }
    }
}