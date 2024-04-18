using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ShopDongHoMVC.Data;
using ShopDongHoMVC.Models;

namespace ShopDongHoMVC.Controllers
{
    public class CategoryManagerController : Controller
    {
        private readonly DongHoShopMvcContext db;
        public CategoryManagerController(DongHoShopMvcContext context)
        {
            db = context;
        }
        public IActionResult Index()
        {
            List<Loai> listloai = db.Loais.ToList();
            return View(listloai);
        }


        public IActionResult Create()
        {

            List<Loai> listloai = db.Loais.ToList();
            return View();
        }

        [HttpPost]
        public IActionResult Create(Loai loai)
        {

            if (loai == null)
            {
                return View(loai);
            }

            db.Loais.Add(loai);
            db.SaveChanges();
            return RedirectToAction("Index");


        }

        public IActionResult Details(int id)
        {
            var item = db.Loais.FirstOrDefault(x => x.MaLoai == id);
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }



        public IActionResult Edit(int id)
        {
            List<Loai> listloai = db.Loais.ToList();
            var item = db.Loais.SingleOrDefault(x => x.MaLoai == id);
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }


        [HttpPost]
        public IActionResult Edit(Loai loai)
        {

            var item = db.Loais.SingleOrDefault(x => x.MaLoai== loai.MaLoai);
            if (item == null)
            {
                return NotFound();
            }

            item.TenLoai = loai.TenLoai;
            item.TenLoaiAlias = loai.TenLoaiAlias;
            item.MoTa = loai.MoTa;
            item.Hinh=loai.Hinh;



            // Lưu thay đổi vào cơ sở dữ liệu
            db.SaveChanges();

            return RedirectToAction("Index");

        }

        public IActionResult Delete(int id)
        {
            List<Loai> listloai = db.Loais.ToList();
            var item = db.Loais.SingleOrDefault(x => x.MaLoai == id);
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }

        [HttpPost]

        public IActionResult Delete(Loai loai)
        {

            var item = db.Loais.SingleOrDefault(x => x.MaLoai == loai.MaLoai);
            if (item == null)
            {
                return NotFound();
            }

            db.Loais.Remove(item);

            // Lưu thay đổi vào cơ sở dữ liệu
            db.SaveChanges();

            return RedirectToAction("Index");

        }

        //private readonly ICategoryReposity _categoryRepository;
        //public CategoryManagerController(ICategoryReposity categoryRepository)
        //{
        //    _categoryRepository = categoryRepository;
        //}
        // Hiển thị danh sách category
        //public async Task<IActionResult> Index()
        //{
        //    var categories = await _categoryRepository.GetAllAsync();
        //    return View(categories);
        //}
        //// Hiển thị form thêm sản phẩm mới
        //public async Task<IActionResult> Create(Loai category)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        _categoryRepository.AddAsync(category);
        //        return RedirectToAction(nameof(Index));
        //    }
        //    return View(category);
        //}
        //[HttpGet]
        //public async Task<IActionResult> Edit(int id)
        //{
        //    var category = await _categoryRepository.GetByIdAsync(id);
        //    return View(category);
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Description,CreatedAt,UpdatedAt")] Loai category)
        //{
        //    if (id != category.MaLoai)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            await _categoryRepository.UpdateAsync(category);
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!await CategoryExists(id))
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

        //    return View(category);
        //}

        //[HttpGet]
        //public async Task<IActionResult> Details(int id)
        //{
        //    var category = await _categoryRepository.GetByIdAsync(id);
        //    return View(category);
        //}

        //[HttpGet]
        //public async Task<IActionResult> Delete(int id)
        //{
        //    var category = await _categoryRepository.GetByIdAsync(id);
        //    return View(category);
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Delete(int id, Loai category)
        //{
        //    if (id != category.MaLoai)
        //    {
        //        return NotFound();
        //    }

        //    try
        //    {
        //        await _categoryRepository.DeleteAsync(id);
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!await CategoryExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return RedirectToAction(nameof(Index));
        //}

        //private async Task<bool> CategoryExists(int id)
        //{
        //    var category = await _categoryRepository.GetByIdAsync(id);
        //    return category != null;
    }
}

