using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShopDongHoMVC.Data;

namespace ShopDongHoMVC.Controllers
{
    public class CustomerManagerController : Controller
    {
        private readonly IKhachHangRepository _khachHangRepository;
        public CustomerManagerController(IKhachHangRepository khachHangRepository)
        {
            _khachHangRepository = khachHangRepository;
        }
        public async Task<IActionResult> Index()
        {
            var customers = await _khachHangRepository.GetAllAsync();
            return View(customers);
        }
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(KhachHang customer)
        {
            if (ModelState.IsValid)
            {
                await _khachHangRepository.AddAsync(customer);
                return RedirectToAction(nameof(Index));
            }
            return View(customer);
        }

        [HttpGet]
        public async Task<IActionResult> Edit(string id)
        {
            var customer = await _khachHangRepository.GetByIdAsync(id);
            return View(customer);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, KhachHang customer)
        {
            if (id != customer.MaKh)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    await _khachHangRepository.UpdateAsync(customer);
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!await CustomerExists(id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                return RedirectToAction(nameof(Index));
            }

            return View(customer);
        }

        [HttpGet]
        public async Task<IActionResult> Details(string id)
        {
            var customer = await _khachHangRepository.GetByIdAsync(id);
            return View(customer);
        }

        [HttpGet]
        public async Task<IActionResult> Delete(string id)
        {
            var customer = await _khachHangRepository.GetByIdAsync(id);
            return View(customer);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            await _khachHangRepository.DeleteAsync(id);
            return RedirectToAction(nameof(Index));
        }

        private async Task<bool> CustomerExists(string id)
        {
            var customer = await _khachHangRepository.GetByIdAsync(id);
            return customer != null;
        }
    }
}
