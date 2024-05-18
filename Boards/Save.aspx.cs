using System;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.UI;
using System.Web;
using System.Net.Mail;

namespace OnlineAdvertisement.Boards
{
    public partial class Save : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Visible = false;

            }

        }
      



        bool check_Fields()
        {
            if (location.Value.Trim() == "")
            {
                return false;
            }
            else if (description.Value.Trim() == "")
            {
                return false;
            }
            else if (manager.Text.Trim() == "")
            {
                return false;
            }
            else if (addsDesc.Text.Trim() == "")
            {
                return false;
            }
            else if (purpose.Value.Trim() == "")
            {
                return false;
            }
            else if (publishDate.Value.Trim() == "")
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        protected void btnUploadAndPublish_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            int fileSize = postedFile.ContentLength;

            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".png")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                int userId = Convert.ToInt32(Session["userId"]);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert advertisement details into the database
                    SqlCommand cmdAds = new SqlCommand("INSERT INTO Billboards (location, description, manager, addsDesc,purpose,publishDate, userId ,ImageData) VALUES (@location, @description, @manager, @addsDesc,@purpose,@publishDate, @userId, @ImageData)", con);
                    cmdAds.Parameters.AddWithValue("@location", location.Value);
                    cmdAds.Parameters.AddWithValue("@description", description.Value);
                    cmdAds.Parameters.AddWithValue("@purpose", purpose.Value);
                    cmdAds.Parameters.AddWithValue("@publishDate", publishDate.Value);
                    cmdAds.Parameters.AddWithValue("@manager", manager.Text);
                    cmdAds.Parameters.AddWithValue("@addsDesc", addsDesc.Text);
                    cmdAds.Parameters.AddWithValue("@userId", userId);
                    cmdAds.Parameters.AddWithValue("@ImageData", bytes);

                    cmdAds.ExecuteNonQuery();

                    con.Close();
                    string userEmail = GetUserEmail(userId);

                    
                    SendEmailToUser(userEmail, location.Value, description.Value, purpose.Value, publishDate.Value);

                    SendEmailToAdmin(location.Value, description.Value,  purpose.Value, publishDate.Value, userId);
                    lblMessage.Visible = true;
                    lblMessage.InnerText = "Your Ads and Image have been published successfully.";
                    lblMessage.Style["color"] = "green";
                    ScriptManager.RegisterStartupScript(this, GetType(), "redirect",
                    "window.location='" + ResolveUrl("View.aspx") + "';", true);
                
                }
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.InnerText = "Only images (.jpg, .png, .gif, and bmp) can be uploaded";
                lblMessage.Style["color"] = "red";

            }
        }
        private string GetUserEmail(int userId)
        {
            if (Session["userEmail"] != null)
            {
                return Session["userEmail"].ToString();
            }
            else
            {
                // Handle the case where the user email is not available in the session.
                // You might need to fetch it from the database or use your authentication mechanism.
                // For example:
                // return FetchUserEmailFromDatabase(userId);
                // or
                // return YourAuthenticationService.GetUserEmail(userId);

                // For now, returning a placeholder email
                return "aun7954@gmail.com";
            }
        }
        private void SendEmailToUser(string userEmail, string location, string description, string purpose, string publishDate)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("codewithaun@example.com"); // Change this to your website's email address
            message.To.Add(new MailAddress(userEmail));
            message.Subject = "Your Billboard has been Published";
            message.Body = $"Your billboard has been published with the following details:\n\nLocation: {location}\nDescription: {description}\nPurpose: {purpose}\nPublish Date: {publishDate}";
            message.IsBodyHtml = true; // Set this to true if you want to use HTML in the email body

            SmtpClient smtp = new SmtpClient("smtp.gmail.com"); // Change this to your SMTP server address
            smtp.Port = 587; // Change this to your SMTP server port
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential("codewithaun@example.com", "hayu umwq kenz qrnc"); // Change this to your SMTP username and password
            smtp.EnableSsl = true;

            try
            {
                smtp.Send(message);
            }
            catch (Exception ex)
            {
                // Handle exception or log the error
                Console.WriteLine("Error sending email to user: " + ex.Message);
            }
        }

        private void SendEmailToAdmin(string location, string description, string purpose, string publishDate, int userId)
        {
            string adminEmail = "codewithaun@gmail.com"; // Change this to your admin's email address

            MailMessage message = new MailMessage();
            message.From = new MailAddress("codewithaun@gmail.com"); // Change this to your website's email address
            message.To.Add(new MailAddress(adminEmail));
            message.Subject = "New Billboard Pulished";
            message.Body = $"A new billboard has been Published:\n\nLocation: {location}\nDescription: {description}\nPurpose: {purpose}\nPublish Date: {publishDate}\nUser ID: {userId}";

            SmtpClient smtp = new SmtpClient("smtp.gmail.com"); // Change this to your SMTP server address
            smtp.Port = 587; // Change this to your SMTP server port
            smtp.Credentials = new System.Net.NetworkCredential("codewithaun@gmail.com", "hayu umwq kenz qrnc"); // Change this to your SMTP username and password
            smtp.EnableSsl = true;

            try
            {
                smtp.Send(message);
            }
            catch (Exception ex)
            {
                // Handle exception or log the error
                Console.WriteLine("Error sending email: " + ex.Message);
            }
        }
    }
}
