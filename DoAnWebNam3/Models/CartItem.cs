using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnWebNam3.Models
{
    public class CartItem
    {
        DAWEBTHOITRANGEntities db = new DAWEBTHOITRANGEntities();
        public string iMaSP { get; set; }
        public string iTenSp { get; set; }
        public string iAnhBia { get; set; }
        public double iDonGia { get; set; }
        public int isoluong { get; set; }

        public double ThanhTien
        {
            get { return isoluong * iDonGia; }
        }
        public CartItem(string Masp)
        {
            SanPham sp = db.SanPhams.Single(n => n.MaSP == Masp);
            if (sp != null)
            {
                iMaSP = Masp;
                iTenSp = sp.TenSP;
                iAnhBia = sp.Anh;
                iDonGia = double.Parse(sp.GiamGia.ToString());
                isoluong = 1;
            }
        }
    }
}