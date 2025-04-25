using System.Collections.ObjectModel;
using System.Configuration;
using System.Data;
using System.Windows;
using Npgsql;

namespace WpfApp3
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static string conn = "Host=127.0.0.1;Port=5432;DataBase=Lysyakov;Username=postgres;Password=postgres";
        
        public static string user;
        public static ObservableCollection<User> users = new ObservableCollection<User>();
    }

}
