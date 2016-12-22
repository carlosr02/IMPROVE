using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMPROVE
{
    public partial class InserirEvento : System.Web.UI.Page
    {
        DAL.DALEvento DALEvento = new DAL.DALEvento();
        Modelo.Evento Evento;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string titulo = TextBox1.Text;
            string descricao = TextBox2.Text;
            DateTime diaEvento = Convert.ToDateTime(TextBox3.Text);
            Guid usuario_id = new Guid(Session["userId"].ToString());
            Evento = new Modelo.Evento(0, titulo, descricao, diaEvento, DateTime.Now, DateTime.Now, usuario_id);
            DALEvento.Insert(Evento);
            Response.Redirect("~/Agenda/Agenda.aspx");
        }
    }
}