using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckOut : System.Web.UI.Page
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
        if (Request.Cookies["FirstName"] != null)
           txtFirstName.Text = Request.Cookies["FirstName"].Value;
        if (Request.Cookies["LastName"] != null)
            txtLastName.Text = Request.Cookies["LastName"].Value;
        if (Request.Cookies["StreetAddress"] != null)
            txtAddress.Text = Request.Cookies["StreetAddress"].Value;
        if (Request.Cookies["StreetCity"] != null)
            txtCity.Text = Request.Cookies["StreetCity"].Value;
        if (Request.Cookies["StreetState"] != null)
            txtState.Text = Request.Cookies["StreetState"].Value;
        if (Request.Cookies["StreetZip"] != null)
            txtZip.Text = Request.Cookies["StreetZip"].Value;
        if (Request.Cookies["EmailAddress"] != null)
            txtEmail1.Text = Request.Cookies["EmailAddress"].Value;
        if (Request.Cookies["PhoneNumber"] != null)
            txtPhone.Text = Request.Cookies["PhoneNumber"].Value;

        txtFirstName.Focus();

        //get entry data from session state
        //if (!IsPostBack)
       // {
         //   string firstName = (string)Session["FirstName"];
          //  if (firstName != null) txtFirstName.Text = (string)Session["FirstName"];

         //   string lastName = (string)Session["FirstName"];
         //   if (lastName != null) txtLastName.Text = (string)Session["LastName"];

          //  string streetAddress = (string)Session["StreetAddress"];
         //   if (streetAddress != null) txtAddress.Text = (string)Session["StreetAddress"];

          //  string streetCity = (string)Session["StreetCity"];
          //  if (streetCity != null) txtCity.Text = (string)Session["StreetCity"];

         //   string streetState = (string)Session["StreetState"];
         //   if (streetState != null) txtState.Text = (string)Session["StreetState"];

         //   string streetZip = (string)Session["StreetZip"];
          //  if (streetZip != null) txtZip.Text = (string)Session["StreetZip"];

          //  string emailAddress = (string)Session["EmailAddress"];
         //   if (emailAddress != null) txtEmail2.Text = (string)Session["EmailAddress"];
         //   
            
         

        //}      
    }    
  

    protected void radioPlain_CheckedChanged(object sender, EventArgs e)
    {
        Session["theme"] = "Plain";
        Page.Theme = "Plain";
    }


    protected void radioMint_CheckedChanged(object sender, EventArgs e)
    {
        Session["theme"] = "Mint";
        Page.Theme = "Mint";
    }

    protected void radioBanana_CheckedChanged(object sender, EventArgs e)
    {
        Session["theme"] = "Banana";
        Page.Theme = "Banana";
    }

    protected void radioPeanut_CheckedChanged(object sender, EventArgs e)
    {
        Session["theme"] = "Peanut";
        Page.Theme = "Peanut";
    }

    //Character choice
    protected void radioNess_CheckedChanged(object sender, EventArgs e)
    {
        Session["character"] = "Ness";
    }


    protected void radioPaula_CheckedChanged(object sender, EventArgs e)
    {
        Session["character"] = "Paula";
    }
    protected void radioJeff_CheckedChanged(object sender, EventArgs e)
    {
        Session["character"] = "Jeff";
    }


    protected void radioPoo_CheckedChanged(object sender, EventArgs e)
    {
        Session["character"] = "Poo";
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        this.LoadCustomerData();

        if (radioPlain.Checked)
        {
            Session["theme"] = "Plain";
           
        }
        if (radioMint.Checked)
        {
            Session["theme"] = "Mint";
           
        }

        if (radioBanana.Checked)
        {
            Session["theme"] = "Banana";

        }

        if (radioPeanut.Checked)
        {
            Session["theme"] = "Peanut";

        }

        if (radioNess.Checked)
        {
            Session["character"] = "Ness";

        }
        if (radioPaula.Checked)
        {
            Session["character"] = "Paula";

        }

        if (radioJeff.Checked)
        {
            Session["character"] = "Jeff";

        }
        if (radioPoo.Checked)
        {
            Session["character"] = "Poo";

        }


        Response.Redirect("~/CookiePolicy.aspx?theme=" + Session["theme"]);
    }

    private void LoadCustomerData()
    {
        // load data in session state object
    //   Session["FirstName"] = txtFirstName.Text;
    //    Session["LastName"] = txtLastName.Text;
    //    Session["StreetAddress"] = txtAddress.Text;
   //     Session["StreetCity"] = txtCity.Text;
   //     Session["StreetState"] = txtState.Text;
    //    Session["StreetZip"] = txtZip.Text;
    //    Session["EmailAddress"] = txtEmail2.Text;


        //load same data in cookies with 5 minute expiration
        if (Page.IsValid)
        {
            DateTime expiry = DateTime.Now.AddMinutes(5);
            this.SetResponseCookie("FirstName", txtFirstName.Text, expiry);
            this.SetResponseCookie("LastName", txtLastName.Text, expiry);
            this.SetResponseCookie("StreetAddress", txtAddress.Text, expiry);
            this.SetResponseCookie("StreetCity", txtCity.Text, expiry);
            this.SetResponseCookie("StreetState", txtState.Text, expiry);
            this.SetResponseCookie("StreetZip", txtZip.Text, expiry);
            this.SetResponseCookie("EmailAddress", txtEmail1.Text, expiry);
            this.SetResponseCookie("PhoneNumber", txtPhone.Text, expiry);  
        }


  }
    private void SetResponseCookie(string name, string value, DateTime expiry)
    {
        HttpCookie cookie = new HttpCookie(name, value);
        cookie.Expires = expiry;
        Response.Cookies.Add(cookie);
    }
}