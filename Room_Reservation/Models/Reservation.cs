namespace Room_Reservation.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;


    public class Reservation
    {
        //TOD check if private work for you
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "You have to enter date and hour for reservation start!")]
        public DateTime ReservedFrom { get; set; }

        [Required(ErrorMessage = "You have to enter date and hour for reservation ends!")]
        [DataType(DataType.DateTime)]
        public DateTime ReservedTo { get; set; }

        public int RoomId { get; set; }

        public virtual Room Room { get; set; }

        public int UserAccountId { get; set; }

        public virtual UserAccount UserAccount { get; set; }
    }
}