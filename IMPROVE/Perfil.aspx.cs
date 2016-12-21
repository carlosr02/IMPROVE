using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMPROVE
{
    public partial class Perfil : System.Web.UI.Page
    {
        DAL.DALUsuario DALUsuario = new DAL.DALUsuario();
        Modelo.Usuario Usuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario = DALUsuario.SelectById(new Guid(Session["userId"].ToString()));

            ImagePerfil.ImageUrl = Usuario.EnderecoFoto;
            LabelNome.Text = Usuario.Nome;
            if (Usuario.DataNascimento != null)
            {
                DateTime data = Usuario.DataNascimento.Value;
                LabelDataNascimento.Text = data.ToShortDateString();
            }
            LabelEmail.Text = Usuario.Email;
            LabelUsuario.Text = Usuario.Usuario1;
            LabelSenha.Text = "*******";
        }
    }
}