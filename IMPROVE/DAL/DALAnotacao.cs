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
    public class DALAnotacao
    {
        private string connectionString = "";

        public DALAnotacao()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["2016TiiGrupo3ConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Anotacao> SelectAll(Guid usuario_id)
        {
            Modelo.Anotacao aAnotacao;
            List<Modelo.Anotacao> aListAnotacoes = new List<Modelo.Anotacao>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarAnotacoes", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usuario_id", usuario_id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aAnotacao = new Modelo.Anotacao(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        dr[2] as string,
                        Convert.ToBoolean(dr[3]),
                        Convert.ToDateTime(dr[4]),
                        Convert.ToDateTime(dr[5]),
                        new Guid(dr[6].ToString())
                        );
                    aListAnotacoes.Add(aAnotacao);
                }
            }

            dr.Close();
            conn.Close();

            return aListAnotacoes;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Anotacao SelectById(int id)
        {
            Modelo.Anotacao aAnotacao;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarAnotacao", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            dr.Read();
            aAnotacao = new Modelo.Anotacao(
                Convert.ToInt32(dr[0]),
                dr[1] as string,
                dr[2] as string,
                Convert.ToBoolean(dr[3]),
                Convert.ToDateTime(dr[4]),
                Convert.ToDateTime(dr[5]),
                new Guid(dr[6].ToString())
            );

            dr.Close();
            conn.Close();

            return aAnotacao;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Anotacao obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_deletarAnotacao", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Anotacao obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_inserirAnotacao", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@titulo", obj.Titulo);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@favorito", obj.Favorito);
            cmd.Parameters.AddWithValue("@usuario_id", obj.Usuario_id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Anotacao obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_editarAnotacao", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@titulo", obj.Titulo);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@favorito", obj.Favorito);

            cmd.ExecuteNonQuery();
        }
    }
}