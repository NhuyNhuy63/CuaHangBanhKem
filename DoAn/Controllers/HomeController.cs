using DoAn.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace DoAn.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
   
        public IActionResult Index()
        {
   
            return View();
        }

        public IActionResult Privacy()
        {
  
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        //// Trang Contact.aspx.cs
        //public IActionResult Login()
        //{
        //    GetInfo();
        //    return View();

        //}
        //[HttpPost]
        //public IActionResult Login(string email, string matkhau)
        //{
        //    var kh = _context.Khachhang.FirstOrDefault(k => k.Email == email);
        //    if (kh != null && _pwHasher.VerifyHashedPassword(kh, kh.MatKhau, matkhau) == PasswordVerificationResult.Success)
        //    {
        //        // dung session de lu tt ng vua dang nhap
        //        HttpContext.Session.SetString("khachhang", email);
        //        // chuyen huong ve 1 view
        //        return RedirectToAction(nameof(Customer));
        //    }
        //    return RedirectToAction(nameof(Login));

        //}
        //public IActionResult Customer()
        //{
        //    GetInfo();
        //    return View();

        //}
        //public IActionResult Logout()
        //{
        //    HttpContext.Session.SetString("khachhang", "");
        //    GetInfo();
        //    return RedirectToAction(nameof(Index));

        //}
        ////get
        //public IActionResult Register()
        //{
        //    GetInfo();
        //    return View();

        //}
        //[HttpPost]
        //public IActionResult Register(string email, string matkhau, string hoten, string dienthoai)
        //{
        //    var kh = new Khachhang();
        //    kh.Email = email;
        //    kh.MatKhau = _pwHasher.HashPassword(kh, matkhau); // can ma hoa
        //    kh.Ten = hoten;
        //    kh.DienThoai = dienthoai;

        //    _context.Add(kh);
        //    _context.SaveChanges();
        //    //yeu cau login
        //    return RedirectToAction(nameof(Login));



        //}

    }
       
}
