using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class Tarefa
    {
        private int id;

        public int Id
        {
            get { return id; }
        }
        private string descricao;

        public string Descricao
        {
            get { return descricao; }
            set { descricao = value; }
        }
        private bool cumprida;

        public bool Cumprida
        {
            get { return cumprida; }
            set { cumprida = value; }
        }
        private bool prioritaria;

        public bool Prioritaria
        {
            get { return prioritaria; }
            set { prioritaria = value; }
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

        public Tarefa(int id, string descricao, bool cumprida, bool prioritaria, DateTime horarioEnvio, DateTime horarioModificao, Guid usuario_id)
        {
            this.id = id;
            this.descricao = descricao;
            this.cumprida = cumprida;
            this.prioritaria = prioritaria;
            this.horarioEnvio = horarioEnvio;
            this.horarioModificao = horarioModificao;
            this.usuario_id = usuario_id;
        }
    }
}