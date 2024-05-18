using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public partial class adminViewUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Operations.BindGrid("SELECT * FROM Users", GridView1);
            }

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Check if the command is for a specific row and the command is "ViewDetails"
            if (e.CommandName == "ViewDetails")
            {
                // Get the index of the row where the command was triggered
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Check if the rowIndex is within the valid range
                if (rowIndex >= 0 && rowIndex < GridView1.Rows.Count)
                {
                    // Assuming your GridView has a DataKey for the "userId" field
                    int userId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values["userId"]);

                    // Redirect to adminUserDetails.aspx with userId in the query string
                    Response.Redirect("adminUserDetails.aspx?userId=" + userId);
                }
                else
                {
                    
                }
            }
        }



      

    }

}


