<%@ Page Title="Cookie Policy" Language="C#" MasterPageFile="~/Site.master"  CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" AutoEventWireup="true"  %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">  
 <!--
   COP2552 001: Object Oriented Programming 2
   Final Project
   Hotel

   Author: Jay Rosen
   Date: 12/10/2015

-->
    
       <link href="Styles/Confirmation.css" rel="stylesheet" /> 
      
     <!-- JavaScript to play sound when button is clicked-->
    <script>
         var itemget1 = new Audio();
         itemget1.src = 'SFX/itemget1.wav';
</script>

</asp:Content>

<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
     
       <!-- background image is animated-->
             <div id="bg">
  <img src="Images/CoffeeBreak.gif" />
</div>
    
     <!-- black square with text that will display user name if entered in cookie and confirm that order is placed in database -->
    <div class="black-square" style="position:absolute; top: 50px; margin-left: 28%; width: 600px;">
        <p style="font-family: 'apple_kid'; text-align: left; list-style-type: disc;";>
          <asp:Label ID="lblCookieStory" runat="server"></asp:Label>
        </p>
          <!-- button to go to home default page -->
        <asp:Button ID="btnNextPage" runat="server" Text="Continue" CssClass="button" OnClick="btnNextPage_Click" onMouseDown="itemget1.play()"/>

    </div>

      <!-- Display the user's avatar if it is stored in session -->
    <asp:Image ID="character" runat="server"/>

      <!-- Flash music player for background music-->
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="165" height="38" id="niftyPlayer1" align="">
<param name="movie" value="niftyplayer.swf?file=Music/you_win.mp3&as=1"/>
<param name="quality" value="high"/>
<param name="bgcolor" value="#FFFFFF"/>
<embed src="niftyplayer.swf?file=Music/you_win.mp3&as=1" quality="high" bgcolor="#FFFFFF" width="165" height="38" name="niftyPlayer1" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>

</object>
   
</asp:Content>

