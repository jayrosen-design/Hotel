using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class CheckOut3 : System.Web.UI.Page
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



    private CartItemList cart;


    protected void Page_Load(object sender, EventArgs e)
    {
        //retrieve cart object from session state on every post back
        cart = CartItemList.GetCart();

        //on initial page load, add cart items to list control
        if (!IsPostBack)
            this.DisplayCart();






        string message =
       "Contact information\n" +
       "    Email: " + Request.Cookies["EmailAddress"].Value + "\n" +
       "    First name: " + Request.Cookies["FirstName"].Value + "\n" +
       "    Last name: " + Request.Cookies["LastName"].Value + "\n" +

       "Shipping address\n" +
       "    Address: " + Request.Cookies["StreetAddress"].Value + "\n" +
       "    City: " + Request.Cookies["StreetCity"].Value + "\n" +
       "    State: " + Request.Cookies["StreetState"].Value + "\n" +
       "    Zip code: " + Request.Cookies["StreetZip"].Value + "\n";
        ;

        txtData.Text = message;





    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        //if cart contains items and user has selected an item...
        if (cart.Count > 0)
        {
            if (lstCart.SelectedIndex > -1)
            {
                //remove selected item from cart and re-add cart items
                cart.RemoveAt(lstCart.SelectedIndex);
                this.DisplayCart();

            }
            else
            {//if no item is selected, notify user 
                lblMessage.Text = "Please select an item to remove.";
            }

        }
    }

    private void getTotal()
    {
        decimal tempValue = 0; //initialize tempValue
        //parse through cart 
        for (int i = 0; i < cart.Count; i++)
        {
            //each item set, get price and update tempValue
            tempValue = this.cart[i].SumPrice(this.cart[i].Room, this.cart[i].Quantity, this.cart[i].startDate, this.cart[i].endDate) + tempValue;
        }
        tempValue = Math.Round(tempValue, 2, MidpointRounding.AwayFromZero);
        lblTotal.Text = "$" + tempValue.ToString();
    }




    private void DisplayCart()
    {
        //remove all current items from list control
        lstCart.Items.Clear();


        this.getTotal();

        //loop through cart and add each item's display value to the control
        for (int i = 0; i < cart.Count; i++)
        {
            lstCart.Items.Add(this.cart[i].Display());
        }



       

        lblCount.Text = cart.Count.ToString();


        //get firstname from cookie and set welcome message if it exists
        HttpCookie cookie = Request.Cookies["FirstName"];
        if (cookie == null)
            lblConfront.Text = "You confront Hotel Concierge";

        if (cookie != null)
            lblConfront.Text = cookie.Value + " confronts Hotel Concierge";


    }


    //Confirming to place order
    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        if (cart.Count == 0)
        {
            lblMessage.Text = "Your cart is empty! Select a hotel to start vacation!";
            Response.Redirect("~/Default.aspx?theme=" + Session["theme"]);
        }
        else

       //Empty cart
            cart.Clear();
            lstCart.Items.Clear();
        
            Response.Redirect("~/Confirmation.aspx?theme=" + Session["theme"]);
       
    }
}