using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class Evento
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
        private DateTime diaEvento;

        public DateTime DiaEvento
        {
            get { return diaEvento; }
            set { diaEvento = value; }
        }
        private DateTime horarioCadastro;

        public DateTime HorarioCadastro
        {
            get { return horarioCadastro; }
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

        public Evento(int id, string titulo, string descricao, DateTime diaEvento, DateTime horarioCadastro, DateTime horarioModificao, Guid usuario_id)
        {
            this.id = id;
            this.titulo = titulo;
            this.descricao = descricao;
            this.diaEvento = diaEvento;
            this.horarioCadastro = horarioCadastro;
            this.horarioModificao = horarioModificao;
            this.usuario_id = usuario_id;
        }
    }
}