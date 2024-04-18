using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ShopDongHoMVC.Data;

namespace ShopDongHoMVC.Controllers
{
    public class OrderManagerController : Controller
    {
        private readonly DongHoShopMvcContext db;
        public OrderManagerController(DongHoShopMvcContext context)
        {
            db = context;
        }
        public IActionResult Index()
        {
            List<HoaDon> listhoadon = db.HoaDons.ToList();
            return View(listhoadon);
        }
        public IActionResult Create()
        {
            List<KhachHang> listkh=db.KhachHangs.ToList();
            ViewBag.KhachHangs = new SelectList(listkh,"MaKh","HoTen");
            List<NhanVien>lisnv=db.NhanViens.ToList();
            ViewBag.NhanViens = new SelectList(lisnv, "MaNv", "HoTen");
            List<TrangThai> listtt=db.TrangThais.ToList();
            ViewBag.TrangThais = new SelectList(listtt, "MaTrangThai", "TenTrangThai");
            List<HoaDon> listhoadon = db.HoaDons.ToList();
            return View();
        }

        [HttpPost]
        public IActionResult Create(HoaDon hoaDon)
        {

            if (hoaDon == null)
            {
                return View(hoaDon);
            }

            db.HoaDons.Add(hoaDon);
            db.SaveChanges();
            return RedirectToAction("Index");


        }

        public IActionResult Details(int id)
        {
            var item = db.HoaDons.FirstOrDefault(x => x.MaHd == id);
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }


        public IActionResult Edit(int id)
        {
            List<KhachHang> listkh = db.KhachHangs.ToList();
            ViewBag.KhachHangs = new SelectList(listkh, "MaKh", "HoTen");
            List<NhanVien> lisnv = db.NhanViens.ToList();
            ViewBag.NhanViens = new SelectList(lisnv, "MaNv", "HoTen");
            List<TrangThai> listtt = db.TrangThais.ToList();
            ViewBag.TrangThais = new SelectList(listtt, "MaTrangThai", "TenTrangThai");
            List<HoaDon> listhoadon = db.HoaDons.ToList();
            var item = db.HoaDons.SingleOrDefault(x => x.MaHd == id);
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }


        [HttpPost]
        public IActionResult Edit(HoaDon hd)
        {

            var item = db.HoaDons.SingleOrDefault(x => x.MaHd == hd.MaHd);
            if (item == null)
            {
                return NotFound();
            }

            item.MaHd = hd.MaHd;
            item.MaKh = hd.MaKh;
            item.NgayDat = hd.NgayDat;
            item.NgayCan = hd.NgayCan;
            item.NgayGiao= hd.NgayGiao;
            item.HoTen = hd.HoTen;
            item.DiaChi = hd.DiaChi;
            item.CachThanhToan = hd.CachThanhToan;
            item.CachVanChuyen= hd.CachVanChuyen;
            item.PhiVanChuyen = hd.PhiVanChuyen;
            item.MaTrangThai = hd.MaTrangThai;
            item.MaNv= hd.MaNv;
            item.GhiChu= hd.GhiChu;
            item.DienThoai= hd.DienThoai;

            // Lưu thay đổi vào cơ sở dữ liệu
            db.SaveChanges();

            return RedirectToAction("Index");

        }

        public IActionResult Delete(int id)
        {
            List<KhachHang> listkh = db.KhachHangs.ToList();
            ViewBag.KhachHangs = new SelectList(listkh, "MaKh", "HoTen");
            List<NhanVien> lisnv = db.NhanViens.ToList();
            ViewBag.NhanViens = new SelectList(lisnv, "MaNv", "HoTen");
            List<TrangThai> listtt = db.TrangThais.ToList();
            ViewBag.TrangThais = new SelectList(listtt, "MaTrangThai", "TenTrangThai");
            List<HoaDon> listhoadon = db.HoaDons.ToList();
            var item = db.HoaDons.SingleOrDefault(x => x.MaHd == id);
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }


        [HttpPost]
        public IActionResult Delete(HoaDon hd)
        {

            var item = db.HoaDons.SingleOrDefault(x => x.MaHd == hd.MaHd);
            if (item == null)
            {
                return NotFound();
            }
            db.HoaDons.Remove(item);

            // Lưu thay đổi vào cơ sở dữ liệu
            db.SaveChanges();

            return RedirectToAction("Index");

        }



    }
}
