//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoAnWebNam3.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ChiTietHD
    {
        public int MaCTHD { get; set; }
        public Nullable<int> MaHD { get; set; }
        public string MaSP { get; set; }
        public Nullable<int> SoLuong { get; set; }
    
        public virtual HoaDon HoaDon { get; set; }
        public virtual SanPham SanPham { get; set; }
    }
}
