using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMPROVE
{
    public partial class AnotacaoETarefa : System.Web.UI.Page
    {
        DAL.DALAnotacao DALAnotacao = new DAL.DALAnotacao();
        Modelo.Anotacao Anotacao;

        DAL.DALTarefa DALTarefa = new DAL.DALTarefa();
        Modelo.Tarefa Tarefa;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;
            
            int id = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());
            string titulo = (GridView1.Rows[index].Cells[1].Controls[0] as TextBox).Text;
            string descricao = (GridView1.Rows[index].Cells[2].Controls[0] as TextBox).Text;
            bool favorito = (GridView1.Rows[index].Cells[3].Controls[0] as CheckBox).Checked;

            Anotacao = new Modelo.Anotacao(id, titulo, descricao, favorito, DateTime.Now, DateTime.Now, new Guid());
            DALAnotacao.Update(Anotacao);

            Response.Redirect("~/AnotacaoETarefa/AnotacaoETarefa.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());

            Anotacao = new Modelo.Anotacao(id, "", "", false, DateTime.Now, DateTime.Now, new Guid());
            DALAnotacao.Delete(Anotacao);

            Response.Redirect("~/AnotacaoETarefa/AnotacaoETarefa.aspx");
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView2.DataKeys[index].Value.ToString());
            string descricao = (GridView2.Rows[index].Cells[1].Controls[0] as TextBox).Text;
            bool cumprida = (GridView2.Rows[index].Cells[2].Controls[0] as CheckBox).Checked;
            bool prioritaria = (GridView2.Rows[index].Cells[3].Controls[0] as CheckBox).Checked;

            Tarefa = new Modelo.Tarefa(id, descricao, cumprida, prioritaria, DateTime.Now, DateTime.Now, new Guid());
            DALTarefa.Update(Tarefa);

            Response.Redirect("~/AnotacaoETarefa/AnotacaoETarefa.aspx");
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView2.DataKeys[index].Value.ToString());

            Tarefa = new Modelo.Tarefa(id, "", false, false, DateTime.Now, DateTime.Now, new Guid());
            DALTarefa.Delete(Tarefa);

            Response.Redirect("~/AnotacaoETarefa/AnotacaoETarefa.aspx");
        }
    }
}