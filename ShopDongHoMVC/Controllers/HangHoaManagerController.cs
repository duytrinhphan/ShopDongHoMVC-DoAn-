using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ShopDongHoMVC.Data;
using ShopDongHoMVC.Models;
using ShopDongHoMVC.ViewModels;

namespace ShopDongHoMVC.Controllers
{
    public class HangHoaManagerController : Controller
    {


        private readonly DongHoShopMvcContext db;
        public HangHoaManagerController(DongHoShopMvcContext context) 
        {
            db = context;        
        }


        public IActionResult Index()
        {
            List<HangHoa> listsanpham = db.HangHoas.ToList();
            return View(listsanpham);
        }
        public IActionResult Create()
        {

            List<Loai> listloai = db.Loais.ToList();
            List<NhaCungCap> Listnhacungcap=db.NhaCungCaps.ToList();
            ViewBag.Loais = new SelectList(listloai, "MaLoai", "TenLoai");
            ViewBag.NhaCungCaps = new SelectList(Listnhacungcap, "MaNcc", "TenCongTy");
            return View();
        }
       
        [HttpPost]
        public IActionResult Create(HangHoa product)
        {
        
                if (product == null)
                {
                    return View(product);
                }

                db.HangHoas.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
     
         
        }

        public IActionResult Details(int id)
        {
            var item = db.HangHoas.FirstOrDefault(x => x.MaHh == id);
            if (item == null) 
            {
                return NotFound();
            }

            return View(item);
        }

        public IActionResult Edit(int id) 
        {
            List<Loai> listloai = db.Loais.ToList();
            List<NhaCungCap> Listnhacungcap = db.NhaCungCaps.ToList();
            ViewBag.Loais = new SelectList(listloai, "MaLoai", "TenLoai");
            ViewBag.NhaCungCaps = new SelectList(Listnhacungcap, "MaNcc", "TenCongTy");
            var item = db.HangHoas.SingleOrDefault(x => x.MaHh == id);
            if(item == null) 
            {
                return NotFound();
            }

            return View(item);
        }


        [HttpPost]
        public IActionResult Edit(HangHoa product)
        {
        
                var item = db.HangHoas.SingleOrDefault(x => x.MaHh == product.MaHh);
                if (item == null)
                {
                    return NotFound();
                }

                item.TenHh = product.TenHh;
                item.TenAlias=product.TenAlias;
                item.MaLoai=product.MaLoai;
                item.DonGia=product.DonGia;
                item.Hinh=product.Hinh;
                item.NgaySx=product.NgaySx;
                item.GiamGia=product.GiamGia;
                item.MoTa=product.MoTa;
                item.MaNcc=product.MaNcc;

            

                // Lưu thay đổi vào cơ sở dữ liệu
                db.SaveChanges();

                return RedirectToAction("Index");
         
        }

        public IActionResult Delete(int id)
        {
            List<Loai> listloai = db.Loais.ToList();
            List<NhaCungCap> Listnhacungcap = db.NhaCungCaps.ToList();
            ViewBag.Loais = new SelectList(listloai, "MaLoai", "TenLoai");
            ViewBag.NhaCungCaps = new SelectList(Listnhacungcap, "MaNcc", "TenCongTy");
            var item = db.HangHoas.SingleOrDefault(x => x.MaHh == id);
            if (item == null)
            {
                return NotFound();
            }

            return View(item);
        }

        [HttpPost]

        public IActionResult Delete(HangHoa product)
        {

            var item = db.HangHoas.SingleOrDefault(x => x.MaHh == product.MaHh);
            if (item == null)
            {
                return NotFound();
            }

           db.HangHoas.Remove(item);

            // Lưu thay đổi vào cơ sở dữ liệu
            db.SaveChanges();

            return RedirectToAction("Index");

        }


       
    }
}
