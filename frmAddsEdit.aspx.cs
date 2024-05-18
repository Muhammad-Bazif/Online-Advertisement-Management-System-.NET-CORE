using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public partial class frmAddsEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Operations.Id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                Get_Details();
            }
        }

        public void Get_Details()
        {
            Operations.dt = new DataTable();
            Operations.dt = Operations.Search_Data("Select * From Advertisements Where advId=" + Operations.Id);
            if (Operations.dt.Rows.Count > 0)
            {
                txtMode.Value = Operations.dt.Rows[0]["advMode"].ToString();
                txtDesc.Value = Operations.dt.Rows[0]["description"].ToString();
                txtBudget.Value = Operations.dt.Rows[0]["budget"].ToString();
                txtDate.Value = Operations.dt.Rows[0]["date"].ToString();
            }

        }
        public bool check_Fields()
        {
            if (txtDesc.Value.Trim() == "")
            {
                return false;
            }
            else if (txtDate.Value.Trim() == "")
            {
                return false;
            }
            else if (txtBudget.Value.Trim() == "")
            {
                return false;
            }
            else if (txtMode.Value.Trim() == "")
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            if (check_Fields())
            {
                Operations.Id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                if (Operations.DB_Operation("Update Advertisements set advMode='" + txtMode.Value + "',description='" + txtDesc.Value + "',budget='" + txtBudget.Value + "',date='" + txtDate.Value + "'" + "Where advId=" + Operations.Id))
                {
                    lblMessage.Text = "Adds Details has been Updated Successfully. Click <a href='Adds.aspx'>here </a> to view details.";
                }
                else
                {
                    lblMessage.Text = "Oops ! Adds Details has not been Updated ! Try Again";
                }
            }
            else
            {
                lblMessage.Text = "All input fields are required.";
            }
        }
    }
}