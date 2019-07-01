using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


using cnfPrySCGCS.Models;
using cnfPrySCGCS.Filters;


namespace cnfPrySCGCS.Areas.cnfProyecto.Controllers
{
    [Autenticado]
    public class cnfClsProyectoController : Controller
    {
        // GET: cnfProyecto/cnfClsProyecto
        cnfPRYpProyecto PobjProyecto = new cnfPRYpProyecto();

        //asd
        cnfUSUpUsuario PobjUsuario = new cnfUSUpUsuario();
        
        public ActionResult cnfFrmProyectoVista(int id = 0)
        {

            // var codigoUsuario = (int)Session["GintCodigoUsuario"];

            // usuario logeado
            var codigoUsuario = PobjUsuario.mtdObtener(SessionHelper.GetUser()).USUcodigo; 
            
            ViewBag.GobjListarProyecto = mtdCargarDatos(codigoUsuario);
            ViewBag.GobjListarMetodologia = mtdCargarComboMetodologia();

           
            return View(id == 0 ? new cnfPRYpProyecto()
                : mtdBuscar(id));
        }

        public ActionResult mtdGuardar(cnfPRYpProyecto PobjProyectoModelo)
        {
            bool LblnModificar = false;
            bool LblnGuardar = false;

            if (ModelState.IsValid)
            {
                if (PobjProyectoModelo.PRYcodigo == 0)
                {
                   PobjProyecto.mtdGuardar(PobjProyectoModelo);                  
                    LblnModificar = false;
                    LblnGuardar = true;
                }
                else
                {
                    PobjProyectoModelo.mtdModificar(PobjProyectoModelo);                   
                    LblnModificar = true;
                    LblnGuardar = false;
                }
            }
            
            return Redirect("~/cnfProyecto/cnfClsProyecto/cnfFrmProyectoVista");
        }

        public object mtdCargarComboMetodologia()
        {
            return PobjProyecto.mtdCargarComboMetodologia();
        }

        public object mtdCargarDatos(int usuarioId)
        {
            return PobjProyecto.mtdCargarDatos(usuarioId);
        }

        public object mtdBuscar(int LintCodigo)
        {
            return PobjProyecto.mtdBuscar(LintCodigo);
        }
    }
}