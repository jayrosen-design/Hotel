using System;

public class CartItem
{
    public CartItem() { }

    public CartItem(Room room, int quantity, DateTime startDate, DateTime endDate)
    {
        this.Room = room;
        this.Quantity = quantity;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Room Room { get; set; }
    public int Quantity { get; set; }
    public DateTime startDate { get; set; }
    public DateTime endDate { get; set; }

    public void AddQuantity(int quantity, DateTime startDate, DateTime endDate)
    {
        this.Quantity += quantity;
        this.startDate = startDate;
        this.endDate = endDate;
    }


    //Calculate Sum Price (Price * Quantity)
    public decimal SumPrice(Room room, int quantity, DateTime startDate, DateTime endDate)
    {

        // Difference in days, hours, and minutes.
        TimeSpan ts = endDate - startDate;
        // Difference in days.
        int Days = ts.Days;

        decimal Sum = (Room.RoomPrice * Quantity) * Days;
        return Sum;

    }

    public int SumDays(){

        // Difference in days, hours, and minutes.
        TimeSpan ts = endDate - startDate;
        // Difference in days.
        int Days = ts.Days;
       

        return Days;

}



    public string Display()
    {
        DateTime tempDate1 = startDate.Date;
        DateTime tempDate2 = endDate.Date;

        string displayString = " " + Quantity.ToString() + " " +
            Room.Name + " (" + tempDate1.ToString("d") + "-" + tempDate2.ToString("d") + ") " + "\n@ " + Room.RoomPrice.ToString("c") + " per day = $" + SumPrice(Room, Quantity, tempDate1, tempDate2).ToString("#.##") + " ";

        return displayString;
    }



}