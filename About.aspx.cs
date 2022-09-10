using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["character"] == "Ness")
            character.ImageUrl = "Images/ness.png";
        
        if (Session["character"] == "Paula")
            character.ImageUrl = "Images/paula.png";

        if (Session["character"] == "Jeff")
            character.ImageUrl = "Images/jeff.png";

        if (Session["character"] == "Poo")
            character.ImageUrl = "Images/poo.png";
    }
}