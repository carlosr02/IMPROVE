using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

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
                string extensao = Path.GetExtension(FileUploadArquivo.FileName);
                string descricao = FileUploadArquivo.FileName.Replace(extensao, "");
                string endereco = "~/" + Session["userId"].ToString() + "/";
                int tamanhoArquivo = FileUploadArquivo.PostedFile.ContentLength;
                Guid usuario_id = new Guid(Session["userId"].ToString());

                Arquivo = new Modelo.Arquivo(0, descricao, extensao, endereco, tamanhoArquivo, DateTime.Now, DateTime.Now, usuario_id);
                DALArquivo.Insert(Arquivo);

                string filename = Request.PhysicalApplicationPath + Session["userId"].ToString() + "\\" + FileUploadArquivo.FileName;
                FileUploadArquivo.SaveAs(filename);

                Response.Redirect("Mochila.aspx");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Baixar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int codigo = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());

                Arquivo = DALArquivo.SelectById(codigo);

                string path = Request.PhysicalApplicationPath.ToString() + Session["userId"].ToString() + "\\" + Arquivo.Descricao + Arquivo.Extensao;
                FileInfo file = new FileInfo(path);
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

            string path = "~/" + Session["userId"].ToString() + "/" + Arquivo.Descricao + Arquivo.Extensao;
            Response.Redirect(path);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            int codigo = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());

            Arquivo = DALArquivo.SelectById(codigo);

            string path = Request.PhysicalApplicationPath.ToString() + Session["userId"].ToString() + "\\" + Arquivo.Descricao + Arquivo.Extensao;

            DALArquivo.Delete(Arquivo);
            File.Delete(path);

            Response.Redirect("Mochila.aspx");
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());
            string descricao = (GridView1.Rows[index].Cells[1].Controls[0] as TextBox).Text;

            Arquivo = DALArquivo.SelectById(id);
            string extensao = Arquivo.Extensao;
            string sourceName = Arquivo.Descricao + extensao;

            Arquivo.Descricao = descricao;
            DALArquivo.Update(Arquivo);

            string path = Request.PhysicalApplicationPath.ToString() + Session["userId"].ToString() + "\\";

            File.Move(path + sourceName, path + descricao + extensao);
            Response.Redirect("~/Mochila/Mochila.aspx");
        }
    }
}