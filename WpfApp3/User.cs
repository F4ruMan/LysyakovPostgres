using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfApp3
{
    public class User
    {
        int Id { get; }
        string Username { get; set; }
        string Pass {  get; set; }
        public User(int id, string username, string pass)
        {
            Id = id;
            Username = username;
            Pass = pass;
        }
    }
}
