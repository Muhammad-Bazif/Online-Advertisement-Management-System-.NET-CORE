
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace OnlineAdvertisement
{
    public static class Operations
    {
        static int result = 0;
        static SqlDataAdapter sda = null;
        public static DataTable dt = null;
        static SqlConnection conn = null;
        public static int Id;
        public static string conn_String = @"Data Source=.;Initial Catalog=OAMS;Integrated Security=True";
        public static void BindGrid(String query, GridView gridView)
        {
            using (conn = Operations.connection_Open())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    cmd.Connection = conn;
                    gridView.DataSource = cmd.ExecuteReader();
                    gridView.DataBind();
                }
            }
        }
        public static void BindGridWithParameters(String query, GridView gridView, params SqlParameter[] parameters)
        {
            using (conn = connection_Open())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    cmd.Connection = conn;

                    // Add parameters to the command
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    gridView.DataSource = cmd.ExecuteReader();
                    gridView.DataBind();
                }
            }
        }

        public static void BindGridForUser(string query, GridView gridView, string userId)
        {
            // Perform the necessary database operations to get data for the user
            // You should replace the following code with actual database operations
            using (SqlConnection connection = new SqlConnection(conn_String))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserId", userId);
                    connection.Open();

                    // Assuming you have a method to fill the GridView
                    SqlDataReader reader = command.ExecuteReader();
                    gridView.DataSource = reader;
                    gridView.DataBind();
                }
            }
        }

        public static void Fill_DropDownList(String query, DropDownList dropDownList_Name, String dataTextField, String dataValueField)
        {
            conn = Operations.connection_Open();
            dropDownList_Name.AppendDataBoundItems = true;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = query;
            cmd.Connection = conn;
            try
            {
                dropDownList_Name.DataSource = cmd.ExecuteReader();
                dropDownList_Name.DataTextField = dataTextField;
                dropDownList_Name.DataValueField = dataValueField;
                dropDownList_Name.DataBind();

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }
        public static int Redirection(object sender)
        {
            int Id = Convert.ToInt32((sender as Button).CommandArgument);
            return Id;
        }
        public static SqlConnection connection_Open()
        {
            conn = new SqlConnection(conn_String);
            conn.Open();
            return conn;
        }
        public static void connection_Close()
        {
            conn.Close();
        }
        public static bool DB_Operation(string query, params SqlParameter[] parameters)
        {
            string connectionString = conn_String;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
        
                {
                    try
                    {
                        connection.Open();
                        if (parameters != null)
                        {
                            command.Parameters.AddRange(parameters);
                        }
                        command.ExecuteNonQuery();
                        return true;
                    }
                    catch (Exception ex)
                    {
                        // Print or log the database error
                        Console.WriteLine("Database Error: " + ex.Message);
                        return false;
                    }
                }
            }
        }

        public static bool Fill_Grid_View(String query) // DataGridView gridViewName
        {
            try
            {
                sda = new SqlDataAdapter(query, connection_Open());
                dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                //gridViewName.DataSource = null;
                //gridViewName.BorderStyle = BorderStyle.FixedSingle;
                //gridViewName.DataSource = dt;
                //gridViewName.Refresh();
            }
            catch (SqlException ex)
            {
                connection_Close();
                // MessageBox.Show(ex.Message);
            }
            finally
            {
                connection_Close();
            }
            return false;
        }

        public static DataTable Search_Data(String query)
        {
            try
            {
                sda = new SqlDataAdapter(query, connection_Open());
                dt = new DataTable();
                sda.Fill(dt);
                return dt;
            }
            catch (SqlException)
            {
                connection_Close();
                return dt;
            }
            finally
            {
                connection_Close();
            }
        }
        public static void ExecuteNonQueryWithParameters(string query, params SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddRange(parameters);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}