using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnWebNam3.Models;

namespace DoAnWebNam3.Controllers
{
    public class KhachHangController : Controller
    {
        //
        // GET: /KhachHang/
        DAWEBTHOITRANGEntities db = new DAWEBTHOITRANGEntities();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(FormCollection col)
        {
            string ten = col["txtName"];
            string mk = col["txtPass"];

            KhachHang khach = db.KhachHangs.SingleOrDefault(k => k.TenDN == ten && k.Pass == mk);
            if (khach == null) //không thành công
            {
                ViewBag.tb = "Thông tin đăng nhập sai";
                return View();
            }
            if (khach.TenDN == "Admin" && khach.Pass == "0000")
            {
                return RedirectToAction("ShowSanPham", "Admin");
            }

            Session["kh"] = khach;

            return RedirectToAction("Index", "ThoiTrang");
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        public ActionResult DangXuat()
        {
            GioHang gio = Session["gh"] as GioHang;
            Session["kh"]=null;
            return RedirectToAction("DangNhap","KhachHang");
        }
        public ActionResult DangXuatAdmin()
        {
            Session["kh"] = null;
            return RedirectToAction("DangNhap", "KhachHang");
        }
        [HttpPost]
        public ActionResult DangKy(KhachHang k, FormCollection f)
        {
            var hoten = f["TenKH"];
            var ngaysinh = String.Format("{0: MM/DD/YYYY}", f["NgaySinh"]);
            var sdt = f["SDT"];
            var diachi = f["DiaChi"];
            var email = f["Email"];
            var tendn = f["TenDN"];
            var matkhau = f["Pass"];
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên không được bỏ trống";
            }
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi2"] = "Tên đăng nhập không được bỏ trống";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Vui lòng nhập mật khẩu";
            }
            if (String.IsNullOrEmpty(sdt))
            {
                ViewData["Loi5"] = "Vui lòng nhập số điện thoại";
            }
            if (!String.IsNullOrEmpty(hoten) && !String.IsNullOrEmpty(tendn) && !String.IsNullOrEmpty(matkhau) && !String.IsNullOrEmpty(sdt) && !String.IsNullOrEmpty(email) && !String.IsNullOrEmpty(diachi))
            {
                k.TenKH = hoten;
                k.TenDN = tendn;
                k.Pass = matkhau;
                k.NgaySinh = DateTime.Parse(ngaysinh);
                k.DiaChi = diachi;
                k.SDT = sdt;
                k.Email = email;
                KhachHang khach = db.KhachHangs.SingleOrDefault(h => h.TenDN == tendn);
                if (khach != null)
                {
                    ViewData["Loi6"] = "Tên đăng nhập đã tồn tại";
                }
                else
                {
                    db.KhachHangs.Add(k);
                    db.SaveChanges();
                    return RedirectToAction("DangNhap", "KhachHang");
                }
            }
            return View();
        }


    }
}
