namespace ShopDongHoMVC.Data
{
    public interface IOrderRepository
    {
        Task<IEnumerable<HoaDon>> GetAllAsync();
        Task<HoaDon> GetByIdAsync(int id);
        Task AddAsync(HoaDon order);
        Task UpdateAsync(HoaDon order);
        Task DeleteAsync(int id);
    }
}
