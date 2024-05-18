using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public partial class adminViewBillboards : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataKeyNames = new string[] { "Id" }; // Set DataKeyNames
                Operations.BindGrid("SELECT * FROM Billboards", GridView1);
            }

        }

        

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            // Check if the dates are provided and valid
            if (DateTime.TryParse(txtStartDate.Text, out DateTime startDate) && DateTime.TryParse(txtEndDate.Text, out DateTime endDate))
            {
                // Use parameterized query to avoid SQL injection
                string query = "SELECT * FROM Billboards WHERE publishDate BETWEEN @StartDate AND @EndDate";

                // Execute the query and bind the grid with filtered data
                Operations.BindGridWithParameters(query, GridView1, new SqlParameter("@StartDate", startDate), new SqlParameter("@EndDate", endDate));

                // Clear any previous error message
                dateErrorMessage.InnerText="";
            }
            else
            {
                // Display an error message if the dates are not provided or invalid
                dateErrorMessage.InnerText =  "Please select both start and end dates.";
        
            }
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {
                // Get the reference to the button that triggered the event
                Button btnUpdateStatus = (Button)sender;

                // Get the row that contains this button
                GridViewRow row = (GridViewRow)btnUpdateStatus.NamingContainer;

                // Check if the index is within the valid range
                if (row.RowIndex >= 0 && row.RowIndex < GridView1.Rows.Count)
                {
                    // Get the advId from the DataKeys collection
                    int Id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

                    // Call the updateAdvertisementStatus method with the advId
                    updateBillboardStatus(Id);

                    // Rebind the GridView to reflect the updated status
                    BindGridView();
                }
            }
        }


        private void BindGridView()
        {
            int userId = Convert.ToInt32(Session["userId"]);
            string connectionString = Operations.conn_String;
            string query = "SELECT Id, location, description, publishDate,manager,purpose,addsDesc, status, ImageData FROM Billboards WHERE userId = @userId";


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@userId", userId);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataKeyNames = new string[] { "Id" }; // Set DataKeyNames
                        GridView1.DataBind();
                        Response.Redirect("adminViewBillBoards.aspx");
                    }
                }
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Redirect to the adminviewAdvertisement page after successful deletion
            Redirect_To(sender);
            Operations.Id = Operations.Redirection(sender);

            // Perform the deletion logic (assuming you have a method for deletion)
            bool deletionSuccess = PerformDeletion(Operations.Id);

            if (deletionSuccess)
            {
                // Display success message (optional)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Billboard deleted successfully.');", true);

                // Redirect to the adminViewAdvertisements page
                Response.Redirect("adminViewBillBoards.aspx");
            }
            else
            {
                // Display error message (optional)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Error deleting Billboard.');", true);
            }
        }
        private bool PerformDeletion(int Id)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(Operations.conn_String))
                {
                    connection.Open();

                    // Construct the SQL query for deletion
                    string query = "DELETE FROM Billboards WHERE Id = @Id";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters as needed
                        command.Parameters.AddWithValue("@Id", Id);

                        // Execute the deletion query
                        int rowsAffected = command.ExecuteNonQuery();

                        // Check if deletion was successful
                        if (rowsAffected > 0)
                        {
                            return true;
                        }
                        else
                        {
                            // Handle the case where no rows were affected (deletion failed)
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception or provide feedback
                System.Diagnostics.Debug.WriteLine($"PerformDeletion error: {ex.Message}");
                return false;
            }
        }

        private static void Redirect_To(object sender)
        {
            Operations.Id = Operations.Redirection(sender);
        }


      
        protected void updateBillboardStatus(int advId)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(Operations.conn_String))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand("dbo.updateBillboardStatus", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        SqlParameter idParameter = new SqlParameter("@Id", SqlDbType.Int);
                        idParameter.Value = advId;
                        command.Parameters.Add(idParameter);

                        SqlParameter resultParameter = new SqlParameter("@status", SqlDbType.Int);
                        resultParameter.Direction = ParameterDirection.Output;
                        command.Parameters.Add(resultParameter);

                        command.ExecuteNonQuery();

                        int result = (int)resultParameter.Value;

                        // Handle the result as needed (e.g., check if it's 0 for success)
                        if (result == 0)
                        {
                            // Success
                            // You can provide feedback to the user if needed

                            // Run any additional logic here if needed
                        }
                        else
                        {
                            // Handle errors
                            // You can provide feedback to the user if needed
                        }
                    }
                }
            }
            catch (Exception)
            {
                // Handle exceptions
                // You can log the exception or provide feedback to the user
            }
        }




        

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Find the Label control for the "status" column
                Label lblStatus = (Label)e.Row.FindControl("lblStatus");

                if (lblStatus != null)
                {
                    // Get the status value from the data source
                    string statusText = lblStatus.Text;

                    // Set the text based on the status value
                    if (!string.IsNullOrEmpty(statusText))
                    {
                        int statusValue;
                        if (int.TryParse(statusText, out statusValue))
                        {
                            lblStatus.Text = GetStatusString(statusValue);
                        }
                        else
                        {
                            lblStatus.Text = "Pending"; // Default value for unrecognized status
                        }
                    }
                    else
                    {
                        lblStatus.Text = "Pending";
                    }
                }

                // Find the Image control for the "Image" column
                Image imgBillboard = (Image)e.Row.FindControl("imgBillboard");

                if (imgBillboard != null)
                {
                    // Get the image data from the data source
                    byte[] imageData = (byte[])DataBinder.Eval(e.Row.DataItem, "ImageData");

                    // Convert the image data to a Base64 string
                    string base64String = Convert.ToBase64String(imageData, 0, imageData.Length);

                    // Set the ImageUrl property to display the image
                    imgBillboard.ImageUrl = "data:image/png;base64," + base64String;
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
                // Add more cases as needed for other status values
                default:
                    return "Pending";
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the advId from the GridView's DataKeys
            int advId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            // Execute the delete query
            string query = "DELETE FROM Billboards WHERE Id = @Id";
            Operations.ExecuteNonQueryWithParameters(query, new SqlParameter("@Id", advId));

            // Refresh the grid after deletion
            Operations.BindGrid("SELECT * FROM Billboards", GridView1);
        }

    }
}
       
   