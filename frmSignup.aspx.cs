using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public partial class frmSignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        bool check_Fields()
        {
            if (txtName.Value.Trim() == "")
            {
                return false;
            }
            else if (txtPassword.Value.Trim().Length <= 5)
            {
                return false;
            }
            else if (txtAddress.Value.Trim() == "")
            {
                return false;
            }
            else if (txtContact.Value.Trim() == "")
            {
                return false;
            }
            else if (txtEmail.Value.Trim() == "")
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (check_Fields())
            {
                Operations.dt = Operations.Search_Data("Select * From Users Where email='" + txtEmail.Value + "'");
                if (Operations.dt.Rows.Count > 0)
                {
                    lblMessage.Text = "Oops ! Email already Registered !";
                }
                else
                {
                    if (Operations.DB_Operation("Insert into Users Values ('" + txtName.Value + "','" + txtAddress.Value + "','" + txtContact.Value + "','" + txtPassword.Value + "','" + txtEmail.Value + "')"))
                    {
                        lblMessage.Text = "You have been Registered Successfully.";
                        Response.Redirect("frmLogin.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Oops ! You have not been Registered ! Try Again";
                    }
                  
                }

            }
            else
            {
                lblMessage.Text = "All input fields are required.";
            }
        }
    }
}
