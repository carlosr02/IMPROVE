using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class Usuario
    {
        private Guid id;

        public Guid Id
        {
            get { return id; }
        }
        private string usuario;

        public string Usuario1
        {
            get { return usuario; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string senha;

        public string Senha
        {
            get { return senha; }
            set { senha = value; }
        }
        private string nome;

        public string Nome
        {
            get { return nome; }
            set { nome = value; }
        }
        private Nullable<DateTime> dataNascimento;

        public Nullable<DateTime> DataNascimento
        {
            get { return dataNascimento; }
            set { dataNascimento = value; }
        }
        private string enderecoFoto;

        public string EnderecoFoto
        {
            get { return enderecoFoto; }
            set { enderecoFoto = value; }
        }

        public Usuario(Guid id, string usuario, string email, string senha, string nome, Nullable<DateTime> dataNascimento, string enderecoFoto)
        {
            this.id = id;
            this.usuario = usuario;
            this.email = email;
            this.senha = senha;
            this.nome = nome;
            this.dataNascimento = dataNascimento;
            this.enderecoFoto = enderecoFoto;
        }
    }
}