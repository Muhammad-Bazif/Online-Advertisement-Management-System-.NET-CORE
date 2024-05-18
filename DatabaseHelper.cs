//using System;
//using System.Collections.Generic;
//using System.Data.SqlClient;

//public class DatabaseHelper
//{
//    private static readonly string ConnectionString = "Data Source=.;Initial Catalog=OAMS;Integrated Security=True";

//    public static object YourExecuteMethod(string query, Dictionary<string, object> parameters)
//    {
//        try
//        {
//            using (SqlConnection connection = new SqlConnection(ConnectionString))
//            {
//                connection.Open();

//                using (SqlCommand command = new SqlCommand(query, connection))
//                {
//                    // Add parameters to the command if any
//                    if (parameters != null)
//                    {
//                        foreach (var parameter in parameters)
//                        {
//                            command.Parameters.AddWithValue(parameter.Key, parameter.Value);
//                        }
//                    }

//                    return command.ExecuteScalar();
//                }
//            }
//        }
//        catch (SqlException sqlEx)
//        {
//            // Log or display the SQL exception message
//            Console.WriteLine("SQL Error in YourExecuteMethod: " + sqlEx.Message);
//            return null;
//        }
//        catch (Exception ex)
//        {
//            // Log or display the exception message
//            Console.WriteLine("Error in YourExecuteMethod: " + ex.Message);
//            return null;
//        }
//    }
//}
