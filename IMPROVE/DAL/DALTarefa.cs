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
    public class DALTarefa
    {
        private string connectionString = "";

        public DALTarefa()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["2016TiiGrupo3ConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Tarefa> SelectAll(Guid usuario_id)
        {
            Modelo.Tarefa aTarefa;
            List<Modelo.Tarefa> aListTarefas = new List<Modelo.Tarefa>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarTarefas", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usuario_id", usuario_id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aTarefa = new Modelo.Tarefa(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToBoolean(dr[2]),
                        Convert.ToBoolean(dr[3]),
                        Convert.ToDateTime(dr[4]),
                        Convert.ToDateTime(dr[5]),
                        new Guid(dr[6].ToString())
                        );
                    aListTarefas.Add(aTarefa);
                }
            }

            dr.Close();
            conn.Close();

            return aListTarefas;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Tarefa SelectById(int id)
        {
            Modelo.Tarefa aTarefa;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarTarefa", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            dr.Read();
            aTarefa = new Modelo.Tarefa(
                Convert.ToInt32(dr[0]),
                dr[1] as string,
                Convert.ToBoolean(dr[2]),
                Convert.ToBoolean(dr[3]),
                Convert.ToDateTime(dr[4]),
                Convert.ToDateTime(dr[5]),
                new Guid(dr[6].ToString())
            );

            dr.Close();
            conn.Close();

            return aTarefa;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Tarefa obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_deletarTarefa", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Tarefa obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_inserirTarefa", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@prioritaria", obj.Prioritaria);
            cmd.Parameters.AddWithValue("@usuario_id", obj.Usuario_id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Tarefa obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_editarTarefa", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@cumprida", obj.Cumprida);
            cmd.Parameters.AddWithValue("@prioritaria", obj.Prioritaria);

            cmd.ExecuteNonQuery();
        }
    }
}