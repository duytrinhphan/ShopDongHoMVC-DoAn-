using Microsoft.EntityFrameworkCore;
using ShopDongHoMVC.Data;
using ShopDongHoMVC.Models;

namespace BTTuan3.Models
{
    public class EFCategoryRepository: ICategoryReposity
    {
        private readonly DongHoShopMvcContext _context;

        public EFCategoryRepository(DongHoShopMvcContext context)
        {
            _context = context;
        }

        public async Task AddAsync(Loai category)
        {
            _context.Loais.Add(category);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(int id)
        {
            var category = await _context.Loais.FindAsync(id);
            _context.Loais.Remove(category);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Loai>> GetAllAsync()
        {
            return await _context.Loais.ToListAsync();
        }

        public async Task<Loai> GetByIdAsync(int id)
        {
            return await _context.Loais.FindAsync(id);
        }

        public async Task UpdateAsync(Loai category)
        {
            _context.Loais.Update(category);
            await _context.SaveChangesAsync();
        }
    }
}
