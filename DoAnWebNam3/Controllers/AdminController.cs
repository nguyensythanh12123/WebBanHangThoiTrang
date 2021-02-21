using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnWebNam3.Models;

namespace DoAnNam3.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        DAWEBTHOITRANGEntities db = new DAWEBTHOITRANGEntities();
        
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ShowSanPham()
        {
            ViewBag.tbsl = db.SanPhams.ToList().Count();
            return View(db.SanPhams.ToList());
        }
        public ActionResult ShowLoaiSP()
        {
            var ListLoai = db.LoaiSPs.ToList();
            return View(ListLoai);
        }
        public ActionResult HienThiTheoLoai(string ml)
        {
            List<SanPham> sp = db.SanPhams.Where(item => item.MaLoai == ml).ToList();
            ViewBag.tbtl = sp.Count();
            return View("ShowSanPham", sp);
        }
        public ActionResult ShowNCC()
        {
            var ListNCC = db.NhaCungCaps.ToList();
            return View(ListNCC);
        }
        public ActionResult HienThiTheoNCC(string mncc)
        {
            List<SanPham> sp = db.SanPhams.Where(item => item.MaNCC == mncc).ToList();
            return View("ShowSanPham", sp);
        }
        public ActionResult CreateProduct()
        {
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps, "MaNCC", "TenNCC");
            ViewBag.MaLoai = new SelectList(db.LoaiSPs, "MaLoai", "TenLoai");
            ViewBag.Size = true;
            return View();
        }
        [HttpPost]
        public ActionResult CreateProduct(SanPham sp)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.SanPhams.Add(sp);
                    db.SaveChanges();
                    return RedirectToAction("ShowSanPham", "Admin");
                }
                catch
                {
                    ViewBag.Loi = "Đã tồn tại mã này";
                }
            }
            return View(sp);
        }
        public ActionResult Details(string msp)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(item => item.MaSP == msp);
            return View(sp);
        }

        public ActionResult UpdateProduct(string msp)
        {
            SanPham sp = db.SanPhams.Single(d => d.MaSP == msp);
            if (sp == null)
            {
                return HttpNotFound();
            }
            return View(sp);
        }
        [HttpPost]
        public ActionResult UpdateProduct(SanPham sp)
        {
            if (ModelState.IsValid)
            {
                db.SanPhams.Attach(sp);
                db.Entry(sp).State = System.Data.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ShowSanPham", "Admin");
            }
            return View(sp);
        }

        public ActionResult DeleteProduct(string msp)
        {
            SanPham sp = db.SanPhams.Single(d => d.MaSP == msp);
            if (sp == null)
                return HttpNotFound();
            return View(sp);
        }
        [HttpPost, ActionName("DeleteProduct")]
        public ActionResult DeleteProductConfirm(string msp)
        {
            SanPham sp = db.SanPhams.Single(d => d.MaSP == msp);
            if (sp == null)
                return HttpNotFound();
            db.Entry(sp).State = System.Data.EntityState.Deleted;
            db.SaveChanges();
            return RedirectToAction("ShowSanPham", "Admin");
        }
        public ActionResult ShowKhachHang()
        {
            List<KhachHang> kh = db.KhachHangs.ToList();
            ViewBag.tb = kh.Count();
            return View(kh);
        }
        public ActionResult ShowHoaDon()
        {
            List<HoaDon> dshd = db.HoaDons.ToList();
            ViewBag.tb = db.ChiTietHDs.ToList().Sum(m=>m.SoLuong*m.SanPham.GiamGia);
            return View(dshd);
        }
    }

}


