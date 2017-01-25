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
    public class DALDisciplina
    {
        private string connectionString = "";

        public DALDisciplina()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["2016TiiGrupo3ConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Disciplina> SelectAll(Guid boletim_id)
        {
            Modelo.Disciplina aDisciplina;
            List<Modelo.Disciplina> aListDisciplinas = new List<Modelo.Disciplina>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarDisciplinas", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@boletim_id", boletim_id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aDisciplina = new Modelo.Disciplina(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToDouble(dr[2]),
                        Convert.ToInt32(dr[3]),
                        Convert.ToInt32(dr[4])
                        );
                    aListDisciplinas.Add(aDisciplina);
                }
            }

            dr.Close();
            conn.Close();

            return aListDisciplinas;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Disciplina SelectById(int id)
        {
            Modelo.Disciplina aDisciplina;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_listarDisciplina", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            dr.Read();
            aDisciplina = new Modelo.Disciplina(
                Convert.ToInt32(dr[0]),
                dr[1] as string,
                Convert.ToDouble(dr[2]),
                Convert.ToInt32(dr[3]),
                Convert.ToInt32(dr[4])
            );

            dr.Close();
            conn.Close();

            return aDisciplina;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Disciplina obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_deletarDisciplina", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Disciplina obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_inserirDisciplina", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@extensao", obj.Media);
            cmd.Parameters.AddWithValue("@endereco", obj.Periodo_id);
            cmd.Parameters.AddWithValue("@tamanhoDisciplina", obj.Boletim_id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Disciplina obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("sp_editarDisciplina", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@media", obj.Media);

            cmd.ExecuteNonQuery();
        }
    }
}