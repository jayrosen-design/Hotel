<%@ Page Title="Your Shopping Cart" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" EnableEventValidation="false" %>
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
    
    <!-- Hide second hint box that is in Site.Master -->
     <style>        .hint2 {
            display: none;
        }
    </style>
    
    <!-- Javascript to play sounds when buttons are clicked -->
        <script>
            var dodge = new Audio();
            dodge.src = 'SFX/dodge.wav';

            var psi3 = new Audio();
            psi3.src = 'SFX/psi3.wav';

            var die = new Audio();
            die.src = 'SFX/die.wav';

            var okdesuka = new Audio();
           okdesuka.src = 'SFX/okdesuka.wav';
</script>


</asp:Content>

   
<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
<section class="content">
  
    <!-- background image is animated -->
    <div id="bg">
  <img src="Images/CoffeeBreak.gif" />
</div>

  
  <div style="position: relative;height: 400px; width: 800px; margin-left: 22%; top:-250px;">
    
      <!-- black box with text, will display user's name is cookie is not null  -->
       <div class="encounter">
           <p><asp:Label ID="lblConfront" runat="server"></asp:Label><span> ...</span></p>
       </div>
           
      <!-- display cart items in a listbox -->
            <asp:ListBox ID="lstCart" runat="server"></asp:ListBox>
      

      <!-- photo image of videogame controller -->
      <img src="Images/SNES-hand.png" />

      <!-- videogame controller buttons user can interface with -->
      <table class="controller">
      <tr><td>&nbsp;</td>
          <!-- X button to remove item  -->
           <td><asp:Button ID="btnRemove" runat="server" Text="X" CssClass="button" onMouseDown="dodge.play()" OnClick="btnRemove_Click"/></td>
          <td>&nbsp;</td>
        </tr>
          <tr>
              <!-- Y button to empty cart -->
              <td><asp:Button ID="btnEmpty" runat="server" Text="Y" CssClass="button" onMouseDown="psi3.play()" OnClick="btnEmpty_Click" /></td>
              <td>&nbsp;</td>
              <!-- A button to continue to checkout -->
              <td><asp:Button  ID="btnCheckOut" runat="server" Text="A" CssClass="button" onMouseDown="okdesuka.play()" OnClick="btnCheckOut_Click"/></td>
          </tr>
           <tr><td>&nbsp;</td>   
               <!-- B button to go back to Order page -->
                <td><asp:Button ID="btnContinue" runat="server" Text="B" CssClass="button" onMouseDown="die.play()" PostBackUrl="~/Order.aspx" /></td>
               <td>&nbsp;</td>
        </tr>
          </table>

      <!-- Display error message if occur-->
               <p id="message">        
            <asp:Label ID="lblMessage" runat="server" EnableViewState="False"></asp:Label>        
        </p>

      <!-- image of the hotel manager -->
            <img src="Images/hotel-man.gif" class="hotel-man" />

      <!-- purple box displaying cost of total and number of hotels selected -->
          <table class="purple-square total">
             <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
             <tr>
                <td class="cart-text">HOTEL &nbsp;</td><td class="cart-number"><asp:Label ID="lblCount" runat="server">00000</asp:Label></td></tr>
               <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            <tr>
                <td class="cart-text">TOTAL &nbsp;</td><td class="cart-number"><asp:Label ID="lblTotal" runat="server">$00.00</asp:Label></td></tr>
               <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
          </table>      

       
 </div>
    <!--  Flash music player for background music-->
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="165" height="38" id="niftyPlayer1" align="">
<param name="movie" value="niftyplayer.swf?file=Music/heartless_hotel.mp3&as=1">
<param name="quality" value="high"/>
<param name="bgcolor" value="#FFFFFF"/>
<embed src="niftyplayer.swf?file=Music/heartless_hotel.mp3&as=1" quality="high" bgcolor=#FFFFFF width="165" height="38" name="niftyPlayer1" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>

</object>

    </section>
    </asp:Content>
