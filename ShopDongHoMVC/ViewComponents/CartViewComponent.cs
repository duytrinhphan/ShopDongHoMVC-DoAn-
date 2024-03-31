using Microsoft.AspNetCore.Mvc;
using ShopDongHoMVC.Helpers;
using ShopDongHoMVC.ViewModels;

namespace ShopDongHoMVC.ViewComponents
{
	public class CartViewComponent : ViewComponent
	{
		public IViewComponentResult Invoke()
		{
			var cart = HttpContext.Session.Get<List<CartItemVM>>(MySetting.CAT_KEY) ?? new List<CartItemVM>();

			return View("CartPanel", new CartModel
			{
				Quantity = cart.Sum(p => p.SoLuong),
				Total = cart.Sum(p => p.ThanhTien)
			});
		}
	}
}
