using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class Mensagem
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
        private int sala_id;

        public int Sala_id
        {
            get { return sala_id; }
        }

        public Mensagem(int id, string descricao, DateTime horarioEnvio, DateTime horarioModificao, Guid usuario_id, int sala_id)
        {
            this.id = id;
            this.descricao = descricao;
            this.horarioEnvio = horarioEnvio;
            this.horarioModificao = horarioModificao;
            this.usuario_id = usuario_id;
            this.sala_id = sala_id;
        }
    }
}