using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DoAn.Models
{
    [Table("MATHANG")]
    public partial class Mathang
    {
        public Mathang()
        {
            Cthoadon = new HashSet<Cthoadon>();
        }

        [Key]
        [Column("MaMH")]
        [Display(Name = "Mã mặt hàng")]
        public int MaMh { get; set; }
        [Required]
        [StringLength(100)]
        [Display(Name = "Tên mặt hàng")]
        public string Ten { get; set; }
        [Display(Name = "Giá gốc")]
        public int? GiaGoc { get; set; }
        [Display(Name = "Giá bán")]
        public int? GiaBan { get; set; }
        [Display(Name = "Số lượng")]
        public short? SoLuong { get; set; }
        [StringLength(1000)]
        [Display(Name = "Mô tả")]
        public string MoTa { get; set; }
        [StringLength(255)]
        
        public string HinhAnh { get; set; }
        [Column("MaDM")]
        [Display(Name = "Mã danh mục")]
        public int MaDm { get; set; }
        [Display(Name = "Lượt xem")]
        public int? LuotXem { get; set; }
        [Display(Name = "Lượt mua")]
        public int? LuotMua { get; set; }

        [Display(Name = "Mã danh mục")]
        [ForeignKey(nameof(MaDm))]
        [InverseProperty(nameof(Danhmuc.Mathang))]
        public virtual Danhmuc MaDmNavigation { get; set; }
        [InverseProperty("MaMhNavigation")]
        public virtual ICollection<Cthoadon> Cthoadon { get; set; }
    }
}
