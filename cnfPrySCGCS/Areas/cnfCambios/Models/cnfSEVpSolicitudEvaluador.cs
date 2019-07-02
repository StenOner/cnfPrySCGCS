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


    [Table("cnfSEVpSolicitudEvaluador")]
    public partial class cnfSEVpSolicitudEvaluador
    {
        [Key]
        public int SEVcodigo { get; set; }

        public int? SOLcodigo { get; set; }

        [Display(Name = "Evaluador")]
        public int? PMIcodigo { get; set; }

        public virtual cnfPMIpProyectoMiembro cnfPMIpProyectoMiembro { get; set; }

        public virtual cnfSOLpSolicitud cnfSOLpSolicitud { get; set; }

        public void mtdGuardar()
        {
            try
            {
                using (var db = new cnfModelo())
                {
                    if (this.SEVcodigo > 0)
                    {
                        db.Entry(this).State = EntityState.Modified;
                    }
                    else
                    {
                        db.Entry(this).State = EntityState.Added;
                    }
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

    }
}
