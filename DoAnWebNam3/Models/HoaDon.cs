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
    
    public partial class HoaDon
    {
        public HoaDon()
        {
            this.ChiTietHDs = new HashSet<ChiTietHD>();
        }
    
        public int MaHD { get; set; }
        public Nullable<int> MaKH { get; set; }
        public Nullable<System.DateTime> NgayLap { get; set; }
        public string GhiChu { get; set; }
    
        public virtual ICollection<ChiTietHD> ChiTietHDs { get; set; }
        public virtual KhachHang KhachHang { get; set; }
    }
}
