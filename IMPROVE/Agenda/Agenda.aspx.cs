using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMPROVE
{
    public partial class Agenda : System.Web.UI.Page
    {
        DAL.DALEvento DALEvento = new DAL.DALEvento();
        Modelo.Evento Evento;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());
            string titulo = (GridView1.Rows[index].Cells[1].Controls[0] as TextBox).Text;
            string descricao = (GridView1.Rows[index].Cells[2].Controls[0] as TextBox).Text;
            DateTime diaEvento = Convert.ToDateTime((GridView1.Rows[index].Cells[3].Controls[0] as TextBox).Text);

            Evento = new Modelo.Evento(id, titulo, descricao, diaEvento, DateTime.Now, DateTime.Now, new Guid());
            DALEvento.Update(Evento);

            Response.Redirect("~/Agenda/Agenda.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());

            Evento = new Modelo.Evento(id, "", "", DateTime.Now, DateTime.Now, DateTime.Now, new Guid());
            DALEvento.Delete(Evento);

            Response.Redirect("~/Agenda/Agenda.aspx");
        }
    }
}