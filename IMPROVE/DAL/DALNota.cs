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
    public class DALNota
    {
        private string connectionString = "";

        public DALNota()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["2016TiiGrupo3ConnectionString"].ConnectionString;
        }

        /*[DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Nota> SelectAll(Guid boletim_id)
        {
            Modelo.Nota aNota;
            List<Modelo.Nota> aListNotas = new List<Modelo.Nota>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarNotas", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@boletim_id", boletim_id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aNota = new Modelo.Nota(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToDouble(dr[2]),
                        Convert.ToInt32(dr[3]),
                        Convert.ToInt32(dr[4])
                        );
                    aListNotas.Add(aNota);
                }
            }

            dr.Close();
            conn.Close();

            return aListNotas;
        }*/

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Nota SelectById(int id)
        {
            Modelo.Nota aNota;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarNota", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            dr.Read();
            aNota = new Modelo.Nota(
                Convert.ToInt32(dr[0]),
                dr[1] as string,
                Convert.ToDouble(dr[2]),
                Convert.ToInt32(dr[3]),
                Convert.ToInt32(dr[4])
            );

            dr.Close();
            conn.Close();

            return aNota;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Nota obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_deletarNota", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Nota obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_inserirNota", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@extensao", obj.Media);
            cmd.Parameters.AddWithValue("@endereco", obj.Periodo_id);
            cmd.Parameters.AddWithValue("@tamanhoNota", obj.Boletim_id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Nota obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_editarNota", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@media", obj.Media);

            cmd.ExecuteNonQuery();
        }
    }
}