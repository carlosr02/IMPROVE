using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class Nota
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private double valor;

        public double Valor
        {
            get { return valor; }
            set { valor = value; }
        }
        private int peso;

        public int Peso
        {
            get { return peso; }
            set { peso = value; }
        }
        private int disciplina_id;

        public int Disciplina_id
        {
            get { return disciplina_id; }
            set { disciplina_id = value; }
        }

        public Nota(int id, double valor, int peso, int disciplina_id)
        {
            this.id = id;
            this.valor = valor;
            this.peso = peso;
            this.disciplina_id = disciplina_id;
        }
    }
}