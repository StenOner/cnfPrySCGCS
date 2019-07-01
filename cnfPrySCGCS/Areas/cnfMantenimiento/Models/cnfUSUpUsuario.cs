namespace cnfPrySCGCS.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    using System.Linq;
    using System.Data.Entity;

    using System.Data.Entity.Validation;
    using System.Web;
    using System.IO;

    [Table("cnfUSUpUsuario")]
    public partial class cnfUSUpUsuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public cnfUSUpUsuario()
        {
            cnfPMIpProyectoMiembro = new HashSet<cnfPMIpProyectoMiembro>();
            cnfPRYpProyecto = new HashSet<cnfPRYpProyecto>();
            cnfSOLpSolicitud = new HashSet<cnfSOLpSolicitud>();
        }

        [Key]
        public int USUcodigo { get; set; }

        [Display(Name = "Dni")]
        [StringLength(8)]
        public string USUdni { get; set; }

        [Display(Name = "Nombres")]
        [StringLength(250)]
        public string USUnombre { get; set; }

        [Display(Name = "Apellidos")]
        [StringLength(250)]
        public string USUapellido { get; set; }

        [Display(Name = "Correo Electronico")]
        [StringLength(250)]
        public string USUcorreo { get; set; }

        [Display(Name = "Telefono")]
        [StringLength(10)]
        public string USUtelefono { get; set; }

        [Display(Name = "Usuario")]
        [StringLength(8)]
        public string USUusuario { get; set; }

        [Display(Name = "Contraseña")]
        [StringLength(8)]
        public string USUcontrasena { get; set; }

        [Display(Name = "Nivel de Usuario")]
        [StringLength(20)]
        public string USUnivel { get; set; }

        [Display(Name = "Estado")]
        [StringLength(20)]
        public string USUestado { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<cnfPMIpProyectoMiembro> cnfPMIpProyectoMiembro { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<cnfPRYpProyecto> cnfPRYpProyecto { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<cnfSOLpSolicitud> cnfSOLpSolicitud { get; set; }

        /*----------------------------------------*/
        
        public List<cnfUSUpUsuario> mtdCargarDatos()
        {
            List<cnfUSUpUsuario> LlstLista = new List<cnfUSUpUsuario>();

            using (var LobjContexto = new cnfModelo())
            {
                var LobjQuery = LobjContexto.Database.SqlQuery<cnfUSUpUsuario>("exec usp_S_cnfUSUpUsuario_CargarDatos").ToList();
                LlstLista = LobjQuery;
            }

            return LlstLista;
        }

        //METODO BUSCAR

        public cnfUSUpUsuario mtdBuscar(int LintParametro)
        {
            cnfUSUpUsuario LobjUsuario = new cnfUSUpUsuario();

            using (var LobjContexto = new cnfModelo())
            {
                var LobjQuery = LobjContexto.Database.SqlQuery<cnfUSUpUsuario>("exec usp_S_cnfUSUpUsuario_Buscar " + LintParametro).Single();
                LobjUsuario = LobjQuery;
            }

            return LobjUsuario;
        }

        //METODO GUARDAR
        public string mtdGuardar(cnfUSUpUsuario LobjUsuario)
        {
            int LintMensajeRespuesta = -1;
            try
            {
                using (var LobjContexto = new cnfModelo())
                {

                    if (LobjUsuario.USUcodigo == 0)
                    {
                        LintMensajeRespuesta = LobjContexto.Database.ExecuteSqlCommand("exec usp_I_cnfUSUpUsuario_Guardar " + "'" + LobjUsuario.USUdni + "','" + LobjUsuario.USUnombre + "','" + LobjUsuario.USUapellido + "','" + LobjUsuario.USUcorreo + "','" + LobjUsuario.USUtelefono + "','" + LobjUsuario.USUusuario + "', '" + LobjUsuario.USUcontrasena + "', '" + LobjUsuario.USUnivel + "','" + LobjUsuario.USUestado + "';");
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
           
            return mtdRespuestaMensaje(LintMensajeRespuesta);
        }

        public string mtdModificar(cnfUSUpUsuario LobjUsuario)
        {
            int LintMensajeRespuesta = -1;
            try
            {
                using (var LobjContexto = new cnfModelo())
                {


                    if (LobjUsuario.USUcodigo != 0)
                    {
                        LintMensajeRespuesta = LobjContexto.Database.ExecuteSqlCommand("exec usp_U_cnfUSUpUsuario_Modificar " + "'" + LobjUsuario.USUcodigo + "','" + LobjUsuario.USUdni + "','" + LobjUsuario.USUnombre + "','" + LobjUsuario.USUapellido + "','" + LobjUsuario.USUcorreo + "','" + LobjUsuario.USUtelefono + "','" + LobjUsuario.USUusuario + "', '" + LobjUsuario.USUcontrasena + "', '" + LobjUsuario.USUnivel + "','" + LobjUsuario.USUestado + "';");
                    }
                }
            }
            catch (Exception)
            {

            }
            return mtdRespuestaMensaje(LintMensajeRespuesta);
        }

        //Obtener 
        public cnfUSUpUsuario mtdObtener(int id) //retorna un objeto
        {
            var usuario = new cnfUSUpUsuario();
            try
            {
                using (var db = new cnfModelo())
                {
                    usuario = db.cnfUSUpUsuario
                                .Where(x => x.USUcodigo == id)
                                .SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return usuario;
        }



        //Logear
        public ResponseModel mtdSeguridad(string user, string password)
        {
            var rm = new ResponseModel();
            try
            {
                using (var db = new cnfModelo())
                {
                    var usuario = db.cnfUSUpUsuario
                        .Where(x => x.USUusuario.Equals(user) &&
                                x.USUcontrasena.Equals(password)).SingleOrDefault();

                    if (usuario != null)
                    {
                        if (usuario.USUestado.Equals("Activo"))
                        {
                            SessionHelper.AddUserToSession(usuario.USUcodigo.ToString());
                            rm.SetResponse(true);
                        }
                        else
                        {
                            rm.SetResponse(false, "Usuario desactivado, comuniquese con el administrador.");
                        }
                    }
                    else
                    {
                        rm.SetResponse(false, "Usuario o Contraseña incorrectos.");
                    }
                }
            }
            catch (Exception)
            {

            }
            return rm;
        }

        public string mtdRespuestaMensaje(int LintMensajeRespuesta)
        {
            string LstrMensajeRespuesta = "";
            if (LintMensajeRespuesta > 0)
            {
                LstrMensajeRespuesta = "Correcto";
            }
            else
            {
                LstrMensajeRespuesta = "Incorrecto";
            }
            return LstrMensajeRespuesta;
        }

    }
}
