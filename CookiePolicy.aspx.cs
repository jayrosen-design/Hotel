using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CookiePolicy : System.Web.UI.Page
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
        //get firstname from cookie and set welcome message if it exists
        HttpCookie cookie = Request.Cookies["FirstName"];
        if (cookie == null)
            lblCookieStory.Text = " You opened the present. <br />There is a cookie inside! <br/>You walk away from the cookie.";
        
        if (cookie != null)
            lblCookieStory.Text = cookie.Value + " opened the present. <br />There is a Cookie inside! <br/>" + cookie.Value + " takes it.";

        cart = CartItemList.GetCart();

        if (Session["character"] == "Ness")
            character.ImageUrl = "Images/ness.png";

        if (Session["character"] == "Paula")
            character.ImageUrl = "Images/paula.png";

        if (Session["character"] == "Jeff")
            character.ImageUrl = "Images/jeff.png";

        if (Session["character"] == "Poo")
            character.ImageUrl = "Images/poo.png";
              
              
              
     


    }




    protected void btnNextPage_Click(object sender, EventArgs e)
    {
        //if cart contains items and user has selected an item...
        if (cart.Count > 0)
            Response.Redirect("~/CheckOut2.aspx?theme=" + Session["theme"]);
        else
            Response.Redirect("~/Order.aspx?theme=" + Session["theme"]);
           




       
    }

}