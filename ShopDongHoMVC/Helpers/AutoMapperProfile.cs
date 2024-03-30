using AutoMapper;
using ShopDongHoMVC.Data;
using ShopDongHoMVC.ViewModels;

namespace ShopDongHoMVC.Helpers
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<RegisterVM, KhachHang>().ForMember(kh => kh.HoTen, option => option.MapFrom(RegisterVM => RegisterVM.HoTen));

        }
    }
}
