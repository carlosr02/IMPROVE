using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class Anotacao
    {
        private int id;

        public int Id
        {
            get { return id; }
        }
        private string titulo;

        public string Titulo
        {
            get { return titulo; }
            set { titulo = value; }
        }
        private string descricao;

        public string Descricao
        {
            get { return descricao; }
            set { descricao = value; }
        }
        private bool favorito;

        public bool Favorito
        {
            get { return favorito; }
            set { favorito = value; }
        }
        private DateTime horarioEnvio;

        public DateTime HorarioEnvio
        {
            get { return horarioEnvio; }
        }
        private DateTime horarioModificao;

        public DateTime HorarioModificao
        {
            get { return horarioModificao; }
            set { horarioModificao = value; }
        }
        private Guid usuario_id;

        public Guid Usuario_id
        {
            get { return usuario_id; }
        }

        public Anotacao(int id, string titulo, string descricao, bool favorito, DateTime horarioEnvio, DateTime horarioModificao, Guid usuario_id)
        {
            this.id = id;
            this.titulo = titulo;
            this.descricao = descricao;
            this.favorito = favorito;
            this.horarioEnvio = horarioEnvio;
            this.horarioModificao = horarioModificao;
            this.usuario_id = usuario_id;
        }
    }
}