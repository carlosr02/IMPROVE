using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMPROVE.AcessoPublico
{
    public partial class Entrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (IsValidEmail(Login1.UserName))
            {
                string username = Membership.GetUserNameByEmail(Login1.UserName);
                e.Authenticated = Membership.ValidateUser(username, Login1.Password);
                if (e.Authenticated == true) Session["userId"] = Membership.GetUser(username).ProviderUserKey.ToString();
            }
            else
            {
                e.Authenticated = Membership.ValidateUser(Login1.UserName, Login1.Password);
                if (e.Authenticated == true) Session["userId"] = Membership.GetUser(Login1.UserName).ProviderUserKey.ToString();
            }
        }
    }
}