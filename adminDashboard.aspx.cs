using System;
using System.Data.SqlClient;

namespace OnlineAdvertisement
{
    public partial class adminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Count total number of users and display in a span
                int totalUsers = CountTotalRecords("Users");
                spanTotalUsers.InnerText = $"Total Users: {totalUsers}";

                // Count total number of advertisements and display in a span
                int totalAdvertisements = CountTotalRecords("Advertisements");
                spanTotalAdvertisements.InnerText = $"Total Advertisements: {totalAdvertisements}";

                // Count total number of billboards and display in a span
                int totalBillboards = CountTotalRecords("Billboards");
                spanTotalBillboards.InnerText = $"Total Billboards: {totalBillboards}";
            }
        }

        private int CountTotalRecords(string tableName)
        {
            int totalCount = 0;

            // Connection string, replace "your_connection_string_here" with your actual connection string
            string connectionString = Operations.conn_String;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // SQL query to count total records
                string query = $"SELECT COUNT(*) FROM {tableName}";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    totalCount = Convert.ToInt32(command.ExecuteScalar());
                }
            }

            return totalCount;
        }
    }
}
