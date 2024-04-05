using Microsoft.EntityFrameworkCore;
using ShopDongHoMVC.Data;

namespace ShopDongHoMVC.Models
{
    public class EFProductRepository : IProductRepository
    {
        private readonly DongHoShopMvcContext _context;
        public EFProductRepository(DongHoShopMvcContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<HangHoa>> GetAllAsync()
        {
            return await _context.HangHoas.Include(p => p.MaLoaiNavigation).ToListAsync();
        }
        public async Task<HangHoa> GetByIdAsync(int id)
        {
            return await _context.HangHoas.FindAsync(id);
        }
        public async Task AddAsync(HangHoa product)
        {
            _context.HangHoas.Add(product);
            await _context.SaveChangesAsync();
        }
        public async Task UpdateAsync(HangHoa product)
        {
            _context.HangHoas.Update(product);
            await _context.SaveChangesAsync();
        }
        public async Task DeleteAsync(int id)
        {
            var product = await _context.HangHoas.FindAsync(id);
            _context.HangHoas.Remove(product);
            await _context.SaveChangesAsync();
        }
    }
}
