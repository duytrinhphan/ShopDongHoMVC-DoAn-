using ShopDongHoMVC.Data;

namespace ShopDongHoMVC.Models
{
    public interface ICategoryReposity
    {
        Task<IEnumerable<Loai>> GetAllAsync();
        Task<Loai> GetByIdAsync(int id);
        Task AddAsync(Loai category);
        Task UpdateAsync(Loai category);
        Task DeleteAsync(int id);
    }
}
