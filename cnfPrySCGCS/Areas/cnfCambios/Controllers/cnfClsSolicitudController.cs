using cnfPrySCGCS.Filters;
using cnfPrySCGCS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace cnfPrySCGCS.Areas.cnfCambios.Controllers
{
    [Autenticado]
    public class cnfClsSolicitudController : Controller
    {
        private readonly cnfModelo _db = new cnfModelo();

        private cnfSOLpSolicitud PobjSolicitud = new cnfSOLpSolicitud();

        private cnfPMIpProyectoMiembro PobjProyectoMiembro = new cnfPMIpProyectoMiembro();


        // GET: cnfCambios/cnfClsSolicitud
        public ActionResult cnfFrmSolicitudVista(int id=0)
        {
            cnfSOLpSolicitud solicitud = new cnfSOLpSolicitud();
            solicitud = _db.cnfSOLpSolicitud.Where(x => x.SOLcodigo == id).SingleOrDefault();
            var codigoUsuario = SessionHelper.GetUser();
            var proyectos = _db.cnfPRYpProyecto.Where(x => x.USUcodigo == codigoUsuario).ToList();
            var ecs = new List<cnfPECpProyectoElementoConfiguracion>();
            var entregables = new List<cnfMNTpMetodologiaEntregable>();
            foreach (var proyecto in proyectos)
            {
                var tempECs = new List<cnfPECpProyectoElementoConfiguracion>();
                tempECs.AddRange(_db.cnfPECpProyectoElementoConfiguracion.Include("cnfPRYpProyecto").Where(x => x.PRYcodigo == proyecto.PRYcodigo).ToList());
                foreach (var ec in tempECs)
                {
                    entregables.AddRange(_db.cnfMNTpMetodologiaEntregable.Include("cnfPECpProyectoElementoConfiguracion").Where(x => x.MNTcodigo == ec.MNTcodigo).ToList());
                }
                ecs.AddRange(tempECs);
            }


            //ViewBag.PRYcodigo = new SelectList(proyectos, "PRYcodigo", "PRYnombre");
            ViewBag.Proyectos = proyectos;
            ViewBag.ECS = ecs;
            ViewBag.Entregables = entregables;
            ViewBag.UsuarioNombre = _db.cnfUSUpUsuario.FirstOrDefault(x => x.USUcodigo == codigoUsuario)?.USUnombre + " " +
                                    _db.cnfUSUpUsuario.FirstOrDefault(x => x.USUcodigo == codigoUsuario)?.USUapellido;
            ViewBag.Solicitudes = _db.cnfSOLpSolicitud.Include("cnfPRYpProyecto").Include("cnfUSUpUsuario").ToList();

            return View("cnfFrmSolicitudVista", solicitud);
        }
        public ActionResult Guardar(cnfSOLpSolicitud solicitud)
        {
            var ec = _db.cnfPECpProyectoElementoConfiguracion.Where(x => x.PECcodigo == solicitud.PECcodigo).ToList();
            solicitud.MNTcodigo = ec[0].MNTcodigo;
            //var codigoUsuario = SessionHelper.GetUser();
            //solicitud.SOLfecha_Registro = DateTime.Now;
            //ModelState.Remove("SOLcodigo");

            try
            {
                if (solicitud.SOLcodigo > 0)
                {
                    _db.Entry(solicitud).State = EntityState.Modified;
                }
                else
                {
                    _db.Entry(solicitud).State = EntityState.Added;
                }
                _db.SaveChanges();
                //using (var bd = new cnfModelo())
                //{
                //    if (this.SOLcodigo > 0)
                //    {
                //        bd.Entry(this).State = EntityState.Modified;
                //    }
                //    else
                //    {
                //        bd.Entry(this).State = EntityState.Added;
                //    }
                //    bd.SaveChanges();
                //}
                //if (ModelState.IsValid)
                //{
                //    _db.cnfSOLpSolicitud.Add(solicitud);
                //    _db.SaveChanges();
                //    return View("cnfFrmSolicitudVista");
                //}
            }
            catch (Exception)
            {
                
            }

            return Redirect("cnfFrmSolicitudVista");

            //var proyectos = _db.cnfPRYpProyecto.Where(x => x.USUcodigo == codigoUsuario).ToList();

            ////ViewBag.PRYcodigo = new SelectList(proyectos, "PRYcodigo", "PRYnombre");
            //ViewBag.UsuarioNombre = _db.cnfUSUpUsuario.FirstOrDefault(x => x.USUcodigo == codigoUsuario)?.USUnombre + " " +
            //                        _db.cnfUSUpUsuario.FirstOrDefault(x => x.USUcodigo == codigoUsuario)?.USUapellido;
            //ViewBag.Solicitudes = _db.cnfSOLpSolicitud.Include("cnfPRYpProyecto").Include("cnfUSUpUsuario").ToList();

            //return View("cnfFrmSolicitudVista", solicitud);
        }

        public ActionResult EvaluarSolicitud(int id) // id solicitud
        {
            return View(PobjSolicitud.obtenterSolicitud(id));
        }

        public ActionResult cnfFrmVerSolicitudesEvaluar()
        {
            cnfPMIpProyectoMiembro objMiembroProyecto = PobjProyectoMiembro.mtdObtenerMiembro(SessionHelper.GetUser());

            return View(PobjSolicitud.mtdObtenterSolicitudEvaluar(objMiembroProyecto.PMIcodigo));
        }


        public ActionResult cnfFrmAsignarEvaluador(int id) //SOLcodigo
        {
            cnfSEVpSolicitudEvaluador objSolicitudEvaluador = new cnfSEVpSolicitudEvaluador();
            cnfSOLpSolicitud LobjSolicitud = PobjSolicitud.obtenterSolicitud(id);

            objSolicitudEvaluador.SOLcodigo = id;

            // Listamos Miembros del proyecto de la solicitud y la solicitud para ver su detalle
            ViewBag.MiembrosProyecto = PobjProyectoMiembro.mtdCargarMiembrosProyecto((int)LobjSolicitud.PRYcodigo);
            ViewBag.SolicitudVer = LobjSolicitud;

            return View(objSolicitudEvaluador);
        }

        public ActionResult GuardarEvaluador(cnfSEVpSolicitudEvaluador xLobjEvaluador)
        {
            if (ModelState.IsValid)
            {
                xLobjEvaluador.mtdGuardar();
            }
            else
            {
                return View("cnfFrmAsignarEvaluador", xLobjEvaluador);
            }
            return Redirect("~/cnfCambios/cnfClsSolicitud/cnfFrmSolicitudVista");
        }

        [HttpGet]
        public JsonResult CargarMetodologiaFase(string term, int pryCod)
        {
            if (term.Equals(" "))
            {
                var userList =
                    _db.cnfMEFpMetodologiaFase
                        .Join(
                            _db.cnfPRYpProyecto,
                            f => f.MTDcodigo,
                            p => p.MTDcodigo,
                            (f, p) => new { id = f.MEFcodigo, nombre = f.MEFnombre, pry = p.PRYcodigo })
                        .Where(j => j.pry == pryCod)
                        .Take(10)
                        .ToList();
                return Json(userList, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var userList =
                    _db.cnfMEFpMetodologiaFase
                        .Join(
                            _db.cnfPRYpProyecto,
                            f => f.MTDcodigo,
                            p => p.MTDcodigo,
                            (f, p) => new { id = f.MEFcodigo, nombre = f.MEFnombre, pry = p.PRYcodigo })
                        .Where(j => j.nombre.ToLower().StartsWith(term.ToLower()) && j.pry == pryCod)
                        .Take(10)
                        .ToList();

                return Json(userList, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public JsonResult CargarComboLineaBase(int mefCod)
        {
            var userList =
                _db.cnfPLBpProyectoLineaBase
                    .Where(x => x.PLBestado.Equals("Activo") && x.MEFcodigo == mefCod)
                    .Select(x => new
                    {
                        id = x.PLBcodigo,
                        nombre = x.PLBfecha_LineaBase.ToString()
                    })
                    .Take(10)
                    .ToList();

            return Json(userList, JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        public JsonResult CargarComboElementoConfiguracion(string term, int pryCod, int mefCod, int mntCod)
        {
            if (term.Equals(" "))
            {
                var userList = _db.cnfPECpProyectoElementoConfiguracion
                    .Where(x => x.MEFcodigo == mefCod &&
                                x.MNTcodigo == mntCod &&
                                x.PRYcodigo == pryCod)
                    .Select(x => new
                    {
                        id = x.PECcodigo,
                        nombre = x.PECnombre
                    }).Take(10).ToList();
                return Json(userList, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var userList = _db.cnfPECpProyectoElementoConfiguracion
                    .Where(x => x.PECnombre.ToLower().StartsWith(term.ToLower()) &&
                                x.MEFcodigo == mefCod &&
                                x.MNTcodigo == mntCod &&
                                x.PRYcodigo == pryCod)
                    .Select(x => new
                    {
                        id = x.PECcodigo,
                        nombre = x.PECnombre
                    }).Take(10).ToList();
                return Json(userList, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public JsonResult CargarComboEntregable(string term, int mefCod)
        {
            if (term.Equals(" "))
            {
                var userList = _db.cnfMNTpMetodologiaEntregable
                    .Where(x => x.MEFcodigo == mefCod &&
                                x.MNTestado.Equals("Activo"))
                    .Select(x => new
                    {
                        id = x.MNTcodigo,
                        nombre = x.MNTnombre
                    }).Take(10).ToList();
                return Json(userList, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var userList = _db.cnfMNTpMetodologiaEntregable
                    .Where(x => x.MNTnombre.ToLower().StartsWith(term.ToLower()) &&
                                x.MEFcodigo == mefCod &&
                                x.MNTestado.Equals("Activo"))
                    .Select(x => new
                    {
                        id = x.MNTcodigo,
                        nombre = x.MNTnombre
                    }).Take(10).ToList();
                return Json(userList, JsonRequestBehavior.AllowGet);
            }
        }
    }
}