using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMPROVE.AcessoPublico
{
    public partial class Cadastrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            string UserId = Membership.GetUser(CreateUserWizard1.UserName).ProviderUserKey.ToString();
            Directory.CreateDirectory(Request.PhysicalApplicationPath + UserId);
            Session["userId"] = UserId;
        }
    }
}