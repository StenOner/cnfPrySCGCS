﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using cnfPrySCGCS.Models;
using cnfPrySCGCS.Filters;

namespace cnfPrySCGCS.Areas.cnfMantenimiento.Controllers
{
    [Autenticado]
    public class cnfClsMetodologiaController : Controller
    {
        private cnfMTDpMetodologia PobjMetodologia = new cnfMTDpMetodologia();
        // GET: cnfClsMetodologia
        public ActionResult cnfFrmMetodologiaVista(int id = 0)
        {
            try
            {
                if (ViewBag.GblnMensaje == null)
                {
                    ViewBag.GblnMensaje = Convert.ToBoolean(Session["GblnMensaje"].ToString());
                    ViewBag.GstrMensajeRespuesta = Convert.ToString(Session["GstrMensajeRespuesta"].ToString());
                }
            }
            catch
            {

            }
            //Listar Metodologias Registradas en la BD
            ViewBag.GobjListarMetodologia = mtdCargarDatos();

            Session["GblnMensaje"] = false;
            Session["GstrMensajeRespuesta"] = "";

            //Si el id es 0 se envia un modelo vacio, de lo contrario se carga los datos de la metodologia
            return View(id == 0 ? new cnfMTDpMetodologia() : mtdBuscar(id));
        }

        public object mtdBuscar(int LintCodigo)
        {
            cnfMTDpMetodologia LobjMetodologia = new cnfMTDpMetodologia();
            return PobjMetodologia.mtdBuscar(LintCodigo);
        }

        public object mtdCargarDatos()
        {
            return PobjMetodologia.mtdCargarDatos();
        }

        public ActionResult mtdGuardar(cnfMTDpMetodologia PobjMetodologiaModelo)
        {
            string LstrMensajeRespuesta = "";

            if (ModelState.IsValid)
            {
                //a modificar
                if (PobjMetodologiaModelo.MTDcodigo == 0)
                {
                    LstrMensajeRespuesta = PobjMetodologiaModelo.mtdGuardar(PobjMetodologiaModelo);
                    mtdRespuestaMensaje(LstrMensajeRespuesta);
                }
                else
                {
                    LstrMensajeRespuesta = mtdModificar(PobjMetodologiaModelo);
                    mtdRespuestaMensaje(LstrMensajeRespuesta);
                }
            }
            else
            {
                return View("~/cnfMantenimiento/cnfClsMetodologia/cnfFrmMetodologiaVista.cshtml", PobjMetodologia);
            }

            return Redirect("~/cnfMantenimiento/cnfClsMetodologia/cnfFrmMetodologiaVista");
        }

        public string mtdModificar(cnfMTDpMetodologia PobjMetodologiaModelo)
        {
            string LstrMensajeRespuesta = "";
            LstrMensajeRespuesta = PobjMetodologiaModelo.mtdModificar(PobjMetodologiaModelo);
            return LstrMensajeRespuesta;
        }

        public void mtdRespuestaMensaje(string LstrMensajeRespuesta)
        {
            if (LstrMensajeRespuesta.Equals("Correcto"))
            {
                Session["GblnMensaje"] = true;
                Session["GstrMensajeRespuesta"] = "La Operación se Realizó Correctamente";
            }
            else
            {
                Session["GblnMensaje"] = true;
                Session["GstrMensajeRespuesta"] = "Ocurrió un Fallo en la Operación";
            }
        }
    }
}