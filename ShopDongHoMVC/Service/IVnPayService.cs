﻿using ShopDongHoMVC.ViewModels;

namespace ShopDongHoMVC.Service
{
	public interface IVnPayService
	{
		string CreatePaymentUrl(HttpContext context, VnPaymentRequestModel model);
		VnPaymentResponseModel PaymentExecute(IQueryCollection collections);
	}
}
