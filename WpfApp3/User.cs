using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace WpfApp3
{
    public class User : INotifyPropertyChanged
    {
        int id;
        string username;
        string pass;
        public User(int id, string username, string pass)
        {
            this.id = id;
            this.username = username;
            this.pass = pass;
        }
        public int Id
        {
            get => id;
            set
            {
                id = value;
                OnPropertyChanged(nameof(id));
            }
        }
        public string Username
        {
            get => username;
            set
            {
                username = value;
                OnPropertyChanged(nameof(username));
            }
        }
        public string Pass
        {
            get => pass;
            set
            {
                pass = value; OnPropertyChanged(nameof(pass));
            }
        }
        public override string ToString()
        {
            return id.ToString();
        }
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
