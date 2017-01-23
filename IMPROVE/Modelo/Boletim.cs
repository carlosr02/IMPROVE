using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class Boletim
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private string descricao;

        public string Descricao
        {
            get { return descricao; }
            set { descricao = value; }
        }
        private Guid usuario_id;

        public Guid Usuario_id
        {
            get { return usuario_id; }
            set { usuario_id = value; }
        }

        public Boletim(int id, string descricao, Guid usuario_id)
        {
            this.id = id;
            this.descricao = descricao;
            this.usuario_id = usuario_id;
        }
    }
}