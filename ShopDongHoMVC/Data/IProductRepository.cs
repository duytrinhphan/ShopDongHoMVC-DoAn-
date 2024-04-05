using ShopDongHoMVC.Data;

namespace ShopDongHoMVC.Models
{
    public interface IProductRepository
    {
        Task<IEnumerable<HangHoa>> GetAllAsync();
        Task<HangHoa> GetByIdAsync(int id);
        Task AddAsync(HangHoa product);
        Task UpdateAsync(HangHoa product);
        Task DeleteAsync(int id);
    }
}
