using System.ComponentModel.DataAnnotations;

namespace ShopDongHoMVC.ViewModels
{
    public class RegisterVM
    {
        [Display(Name ="Tên Đăng Nhập")]
        [Required(ErrorMessage ="*")]
        [MaxLength(20, ErrorMessage ="Tối đa 20 kí tự ")]
        public string MaKh { get; set; }
        [Display(Name ="Mật Khẩu")]
        public string MatKhau { get; set; }
        [Required(ErrorMessage ="*")]
        [MaxLength(50, ErrorMessage = "Tối đa 50 kí tự ")]
        [Display(Name ="Họ Tên")]
        public string HoTen { get; set; } = null!;
        [Display(Name ="Giới Tính")]
        public bool GioiTinh { get; set; } = true;
        [Display(Name = "Ngày Sinh")]
        public DateOnly? NgaySinh { get; set; }
        [MaxLength(60, ErrorMessage = "Tối đa 60 kí tự ")]
        [Display(Name = "Địa Chỉ")]
        public string DiaChi { get; set; }
        [MaxLength(24, ErrorMessage = "Tối đa 24 kí tự ")]
        [RegularExpression(@"0[123456789]\d{8}", ErrorMessage ="Chưa đúng định dạng của di động Việt Nam")]
        [Display(Name ="Số Điện Thoại")]
        public string DienThoai { get; set; }

        [EmailAddress(ErrorMessage ="Chưa đúng định dạng email")]
        [Display(Name ="Email")]
        public string Email { get; set; }
        [Display(Name ="Hình Ảnh")]
        public string? Hinh { get; set; }
    }
}
