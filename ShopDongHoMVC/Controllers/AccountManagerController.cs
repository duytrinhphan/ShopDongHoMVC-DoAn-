using Microsoft.AspNetCore.Mvc;
using ShopDongHoMVC.Data;

namespace ShopDongHoMVC.Controllers
{
    public class AccountManagerController : Controller
    {
        private readonly IKhachHangRepository _userRepository;

        public AccountManagerController(IKhachHangRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<IActionResult> Index()
        {
            var users = await _userRepository.GetAllAsync();
            return View(users);
        }
        public async Task<IActionResult> Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(KhachHang user)
        {
            if (ModelState.IsValid)
            {
                await _userRepository.AddAsync(user);
                return RedirectToAction(nameof(Index));
            }
            return View(user);
        }

        public async Task<IActionResult> Edit(string id)
        {
            var user = await _userRepository.GetByIdAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            return View(user);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(string id, KhachHang user)
        {
            if (id != user.MaKh)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                await _userRepository.UpdateAsync(user);
                return RedirectToAction(nameof(Index));
            }

            return View(user);
        }

        public async Task<IActionResult> Details(string id)
        {
            var user = await _userRepository.GetByIdAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            return View(user);
        }

        public async Task<IActionResult> Delete(string id)
        {
            var user = await _userRepository.GetByIdAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            return View(user);
        }

        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            await _userRepository.DeleteAsync(id);
            return RedirectToAction(nameof(Index));
        }
    }
}
