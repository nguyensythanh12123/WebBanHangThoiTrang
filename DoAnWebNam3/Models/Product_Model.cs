using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace DoAnWebNam3.Models
{
    [Table("SanPham")]
    public class Product_Model
    {
        [Key]
        [Required(ErrorMessage = "Bắt buộc nhập")]
        public string MaSP { set; get; }


        [Required()]
        public string TenSP { set; get; }

        [Required()]
        public float GiaBan { set; get; }

        [Required()]
        public float GiamGia { set; get; }

        [Required()]
        public string MoTa { set; get; }

        [Required()]
        public string MaLoai { set; get; }

        [Required()]
        public string MaNCC { set; get; }

        [Required()]
        public string Anh { set; get; }

        [Required()]
        public string AnhCT { set; get; }

        [Required()]
        public string Size { set; get; }
    }
}