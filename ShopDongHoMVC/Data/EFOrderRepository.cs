using Microsoft.EntityFrameworkCore;

namespace ShopDongHoMVC.Data
{
    public class EFOrderRepository : IOrderRepository
    {
        private readonly DongHoShopMvcContext _context;

        public EFOrderRepository(DongHoShopMvcContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<HoaDon>> GetAllAsync()
        {
            return await _context.HoaDons
                .Include(h => h.MaKhNavigation)
                .Include(h => h.MaNvNavigation)
                .Include(h => h.MaTrangThaiNavigation)
                .ToListAsync();
        }

        public async Task<HoaDon> GetByIdAsync(int id)
        {
            return await _context.HoaDons
                .Include(h => h.MaKhNavigation)
                .Include(h => h.MaNvNavigation)
                .Include(h => h.MaTrangThaiNavigation)
                .FirstOrDefaultAsync(h => h.MaHd == id);
        }

        public async Task AddAsync(HoaDon order)
        {
            _context.HoaDons.Add(order);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(HoaDon order)
        {
            _context.HoaDons.Update(order);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(int id)
        {
            var order = await _context.HoaDons.FindAsync(id);
            if (order != null)
            {
                _context.HoaDons.Remove(order);
                await _context.SaveChangesAsync();
            }
        }
    }
}
