namespace OfficeRoomBooking.Controllers
{
    using Room_Reservation.Context;
    using Room_Reservation.Models;
    using System;
    using System.Linq;
    using System.Web.Mvc;


    public class RoomController : Controller
    {
        Room_ReservationDbContext db = new Room_ReservationDbContext();

        public ActionResult Index()
        {
            var rooms = db.Rooms.ToList();

            return View(rooms);
        }

        public ActionResult Reserve(int id)
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Reserve(Reservation reservation)
        {
            reservation.UserAccountId = int.Parse(Session["Id"].ToString());
            //Check if there are future reservations and check if room iss reservated
            var reservedFrom = db.Reservations.AsEnumerable().Where(r => r.RoomId == reservation.RoomId).Select(r => r.ReservedFrom)
                .Where(t => t.Date.CompareTo(DateTime.Now) >= 0).ToList();
            var reservedTo = db.Reservations.AsEnumerable().Where(r => r.RoomId == reservation.RoomId).Select(r => r.ReservedTo)
                .Where(t => t.Date.CompareTo(DateTime.Now) >= 0).ToList();
            var toCheckReserveFrom = reservation.ReservedFrom;
            var toCheckReserveTo = reservation.ReservedTo;

            for (int i = 0; i < reservedFrom.Count; i++)
            {
                if (DateTime.Compare(reservedFrom[i], toCheckReserveFrom) <= 0 && DateTime.Compare(reservedTo[i], toCheckReserveFrom) >= 0)
                {
                    this.TempData["UnsuccesfulRes"] = "Room is not available for this period. For more information check room history.";
                    return View(reservation);
                }
                if (DateTime.Compare(reservedFrom[i], toCheckReserveTo) <= 0 && DateTime.Compare(reservedTo[i], toCheckReserveTo) >= 0)
                {
                    this.TempData["UnsuccesfulRes"] = "Room is not available for this period. For more information check room history.";
                    return View(reservation);
                }
            }

            try
            {
                db.Reservations.Add(reservation);
                db.SaveChanges();
                this.TempData["SuccesfulRes"] = "You succesfully reserved the room!";

                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                this.TempData["UnsuccesfulRes"] = "Problem occured with your reservation!";
                return View(reservation);
            }
        }

        public ActionResult History(int id)
        {
            var reservationHistory = db.Reservations.Where(r => r.Room.Id == id).ToList();
            return View(reservationHistory);
        }
    }
}