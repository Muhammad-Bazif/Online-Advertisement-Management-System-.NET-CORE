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
    public partial class Adds : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            // Get the reference to the button that triggered the event
            Button btnUpdateStatus = (Button)sender;

            // Get the row that contains this button
            GridViewRow row = (GridViewRow)btnUpdateStatus.NamingContainer;

            // Get the advId from the DataKeys collection
            int advId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

            // Call the updateAdvertisementStatus method with the advId
            updateAdvertisementStatus(advId);

            // Rebind the GridView to reflect the updated status
            BindGridView();
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
                        GridView1.DataKeyNames = new string[] { "advId" }; // Set DataKeyNames
                        GridView1.DataBind();
                    }
                }
            }
        }
        protected void updateAdvertisementStatus(int advId)
        {
            try
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




        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        // Find the Label control for the "status" column
        //        Label lblStatus = (Label)e.Row.FindControl("lblStatus");

        //        if (lblStatus != null)
        //        {
        //            // Get the status value from the data source
        //            string statusText = lblStatus.Text;

        //            // Set the text based on the status value
        //            if (!string.IsNullOrEmpty(statusText))
        //            {
        //                int statusValue = Convert.ToInt32(statusText);

        //                switch (statusValue)
        //                {
        //                    case 0:
        //                        lblStatus.Text = "Processing";
        //                        break;
        //                    case 1:
        //                        lblStatus.Text = "Approved";
        //                        break;
        //                    // Add more cases as needed for other status values
        //                    default:
        //                        lblStatus.Text = "Rejected";
        //                        break;
        //                }
        //            }
        //            else
        //            {
        //                lblStatus.Text = "Rejected";
        //            }
        //        }
        //    }
        //}
        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        // Find the Label control for the "status" column
        //        Label lblStatus = (Label)e.Row.FindControl("lblStatus");

        //        if (lblStatus != null)
        //        {
        //            // Get the status value from the data source
        //            string statusText = lblStatus.Text;

        //            // Set the text based on the status value
        //            if (!string.IsNullOrEmpty(statusText))
        //            {
        //                int statusValue;
        //                if (int.TryParse(statusText, out statusValue))
        //                {
        //                    lblStatus.Text = GetStatusString(statusValue);
        //                }
        //                else
        //                {
        //                    lblStatus.Text = "Rejected"; // Default value for unrecognized status
        //                }
        //            }
        //            else
        //            {
        //                lblStatus.Text = "Rejected";
        //            }
        //        }
        //    }
        //}

        //private string GetStatusString(int statusValue)
        //{
        //    switch (statusValue)
        //    {
        //        case 0:
        //            return "Processing";
        //        case 1:
        //            return "Approved";
        //        // Add more cases as needed for other status values
        //        default:
        //            return "Rejected";
        //    }
        //}
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

                // Find the Image control for the "Image" column
                Image imgAdvertisement = (Image)e.Row.FindControl("imgAdvertisement");

                if (imgAdvertisement != null)
                {
                    // Get the image data from the data source
                    byte[] imageData = (byte[])DataBinder.Eval(e.Row.DataItem, "ImageData");

                    // Convert the image data to a Base64 string
                    string base64String = Convert.ToBase64String(imageData, 0, imageData.Length);

                    // Set the ImageUrl property to display the image
                    imgAdvertisement.ImageUrl = "data:image/png;base64," + base64String;
                }
            }
        }

        private string GetStatusString(int statusValue)
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








        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPublish.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Redirect_To(sender);
            Response.Redirect("frmAddsEdit.aspx" + "?Id=" + Operations.Id);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Redirect_To(sender);
            Response.Redirect("frmAddsDelete.aspx" + "?Id=" + Operations.Id);
        }

        private static void Redirect_To(object sender)
        {
            Operations.Id = Operations.Redirection(sender);
        }
    }
}