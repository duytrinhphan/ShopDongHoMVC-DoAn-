using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using ShopDongHoMVC.Data;
using ShopDongHoMVC.Models;

namespace ShopDongHoMVC.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
	{
        public async Task<IActionResult> Index()
        {
            return View();
        }
    }
}
