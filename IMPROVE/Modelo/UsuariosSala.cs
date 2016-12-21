using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMPROVE.Modelo
{
    public class UsuariosSala
    {
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

        public UsuariosSala(Guid usuario_id, int sala_id)
        {
            this.usuario_id = usuario_id;
            this.sala_id = sala_id;
        }
    }
}