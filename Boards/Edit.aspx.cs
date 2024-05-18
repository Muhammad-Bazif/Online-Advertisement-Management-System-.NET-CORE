using OnlineAdvertisement;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement.Boards
{
    public partial class Edit : System.Web.UI.Page
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
            Operations.dt = Operations.Search_Data("Select * From Billboards Where Id=" + Operations.Id);
            if (Operations.dt.Rows.Count > 0)
            {
                description.Value = Operations.dt.Rows[0]["location"].ToString();
                description.Value = Operations.dt.Rows[0]["description"].ToString();
                publishDate.Value= Operations.dt.Rows[0]["publishDate"].ToString();
                manager.Text = Operations.dt.Rows[0]["manager"].ToString();
                purpose.Value = Operations.dt.Rows[0]["purpose"].ToString();
                addsDesc.Text = Operations.dt.Rows[0]["addsDesc"].ToString();
            }

        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            Operations.Id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (Operations.DB_Operation("Update Billboards set location='" + location.Value+ "',description='" + description.Value + "',publishDate='" + publishDate.Value+ "',manager='" + manager.Text+ "',purpose='"+purpose.Value+"',addsDesc='"+addsDesc.Text+"' Where Id=" + Operations.Id))
            {
                lblMessage.InnerHtml = "Billboard has been Updated Successfully. <a href='/Boards/View.aspx'>View All</a> ";
            }
            else
            {
                lblMessage.InnerText = "Sorry ! Billboard has not been Updated ! Try Again";
            }
        }
    }
}