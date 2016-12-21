using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMPROVE
{
    public partial class InserirAnotacao : System.Web.UI.Page
    {
        DAL.DALAnotacao DALAnotacao = new DAL.DALAnotacao();
        Modelo.Anotacao Anotacao;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string titulo = TextBox1.Text;
            string descricao = TextBox2.Text;
            bool favorito = CheckBox1.Checked;
            Guid usuario_id = new Guid(Session["userId"].ToString());
            Anotacao = new Modelo.Anotacao(0, titulo, descricao, favorito, DateTime.Now, DateTime.Now, usuario_id);
            DALAnotacao.Insert(Anotacao);
            Response.Redirect("~/AnotacaoETarefa/AnotacaoETarefa.aspx");
        }
    }
}