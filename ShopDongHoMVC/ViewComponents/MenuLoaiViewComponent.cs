using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopDongHoMVC.Data;
using ShopDongHoMVC.ViewModels;

namespace ShopDongHoMVC.ViewComponents
{
    public class MenuLoaiViewComponent :ViewComponent
    {
        private readonly DongHoShopMvcContext db;
        public MenuLoaiViewComponent(DongHoShopMvcContext context)
        {
            db = context;
        }

        public async Task<IViewComponentResult> InvokeAsync() 
        {
            var data = db.Loais.Select( lo => new MenuLoaiVM
            {
                MaLoai=lo.MaLoai,
                TenLoai=lo.TenLoai,
                SoLuong=lo.HangHoas.Count
            });
            return View(data);
        }

    }
}
