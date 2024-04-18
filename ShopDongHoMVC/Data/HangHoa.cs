using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShopDongHoMVC.Data;

public partial class HangHoa
{
    [DisplayName("Mã Sản Phẩm")]
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int MaHh { get; set; }
    [Required]
    [DisplayName("Tên Sản Phẩm")]
    public string? TenHh { get; set; }
    [DisplayName("Tên Kí hiệu")]
    public string? TenAlias { get; set; }
    [DisplayName("Mã Loại")]
    public int MaLoai { get; set; }
    [DisplayName("Đơn Vị")]
    public string? MoTaDonVi { get; set; }

    [Required]
    [DisplayName("Giá Sản Phẩm")]
    public double? DonGia { get; set; }
    [Required]
    [DisplayName("Hình Ảnh")]
    public string? Hinh { get; set; }
    [DisplayName("Ngày Sản Xuất")]
    public DateTime NgaySx { get; set; }
    [DisplayName("Giảm Giá")]
    public double GiamGia { get; set; }
    [DisplayName("Số Lượt Xem")]
    public int SoLanXem { get; set; }
    [DisplayName("Mô Tả")]
    public string? MoTa { get; set; }
    [DisplayName("Nhà Cung Cấp")]
    public string? MaNcc { get; set; }

    public virtual ICollection<BanBe> BanBes { get; set; } = new List<BanBe>();

    public virtual ICollection<ChiTietHd> ChiTietHds { get; set; } = new List<ChiTietHd>();

    [Required]
    [DisplayName("Mã Loại")]
    public virtual Loai MaLoaiNavigation { get; set; }

    public virtual NhaCungCap MaNccNavigation { get; set; } = null!;

    public virtual ICollection<YeuThich> YeuThiches { get; set; } = new List<YeuThich>();
}
