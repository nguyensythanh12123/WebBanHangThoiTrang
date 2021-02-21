using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThoiTrangAPI;

namespace DoAnWebNam3.Controllers
{
    public class TacVuAPIController : Controller
    {
        //
        // GET: /TacVuAPI/
        doanwebthoitrangDataContext data = new doanwebthoitrangDataContext();
        APITTController d = new APITTController();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LoadSP()
        {
            return View(d.Get());
        }
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(SanPham f)
        {
            d.InsertNew(f.MaSP, f.TenSP,(float)f.GiaBan,(float)f.GiamGia,f.MoTa,f.MaNCC,f.MaLoai,f.Anh,f.AnhCT,f.Size);
            return RedirectToAction("LoadSP", "TacVuAPI");
        }
        public ActionResult Edit()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Edit(SanPham f)
        {
            //d.UpdateFood(id);
            return View(d.UpdateSP(f.MaSP, f.TenSP, (float)f.GiaBan, (float)f.GiamGia, f.MoTa, f.MaNCC, f.MaLoai, f.Anh, f.AnhCT, f.Size));
        }
        public ActionResult Delete(string masp)
        {
            d.DeleteSP(masp);
            return RedirectToAction("LoadSP", "TacVuAPI");
        }
    }
}
