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
    public class DALUsuariosSala
    {
        private string connectionString = "";

        public DALUsuariosSala()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["2016TiiGrupo3ConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.UsuariosSala SelectById(int id)
        {
            Modelo.UsuariosSala aSala;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarSala", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            dr.Read();
            aSala = new Modelo.UsuariosSala(
                new Guid(dr[0].ToString()),
                Convert.ToInt32(dr[1])
            );

            dr.Close();
            conn.Close();

            return aSala;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.UsuariosSala obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_deletarSala", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@sala_id", obj.Sala_id);
            cmd.Parameters.AddWithValue("@usuario_id", obj.Usuario_id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.UsuariosSala obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_inserirSala", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@sala_id", obj.Sala_id);
            cmd.Parameters.AddWithValue("@usuario_id", obj.Usuario_id);

            cmd.ExecuteNonQuery();
        }
    }
}