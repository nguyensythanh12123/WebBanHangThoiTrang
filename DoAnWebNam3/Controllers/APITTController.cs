using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ThoiTrangAPI;

namespace DoAnWebNam3.Controllers
{
    public class APITTController : ApiController
    {
        doanwebthoitrangDataContext data = new doanwebthoitrangDataContext();
        public List<SanPham> Get()
        {
            List<SanPham> ds = data.SanPhams.ToList();
            return ds;
        }
        public SanPham Get(string ID)
        {
            SanPham ds = data.SanPhams.SingleOrDefault(m=>m.MaSP==ID);
            return ds;
        }
        public bool InsertNew(string masp, string tensp, float giaban, float giamgia, string mota, string mancc, string maloai, string anh, string anhct, string size)
        {
            try
            {
                doanwebthoitrangDataContext db = new doanwebthoitrangDataContext();
                SanPham sp = new SanPham();
                sp.MaSP = masp;
                sp.TenSP = tensp;
                sp.GiaBan = giaban;
                sp.GiamGia = giamgia;
                sp.MoTa = mota;
                sp.MaNCC = mancc;
                sp.MaLoai = maloai;
                sp.Anh = anh;
                sp.AnhCT = anhct;
                sp.Size = size;
                db.SanPhams.InsertOnSubmit(sp);
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool UpdateSP(string masp, string tensp, float giaban, float giamgia, string mota, string mancc, string maloai, string anh, string anhct, string size)
        {
            try
            {
                doanwebthoitrangDataContext db = new doanwebthoitrangDataContext();
                SanPham sp = db.SanPhams.FirstOrDefault(x => x.MaSP == masp);
                if (sp == null)
                    return false;
                sp.TenSP = tensp;
                sp.GiaBan = giaban;
                sp.GiamGia = giamgia;
                sp.MoTa = mota;
                sp.MaNCC = mancc;
                sp.MaLoai = maloai;
                sp.Anh = anh;
                sp.AnhCT = anhct;
                sp.Size = size;
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool DeleteSP(string masp)
        {
            doanwebthoitrangDataContext db = new doanwebthoitrangDataContext();
            SanPham sp = db.SanPhams.FirstOrDefault(x => x.MaSP == masp);
            if (sp == null)
                return false;
            db.SanPhams.DeleteOnSubmit(sp);
            db.SubmitChanges();
            return true;
        }
    }
}
