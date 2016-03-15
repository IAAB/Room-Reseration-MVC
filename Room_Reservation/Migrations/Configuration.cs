namespace Room_Reservation.Migrations
{
    using Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<Room_Reservation.Context.Room_ReservationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationDataLossAllowed = true;
            AutomaticMigrationsEnabled = true;
            ContextKey = "Room_Reservation.Context.Room_ReservationDbContext";
        }

        protected override void Seed(Room_Reservation.Context.Room_ReservationDbContext context)
        {
            
        }
    }
}
