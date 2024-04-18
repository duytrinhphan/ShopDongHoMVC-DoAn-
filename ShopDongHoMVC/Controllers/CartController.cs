using Microsoft.AspNetCore.Mvc;
using ShopDongHoMVC.Data;
using ShopDongHoMVC.ViewModels;
using ShopDongHoMVC.Helpers;
using Microsoft.AspNetCore.Authorization;
using ShopDongHoMVC.Service;
using Microsoft.AspNetCore.Http;

namespace ShopDongHoMVC.Controllers
{
	public class CartController : Controller
	{
		private readonly IVnPayService _vnPayservice;
		private readonly DongHoShopMvcContext db;
		public CartController(DongHoShopMvcContext context, IVnPayService vnPayService)
		{
			_vnPayservice = vnPayService;
			db = context;
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


		public IActionResult AddTocart(int id, int quantity = 1)
		{
		
			var cart = Cart;
			var item = cart.SingleOrDefault(p => p.MaSp == id);
			if (item == null)
			{
				var sanpham = db.HangHoas.SingleOrDefault(p => p.MaHh == id);
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
					SoLuong = quantity,
                    ThanhTien = (sanpham.DonGia ?? 0) * quantity

                };
				cart.Add(item);

			}
			else
			{
				item.SoLuong += quantity;
                item.ThanhTien = item.SoLuong * item.DonGia;


            }
			HttpContext.Session.Set(CART_KEY, cart);
			return RedirectToAction("Index");
		}

		public IActionResult RemoveCart(int id)
		{
			var cart = Cart;
			var item = cart.SingleOrDefault(p => p.MaSp == id);
			if (item != null)
			{
				cart.Remove(item);
				HttpContext.Session.Set(CART_KEY, cart);
			}

			return RedirectToAction("Index");
		}

        public IActionResult UpdateCart(int id, int quantity=1)
        {
            var cart = Cart;
            var item = cart.SingleOrDefault(p => p.MaSp == id);
            if (item != null)
            {
                if (quantity <= 0)
                {
                    cart.Remove(item);
                }
                else
                {
                    item.SoLuong = quantity;
					item.ThanhTien = item.DonGia * quantity;
                }

                HttpContext.Session.Set(CART_KEY, cart);
   

            }

            return RedirectToAction("Index");
        }




        [Authorize]
		[HttpGet]
		public IActionResult Checkout()
		{
			if (Cart.Count == 0)
			{
				return Redirect("/");
			}

			return View(Cart);
		}

		[Authorize]
		[HttpPost]
		public IActionResult Checkout(CheckoutVM model, string payment = "COD")
		{
			if (ModelState.IsValid)
			{
				if (payment == "Đặt hàng (VnPay)")
				{
					var vnPayModel = new VnPaymentRequestModel
					{
						Amount = Cart.Sum(p => p.ThanhTien),
						CreatedDate = DateTime.Now,
						Description = $"{model.HoTen} {model.DienThoai} {model.DiaChi}",
						FullName = model.HoTen,
						OrderId = new Random().Next(1000, 100000)
					};
					return Redirect(_vnPayservice.CreatePaymentUrl(HttpContext, vnPayModel));
				}

				var customerId = HttpContext.User.Claims.SingleOrDefault(p => p.Type == MySetting.CLAIM_CUSTOMERID).Value;
				var khachHang = new KhachHang();
				if (model.GiongKhachHang)
				{
					khachHang = db.KhachHangs.SingleOrDefault(kh => kh.MaKh == customerId);
				}

				var hoadon = new HoaDon
				{
					MaKh = customerId,
					HoTen = model.HoTen ?? khachHang.HoTen,
					DiaChi = model.DiaChi ?? khachHang.DiaChi,
					DienThoai = model.DienThoai ?? khachHang.DienThoai,
					NgayDat = DateTime.Now,
					CachThanhToan = "COD",
					CachVanChuyen = "GRAB",
					MaTrangThai = 0,
					GhiChu = model.GhiChu
				};

				db.Database.BeginTransaction();
				try
				{

					db.Add(hoadon);
					db.SaveChanges();

					var cthds = new List<ChiTietHd>();
					foreach (var item in Cart)
					{
						cthds.Add(new ChiTietHd
						{
							MaHd = hoadon.MaHd,
							SoLuong = item.SoLuong,
							DonGia = item.DonGia,
							MaHh = item.MaSp,
							GiamGia = 0
						});
					}
					db.AddRange(cthds);
					db.SaveChanges();
					db.Database.CommitTransaction();

					HttpContext.Session.Set<List<CartItemVM>>(MySetting.CAT_KEY, new List<CartItemVM>());

					return View("Success");
				}
				catch
				{
					db.Database.RollbackTransaction();
				}
			}

			return View(Cart);
		}

		[Authorize]
		public IActionResult PaymentSuccess()
		{
			return View("Success");
		}

		[Authorize]
		public IActionResult PaymentFail()
		{
			return View();
		}
		public class DonHang
		{
			public string DienThoai { get; set; }
			// Các thuộc tính khác cần thiết
		}
		[Authorize]
		public IActionResult PaymentCallBack()
		{
			var response = _vnPayservice.PaymentExecute(Request.Query);

			if (response == null || response.VnPayResponseCode != "00")
			{
				TempData["Message"] = $"Lỗi thanh toán VN Pay: {response.VnPayResponseCode}";
				return RedirectToAction("PaymentFail");
			}

			try
			{
				// Lấy thông tin từ callback VNPay và lưu vào đơn hàng
				var customerId = HttpContext.User.Claims.SingleOrDefault(p => p.Type == MySetting.CLAIM_CUSTOMERID).Value;
				var khachHang = db.KhachHangs.SingleOrDefault(kh => kh.MaKh == customerId);
				var hoadon = new HoaDon
				{
					MaKh = customerId,
					HoTen = khachHang?.HoTen ?? "", // Kiểm tra null trước khi sử dụng
					DiaChi = khachHang?.DiaChi ?? "",
					DienThoai = khachHang?.DienThoai ?? "",
					NgayDat = DateTime.Now,
					CachThanhToan = "VnPay",
					CachVanChuyen = "GRAB",
					MaTrangThai = 0,
					GhiChu = "" // Bạn có thể cung cấp ghi chú từ callback nếu cần
				};

				// Bắt đầu giao dịch
				using (var transaction = db.Database.BeginTransaction())
				{
					try
					{
						// Lưu đơn hàng vào cơ sở dữ liệu
						db.Add(hoadon);
						db.SaveChanges();

						// Lưu chi tiết hóa đơn vào cơ sở dữ liệu
						foreach (var item in Cart)
						{
							var chiTietHd = new ChiTietHd
							{
								MaHd = hoadon.MaHd,
								SoLuong = item.SoLuong,
								DonGia = item.DonGia,
								MaHh = item.MaSp,
								GiamGia = 0
							};
							db.Add(chiTietHd);
						}
						db.SaveChanges();

						// Commit giao dịch
						transaction.Commit();

						// Xóa giỏ hàng sau khi đã đặt hàng thành công
						HttpContext.Session.Set<List<CartItemVM>>(MySetting.CAT_KEY, new List<CartItemVM>());

						TempData["Message"] = $"Thanh toán VNPay thành công";
						return RedirectToAction("PaymentSuccess");
					}
					catch (Exception ex)
					{
						// Nếu có lỗi, rollback giao dịch
						transaction.Rollback();
						TempData["Message"] = $"Lỗi khi lưu đơn hàng: {ex.Message}";
						return RedirectToAction("PaymentFail");
					}
				}
			}
			catch (Exception ex)
			{
				TempData["Message"] = $"Lỗi khi xử lý thanh toán: {ex.Message}";
				return RedirectToAction("PaymentFail");
			}
		}
	}
}
