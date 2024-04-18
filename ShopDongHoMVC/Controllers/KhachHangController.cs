using AutoMapper;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.DotNet.Scaffolding.Shared.Messaging;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages;
using ShopDongHoMVC.Data;
using ShopDongHoMVC.Helpers;
using ShopDongHoMVC.ViewModels;
using System.Security.Claims;
using System.Drawing;

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

        #region Register
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

        #endregion

        public IActionResult QuenMatKhau() 
        {
            return View();
        }
        [HttpPost]

        public IActionResult QuenMatKhau(string email,string newpassword)
        {
            try 
            {
                var khachang = db.KhachHangs.SingleOrDefault(x => x.Email == email);
                if (khachang != null)
                {
                    if (string.IsNullOrEmpty(newpassword))
                    {
                        ModelState.AddModelError("newpassword", "Vui lòng nhập mật khẩu");
                        return View();
                    }

                    khachang.MatKhau = newpassword.ToMd5Hash(khachang.RandomKey);
                    db.SaveChanges();
                    ViewBag.SuccessMessage = "Mật khẩu mới đã được cập nhật thành công.";
                    return View("DangNhap");

                }
                else
                {
                    ModelState.AddModelError("email", "Email không tồn tại !");
                    return View();
                }
            }
            catch (Exception ex) 
            {
                ModelState.AddModelError("", "Đã xảy ra lỗi khi thực hiện yêu cầu đặt lại mật khẩu.");
                return View();
            }
        }

   
        #region Login
        [HttpGet]
        public IActionResult DangNhap(string? ReturnUrl)
        {Image quynhphuong=null;

            ViewBag.ReturnUrl = ReturnUrl;
            return View();
        }

        [HttpPost]
		public async Task<IActionResult> DangNhap(LoginVM model, string? ReturnUrl)
		{
			ViewBag.ReturnUrl = ReturnUrl;
			if (ModelState.IsValid)
			{
				var khachHang = db.KhachHangs.SingleOrDefault(kh => kh.MaKh == model.UserName);
				if (khachHang == null)
				{
					ModelState.AddModelError("loi", "Không có khách hàng này");
				}
				else
				{
					if (!khachHang.HieuLuc)
					{
						ModelState.AddModelError("loi", "Tài khoản đã bị khóa. Vui lòng liên hệ Admin.");
					}
					else
					{
						if (khachHang.MatKhau != model.Password.ToMd5Hash(khachHang.RandomKey))
						{
							ModelState.AddModelError("loi", "Sai thông tin đăng nhập");
						}
						else
						{
							var claims = new List<Claim> {
						new Claim(ClaimTypes.Email, khachHang.Email),
						new Claim(ClaimTypes.Name, khachHang.HoTen),
						new Claim(MySetting.CLAIM_CUSTOMERID, khachHang.MaKh),
					};

							if (khachHang.VaiTro == 1)
							{
								claims.Add(new Claim(ClaimTypes.Role, "Admin"));
							}
							else if (khachHang.VaiTro == 0)
							{
								claims.Add(new Claim(ClaimTypes.Role, "Customer"));
							}

							var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
							var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);

							await HttpContext.SignInAsync(claimsPrincipal);

							if (Url.IsLocalUrl(ReturnUrl))
							{
								return Redirect(ReturnUrl);
							}
							else
							{
								return Redirect("/");
							}
						}
					}
				}
			}
			return View();
		}
		#endregion

		[Authorize]
        public async Task<IActionResult> DangXuat()
        {
            await HttpContext.SignOutAsync();
            return Redirect("/");
        }


        [Authorize]

        public IActionResult Profile()
        {
            var customerid = User.FindFirstValue(MySetting.CLAIM_CUSTOMERID);
            var khachhang = db.KhachHangs.SingleOrDefault(kh => kh.MaKh == customerid);
            if(khachhang == null) 
            {
                return NotFound();
            }

            return View(khachhang);
        }
    }
}