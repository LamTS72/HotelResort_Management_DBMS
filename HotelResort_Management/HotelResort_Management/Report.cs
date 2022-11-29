using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HotelResort_Management
{
    public partial class Report : Form
    {
        public Report()
        {
            InitializeComponent();
        }
        LoginForm loginIO = new LoginForm();
        private void button2_Click(object sender, EventArgs e)
        {
           HomePage hpage = new HomePage();
            this.Hide();
            hpage.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                loginIO.conn.Open();
                loginIO.sql = @"SELECT * FROM StatisticGuests(:_branch_id,:_year)";
                loginIO.cmd = new NpgsqlCommand(loginIO.sql, loginIO.conn);
                loginIO.cmd.Parameters.AddWithValue("_branch_id", branchidBox.Text);
                loginIO.cmd.Parameters.AddWithValue("_year", yearBox.Text);
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
    

        private void Report_Load(object sender, EventArgs e)
        {
            loginIO.conn = new NpgsqlConnection(loginIO.connstring);
        }
    }
}
