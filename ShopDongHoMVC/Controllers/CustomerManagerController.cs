using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopDongHoMVC.Data;

namespace ShopDongHoMVC.Controllers
{
    public class CustomerManagerController : Controller
    {


        private readonly DongHoShopMvcContext db;
        public CustomerManagerController(DongHoShopMvcContext context)
        {
            db = context;
        }
        public IActionResult Index()
        {
            List<KhachHang> listkh = db.KhachHangs.ToList();
            return View(listkh);
        }


        public IActionResult Create()
        {

            List<KhachHang> listkh = db.KhachHangs.ToList();
            return View();
        }

        [HttpPost]
        public IActionResult Create(KhachHang kh)
        {

            if (kh == null)
            {
                return View();
            }

            db.KhachHangs.Add(kh);
            db.SaveChanges();
            return RedirectToAction("Index");


        }

        public IActionResult Details(string id)
        {
            var item = db.KhachHangs.FirstOrDefault(x => x.MaKh.Equals(id));
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }



        public IActionResult Edit(string id)
        {

            List<KhachHang> listkh = db.KhachHangs.ToList();

            var item = db.KhachHangs.FirstOrDefault(x => x.MaKh.Equals(id));
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }


        [HttpPost]
        public IActionResult Edit(KhachHang kh)
        {

            var item = db.KhachHangs.FirstOrDefault(x => x.MaKh.Equals(kh.MaKh));
            if (item == null)
            {
                return NotFound();
            }
            item.MaKh = kh.MaKh;
            item.MatKhau = kh.MatKhau;
            item.HoTen = kh.HoTen;
            item.GioiTinh= kh.GioiTinh;
            item.NgaySinh= kh.NgaySinh;
            item.DiaChi = kh.DiaChi;
            item.DiaChi = kh.DiaChi;
            item.DienThoai = kh.DienThoai;
            item.Email=kh.Email;
            item.Hinh = kh.Hinh;
            item.HieuLuc = kh.HieuLuc;
            item.VaiTro = kh.VaiTro;
            item.RandomKey = kh.RandomKey;


            // Lưu thay đổi vào cơ sở dữ liệu
            db.SaveChanges();

            return RedirectToAction("Index");

        }

        public IActionResult Delete(string id)
        {

            List<KhachHang> listkh = db.KhachHangs.ToList();

            var item = db.KhachHangs.FirstOrDefault(x => x.MaKh.Equals(id));
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }

        [HttpPost]

        public IActionResult Delete(KhachHang kh)
        {

            var item = db.KhachHangs.FirstOrDefault(x => x.MaKh.Equals(kh.MaKh));
            if (item == null)
            {
                return NotFound();
            }

            db.KhachHangs.Remove(item);

            // Lưu thay đổi vào cơ sở dữ liệu
            db.SaveChanges();

            return RedirectToAction("Index");

        }
        //private readonly IKhachHangRepository _khachHangRepository;
        //public CustomerManagerController(IKhachHangRepository khachHangRepository)
        //{
        //    _khachHangRepository = khachHangRepository;
        //}
        //public async Task<IActionResult> Index()
        //{
        //    var customers = await _khachHangRepository.GetAllAsync();
        //    return View(customers);
        //}
        //public IActionResult Create()
        //{
        //    return View();
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Create(KhachHang customer)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        await _khachHangRepository.AddAsync(customer);
        //        return RedirectToAction(nameof(Index));
        //    }
        //    return View(customer);
        //}

        //[HttpGet]
        //public async Task<IActionResult> Edit(string id)
        //{
        //    var customer = await _khachHangRepository.GetByIdAsync(id);
        //    return View(customer);
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Edit(string id, KhachHang customer)
        //{
        //    if (id != customer.MaKh)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            await _khachHangRepository.UpdateAsync(customer);
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!await CustomerExists(id))
        //            {
        //                return NotFound();
        //            }
        //            else
        //            {
        //                throw;
        //            }
        //        }

        //        return RedirectToAction(nameof(Index));
        //    }

        //    return View(customer);
        //}

        //[HttpGet]
        //public async Task<IActionResult> Details(string id)
        //{
        //    var customer = await _khachHangRepository.GetByIdAsync(id);
        //    return View(customer);
        //}

        //[HttpGet]
        //public async Task<IActionResult> Delete(string id)
        //{
        //    var customer = await _khachHangRepository.GetByIdAsync(id);
        //    return View(customer);
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> DeleteConfirmed(string id)
        //{
        //    await _khachHangRepository.DeleteAsync(id);
        //    return RedirectToAction(nameof(Index));
        //}

        //private async Task<bool> CustomerExists(string id)
        //{
        //    var customer = await _khachHangRepository.GetByIdAsync(id);
        //    return customer != null;
        //}
    }
}
