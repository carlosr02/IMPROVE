using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace IMPROVE.DAL
{
    public class DALArquivo
    {
        private string connectionString = "";

        public DALArquivo()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["2016TiiGrupo3ConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Arquivo> SelectAll(Guid usuario_id)
        {
            Modelo.Arquivo aArquivo;
            List<Modelo.Arquivo> aListArquivos = new List<Modelo.Arquivo>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarArquivos", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usuario_id", usuario_id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aArquivo = new Modelo.Arquivo(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        dr[2] as string,
                        Convert.ToInt32(dr[3]),
                        Convert.ToDateTime(dr[4]),
                        Convert.ToDateTime(dr[5]),
                        new Guid(dr[6].ToString())
                        );
                    aListArquivos.Add(aArquivo);
                }
            }

            dr.Close();
            conn.Close();

            return aListArquivos;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Arquivo SelectById(int id)
        {
            Modelo.Arquivo aArquivo;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarArquivo", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            dr.Read();
            aArquivo = new Modelo.Arquivo(
                Convert.ToInt32(dr[0]),
                dr[1] as string,
                dr[2] as string,
                Convert.ToInt32(dr[3]),
                Convert.ToDateTime(dr[4]),
                Convert.ToDateTime(dr[5]),
                new Guid(dr[6].ToString())
            );

            dr.Close();
            conn.Close();

            return aArquivo;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Arquivo obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_deletarArquivo", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Arquivo obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_inserirArquivo", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@endereco", obj.Endereco);
            cmd.Parameters.AddWithValue("@tamanhoArquivo", obj.TamanhoArquivo);
            cmd.Parameters.AddWithValue("@usuario_id", obj.Usuario_id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Arquivo obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_editarArquivo", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@endereco", obj.Endereco);
            cmd.Parameters.AddWithValue("@tamanhoArquivo", obj.TamanhoArquivo);

            cmd.ExecuteNonQuery();
        }
    }
}