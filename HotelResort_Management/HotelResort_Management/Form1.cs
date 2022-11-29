using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HotelResort_Management
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }
       
        public NpgsqlConnection conn;
        public string connstring = String.Format("Server={0};Port={1};User Id={2};Password={3};Database={4};",
            "localhost", "5432", "sManager", "123456", "postgres");
        public DataTable dt;
     
        public NpgsqlCommand cmd;
        public string sql = null;

        private void LogIn_Button_Click(object sender, EventArgs e)
        {
            try
            {
                conn = new NpgsqlConnection(connstring);
                conn.Open();
                sql = @"SELECT * FROM check_userlogin(:_username,:_password)";
                cmd = new NpgsqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("_username", username_textBox.Text);
                cmd.Parameters.AddWithValue("_password", password_textBox.Text);
                
                int result = (int)cmd.ExecuteScalar();
                conn.Close();
                if (result == 1)
                {
                    this.Hide();
                    HomePage hp = new HomePage();
                    hp.Show();
                }
                else
                {
                    MessageBox.Show("Please check your account","Message" ,MessageBoxButtons.OK, MessageBoxIcon.Error);
                    conn.Close();
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Error" + ex.Message, "Something is wrong", MessageBoxButtons.OK, MessageBoxIcon.Error);
                conn.Close();
            }
        }

        private void LoginForm_Load(object sender, EventArgs e)
        {
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            
            Environment.Exit(0);
            Application.Exit();
        }
    }
}
