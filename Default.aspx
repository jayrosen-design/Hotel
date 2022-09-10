<%@ Page Title="Welcome to Hotel" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">  
 <!--
   COP2552 001: Object Oriented Programming 2
   Final Project
   Hotel

   Author: Jay Rosen
   Date: 12/10/2015

-->
    
       <link href="Styles/Home.css" rel="stylesheet" /> 
   
</asp:Content>

<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <section class="home-content">
             <!-- background image-->
         <div id="bg">
  <img src="Images/summers.png" />
</div>
          <!-- black square with a welcome message -->
    <div class="black-square" style="position: relative; top: 50%; margin-left: 5%; width: 500px;">
        <p style="font-family: 'apple_kid'; text-align: left; list-style-type: disc;";>Welcome to Hotel ! 
        <br />Enjoy your stay !
        </p>

    </div>
          <!-- flash music player to play background music -->
       <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="165" height="38" id="niftyPlayer1" align="">
<param name="movie" value="niftyplayer.swf?file=Music/summers.mp3&as=1"/>
<param name="quality" value="high"/>
<param name="bgcolor" value="#FFFFFF"/>
<embed src="niftyplayer.swf?file=Music/summers.mp3&as=1" quality="high" bgcolor="#FFFFFF" width="165" height="38" name="niftyPlayer1" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>

</object>

    </section>
</asp:Content>


