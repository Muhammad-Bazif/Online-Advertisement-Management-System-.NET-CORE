using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public partial class frmProfileEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Operations.Id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                Operations.dt = new DataTable();
                Operations.dt = Operations.Search_Data("Select * From Users Where userId=" + Operations.Id);
                if (Operations.dt.Rows.Count > 0)
                {
                    txtName.Value = Operations.dt.Rows[0]["name"].ToString();
                    txtPassword.Value = Operations.dt.Rows[0]["password"].ToString();
                    txtAddress.Value = Operations.dt.Rows[0]["address"].ToString();
                    txtContact.Value = Operations.dt.Rows[0]["contact"].ToString();
                    txtEmail.Value = Operations.dt.Rows[0]["email"].ToString();
                }
            }
        }
        bool check_Fields()
        {
            if (txtName.Value.Trim() == "")
            {
                return false;
            }
            else if (txtPassword.Value.Trim() == "")
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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (check_Fields())
            {
                Operations.Id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                if (Operations.DB_Operation("Update Users set name='" + txtName.Value + "',email='" + txtEmail.Value + "',password='" + txtPassword.Value + "',contact='" + txtContact.Value + "',address='" + txtAddress.Value + "'" + "Where userId=" + Operations.Id))
                {
                    lblMessage.Text = "Profile Details has been Updated Successfully. Click <a href='frmProfile.aspx'>here </a> to view details.";
                }
                else
                {
                    lblMessage.Text = "Oops ! Profile Details has not been Updated ! Try Again";
                }
            }
            else
            {
                lblMessage.Text = "All txt fields are required.";
            }
        }
    }
}