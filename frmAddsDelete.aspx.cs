using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public partial class frmAddsDelete : System.Web.UI.Page
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Operations.Id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            Delete();
        }

        private void Delete()
        {
            if (Operations.DB_Operation("Delete From Advertisements Where advId=" + Operations.Id))
            {
                lblMessage.Text = "Adds Details has been Deleted Successfully.";
                Response.Redirect("Adds.aspx");
            }
            else
            {
                lblMessage.Text = "Oops ! Adds Details has not been Deleted ! Try Again";
            }
        }
    }
}