using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class Periodo
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

        public Periodo(int id, string descricao)
        {
            this.id = id;
            this.descricao = descricao;
        }
    }
}