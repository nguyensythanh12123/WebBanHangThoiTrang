using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnWebNam3.Models;

namespace DoAnWebNam3.Controllers
{
    public class DatHangController : Controller
    {
        //
        // GET: /DatHang/
        DAWEBTHOITRANGEntities db = new DAWEBTHOITRANGEntities();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GioHangTrong()
        {
            return View();
        }
        public ActionResult ThemMatHang(string msp)
        {
            GioHang gio = (GioHang)Session["gh"];
            if (gio == null)
                gio = new GioHang();
            int kq = gio.Them(msp);
            Session["gh"] = gio;
            return RedirectToAction("Index", "ThoiTrang");
        }
        [HttpGet]
        public ActionResult XemGioHang()
        {
            GioHang gio = (GioHang)Session["gh"];
            //KhachHang khach = Session["kh"] as KhachHang;
            //if (khach == null)
            //{
            //    return RedirectToAction("DangNhap", "KhachHang");
            //}
            if (gio != null)
            {
                gio = Session["gh"] as GioHang;
                //ViewBag.kh = khach;
                ViewBag.tongsl = gio.tongSLHang().ToString();
                ViewBag.tongthanhtien = gio.tongThanhTien().ToString();
                return View(gio);
            }          
            return RedirectToAction("GioHangTrong", "DatHang");
        }
        public ActionResult XoaGioHang(string msp)
        {
            GioHang gio = (GioHang)Session["gh"];
            CartItem sp = gio.dssp.Single(m => m.iMaSP == msp);
            if (sp!=null)
            {
                gio.dssp.RemoveAll(m => m.iMaSP == msp);
                return RedirectToAction("XemGioHang", "DatHang");
            }
            else if (gio.dssp.Count == 0)
            {
                return RedirectToAction("GioHangTrong", "DatHang");
            }
            return RedirectToAction("XemGioHang", "DatHang");
        }
        public ActionResult UpdateGioHang(string msp, FormCollection f)
        {
            GioHang gio = (GioHang)Session["gh"];
            CartItem sp = gio.dssp.Single(m => m.iMaSP == msp);
            if (sp != null)
            {
                sp.isoluong=int.Parse(f["txtSoLuong"].ToString());
            }
            if (gio.dssp.Count == 0)
            {
                return RedirectToAction("GioHangTrong", "DatHang");
            }
            return RedirectToAction("XemGioHang", "DatHang");
        }
        public ActionResult XoaGioHangAll()
        {
            GioHang gio = (GioHang)Session["gh"];
            gio.dssp.Clear();
            return RedirectToAction("Index", "ThoiTrang");
        }
        public ActionResult kiemTraDH()
        {
            KhachHang khach = Session["kh"] as KhachHang;
            if (khach == null)
            {
                return RedirectToAction("DangNhap", "KhachHang");
            }
            GioHang gio = Session["gh"] as GioHang;
            ViewBag.k = khach;
            ViewBag.tsl = gio.tongSLHang();
            ViewBag.ttt = gio.tongThanhTien();
            return View(gio);
        }
        public ActionResult ChiTietGiaoDich()
        {
            KhachHang khach = Session["kh"] as KhachHang;
            if (khach == null)
            {
                return RedirectToAction("DangNhap", "KhachHang");
            }
            List<HoaDon> dshd = db.HoaDons.Where(m => m.MaKH == khach.MaKH).ToList();
            return View(dshd);
        }
        public ActionResult ChitietHD(int mahd)
        {
            List<ChiTietHD> dshd = db.ChiTietHDs.Where(m => m.MaHD == mahd).ToList();
            return View(dshd);
        }
        [HttpPost]
        public ActionResult XacNhanDonHang(FormCollection col)
        {
            KhachHang khach = Session["kh"] as KhachHang;
            GioHang gio = Session["gh"] as GioHang;
            string ghiChu = col["txtGhiChu"];
            //lưu thông tin 1 dòng vào hóa đơn
            HoaDon dh = new HoaDon();           
            dh.MaKH = khach.MaKH;
            dh.NgayLap = DateTime.Now;
            //dh.TinhTrang = Int32.Parse(tinhTrang);
            //dh.GhiChu = ghiChu;
            dh.GhiChu = ghiChu;
            db.HoaDons.Add(dh);
            db.SaveChanges();
            
            foreach (CartItem item in gio.dssp)
            {
                ChiTietHD ct = new ChiTietHD();
                ct.MaHD = dh.MaHD;
                ct.MaSP = item.iMaSP;
                ct.SoLuong = item.isoluong;
                db.ChiTietHDs.Add(ct);
                db.SaveChanges();
            }
            gio.dssp = null;
            return View(dh);
        }       

    }
}
