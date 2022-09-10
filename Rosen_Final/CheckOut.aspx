<%@ Page Title="Register" Language="C#" MasterPageFile="~/CheckOut.master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>
<%@ MasterType VirtualPath="~/CheckOut.master" %>

<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <!--
   COP2552 001: Object Oriented Programming 2
   Final Project
   Hotel

   Author: Jay Rosen
   Date: 12/10/2015

-->


    <!-- Javascript to play sounds when buttons are clicked -->
      <script>
          var wow = new Audio();
          wow.src = 'SFX/wow.wav';

          var eb_condition = new Audio();
          eb_condition.src = 'SFX/eb_condition.wav';

          var eb_newchar = new Audio();
          eb_newchar.src = 'SFX/eb_newchar.wav';

          var okdesuka = new Audio();
          okdesuka.src = 'SFX/okdesuka.wav';

          var psilearn = new Audio();
          psilearn.src = 'SFX/psilearn.wav';
</script>

    <!--container for form  -->
<section class="register">
      
    <!--  left column of form -->
    <div id="left">
        
        <!-- black rectange that contains Logo and message -->
     <div class="black-square field">
     <asp:ImageButton ID="Logo" AlternateText="Hotel" ImageUrl="~/Images/logo_white.gif" OnClick="Home_Click" onMouseDown="psilearn.play()" runat="server" style="margin-left: 90px; margin-top: 50px;"/>
        <br />
        <p>Please fill in all information to complete Hotel reservations.</p>
    </div>
      
<!-- Text field for first name with required validator  -->
 <div  class="black-square field">
     <h2>Name</h2>
<p>First &nbsp; <asp:TextBox ID="txtFirstName" runat="server" CssClass="entry"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="FirstName" runat="server" 
                    ErrorMessage="First name is required" ControlToValidate="txtFirstName" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
  &nbsp;  &nbsp; &nbsp;          
Last &nbsp;

    <!-- Text field for last name with required validator -->
       <asp:TextBox ID="txtLastName" runat="server" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LastName" runat="server" 
                    ErrorMessage="Last name is required" ControlToValidate="txtLastName" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator></p>   
    </div>

<!-- text field for email, required validator, and regular expression validator -->
    <div class="black-square field">
     <h2>Email Address</h2>
<p>E-mail &nbsp; <asp:TextBox ID="txtEmail1" runat="server" CssClass="entry"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="EmailAdress" runat="server" 
                    ErrorMessage="E-mail is required" ControlToValidate="txtEmail1" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="revtxtEmail1" runat="server"
                ErrorMessage="First email address" CssClass="validator" Display="Dynamic" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ControlToValidate="txtEmail1">Must be a valid email address
            </asp:RegularExpressionValidator>

  &nbsp;  &nbsp; &nbsp;          
Confirm  &nbsp;
    <!-- text field to compare email with a compare validator -->
       <asp:TextBox ID="txtEmail2" runat="server" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailAdress2" runat="server" 
                    ErrorMessage="E-mail is not the same" ControlToValidate="txtEmail2" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
     <asp:CompareValidator ID="cmvEmail2" runat="server" ErrorMessage="Second email address" 
                ControlToCompare="txtEmail1" ControlToValidate="txtEmail2" 
                CssClass="validator" Display="Dynamic">Must match first entry
            </asp:CompareValidator>
</p>   
  
    </div>
      
        <!-- Radio buttons that will change the Skin Theme of the website using Session state and query strings -->
        <!-- So far, Plain and Mint work, if there is time, Banana and Peanut can be coded too -->
   <div class="black-square field"> 
            <h2>Flavor</h2>
            
           <ul class="radio">
               <li>  <asp:RadioButton ID="radioPlain" runat="server" onMouseDown="wow.play()" GroupName="theme"/>Plain</li>
                <li> <asp:RadioButton ID="radioMint" runat="server" onMouseDown="wow.play()" GroupName="theme"/>Mint</li>
               <li> <asp:RadioButton ID="radioBanana" runat="server" onMouseDown="wow.play()" GroupName="theme"/>Banana</li>
               <li> <asp:RadioButton ID="radioPeanut" runat="server" onMouseDown="wow.play()" GroupName="theme"/>Peanut</li>
               </ul> 
            </div>

<!--  end of left column-->
</div>
    <!-- Right column of form  -->
    <div id="right">
        
       <div class="black-square field">
           
           <!-- Images of character avatars to pick form -->
             <ul id="characters">
            <li><img src="Images/ness.gif" width="150" height="150"/></li>
      <li><img src="Images/paula.gif" width="104" height="150" /></li>
       <li> <img src="Images/jeff.gif" width="150" height="150" /></li>
      <li> <img src="Images/poo.gif" width="98" height="150"/></li>
            </ul>
            
            
            <h2>Select a character</h2>
           
             <!-- Radio buttons to select avatar for user, which is saved in Session state -->
           <!-- Some other pages on the website will display the selected character in the scenes -->
           <ul class="radio">
               <li>  <asp:RadioButton ID="radioNess" runat="server" onMouseDown="eb_newchar.play()" GroupName="character" /></li>
                <li> <asp:RadioButton ID="radioPaula" runat="server" onMouseDown="eb_newchar.play()" GroupName="character"/></li>
               <li>  <asp:RadioButton ID="radioJeff" runat="server" onMouseDown="eb_newchar.play()"  GroupName="character"/></li>
               <li>  <asp:RadioButton ID="radioPoo" runat="server" onMouseDown="eb_newchar.play()" GroupName="character" /></li>
               </ul>
            
            </div> 

     <div class="black-square field" style="height: 320px;">

           <!--Textfield for address and required validator -->
         <h2>Home Address</h2>
<p>Street &nbsp; <asp:TextBox ID="txtAddress" runat="server" CssClass="entry"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="StreetAddress" runat="server" 
                    ErrorMessage="Address is required" ControlToValidate="txtAddress" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>

  &nbsp;  &nbsp; &nbsp;          
City &nbsp;
      <!--Text field for city and required validator -->
       <asp:TextBox ID="txtCity" runat="server" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="StreetCity" runat="server" 
                    ErrorMessage="City is required" ControlToValidate="txtCity" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator></p>   
         <br />
           <!--text field for State and required validator -->
 <p>State &nbsp; <asp:TextBox ID="txtState" runat="server" CssClass="entry"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="StreetState" runat="server" 
                    ErrorMessage="State is required" ControlToValidate="txtState" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>

  &nbsp;  &nbsp; &nbsp;          
Zipcode &nbsp;
       <!--text fieldf or zipcode with required and regular expression validator -->
       <asp:TextBox ID="txtZip" runat="server" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="StreetZip" runat="server" 
                    ErrorMessage="Zipcode is required" ControlToValidate="txtZip" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="revZipCode" runat="server" ControlToValidate="txtZip" CssClass="validator" ErrorMessage="Use this format: 99999 or 99999-9999" ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
 </p>  

<p>
         Phone Number &nbsp;
      <!-- text field for phone number with required and regular expression validator-->
       <asp:TextBox ID="txtPhone" runat="server" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PhoneNumber" runat="server" 
                    ErrorMessage="Phone Number is required" ControlToValidate="txtPhone" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone" CssClass="validator" ErrorMessage="Use this format: (555)-123-4567" ValidationExpression="\(?\d{3}\)?-? *\d{3}-? *-?\d{4}"></asp:RegularExpressionValidator>
 </p>  

  
    </div>


       

  <!--Button to confirm text entered, and save as cookie, continue to next page-->
 <div class="black-square field">
     <h2>Are you sure?</h2>
<p><asp:Button ID="btnContinue" runat="server" Text="Yep" CssClass="button" onMouseDown="okdesuka.play()" OnClick="btnContinue_Click" />
  
  &nbsp;  &nbsp; &nbsp;          
      <!--Button to reset form -->
<input id="Reset1" type="reset" value="Nope" onmousedown="eb_condition.play()"  class="button"/>   
  
          </div>        
    </div>
           
    </section>
      <!-- Flash music player for background music -->
    <div id="music">
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="165" height="38" id="niftyPlayer1" align="">
<param name="movie" value="niftyplayer.swf?file=Music/name_please.mp3&as=1"/>
<param name="quality" value="high"/>
<param name="bgcolor" value="#FFFFFF"/>
<embed src="niftyplayer.swf?file=Music/name_please.mp3&as=1" quality="high" bgcolor="#FFFFFF" width="165" height="38" name="niftyPlayer1" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>
</object>
    </div>
    </asp:Content>

