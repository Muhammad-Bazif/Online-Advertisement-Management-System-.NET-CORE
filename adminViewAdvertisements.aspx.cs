using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public partial class adminViewAdvertisements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataKeyNames = new string[] { "advId" };
                Operations.BindGrid("SELECT * FROM Advertisements", GridView1);
            }

        }
        
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            if (DateTime.TryParse(txtStartDate.Text, out DateTime startDate) && DateTime.TryParse(txtEndDate.Text, out DateTime endDate))
            {
                string query = "SELECT * FROM Advertisements WHERE date BETWEEN @StartDate AND @EndDate";

                Operations.BindGridWithParameters(query, GridView1, new SqlParameter("@StartDate", startDate), new SqlParameter("@EndDate", endDate));

                dateErrorMessage.InnerText = "";
            }
            else
            {
                dateErrorMessage.InnerText = "Please select both start and end dates.";
            }
        }


        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {
                Button btnUpdateStatus = (Button)sender;

                GridViewRow row = (GridViewRow)btnUpdateStatus.NamingContainer;

                if (row.RowIndex >= 0 && row.RowIndex < GridView1.Rows.Count)
                {
                    int advId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

                    updateAdvertisementStatus(advId);

                    // Verify if this line is reached
                    System.Diagnostics.Debug.WriteLine("Redirecting to the new page...");
                }
            }
        }


        private void BindGridView()
        {
            int userId = Convert.ToInt32(Session["userId"]);
            string connectionString = Operations.conn_String;
            string query = "SELECT advId, advMode, budget, date, status, ImageData FROM Advertisements WHERE userId = @userId";


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@userId", userId);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataKeyNames = new string[] { "advId" }; 
                        GridView1.DataBind();
                    }
                }
            }
        }
        protected void DeleteAdvertisement_Click1(object sender, EventArgs e)
        {
            Redirect_To(sender);
            Operations.Id = Operations.Redirection(sender);

            bool deletionSuccess = PerformDeletion(Operations.Id);

            if (deletionSuccess)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Advertisement deleted successfully.');", true);

                Response.Redirect("adminViewAdvertisement.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Error deleting Advertisement.');", true);
            }
        }
        private bool PerformDeletion(int advId)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(Operations.conn_String))
                {
                    connection.Open();

                    string query = "DELETE FROM Advertisement WHERE advId = @advId";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@advId", advId);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"PerformDeletion error: {ex.Message}");
                return false;
            }
        }

        private static void Redirect_To(object sender)
        {
            Operations.Id = Operations.Redirection(sender);
        }






       
        protected void updateAdvertisementStatus(int advId)
        {
            using (SqlConnection connection = new SqlConnection(Operations.conn_String))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("dbo.updateAdvertisementStatus", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    SqlParameter idParameter = new SqlParameter("@advId", SqlDbType.Int);
                    idParameter.Value = advId;
                    command.Parameters.Add(idParameter);

                    SqlParameter resultParameter = new SqlParameter("@status", SqlDbType.Int);
                    resultParameter.Direction = ParameterDirection.Output;
                    command.Parameters.Add(resultParameter);

                    command.ExecuteNonQuery();

                    int result = (int)resultParameter.Value;

                    if (result == 0)
                    {
                    }
                    else
                    {
                    }
                }
            }
        }



        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("lblStatus");

                if (lblStatus != null)
                {
                    string statusText = lblStatus.Text;

                    if (!string.IsNullOrEmpty(statusText))
                    {
                        int statusValue;
                        if (int.TryParse(statusText, out statusValue))
                        {
                            lblStatus.Text = GetStatusString(statusValue);
                        }
                        else
                        {
                            lblStatus.Text = "Rejected"; 
                        }
                    }
                    else
                    {
                        lblStatus.Text = "Rejected";
                    }
                }

                Image imgAdvertisement = (Image)e.Row.FindControl("imgAdvertisement");

                if (imgAdvertisement != null)
                {
                    byte[] imageData = (byte[])DataBinder.Eval(e.Row.DataItem, "ImageData");

                    string base64String = Convert.ToBase64String(imageData, 0, imageData.Length);

                    imgAdvertisement.ImageUrl = "data:image/png;base64," + base64String;
                }
            }
        }

        public string GetStatusString(int statusValue)
        {
            switch (statusValue)
            {
                case 0:
                    return "Pending";
                case 1:
                    return "Approved";
                default:
                    return "Rejected";
            }
        }
        protected void DownloadImage_Click(object sender, EventArgs e)
        {
            Button btnDownload = (Button)sender;
            int advId = Convert.ToInt32(btnDownload.CommandArgument);

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
                          
                        }
                    }
                }
            }
        }

        protected void DeleteAdvertisement_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            int advId = Convert.ToInt32(btnDelete.CommandArgument);

            // Use parameterized query to avoid SQL injection
            string query = "DELETE FROM Advertisements WHERE advId = @advId";

            // Execute the query and rebind the grid with updated data
            Operations.ExecuteNonQueryWithParameters(query, new SqlParameter("@advId", advId));
            Operations.BindGrid("SELECT * FROM Advertisements", GridView1);
        }

    }
}