<%@ Page Title="Your Shopping Cart" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CheckOut3.aspx.cs" Inherits="CheckOut3" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <!--
   COP2552 001: Object Oriented Programming 2
   Final Project
   Hotel

   Author: Jay Rosen
   Date: 12/10/2015

-->
    
    <link href="Styles/Cart.css" rel="stylesheet" />
   
      <!--Hide the button hints for buttons not being used -->
     <style>        .hint {
            display: none;
        }
    </style>

      <!-- JavaScript to play sounds when buttons are clicked-->
      <!-- JavaScript function to disable to X and Y button from possibly breaking program if clicked-->
    <script>
        var die = new Audio();
        die.src = 'SFX/die.wav';

        var smash = new Audio();
       smash.src = 'SFX/smash.wav';

       function btn_disable()
       {
           document.getElementById("btnX").disabled = true;
           document.getElementById("btnY").disabled = true;
       }

</script>
         
</asp:Content>

   
<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
<section class="content">
  
      <!--background image is animated -->
    <div id="bg">
  <img src="Images/CoffeeBreak.gif" />
</div>

  
  <div style="position: relative;height: 400px; width: 800px; margin-left: 22%; top:-250px;">
      <!--black square with message that will display user name if in cookie -->
       <div class="encounter">
           <p><asp:Label ID="lblConfront" runat="server"></asp:Label><span> ...</span></p>
       </div>
             <!--display the cart items in a listbox -->
            <asp:ListBox ID="lstCart" runat="server" style="height:200px;">
            </asp:ListBox>
        <!-- display the user data stored in cookies-->
      <asp:TextBox ID="txtData" runat="server" TextMode="MultiLine" Columns="50" Rows="20" style="height: 300px;">
            </asp:TextBox>
      
        <!-- photo image of videogame controler -->
      <img src="Images/SNES-hand.png" />

        <!--the user interface for videogame controller buttons -->
      <table class="controller">
      <tr><td>&nbsp;</td>
            <!-- X button is shown but it is disabled by javascript-->
           <td><asp:Button ID="btnX" runat="server" Text="X" CssClass="button" OnClientClick="return btn_disable"/></td>
          <td>&nbsp;</td>
        </tr>
          <tr>
                <!--Y button is shown but it is disabled by javascript -->
              <td><asp:Button ID="btnY" runat="server" Text="Y" CssClass="button" OnClientClick="return btn_disable"  /></td>
              <td>&nbsp;</td>
                <!--A Button to Confirm information on page and go to Confirmation page-->
              <td><asp:Button  ID="btnCheckOut" runat="server" Text="A" CssClass="button" OnClick="btnCheckOut_Click" onMouseDown="smash.play()"/></td>
          </tr>
           <tr><td>&nbsp;</td>   
                 <!-- B button to go back to cart-->
                <td><asp:Button ID="btnContinue" runat="server" Text="B" CssClass="button"  PostBackUrl="~/Cart.aspx" onMouseDown="die.play()" /></td>
               <td>&nbsp;</td>
        </tr>
          </table>

        <!--display error message if occur -->
               <p id="message">        
            <asp:Label ID="lblMessage" runat="server" EnableViewState="False"></asp:Label>        
        </p>
        <!-- image of hotel manager-->
            <img src="Images/hotel-man.gif" class="hotel-man" />

        <!-- purple box to display number of hotels and total  -->
          <table class="purple-square total">
             <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
             <tr>
                <td class="cart-text">HOTEL &nbsp;</td><td class="cart-number"><asp:Label ID="lblCount" runat="server">00000</asp:Label></td></tr>
               <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            <tr>
                <td class="cart-text">TOTAL  &nbsp;</td><td class="cart-number"><asp:Label ID="lblTotal" runat="server">$00.00</asp:Label></td></tr>
               <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
          </table>      

       
 </div>
      <!-- SQL statement to insert cookie information into customer table of database -->
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>'
            InsertCommand="INSERT INTO [Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber])
            VALUES (@Email, @LastName, @FirstName, @Address, @City, @State, @ZipCode, @PhoneNumber)"></asp:SqlDataSource>


    </section>
      <!--Flash music player to play background music -->
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="165" height="38" id="niftyPlayer1" align="">
<param name="movie" value="niftyplayer.swf?file=Music/battle_weird.mp3&as=1"/>
<param name="quality" value="high"/>
<param name="bgcolor" value="#FFFFFF"/>
<embed src="niftyplayer.swf?file=Music/battle_weird.mp3&as=1" quality="high" bgcolor="#FFFFFF" width="165" height="38" name="niftyPlayer1" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>

</object>
    </asp:Content>
