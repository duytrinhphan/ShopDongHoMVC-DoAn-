using System.Text;

namespace ShopDongHoMVC.Helpers
{
    public class Util
    {
        public static string UpLoadHinh(IFormFile hinh, string folder)
        {
            try
            {
                var FullPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Hinh", folder, hinh.FileName);
                using (var myfile = new FileStream(FullPath, FileMode.CreateNew))
                {
                    hinh.CopyTo(myfile);
                }

                return hinh.FileName;
            }
            catch (Exception ex)
            {
                return string.Empty;
            }
        }
        public static string GenerateRandomKey(int length = 5)
        {
            var pattern =
                "qwerrtttrrerttrrtrerRTHUHFFHJKKKKLLJJJLL!";

            var sb = new StringBuilder();
            var rd = new Random();
            for (int i = 0; i < length; i++)
            {
                sb.Append(pattern[rd.Next(0, pattern.Length)]);
            }

            return sb.ToString();
        }
    }
}
