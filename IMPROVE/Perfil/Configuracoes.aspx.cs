using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMPROVE
{
    public partial class Configuracoes : System.Web.UI.Page
    {
        DAL.DALUsuario DALUsuario = new DAL.DALUsuario();
        Modelo.Usuario Usuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario = DALUsuario.SelectById(new Guid(Session["userId"].ToString()));

                ImagePerfil.ImageUrl = Usuario.EnderecoFoto;
                TextBoxNome.Text = Usuario.Nome;
                if (Usuario.DataNascimento != null)
                {
                    DateTime data = Usuario.DataNascimento.Value;
                    TextBoxDataNascimento.Text = data.ToString("yyyy-MM-dd");
                }
                TextBoxEmail.Text = Usuario.Email;
            }
        }

        protected void ButtonEditar_Click(object sender, EventArgs e)
        {
            Usuario = DALUsuario.SelectById(new Guid(Session["userId"].ToString()));

            Usuario.Nome = TextBoxNome.Text;

            DateTime dataNascimento;
            if(DateTime.TryParse(TextBoxDataNascimento.Text, out dataNascimento))
                Usuario.DataNascimento = dataNascimento;

            Usuario.Email = TextBoxEmail.Text;

            MembershipUser user = Membership.GetUser(Usuario.Usuario1);
            user.Email = TextBoxEmail.Text;
            Membership.UpdateUser(user);

            if (FileUpload1.HasFile)
            {
                Usuario.EnderecoFoto = "~/Imagens/perfil/" + Session["userId"].ToString() + ".png";

                string directory = Request.PhysicalApplicationPath + "Imagens\\perfil\\" + Session["userId"] + ".png";
                FileUpload1.SaveAs(directory);
            }

            DALUsuario.Update(Usuario);

            Response.Redirect("Perfil.aspx");
        }
    }
}