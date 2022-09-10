<%@ Page Title="Register" Language="C#" MasterPageFile="~/CheckOut.master" AutoEventWireup="true" CodeFile="CheckOut2.aspx.cs" Inherits="CheckOut2" %>
<%@ MasterType VirtualPath="~/CheckOut.master" %>

   
<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
   <!--
   COP2552 001: Object Oriented Programming 2
   Final Project
   Hotel

   Author: Jay Rosen
   Date: 12/10/2015

-->  
     <!--JavaScript to play sounds when buttons are clicked -->
      <script>
          var eb_condition = new Audio();
          eb_condition.src = 'SFX/eb_condition.wav';

          var enterbattle = new Audio();
          enterbattle.src = 'SFX/enterbattle.wav';

          var okdesuka = new Audio();
          okdesuka.src = 'SFX/okdesuka.wav';

          var psilearn = new Audio();
          psilearn.src = 'SFX/psilearn.wav';
        </script>
    
      <!-- wrapper for form-->
<section class="register">
        <!--form left column -->
    <div id="left">
          <!-- black square containing logo and message -->
     <div class="black-square field">
      <asp:ImageButton ID="Logo" AlternateText="Hotel" ImageUrl="~/Images/logo_white.gif"   OnClick="Home_Click" runat="server" onMouseDown="psilearn.play()" style="margin-left: 90px; margin-top: 50px;"/>
        <br />
        <p>Please fill in the billing information to complete hotel reservation.</p>
    </div>
      

     
      
     
     <div class="black-square field">
           <!-- text field for address and required validator -->
         <h2>Billing Address</h2>
<p>Street &nbsp; <asp:TextBox ID="txtAddress" runat="server" CssClass="entry"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="StreetAddress" runat="server" 
                    ErrorMessage="Address is required" ControlToValidate="txtAddress" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>

  &nbsp;  &nbsp; &nbsp;          
City &nbsp;
      <!-- text field for city and required validator -->
       <asp:TextBox ID="txtCity" runat="server" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="StreetCity" runat="server" 
                    ErrorMessage="City is required" ControlToValidate="txtCity" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator></p>   
         <br />
           <!--text field for state and required validator -->
 <p>State &nbsp; <asp:TextBox ID="txtState" runat="server" CssClass="entry"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="StreetState" runat="server" 
                    ErrorMessage="State is required" ControlToValidate="txtState" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>

  &nbsp;  &nbsp; &nbsp;          
Zipcode &nbsp;
       <!-- text field for zipcode and required validator-->
       <asp:TextBox ID="txtZip" runat="server" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="StreetZip" runat="server" 
                    ErrorMessage="Zipcode is required" ControlToValidate="txtZip" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator></p>  
  
    </div>

</div>
      <!-- right column of form-->
    <div id="right">
        
    <div class="black-square field">
     <h2>Electronic Payment</h2>

          <!-- text field for credit card with required and regular expression validator -->
<p>Credit Card &nbsp; <asp:TextBox ID="txtCredit" runat="server" CssClass="entry"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="Credit" runat="server" 
                    ErrorMessage="Credit card is required" ControlToValidate="txtCredit" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revtxtCredit" runat="server"
                ErrorMessage="Invalid Credit Card" CssClass="validator" Display="Dynamic" 
                ValidationExpression="\d{16}" 
                ControlToValidate="txtCredit">Must be a valid credit card number (16 digits)
            </asp:RegularExpressionValidator>
</p><br />

<p>       
Expiration  &nbsp;
      <!-- text field for expiration date with required, regular expression, and compare validator  -->
       <asp:TextBox ID="txtExpiration" runat="server" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Expiration" runat="server" 
                    ErrorMessage="Expiration date is required" ControlToValidate="txtExpiration" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator> 
      <asp:RegularExpressionValidator ID="revtxtExpiration" runat="server"
                ErrorMessage="Invalid date " CssClass="validator" Display="Dynamic" 
                ValidationExpression="\d{2}-\d{4}" 
                ControlToValidate="txtExpiration">Must be a valid date in format "MM-YYYY"
            </asp:RegularExpressionValidator>
      <!-- Compare validator for TimeDate to be codeded here to check if expiration date is past due-->

</p> <br />

      <p>      
CSV  &nbsp;
            <!-- text field for security code with required and regular expression validator -->
       <asp:TextBox ID="txtCSV" runat="server" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="CSVee" runat="server" 
                    ErrorMessage="Security Code is required" ControlToValidate="txtCSV" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="revtxtCSV" runat="server"
                ErrorMessage="Invalid Credit Card" CssClass="validator" Display="Dynamic" 
                ValidationExpression="\d{3}" 
                ControlToValidate="txtCSV">Must be a valid number (3 digits)
            </asp:RegularExpressionValidator>
      </p>   
  
    </div>


 <div class="black-square field">
     <h2>Are you sure?</h2>
       <!-- button to continue to next page, the last checkout step -->
<p><asp:Button ID="btnContinue" runat="server" Text="Yep" CssClass="button"  OnClick="btnContinue_Click" onMouseDown="enterbattle.play()" />
   
  &nbsp;  &nbsp; &nbsp;      
      <!-- button to reset form fields -->    
<input id="Reset1" type="reset" value="Nope" onmousedown="eb_condition.play()" class="button"/></p>   
  
    </div>
          
    </div>
     
    </section>
      <!--Flash music player for background music -->
    <div id="music">
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="165" height="38" id="niftyPlayer1" align="">
<param name="movie" value="niftyplayer.swf?file=Music/buy_something.mp3&as=1"/>
<param name="quality" value="high"/>
<param name="bgcolor" value="#FFFFFF"/>
<embed src="niftyplayer.swf?file=Music/buy_something.mp3&as=1" quality="high" bgcolor="#FFFFFF" width="165" height="38" name="niftyPlayer1" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>
</object>
    </div>
    </asp:Content>

