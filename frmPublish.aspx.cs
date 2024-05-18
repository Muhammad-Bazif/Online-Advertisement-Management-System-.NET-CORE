 using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace OnlineAdvertisement
{
    public partial class frmPublish : System.Web.UI.Page
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
            if (txtDesc.Value.Trim() == "")
            {
                return false;
            }
            else if (txtDate.Value.Trim() == "")
            {
                return false;
            }
            else if (txtBudget.Value.Trim() == "")
            {
                return false;
            }
            else if (txtMode.Value.Trim() == "")
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

            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".zip" || fileExtension.ToLower() == ".png")
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
                    SqlCommand cmdAds = new SqlCommand("INSERT INTO Advertisements (advMode, description, budget, date, userId, ImageData, YouTube, Facebook, Instagram, Google) VALUES (@advMode, @desc, @budget, @date, @userId, @ImageData, @YouTube, @Facebook, @Instagram, @Google)", con);
                    cmdAds.Parameters.AddWithValue("@advMode", txtMode.Value);
                    cmdAds.Parameters.AddWithValue("@desc", txtDesc.Value);
                    cmdAds.Parameters.AddWithValue("@budget", txtBudget.Value);
                    cmdAds.Parameters.AddWithValue("@date", txtDate.Value);
                    cmdAds.Parameters.AddWithValue("@userId", userId);
                    cmdAds.Parameters.AddWithValue("@ImageData", bytes);
                    // CheckBox
                    cmdAds.Parameters.AddWithValue("@YouTube", chkYouTube.Checked ? 1 : 0);
                    cmdAds.Parameters.AddWithValue("@Facebook", chkFacebook.Checked ? 1 : 0);
                    cmdAds.Parameters.AddWithValue("@Instagram", chkInstagram.Checked ? 1 : 0);
                    cmdAds.Parameters.AddWithValue("@Google", chkGoogle.Checked ? 1 : 0);


                    cmdAds.ExecuteNonQuery();

                    con.Close();
                    SendEmailToAdmin(txtMode.Value, txtDesc.Value, txtBudget.Value, txtDate.Value, userId);
                    lblMessage.Visible = true;
                    lblMessage.Text = "Your Ads and Image have been published successfully.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    ScriptManager.RegisterStartupScript(this, GetType(), "redirect",
                    "window.location='" + ResolveUrl("Adds.aspx") + "';", true);

                }
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Only images (.jpg, .png, .gif, and bmp) can be uploaded";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        private void SendEmailToAdmin(string advMode, string desc, string budget, string date, int userId)
        {
            string adminEmail = "codewithaun@gmail.com"; // Change this to your admin's email address

            MailMessage message = new MailMessage();
            message.From = new MailAddress("codewithaun@gmail.com"); // Change this to your website's email address
            message.To.Add(new MailAddress(adminEmail));
            message.Subject = "New Advertisement Published";
            message.Body = $"A new Advertisement has been published:\n\nMode: {advMode}\nDescription: {desc}\nBudget: {budget}\nDate: {date}\nUser ID: {userId}";

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