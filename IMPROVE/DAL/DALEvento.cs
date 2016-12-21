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
    public class DALEvento
    {
        private string connectionString = "";

        public DALEvento()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["2016TiiGrupo3ConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Evento> SelectAll(Guid usuario_id)
        {
            Modelo.Evento aEvento;
            List<Modelo.Evento> aListEventos = new List<Modelo.Evento>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarEventos", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usuario_id", usuario_id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aEvento = new Modelo.Evento(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        dr[2] as string,
                        Convert.ToDateTime(dr[3]),
                        Convert.ToDateTime(dr[4]),
                        Convert.ToDateTime(dr[5]),
                        new Guid(dr[6].ToString())
                        );
                    aListEventos.Add(aEvento);
                }
            }

            dr.Close();
            conn.Close();

            return aListEventos;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Evento SelectById(int id)
        {
            Modelo.Evento aEvento;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarEvento", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            dr.Read();
            aEvento = new Modelo.Evento(
                Convert.ToInt32(dr[0]),
                dr[1] as string,
                dr[2] as string,
                Convert.ToDateTime(dr[3]),
                Convert.ToDateTime(dr[4]),
                Convert.ToDateTime(dr[5]),
                new Guid(dr[6].ToString())
            );

            dr.Close();
            conn.Close();

            return aEvento;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Evento> SelectByDay(DateTime diaEvento, Guid usuario_id)
        {
            Modelo.Evento aEvento;
            List<Modelo.Evento> aListEventos = new List<Modelo.Evento>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarEventosDia", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@diaEvento", diaEvento);
            cmd.Parameters.AddWithValue("@usuario_id", usuario_id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aEvento = new Modelo.Evento(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        dr[2] as string,
                        Convert.ToDateTime(dr[3]),
                        Convert.ToDateTime(dr[4]),
                        Convert.ToDateTime(dr[5]),
                        new Guid(dr[6].ToString())
                        );
                    aListEventos.Add(aEvento);
                }
            }

            dr.Close();
            conn.Close();

            return aListEventos;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Evento obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_deletarEvento", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Evento obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_inserirEvento", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@titulo", obj.Titulo);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@diaEvento", obj.DiaEvento);
            cmd.Parameters.AddWithValue("@usuario_id", obj.Usuario_id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Evento obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_editarEvento", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@titulo", obj.Titulo);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@diaEvento", obj.DiaEvento);

            cmd.ExecuteNonQuery();
        }
    }
}