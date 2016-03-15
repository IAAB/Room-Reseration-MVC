namespace Room_Reservation.Context
{
    using Room_Reservation.Models;
    using System.Data.Entity;

    public class Room_ReservationDbContext : DbContext
    {
        public DbSet<UserAccount> UserAccounts { get; set; }

        public DbSet<Room> Rooms { get; set; }

        public DbSet<Reservation> Reservations { get; set; }
    }
}