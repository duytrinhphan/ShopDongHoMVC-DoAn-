using Microsoft.AspNetCore.Mvc;
using ShopDongHoMVC.Data;
using ShopDongHoMVC.ViewModels;
using ShopDongHoMVC.Helpers;

namespace ShopDongHoMVC.Controllers
{
    public class CartController : Controller
    {
        private readonly DongHoShopMvcContext db;
        public CartController(DongHoShopMvcContext context) 
        {
            db=context;
        }
        const string CART_KEY = "MYCART";
        public List<CartItemVM> Cart 
        {
            get 
            {
                return HttpContext.Session.Get<List<CartItemVM>>(CART_KEY) ?? new List<CartItemVM>();
            }
        }
          
        public IActionResult Index()
        {
            return View(Cart);
        }


        public IActionResult AddTocart(int id,int quantity = 1)
        {
            var cart=Cart;
            var item = cart.SingleOrDefault(p => p.MaSp == id);
            if(item==null) 
            {
                var sanpham=db.HangHoas.SingleOrDefault(p=>p.MaHh==id);
                if (sanpham == null) 
                {
                    TempData["Message"] = $"Không tìm thấy hàng hóa có mã{id}";
                    return Redirect("/404");
                }

                item = new CartItemVM
                {
                    MaSp = sanpham.MaHh,
                    TenSp = sanpham.TenHh,
                    DonGia = sanpham.DonGia ?? 0,
                    Hinh = sanpham.Hinh ?? string.Empty,
                    SoLuong = quantity
                };
                cart.Add(item);
                              
            }
            else 
            {
                item.SoLuong += quantity;
            }
            HttpContext.Session.Set(CART_KEY, cart);
            return RedirectToAction("Index");
        }

        public IActionResult RemoveCart(int id) 
        {
            var cart = Cart;
            var item = cart.SingleOrDefault(p=>p.MaSp == id);
            if (item != null)
            {
                cart.Remove(item);
                HttpContext.Session.Set(CART_KEY , cart);
            }

            return RedirectToAction("Index");
        }
    }
}
