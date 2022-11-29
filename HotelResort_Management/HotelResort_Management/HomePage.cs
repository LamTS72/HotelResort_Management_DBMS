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
    public partial class HomePage : Form
    {
        public HomePage()
        {
            InitializeComponent();
        }

        private void LogOutButton_Click(object sender, EventArgs e)
        {
            LoginForm pageIO = new LoginForm();
            this.Hide();
            pageIO.Show();
        }

        private void CustomerButton_Click(object sender, EventArgs e)
        {
            CustomerPage customerInfo = new CustomerPage();
            this.Hide();
            customerInfo.Show();
        }

        private void ReportButton_Click(object sender, EventArgs e)
        {
            Report nreport = new Report();
            this.Hide();
            nreport.Show();

        }

        private void AddRoomButton_Click(object sender, EventArgs e)
        {
            AddingRoom addpage = new AddingRoom();
            this.Hide();
            addpage.Show();

        }

        private void QueryButton_Click(object sender, EventArgs e)
        {
            Query qp = new Query();
            this.Hide();
            qp.Show();
        }
    }
}
