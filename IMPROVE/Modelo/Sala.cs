using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class Sala
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
        private string senha;

        public string Senha
        {
            get { return senha; }
            set { senha = value; }
        }

        public Sala(int id, string descricao, string senha)
        {
            this.id = id;
            this.descricao = descricao;
            this.senha = senha;
        }
    }
}