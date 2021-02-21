using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnWebNam3.Models;

namespace DoAnWebNam3.Models
{
    public class ThoiTrangController : Controller
    {
        //
        // GET: /ThoiTrang/
        DAWEBTHOITRANGEntities db = new DAWEBTHOITRANGEntities();
        public ActionResult Index()
        {
            List<SanPham> ds = db.SanPhams.ToList();
            return View(ds);
        }
        public ActionResult Deatails(string msp)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(item => item.MaSP == msp);
            List<SanPham> ds_Loai = db.SanPhams.Where(s => s.MaLoai == sp.MaLoai).Take(8).ToList();
            ViewBag.Loai = ds_Loai;
            return View(sp);
        }
        public ActionResult KhoiTaoLayout()
        {
            GioHang gio = (GioHang)Session["gh"];

            //bổ sung
            KhachHang Khach = Session["kh"] as KhachHang;
            ViewBag.kh = Khach;
            //

            return PartialView(gio);
        }
        public ActionResult Search(FormCollection col)
        {
            string keyword = col["txtsearch"];
            List<SanPham> dssp = db.SanPhams.Where(s => s.TenSP.Contains(keyword)).ToList();
            ViewBag.tb = "Tìm Kiếm " + keyword.ToString();
            return View("Index", dssp);
        }
        public ActionResult ThoiTrangBG()
        {
            List<SanPham> spn = db.SanPhams.ToList();
            return View(spn);
        }
        public ActionResult ThoiTrangBT()
        {
            List<SanPham> spn = db.SanPhams.ToList();
            return View(spn);
        }
        public ActionResult ThoiTrangNam()
        {
            List<SanPham> spn = db.SanPhams.ToList();
            return View(spn);
        }
        public ActionResult ThoiTrangNu()
        {
            List<SanPham> spn = db.SanPhams.ToList();
            return View(spn);
        }
    }
}
