using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.DotNet.Scaffolding.Shared.Messaging;
using ShopDongHoMVC.Data;
using ShopDongHoMVC.Helpers;
using ShopDongHoMVC.ViewModels;

namespace ShopDongHoMVC.Controllers
{
    public class KhachHangController : Controller
    {
        private readonly DongHoShopMvcContext db;
        private readonly IMapper _mapper;

        public KhachHangController(DongHoShopMvcContext context, IMapper mapper)
        {
            db = context;
            _mapper = mapper;

        }


        [HttpGet]
        public IActionResult DangKy()
        {
            return View();
        }

        [HttpPost]

        public IActionResult Dangky(RegisterVM model, IFormFile Hinh)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var khachhang = _mapper.Map<KhachHang>(model);
                    khachhang.RandomKey = Util.GenerateRandomKey();
                    khachhang.MatKhau = model.MatKhau.ToMd5Hash(khachhang.RandomKey);
                    khachhang.HieuLuc = true;// sẽ cử lý khi dùng mail để active
                    khachhang.VaiTro = 0;

                    if (Hinh != null)
                    {
                        khachhang.Hinh = Util.UpLoadHinh(Hinh, "khachhang");
                    }
                    db.Add(khachhang);
                    db.SaveChanges();
                    return RedirectToAction("Index", "HangHoa");
                }
            }
            catch (Exception ex)
            {
                
            }
            return View();
        }
    }
}
