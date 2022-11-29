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
    public partial class AddingRoom : Form
    {
        public AddingRoom()
        {
            InitializeComponent();
        }
        LoginForm loginIO = new LoginForm();
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                loginIO.conn.Open();
                loginIO.sql = @"INSERT INTO RoomType(room_name,area_square,num_guests,description)
	                            VALUES(@_roomtype_name,@_area_square,@_num_guests,@_description);"; ;
                loginIO.cmd = new NpgsqlCommand(loginIO.sql, loginIO.conn);
                loginIO.cmd.Parameters.AddWithValue("_roomtype_name", roomnameBox.Text);
                loginIO.cmd.Parameters.AddWithValue("_area_square", areaBox.Text);
                loginIO.cmd.Parameters.AddWithValue("_num_guests", int.Parse(numguestBox.Text));
                loginIO.cmd.Parameters.AddWithValue("_description", descriptBox.Text);
                loginIO.dt = new DataTable();
                loginIO.dt.Load(loginIO.cmd.ExecuteReader());
                loginIO.conn.Close();

                loginIO.conn.Open();
                loginIO.sql = @"SELECT * FROM RoomType ORDER BY roomtype_id DESC LIMIT 1;";
                loginIO.cmd = new NpgsqlCommand(loginIO.sql, loginIO.conn);
                loginIO.dt = new DataTable();
                loginIO.dt.Load(loginIO.cmd.ExecuteReader());
                loginIO.conn.Close();
                var tempval = loginIO.dt.Rows[0][0].ToString();

                loginIO.conn.Open();
                loginIO.sql = @"INSERT INTO  BedInfo(roomtype_id,bed_size, quantity) VALUES(@roomtype_id,@bed_size,@quantity); ";
                loginIO.sql += @"INSERT INTO SpicTypeInRoomType(spicimen_id,roomtype_id,quantity_spic) VALUES(@spicimen_id,@roomtype_id,@quantity_spic); ";
                loginIO.cmd = new NpgsqlCommand(loginIO.sql, loginIO.conn);
                loginIO.cmd.Parameters.AddWithValue("roomtype_id", Int16.Parse(tempval));
                loginIO.cmd.Parameters.AddWithValue("bed_size",float.Parse(sizeBedBox.Text) );
                loginIO.cmd.Parameters.AddWithValue("quantity", Int16.Parse(bedBox.Text));
                loginIO.cmd.Parameters.AddWithValue("spicimen_id", textBoxspicid.Text);
                loginIO.cmd.Parameters.AddWithValue("roomtype_id", int.Parse(tempval));
                loginIO.cmd.Parameters.AddWithValue("quantity_spic", int.Parse(spicinumBox.Text));
                loginIO.dt = new DataTable();
                loginIO.dt.Load(loginIO.cmd.ExecuteReader());
                loginIO.conn.Close();

                loginIO.conn.Open();
                loginIO.sql = @"SELECT RoomType.roomtype_id,RoomType.room_name,RoomType.area_square,RoomType.num_guests,RoomType.description,
		                        BedInfo.bed_size, BedInfo.quantity,SpicTypeInRoomType.spicimen_id,SpicTypeInRoomType.quantity_spic
		                        FROM RoomType JOIN BedInfo ON RoomType.roomtype_id = BedInfo.roomtype_id 
			                    JOIN SpicTypeInRoomType ON SpicTypeInRoomType.roomtype_id = BedInfo.roomtype_id
		                        ORDER BY RoomType.roomtype_id DESC LIMIT 1;";
                loginIO.cmd = new NpgsqlCommand(loginIO.sql, loginIO.conn);
                loginIO.dt = new DataTable();
                loginIO.dt.Load(loginIO.cmd.ExecuteReader());
                dataGridView1.DataSource = null;
                dataGridView1.DataSource = loginIO.dt;
                dataGridView1.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10, FontStyle.Regular);
            }
            catch (Exception ex)
            {
                loginIO.conn.Close();
                MessageBox.Show("Error: " + ex.Message);
            }


        }

        private void button2_Click(object sender, EventArgs e)
        {
            HomePage hpage = new HomePage();
            this.Hide();
            hpage.Show();
        }

        private void AddingRoom_Load(object sender, EventArgs e)
        {
            loginIO.conn = new NpgsqlConnection(loginIO.connstring);
        }

       
    }
}
