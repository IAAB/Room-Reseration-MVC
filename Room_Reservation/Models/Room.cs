namespace Room_Reservation.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Room
    {
        public Room()
        {
            this.Reservations = new HashSet<Reservation>();
        }

        [Key]
        public int Id { get; set; }
        [MaxLength(20)]
        public string Name { get; set; }

        public int Capacity { get; set; }

        public bool HasTV { get; set; }

        public bool HasProjector { get; set; }

        public virtual ICollection<Reservation> Reservations { get; set; }
    }
}