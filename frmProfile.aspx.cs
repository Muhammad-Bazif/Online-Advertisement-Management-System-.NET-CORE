using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public partial class frmProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Operations.BindGrid("Select * from Users where email='" + Session["user"] + "'", GridView1);
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Operations.Id = Operations.Redirection(sender);
            Response.Redirect("frmProfileEdit.aspx" + "?Id=" + Operations.Id);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Operations.Id = Operations.Redirection(sender);
            Response.Redirect("frmProfileDelete.aspx" + "?Id=" + Operations.Id);
        }
    }
}