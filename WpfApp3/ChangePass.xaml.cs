using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
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
    /// Логика взаимодействия для ChangePass.xaml
    /// </summary>
    public partial class ChangePass : Window
    {
        User da;
        public ChangePass(User d)
        {
            InitializeComponent();
            da = d;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            
            using (var connection = new NpgsqlConnection(App.conn))
            {
                connection.Open();
                string com = $"select pass from users where username = '{tbOldPass.Text}'";
                
                using (var comm = new NpgsqlCommand(com, connection))
                {
                    using (var reader = comm.ExecuteReader())
                    {
                        reader.Read();
                        string pas = reader.GetString(0);
                        if (pas == tbOldPass.Text)
                        {
                            string commm = $"UPDATE users pass = '{tbNewPass.Text}' where " + '"' + "ID" + '"' + $" = {da.Id}";
                            using (var a = new NpgsqlCommand(commm,connection))
                            {
                                a.ExecuteNonQueryAsync();
                            }
                        }
                        else
                        {
                            tbOldPass.Text = "Праоль неверный";
                        }
                    }
                }
                Close();
            }
        }
    }
}
