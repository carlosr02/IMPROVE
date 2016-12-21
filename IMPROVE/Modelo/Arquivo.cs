using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class Arquivo
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
        private string endereco;

        public string Endereco
        {
            get { return endereco; }
            set { endereco = value; }
        }
        private int tamanhoArquivo;

        public int TamanhoArquivo
        {
            get { return tamanhoArquivo; }
            set { tamanhoArquivo = value; }
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

        public Arquivo(int id, string descricao, string endereco, int tamanhoArquivo, DateTime horarioEnvio, DateTime horarioModificao, Guid usuario_id)
        {
            this.id = id;
            this.descricao = descricao;
            this.endereco = endereco;
            this.tamanhoArquivo = tamanhoArquivo;
            this.horarioEnvio = horarioEnvio;
            this.horarioModificao = horarioModificao;
            this.usuario_id = usuario_id;
        }
    }
}