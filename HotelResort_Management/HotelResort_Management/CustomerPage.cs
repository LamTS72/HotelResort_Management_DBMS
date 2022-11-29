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
    public partial class CustomerPage : Form
    {
        public CustomerPage()
        {
            InitializeComponent();
        }

        LoginForm loginIO = new LoginForm();
        public DataGridViewRow dgw;
       
        private void CustomerPage_Load(object sender, EventArgs e)
        {
            loginIO.conn = new NpgsqlConnection(loginIO.connstring);
            ShowInfo();
        }
        public void ShowInfo()
        {
            try
            {
               
                loginIO.conn.Open();
                loginIO.sql = @"SELECT customer_id,cccd_cmnd,customer_name,customer_phone,customer_email,username,points,customer_type FROM Customer ORDER BY customer_id;";
                loginIO.cmd = new NpgsqlCommand(loginIO.sql, loginIO.conn);
                loginIO.dt = new DataTable();
                loginIO.dt.Load(loginIO.cmd.ExecuteReader());
                loginIO.conn.Close();
                dataGridView1.DataSource = null;
                dataGridView1.DataSource = loginIO.dt;
                dataGridView1.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10, FontStyle.Regular);
            }
            catch(Exception ex)
            {
                loginIO.conn.Close();
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            HomePage homeIO = new HomePage();
            this.Hide();
            homeIO.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                loginIO.conn.Open();
                loginIO.sql = @"SELECT customer_id,cccd_cmnd,customer_name,customer_phone,customer_email,username,points,customer_type FROM Customer WHERE CONCAT(customer_name) LIKE '%" + textBoxSearch.Text + "%'";
                loginIO.cmd = new NpgsqlCommand(loginIO.sql, loginIO.conn);
                loginIO.dt = new DataTable();
                NpgsqlDataAdapter da = new NpgsqlDataAdapter();
                da.SelectCommand = loginIO.cmd;
                da.Fill(loginIO.dt);
                dataGridView1.DataSource = loginIO.dt;
                dataGridView1.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10, FontStyle.Regular);
                loginIO.conn.Close();
            }
            catch(Exception ex)
            {
                loginIO.conn.Close();
                MessageBox.Show("Error: " + ex.Message);
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
                ShowInfo();
        }


        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            
                if (e.RowIndex >= 0)
                {
                    dgw = dataGridView1.Rows[e.RowIndex];
                    string customer_id = dgw.Cells["customer_id"].Value.ToString();
                    try
                    {
                        loginIO.conn.Open();
                        loginIO.sql = @"SELECT * FROM BillBookingInfo(:_customer_id);";
                        loginIO.cmd = new NpgsqlCommand(loginIO.sql, loginIO.conn);
                        loginIO.cmd.Parameters.AddWithValue("_customer_id", customer_id);
                        loginIO.dt = new DataTable();
                        loginIO.dt.Load(loginIO.cmd.ExecuteReader());
                        loginIO.conn.Close();
                        dataGridView1.DataSource = null;
                        dataGridView1.DataSource = loginIO.dt;
                        dataGridView1.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10, FontStyle.Regular);
                    }
                    catch(Exception ex)
                    {
                        loginIO.conn.Close();
                        MessageBox.Show("Error: " + ex.Message);
                    }
                    
                }
 
            
        }
    }
}
