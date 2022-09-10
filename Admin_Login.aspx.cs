using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Media;

public partial class Admin_Login : System.Web.UI.Page
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

    protected void Home_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?theme=" + Session["theme"]);
        
    }

    protected void Continue_Click(object sender, EventArgs e)
    {


        if (Request.Cookies["Password"].Value == txtPassword.Text)
            Response.Redirect("~/Editor.aspx?theme=" + Session["theme"]);
       
        else
            Response.Redirect("~/Default.aspx?theme=" + Session["theme"]);
    }

    protected void Run_Click(object sender, EventArgs e)
    {
      
        Response.Redirect("~/Default.aspx?theme=" + Session["theme"]);
       
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        string password = "Giygas199X";
        
        DateTime expiry = DateTime.Now.AddMinutes(5);
            this.SetResponseCookie("Password", password, expiry);

        


        
           

        txtPassword.Focus();

       
    }

     private void SetResponseCookie(string name, string value, DateTime expiry)
    {
        HttpCookie cookie = new HttpCookie(name, value);
        cookie.Expires = expiry;
        Response.Cookies.Add(cookie);
    }
}



     


      
   