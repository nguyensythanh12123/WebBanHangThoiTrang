using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnWebNam3.Models;
using Newtonsoft.Json;

namespace DoAnWebNam3.Controllers
{
    public class PhanTrangAJAXController : Controller
    {
        //
        // GET: /PhanTrangAJAX/
        DAWEBTHOITRANGEntities data = new DAWEBTHOITRANGEntities();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LoadSanPham()
        {
            List<SanPham> ds = data.SanPhams.ToList();
            return PartialView(ds);
        }
        [HttpPost]
        public JsonResult Add(SanPham f)
        {
            int kq = 1;
            try
            {
                data.SanPhams.Add(f);
                data.SaveChanges();
            }
            catch
            {
                kq = 0;
            }
            return Json(kq, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetbyID(string MaSP)
        {
            SanPham f = data.SanPhams.FirstOrDefault(x => x.MaSP == MaSP);
            return Json(f, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Update(SanPham f)
        {
            int kq = 1;
            try
            {
                SanPham sp = data.SanPhams.FirstOrDefault(m => m.MaSP == f.MaSP);
                sp.MaSP = f.MaSP;
                sp.TenSP = f.TenSP;
                sp.GiaBan = f.GiaBan;
                sp.GiamGia = f.GiamGia;
                sp.MoTa = f.MoTa;
                sp.MaNCC = f.MaNCC;
                sp.MaLoai = f.MaLoai;
                sp.Anh = f.Anh;
                sp.AnhCT = f.AnhCT;
                sp.Size = f.Size;

                UpdateModel(sp) ;
                data.SaveChanges();
            }
            catch
            {
                kq = 0;
            }
            return Json(kq, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Delete(string MaSP)
        {
            SanPham sp = data.SanPhams.Single(d => d.MaSP == MaSP);
            data.Entry(sp).State = System.Data.EntityState.Deleted;
            data.SaveChanges();
            return Json(data.SanPhams.ToList(), JsonRequestBehavior.AllowGet);
            
        }
    }
}
