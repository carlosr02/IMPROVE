using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMPROVE
{
    public partial class Mochila : System.Web.UI.Page
    {
        DAL.DALArquivo DALArquivo = new DAL.DALArquivo();
        Modelo.Arquivo Arquivo;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Upload_Click(object sender, EventArgs e)
        {
            if (FileUploadArquivo.HasFile)
            {
                string redirect;
                string filename;
                try
                {
                    string descricao = FileUploadArquivo.FileName;
                    string endereco = "~/" + Session["userId"].ToString() + "/";
                    int tamanhoArquivo = FileUploadArquivo.PostedFile.ContentLength;
                    Guid usuario_id = new Guid(Session["userId"].ToString());

                    Arquivo = new Modelo.Arquivo(0, descricao, endereco, tamanhoArquivo, DateTime.Now, DateTime.Now, usuario_id);
                    DALArquivo.Insert(Arquivo);

                    filename = Request.PhysicalApplicationPath + Session["userId"].ToString() + "\\" + FileUploadArquivo.FileName;
                    FileUploadArquivo.SaveAs(filename);

                    //redirect = "~\\WebFormMensagem.aspx?msgTipo=ok&msg=Cronologia Enviada com Sucesso";
                }
                catch (Exception ex)
                {
                    //redirect = "~\\WebFormMensagem.aspx?msgTipo=erro&msg=Erro Enviando Cronologia";
                }
                Response.Redirect("Mochila.aspx"/*redirect*/);
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Baixar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int codigo = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());

                Arquivo = DALArquivo.SelectById(codigo);

                string path = Request.PhysicalApplicationPath.ToString() + Session["userId"].ToString() + "\\" + Arquivo.Descricao;
                System.IO.FileInfo file = new System.IO.FileInfo(path);
                if (file.Exists)
                {
                    Response.Clear();
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                    Response.AddHeader("Content-Length", file.Length.ToString());
                    Response.ContentType = "application/octet-stream";
                    Response.WriteFile(file.FullName);
                    Response.End();
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int codigo = Convert.ToInt32(GridView1.SelectedValue);

            Arquivo = DALArquivo.SelectById(codigo);

            string path = Session["userId"].ToString() + "/" + Arquivo.Descricao;
            Response.Redirect(path);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            int codigo = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());

            Arquivo = DALArquivo.SelectById(codigo);

            string path = Request.PhysicalApplicationPath.ToString() + Session["userId"].ToString() + "\\" + Arquivo.Descricao;

            DALArquivo.Delete(Arquivo);
            System.IO.File.Delete(path);

            Response.Redirect("Mochila.aspx");
        }
    }
}