using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace View
{
    public partial class ViewDefault : System.Web.UI.Page
    {
        public static DataTable TableData = new DataTable();
        public static string Constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllData();
            }
        }
        private void GetAllData() //Get all the data and bind it in HTLM Table 
        {
            using (var con = new SqlConnection(Constr))
            {
                const string query = "SELECT * FROM DBO.IJPDetails ORDER BY Id DESC";
                using (var cmd = new SqlCommand(query, con))
                {
                    using (var sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (TableData)
                        {
                            TableData.Clear();
                            sda.Fill(TableData);
                        }
                    }
                }
            }
        }
        [WebMethod]
        public static IJPDetails[] GetData() //Show the details of the data after insert in HTML Table
        {
            var details = new List<IJPDetails>();
            using (var con = new SqlConnection(Constr))
            {
                const string query = "SELECT * FROM DBO.IJPDetails ORDER BY Id DESC";
                using (var cmd = new SqlCommand(query, con))
                {
                    using (var sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        TableData.Clear();
                        sda.Fill(TableData);
                        details.AddRange(from DataRow dtrow in TableData.Rows
                            select new IJPDetails
                            {
                                Id = Convert.ToInt32(dtrow["Id"]),
                                Job = dtrow["Job"].ToString(),
                                Experience = Convert.ToDecimal(dtrow["Experience"]),
                                LastDate = dtrow["LastDate"].ToString(),
                                ApplicationReceived = dtrow["ApplicationReceived"].ToString(),
                                IJPStatus = dtrow["IJPStatus"].ToString(),
                            });
                    }
                }
            }
            return details.ToArray();
        }

        [WebMethod]
        public static void SaveUser(IJPDetails objEmployee) //Insert data in database
        {
            using (var con = new SqlConnection(Constr))
            {
                using (var cmd = new SqlCommand("INSERT INTO [dbo].[IJPDetails] VALUES(@Job,@Experience,@LastDate,@ApplicationReceived,@Quantity,@IJPStatus)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Job", objEmployee.Job);
                    cmd.Parameters.AddWithValue("@Experience", objEmployee.Experience);
                    cmd.Parameters.AddWithValue("@LastDate", objEmployee.LastDate);
                    cmd.Parameters.AddWithValue("@ApplicationReceived", objEmployee.ApplicationReceived);
                    cmd.Parameters.AddWithValue("@Quantity", objEmployee.Quantity);
                    cmd.Parameters.AddWithValue("@IJPStatus", objEmployee.IJPStatus);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        [WebMethod]
        public static string EditData(int Id) //Show the edit clicked data in the popup window
        {
            string jsondata;
            //var details = new List<Employee>();
            using (var con = new SqlConnection(Constr))
            {
                var query = "SELECT * FROM IJPDetails WHERE ID ='" + Id + "' ORDER BY ID DESC";
                using (var cmd = new SqlCommand(query, con))
                {
                    using (var sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        TableData.Clear();
                        sda.Fill(TableData);
                        jsondata = JsonConvert.SerializeObject(TableData);
                    }
                }
            }
            return jsondata;
        }

        [WebMethod]
        public static void UpdateData(IJPDetails objEmployee, int Id) //Update data in database  
        {
            using (var con = new SqlConnection(Constr))
            {
                var query = @" UPDATE [dbo].[IJPDetails] SET [Job] = '"+objEmployee.Job+"',[Experience] = '"+objEmployee.Experience+"',[LastDate] = '"+objEmployee.LastDate+"',[ApplicationReceived] = '"+objEmployee.ApplicationReceived+"',[Quantity] = '"+objEmployee.Quantity+"',[IJPStatus] = '"+objEmployee.IJPStatus+"'WHERE Id='" + Id + "'";
                con.Open();
                var cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        [WebMethod]
        public static void Remove(int Id)
        {
            using (var con = new SqlConnection(Constr))
            {
                var query = "DELETE FROM [dbo].[IJPDetails] WHERE ID='" + Id + "'";
                con.Open();
                var cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

    }
    public class IJPDetails
    {
        public int Id;
        public string Job;
        public decimal Experience;
        public string LastDate;
        public string ApplicationReceived;
        public int Quantity;
        public string IJPStatus;
    }
}