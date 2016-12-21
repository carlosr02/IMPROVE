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
    public class DALUsuario
    {
        private string connectionString = "";

        public DALUsuario()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["2016TiiGrupo3ConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Usuario SelectById(Guid id)
        {
            Modelo.Usuario aUsuario;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarUsuario", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            dr.Read();
            aUsuario = new Modelo.Usuario(
                new Guid(dr[0].ToString()),
                dr[1] as string,
                dr[2] as string,
                dr[3] as string,
                dr[4] as string,
                dr[5] as Nullable<DateTime>,
                dr[6] as string
            );

            dr.Close();
            conn.Close();

            return aUsuario;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Usuario obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_deletarUsuario", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Usuario obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_editarUsuario", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@email", obj.Email);
            cmd.Parameters.AddWithValue("@senha", obj.Senha);
            cmd.Parameters.AddWithValue("@nome", obj.Nome);
            cmd.Parameters.AddWithValue("@dataDeNascimento", obj.DataNascimento);
            cmd.Parameters.AddWithValue("@enderecoFoto", obj.EnderecoFoto);

            cmd.ExecuteNonQuery();
        }
    }
}