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
    
    public partial class LoaiSP
    {
        public LoaiSP()
        {
            this.SanPhams = new HashSet<SanPham>();
        }
    
        public string MaLoai { get; set; }
        public string TenLoai { get; set; }
    
        public virtual ICollection<SanPham> SanPhams { get; set; }
    }
}
