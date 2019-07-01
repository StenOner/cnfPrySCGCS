using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using cnfPrySCGCS.Models;
using cnfPrySCGCS.Filters;

namespace cnfPrySCGCS.Areas.cnfSeguridad.Controllers
{
    
    public class cnfClsSeguridadController : Controller
    {
        // GET: cnfSeguridad/cnfClsSeguridad
        [NoLogin]
        public ActionResult cnfFrmSeguridadVista()
        {
            return View();
        }

        private cnfUSUpUsuario PobjUsuario = new cnfUSUpUsuario();
        // GET: cnfSeguridad/cnfClsSeguridad

        //login
        public JsonResult mtdSeguridad(string Usuario, string Contraseña)
        {
            var rm = PobjUsuario.mtdSeguridad(Usuario, Contraseña);
            if (rm.response)
            {
                //rm.href = Url.Content("/Usuario");
                rm.href = Url.Content("/cnfMantenimiento/cnfClsUsuario/cnfFrmUsuarioVista");
            }
            return Json(rm);
        }
        public ActionResult mtdCerrarSesion()
        {
            SessionHelper.DestroyUserSession();
            return RedirectToAction("cnfFrmSeguridadVista", "cnfClsSeguridad", new { area = "cnfSeguridad" });

            
            //return Redirect("~/cnfFrmSeguridadVista");
        }
    }
}