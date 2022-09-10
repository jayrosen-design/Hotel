<%@ Page Title="Cookie Policy" Language="C#" MasterPageFile="~/Site.master"  CodeFile="CookiePolicy.aspx.cs" Inherits="CookiePolicy" AutoEventWireup="true"  %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">  
    <!--
   COP2552 001: Object Oriented Programming 2
   Final Project
   Hotel

   Author: Jay Rosen
   Date: 12/10/2015

-->
    
    <link href="Styles/Cookie.css" rel="stylesheet" /> 
     
     <!-- JavaScript to play sound when button is clicked -->
     <script>
         var itemget2 = new Audio();
         itemget2.src = 'SFX/itemget2.wav';
         </script>
</asp:Content>


<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
        <!-- background image-->
             <div id="bg">
  <img src="Images/cookie-bg.png" />
</div>
      <!--Display user name if it is stored in cookie - this message acts as the website's Cookie Policy -->
      <!-- If user does not have name stored in cookie it will say user declines Cookie, if user name is in cookie, it will say user accepts cookie-->
    <div class="black-square" style="position:absolute; top: 50px; margin-left: 28%; width: 600px;">
        <p style="font-family: 'apple_kid'; text-align: left; list-style-type: disc;";>
          <asp:Label ID="lblCookieStory" runat="server"></asp:Label>
        </p>
          <!--button to go to next page of checkout -->
        <asp:Button ID="btnNextPage" runat="server" Text="Continue" CssClass="button"  onMouseDown="itemget2.play()" OnClick="btnNextPage_Click" />

    </div>

      <!-- Display user's avatar it it is stored in Session-->
    <asp:Image ID="character" runat="server"/>
    
      <!-- Flash music player to play background music -->
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="165" height="38" id="niftyPlayer1" align="">
<param name="movie" value="niftyplayer.swf?file=Music/bed_breakfast.mp3&as=1"/>
<param name="quality" value="high"/>
<param name="bgcolor" value="#FFFFFF"/>
<embed src="niftyplayer.swf?file=Music/bed_breakfast.mp3&as=1" quality="high" bgcolor="#FFFFFF" width="165" height="38" name="niftyPlayer1" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>
</object>
   
</asp:Content>

