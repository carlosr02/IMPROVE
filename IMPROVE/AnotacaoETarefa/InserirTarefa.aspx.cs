using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMPROVE
{
    public partial class InserirTarefa : System.Web.UI.Page
    {
        DAL.DALTarefa DALTarefa = new DAL.DALTarefa();
        Modelo.Tarefa Tarefa;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string descricao = TextBox1.Text;
            bool prioritaria = CheckBox2.Checked;
            Guid usuario_id = new Guid(Session["userId"].ToString());
            Tarefa = new Modelo.Tarefa(0, descricao, false, prioritaria, DateTime.Now, DateTime.Now, usuario_id);
            DALTarefa.Insert(Tarefa);
            Response.Redirect("~/AnotacaoETarefa/AnotacaoETarefa.aspx");
        }
    }
}