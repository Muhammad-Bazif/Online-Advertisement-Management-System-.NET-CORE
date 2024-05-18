using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Value.Trim() != "" && txtPassword.Value.Trim() != "")
            {


                if (txtEmail.Value == "admin@gmail.com" && txtPassword.Value == "admin123")
                {
                    Response.Redirect("adminDashboard.aspx");

                }


                Operations.dt = Operations.Search_Data("Select * From Users Where email='" + txtEmail.Value + "'");
                if (Operations.dt.Rows.Count > 0)
                {
                    Operations.dt = Operations.Search_Data("Select * From Users Where email='" + txtEmail.Value + "' and password='" + txtPassword.Value + "'");
                    if (Operations.dt.Rows.Count > 0)
                    {
                        Session["userId"] = Operations.dt.Rows[0]["userId"];
                        Session["user"] = txtEmail.Value;
                        Response.Redirect("Index.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid Eamil or Password !";
                    }
                }
                else
                {
                    lblMessage.Text = "Oops ! You are not registered !";
                }
            }
            else
            {
                lblMessage.Text = "Eamil & Password are Required.";
            }
        }
    }
}