namespace Room_Reservation.Models
{
    using System.ComponentModel.DataAnnotations;

    public class UserAccount
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage ="You have to enter your first name to proceed with registration!")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "You have to enter your last name to proceed with registration!")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "You have to enter a user name to proceed with registration!")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "You enter a password to proceed with registration!")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Compare("Password",ErrorMessage ="Given passwords does not match!")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }

      //  public virtual List<ReservationModels> Reservations { get; set; }
    }
}