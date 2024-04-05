namespace ShopDongHoMVC.Data
{
    public interface IKhachHangRepository
    {
        Task<IEnumerable<KhachHang>> GetAllAsync();
        Task<KhachHang> GetByIdAsync(string id);
        Task AddAsync(KhachHang khachHang);
        Task UpdateAsync(KhachHang khachHang);
        Task DeleteAsync(string id);
    }
}
