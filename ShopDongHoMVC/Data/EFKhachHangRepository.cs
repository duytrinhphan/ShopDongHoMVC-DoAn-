using Microsoft.EntityFrameworkCore;

namespace ShopDongHoMVC.Data
{
    public class EFKhachHangRepository : IKhachHangRepository
    {
        private readonly DongHoShopMvcContext _context;

        public EFKhachHangRepository(DongHoShopMvcContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<KhachHang>> GetAllAsync()
        {
            return await _context.KhachHangs.ToListAsync();
        }

        public async Task<KhachHang> GetByIdAsync(string id)
        {
            return await _context.KhachHangs.FindAsync(id);
        }

        public async Task AddAsync(KhachHang khachHang)
        {
            _context.KhachHangs.Add(khachHang);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(KhachHang khachHang)
        {
            _context.KhachHangs.Update(khachHang);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(string id)
        {
            var khachHang = await _context.KhachHangs.FindAsync(id);
            _context.KhachHangs.Remove(khachHang);
            await _context.SaveChangesAsync();
        }
    }
}
