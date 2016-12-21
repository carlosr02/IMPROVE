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
    public class DALMensagem
    {
        private string connectionString = "";

        public DALMensagem()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["2016TiiGrupo3ConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Mensagem> SelectAll(int sala_id)
        {
            Modelo.Mensagem aMensagem;
            List<Modelo.Mensagem> aListMensagens = new List<Modelo.Mensagem>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarMensagens", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@sala_id", sala_id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aMensagem = new Modelo.Mensagem(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToDateTime(dr[2]),
                        Convert.ToDateTime(dr[3]),
                        new Guid(dr[4].ToString()),
                        Convert.ToInt32(dr[5])
                    );
                    aListMensagens.Add(aMensagem);
                }
            }

            dr.Close();
            conn.Close();

            return aListMensagens;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Mensagem obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_deletarMensagem", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Mensagem obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_inserirMensagem", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@usuario_id", obj.Usuario_id);
            cmd.Parameters.AddWithValue("@sala_id", obj.Sala_id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Mensagem obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_editarMensagem", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);

            cmd.ExecuteNonQuery();
        }
    }
}