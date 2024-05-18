using OnlineAdvertisement;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement.Boards
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindGridView();
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Save.aspx");
        }
        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            // Get the reference to the button that triggered the event
            Button btnUpdateStatus = (Button)sender;

            // Get the row that contains this button
            GridViewRow row = (GridViewRow)btnUpdateStatus.NamingContainer;

            // Get the advId from the DataKeys collection
            int Id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

            // Call the updateAdvertisementStatus method with the advId
            updateBillboardStatus(Id);

            // Rebind the GridView to reflect the updated status
            BindGridView();
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
                    }
                }
            }
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
                            lblStatus.Text = "Rejected"; // Default value for unrecognized status
                        }
                    }
                    else
                    {
                        lblStatus.Text = "Rejected";
                    }
                }

                Image imgBillboard = (Image)e.Row.FindControl("imgBillboard");

                if (imgBillboard != null)
                {
                    // Get the image data from the data source
                    byte[] imageData = (byte[])DataBinder.Eval(e.Row.DataItem, "ImageData");

                    // Log the length of the imageData array
                    System.Diagnostics.Debug.WriteLine($"ImageData Length: {imageData.Length}");

                    try
                    {
                        // Convert the image data to a Base64 string
                        string base64String = Convert.ToBase64String(imageData, 0, imageData.Length);

                        // Log the length of the base64String
                        System.Diagnostics.Debug.WriteLine($"Base64String Length: {base64String.Length}");

                        // Set the ImageUrl property to display the image
                        imgBillboard.ImageUrl = "data:image/png;base64," + base64String;
                    }
                    catch (Exception ex)
                    {
                        // Log or display the exception details
                        System.Diagnostics.Debug.WriteLine($"Exception: {ex.Message}");
                    }
                }
            }
        }

        public string GetStatusString(int statusValue)
        {
            switch (statusValue)
            {
                case 0:
                    return "Processing";
                case 1:
                    return "Approved";
                // Add more cases as needed for other status values
                case -1:
                    return "Rejected";
                default:
                    return "Error";
            }
        }


        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Redirect_To(sender);
            Response.Redirect("Edit.aspx" + "?Id=" + Operations.Id);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Redirect_To(sender);
            Response.Redirect("Delete.aspx" + "?Id=" + Operations.Id);
        }

        private static void Redirect_To(object sender)
        {
            Operations.Id = Operations.Redirection(sender);
        }


    }
}