using cnfPrySCGCS.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace cnfPrySCGCS.Areas.cnfProyecto.Controllers
{
    [Autenticado]
    public class cnfClsEntregaEntregableControllerController : Controller
    {
        // GET: cnfProyecto/cnfClsEntregaEntregableController
        public ActionResult cnfFrmEntregaEntregable()
        {
            return View();
        }
        public ActionResult cnfFrmEntregaRepositorio()
        {
            return View();
        }
    }
}