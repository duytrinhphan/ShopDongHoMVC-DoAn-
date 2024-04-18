using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopDongHoMVC.Data;
using ShopDongHoMVC.ViewModels;

namespace ShopDongHoMVC.Controllers
{
    public class HangHoaController : Controller
    {


        public readonly DongHoShopMvcContext db;
        public HangHoaController(DongHoShopMvcContext context)
        {
            db = context;
        }
        public IActionResult Index(int? loai)
        {

            var sanpham = db.HangHoas.AsQueryable();
            if (loai.HasValue) 
            {
                sanpham = sanpham.Where(p => p.MaLoai == loai.Value);
            }
            var result = sanpham.Select(p => new SanPhamVM
            {
                MaSp = p.MaHh,
                TenSp = p.TenHh,
                DonGia = p.DonGia ?? 0,
                HinhAnh = p.Hinh ?? "",
                MoTaNgan = p.MoTa ?? "",
                Tenloai = p.MaLoaiNavigation.TenLoai,
                SoLanXem = p.SoLanXem + 1
            }) ;
            
            
               
            return View(result);
        }


        public IActionResult Search(string? query)
        {
            var sanpham=db.HangHoas.AsQueryable();
            if (query != null)
            {
                sanpham = sanpham.Where(p => p.TenHh.Contains(query));
            }

            var result = sanpham.Select(p => new SanPhamVM
            {
                MaSp = p.MaHh,
                TenSp = p.TenHh,
                DonGia = p.DonGia ?? 0,
                HinhAnh = p.Hinh ?? "",
                MoTaNgan = p.MoTa ?? "",
                Tenloai = p.MaLoaiNavigation.TenLoai
            });

            return View(result);
        }

        public IActionResult Detail(int id) 
        {
            var item = db.HangHoas.Include(p=>p.MaLoaiNavigation).SingleOrDefault(x => x.MaHh == id);
            if (item == null) 
            {
                TempData["Messsage"] = $"Không thấy sản phẩm có mã {id}";
                return Redirect("/404");
            }
            var result = new ChiTietSanPhamVM
            {
                MaSp = item.MaHh,
                TenSp = item.TenHh,
                DonGia = item.DonGia ?? 0,
                HinhAnh= item.Hinh ?? string.Empty,
                ChiTiet = item.MoTa ?? string.Empty,
                MoTaNgan= item.MoTaDonVi ?? string.Empty,
                Tenloai= item.MaLoaiNavigation.TenLoai,
                SoLuongTon=10,
                DiemDanhGia = 5,
            };

            return View(result);

        }


       
      
    }
}
