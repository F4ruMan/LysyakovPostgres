using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Npgsql;
using System;

namespace WpfApp3
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            using (var connection = new NpgsqlConnection(App.conn))
            {
                connection.Open();
            }
        }

        private void btnLogIn_Click(object sender, RoutedEventArgs e)
        {
            using ( var connection = new NpgsqlConnection(App.conn))
            {
                connection.Open();
                string com = $"select pass, dolznost from users where username = '{tblog.Text}'";
                using (var comm = new NpgsqlCommand(com,connection))
                {
                    using (var reader = comm.ExecuteReader())
                    {
                        reader.Read();
                        string pas = reader.GetString(0);
                        if (pas == tbpass.Text)
                        {
                            App.user=reader.GetString(1);
                            Window1 window1 = new Window1();
                            window1.ShowDialog();
                            this.Close();
                        }
                        else
                        {
                            tbpass.Text = "Праоль неверный";
                        }
                    }
                }
            }
        }
    }
}