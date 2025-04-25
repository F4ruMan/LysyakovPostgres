using Npgsql;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
            lbloguser.Content = App.user;
            using (var connection = new NpgsqlConnection(App.conn))
            {
                connection.Open();
                string com = "select * from users";
                using (var comm = new NpgsqlCommand(com, connection))
                {
                    using (var reader = comm.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            App.users.Add(new User(reader.GetInt32(0), reader.GetString(1), reader.GetString(2)));
                        }
                        dgUsers.ItemsSource = App.users;
                    }
                }
            }
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (dgUsers.SelectedItem is User selectedUser)
            {
                using (var connection = new NpgsqlConnection(App.conn))
                {
                    connection.Open(); 
                    string deleteQuery = "DELETE FROM public.users WHERE "+'"'+"ID"+'"'+ $" = {selectedUser.Id}";
                    using (var command = new NpgsqlCommand(deleteQuery, connection))
                    {
                        command.Parameters.AddWithValue("ID", selectedUser.Id);
                        int rowsAffected = await command.ExecuteNonQueryAsync();
                        MessageBox.Show($"Удалено строк: {rowsAffected}");
                    }

                    string selectQuery = "SELECT * FROM public.users";
                    using (var command = new NpgsqlCommand(selectQuery, connection))
                    {
                        using (var reader = command.ExecuteReader())
                        {
                            App.users.Clear();
                            while (reader.Read())
                            {
                                App.users.Add(new User(reader.GetInt32(0), reader.GetString(1), reader.GetString(2)));
                            }
                        }
                    }
                    dgUsers.ItemsSource = null;
                    dgUsers.ItemsSource = App.users;
                }
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите пользователя для удаления.");
            }


        }

        private void btnChangepass_Click(object sender, RoutedEventArgs e)
        {
            ChangePass changePass = new ChangePass(dgUsers.SelectedItem as User);
            changePass.ShowDialog();
        }
    }
}
