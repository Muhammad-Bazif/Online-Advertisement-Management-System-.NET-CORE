using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public partial class frmProfileDelete : System.Web.UI.Page
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Operations.Id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            Delete();
        }

        private void Delete()
        {
            if (Operations.DB_Operation("Delete From Users Where userId=" + Operations.Id))
            {
                lblMessage.Text = "Profile Details has been Deleted Successfully.";
                Response.Redirect("frmLogout.aspx");
            }
            else
            {
                lblMessage.Text = "Oops ! Profile Details has not been Deleted ! Try Again";
            }
        }
    }
}