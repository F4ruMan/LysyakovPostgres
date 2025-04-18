using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WpfApp3
{
    /// <summary>
    /// Логика взаимодействия для Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();
            using (var connection = new NpgsqlConnection(App.conn))
            {
                connection.Open();
                string com = "select * from users";
                using (var comm = new NpgsqlCommand(com, connection))
                {
                    using (var reader = comm.ExecuteReader())
                    {
                        List<User> users = new List<User>();
                        while (reader.Read())
                        {
                            users.Add(new User(reader.GetInt32(0), reader.GetString(1), reader.GetString(2)));
                        }
                        lbusers.ItemsSource = users;
                    }
                }
            }
        }
    }
}
