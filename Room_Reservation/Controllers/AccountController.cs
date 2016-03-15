namespace Room_Reservation.Controllers
{
    using Room_Reservation.Context;
    using Room_Reservation.Models;
    using System.Linq;
    using System.Web.Mvc;

    public class AccountController : Controller
    {
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(UserAccount account)
        {
            if (ModelState.IsValid)
            {
                using (Room_ReservationDbContext db = new Room_ReservationDbContext())
                {
                    db.UserAccounts.Add(account);
                    db.SaveChanges();
                }
                ModelState.Clear();
                this.TempData["Register"] = "Thank you for using your services. You may now sign in.";
                return RedirectToAction("Index", "Home", new { area = "" });
            }
            return View();
        }

        public ActionResult LogIn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogIn(UserAccount user)
        {
            using (Room_ReservationDbContext db = new Room_ReservationDbContext())
            {
                var usr = db.UserAccounts.Where(u => u.UserName == user.UserName && u.Password == user.Password).FirstOrDefault();

                if (usr != null)
                {
                    Session["Id"] = usr.Id.ToString();
                    Session["UserName"] = usr.UserName.ToString();
                    return RedirectToAction("LoggedIn");
                }
                else
                {
                    ModelState.AddModelError("", "Incorrect username or password.");
                }
            }
            return View();
        }

        public ActionResult LoggedIn()
        {
            if (Session["Id"] != null)
            {
                return RedirectToAction("Index", "Room", new { area = "" });
            }
            else
            {
                return RedirectToAction("LogIn");
            }
        }

        public ActionResult LogOut()
        {
            Session.Clear();

            return RedirectToAction("Index", "Home",new { area= ""});
        }

    }
}