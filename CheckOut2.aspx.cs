using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




public partial class CheckOut2 : System.Web.UI.Page
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

    protected void Page_Load(object sender, EventArgs e)
    {
        // get entry data from cookies
       
        if (Request.Cookies["StreetAddress"] != null)
            txtAddress.Text = Request.Cookies["StreetAddress"].Value;
        if (Request.Cookies["StreetCity"] != null)
            txtCity.Text = Request.Cookies["StreetCity"].Value;
        if (Request.Cookies["StreetState"] != null)
            txtState.Text = Request.Cookies["StreetState"].Value;
        if (Request.Cookies["StreetZip"] != null)
            txtZip.Text = Request.Cookies["StreetZip"].Value;
        if (Request.Cookies["CSV"] != null)
            txtCSV.Text = Request.Cookies["CSV"].Value;
        if (Request.Cookies["CreditExpiration"] != null)
            txtExpiration.Text = Request.Cookies["CreditExpiration"].Value;
        if (Request.Cookies["Credit"] != null)
            txtCredit.Text = Request.Cookies["Credit"].Value;
       
     
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        this.LoadCustomerData();
        Response.Redirect("~/CheckOut3.aspx?theme=" + Session["theme"]);
    }


    private void LoadCustomerData()
    {
        


        //load same data in cookies with 5 minute expiration
        if (Page.IsValid)
        {
            DateTime expiry = DateTime.Now.AddMinutes(5);
          
            this.SetResponseCookie("StreetAddress", txtAddress.Text, expiry);
            this.SetResponseCookie("StreetCity", txtCity.Text, expiry);
            this.SetResponseCookie("StreetState", txtState.Text, expiry);
            this.SetResponseCookie("StreetZip", txtZip.Text, expiry);
            this.SetResponseCookie("Credit", txtCredit.Text, expiry);
            this.SetResponseCookie("Expiration", txtExpiration.Text, expiry);
            this.SetResponseCookie("CSV", txtCSV.Text, expiry);
        }


    }
    private void SetResponseCookie(string name, string value, DateTime expiry)
    {
        HttpCookie cookie = new HttpCookie(name, value);
        cookie.Expires = expiry;
        Response.Cookies.Add(cookie);
    }
}