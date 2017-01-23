using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class Disciplina
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
        private double media;

        public double Media
        {
            get { return media; }
            set { media = value; }
        }
        private int periodo_id;

        public int Periodo_id
        {
            get { return periodo_id; }
            set { periodo_id = value; }
        }
        private int boletim_id;

        public int Boletim_id
        {
            get { return boletim_id; }
            set { boletim_id = value; }
        }

        public Disciplina(int id, string descricao, double media, int periodo_id, int boletim_id)
        {
            this.id = id;
            this.descricao = descricao;
            this.media = media;
            this.periodo_id = periodo_id;
            this.boletim_id = boletim_id;
        }
    }
}