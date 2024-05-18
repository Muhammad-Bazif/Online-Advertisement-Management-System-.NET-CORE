//using System;
//using System.Collections.Generic;
//using System.Data.SqlClient;
using System;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public partial class adminUserDetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int userIdd = Convert.ToInt32(Request.QueryString["userId"]);
                System.Diagnostics.Debug.WriteLine("userddd: " + userIdd);
                // Check if the userId parameter exists in the query string
                if (Request.QueryString["userId"] != null)
                {
                    
                    // Retrieve the userId from the query string and convert it to an integer
                    int userId = Convert.ToInt32(Request.QueryString["userId"]);
                    System.Diagnostics.Debug.WriteLine("userIdd: " + userId);

                    string adsQuery = "SELECT * FROM Advertisements WHERE userId = @UserId";
                    Operations.BindGridWithParameters(adsQuery, GridViewAdvertisements, new SqlParameter("@UserId", userId));
                    // Use the userId to fetch and display data in the GridView or perform other operations
                    // Example: BindGridViewData(userId);
                    string billQuery = "SELECT * FROM Billboards WHERE userId = @UserId";
                    Operations.BindGridWithParameters(billQuery, GridViewBillboards, new SqlParameter("@UserId", userId));
                }
                else
                {
                    // Handle the case where the userId parameter is not present in the query string
                }

            }

        }

        protected void DownloadImage_Click(object sender, EventArgs e)
        {
            Button btnDownload = (Button)sender;
            int advId = Convert.ToInt32(btnDownload.CommandArgument);

            // Fetch the image data from the database
            string query = "SELECT ImageData FROM Billboards WHERE Id = @Id";
            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", advId);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            reader.Read();
                            byte[] imageData = (byte[])reader["ImageData"];

                            // Set the response headers for downloading the image
                            Response.Clear();
                            Response.ContentType = "image/png";
                            Response.AddHeader("Content-Disposition", "attachment; filename=advertisement_image.png");
                            Response.BinaryWrite(imageData);
                            Response.Flush();
                            Response.End();
                        }
                        else
                        {
                            System.Diagnostics.Debug.WriteLine("Image not found for advId: " + advId);
                            // Handle the case where the image is not found for the given advId
                            // Log or display an error message
                        }
                    }
                }
            }
        }
        protected void DownloadImage_ClickADS(object sender, EventArgs e)
        {
            Button btnDownload = (Button)sender;
            int advId = Convert.ToInt32(btnDownload.CommandArgument);

            // Fetch the image data from the database
            string query = "SELECT ImageData FROM Advertisements WHERE advId = @AdvId";
            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@AdvId", advId);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {

                            reader.Read();
                            byte[] imageData = (byte[])reader["ImageData"];

                            // Set the response headers for downloading the image
                            Response.Clear();
                            Response.ContentType = "image/png";
                            Response.AddHeader("Content-Disposition", "attachment; filename=advertisement_image.png");
                            Response.BinaryWrite(imageData);
                            Response.Flush();
                            Response.End();
                        }
                        else
                        {
                            System.Diagnostics.Debug.WriteLine("Image not found for advId: " + advId);
                            // Handle the case where the image is not found for the given advId
                            // Log or display an error message
                        }
                    }
                }
            }
        }

    }
}
    







