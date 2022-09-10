using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Confirmation : System.Web.UI.Page
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
            lblCookieStory.Text = " You successfully booked a Hotel. <br/> YOU WON !";

        if (cookie != null)
        {
            string CAPS = cookie.Value.ToUpper();

            lblCookieStory.Text = cookie.Value + " successfully booked a Hotel. <br/> " + CAPS + " WON !";
        }
        cart = CartItemList.GetCart();

        if (Session["character"] == "Ness")
            character.ImageUrl = "Images/ness.gif";

        if (Session["character"] == "Paula")
            character.ImageUrl = "Images/paula.gif";

        if (Session["character"] == "Jeff")
            character.ImageUrl = "Images/jeff.gif";

        if (Session["character"] == "Poo")
            character.ImageUrl = "Images/poo.gif";






    }




    protected void btnNextPage_Click(object sender, EventArgs e)
    {
       
            Response.Redirect("~/Default.aspx?theme=" + Session["theme"]);
       





    }

}