using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
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
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {


       

        //get firstname from cookie and set welcome message if it exists
        HttpCookie cookie = Request.Cookies["FirstName"];
        if (cookie == null)
            lblWelcome.Text = "Register";
  
         if (cookie != null)
                lblWelcome.Text =  cookie.Value;

        }

    protected void Home_Click(object sender, EventArgs e)
    {
       
        Response.Redirect("~/Default.aspx?theme=" + Session["theme"]);
        
    }

    protected void About_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/About.aspx?theme=" + Session["theme"]);
    }

    protected void Order_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Order.aspx?theme=" + Session["theme"]);
    }

    protected void Cart_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Cart.aspx?theme=" + Session["theme"]);
    }

    protected void Editor_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin_Login.aspx?theme=" + Session["theme"]);
    }
 


        //get first name from session state and set welcome message if it exists
        //string firstName = (string)Session["FirstName"];

        //if (firstName == null)
       // {
       //     lblWelcome.Text = "Login"; 
      //     
      //  }

        //if (firstName != null)
       // {
        //    lblWelcome.Text = (string)Session["FirstName"] ;
        //}


       

    } 

   

   
