using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Caching;


public partial class Order : System.Web.UI.Page
{

    protected void Page_PreInit(object sender, EventArgs e)
    {
        switch (Request.QueryString["theme"])
        {
            case "Plain":
                Page.Theme = "Plain";
                break;
            case "Mint":
                Page.Theme = "Mint";
                break;
            case "Banana":
                Page.Theme = "Banana";
                break;
            case "Peanut":
                Page.Theme = "Peanut";
                break;
        }
    }

    private Room selectedRoom;

    protected void Page_Load(object sender, EventArgs e)
    {
        //bind drop-down list on first load
        //get and show Room on every load
        if (!IsPostBack) ddlRooms.DataBind();
        selectedRoom = this.GetSelectedRoom();
        lblName.Text = selectedRoom.Name;
        lblShortDescription.Text = selectedRoom.ShortDescription;
        lblLongDescription.Text = selectedRoom.LongDescription;
        lblRoomPrice.Text = selectedRoom.RoomPrice.ToString("c") + " each";
        imgProduct.ImageUrl = "Images/Products/" + selectedRoom.ImageFile;


        // Change the color for calandars.


        

        Calendar1.BackColor = System.Drawing.Color.Black;
        Calendar1.ForeColor = System.Drawing.Color.White;
        Calendar1.TitleStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#7527df");
        Calendar1.TitleStyle.ForeColor = System.Drawing.Color.White;
        Calendar1.SelectedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#7527df");

        Calendar2.BackColor = System.Drawing.Color.Black;
        Calendar2.ForeColor = System.Drawing.Color.White;
        Calendar2.TitleStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#7527df");
        Calendar2.TitleStyle.ForeColor = System.Drawing.Color.White;
        Calendar2.SelectedDayStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#7527df");

      

        if (Session["character"] == "Ness")
            character.ImageUrl = "Images/ness.png";
        
        if (Session["character"] == "Paula")
            character.ImageUrl = "Images/paula.png";

        if (Session["character"] == "Jeff")
            character.ImageUrl = "Images/jeff.png";

        if (Session["character"] == "Poo")
            character.ImageUrl = "Images/poo.png";


    }
    private Room GetSelectedRoom()
    {
        //Get row from SQLDataSource based on value in dropdown list
        DataView RoomsTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        RoomsTable.RowFilter = string.Format("roomID = '{0}'", ddlRooms.SelectedValue);
        DataRowView row = (DataRowView)RoomsTable[0];

        //create a new Room object and load with data from row
        Room r = new Room();
        r.roomID = row["roomID"].ToString();
        r.Name = row["Name"].ToString();
        r.ShortDescription = row["ShortDescription"].ToString();
        r.LongDescription = row["LongDescription"].ToString();
        r.RoomPrice = (decimal)row["RoomPrice"];
        r.ImageFile = row["ImageFile"].ToString();
        return r;
    }




    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //get cart from session state and selected item from cart
            CartItemList cart = CartItemList.GetCart();
            CartItem cartItem = cart[selectedRoom.roomID];

            //if item is't in cart, add it; otherwise, increase its quantity
            if (cartItem == null)
            {
                cart.AddItem(selectedRoom, Convert.ToInt32(txtQuantity.Text), Convert.ToDateTime(Calendar1.SelectedDate), Convert.ToDateTime(Calendar2.SelectedDate));
            }
            else
            {
                cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text), Convert.ToDateTime(Calendar1.SelectedDate), Convert.ToDateTime(Calendar2.SelectedDate));

            }
            Response.Redirect("Cart.aspx");
        }
    }
}
