<%@ Page Title="Welcome to Hotel" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">  
    <link href="Styles/About.css" rel="stylesheet" />  
</asp:Content>


<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
  <!--
   COP2552 001: Object Oriented Programming 2
   Final Project
   Hotel

   Author: Jay Rosen
   Date: 12/10/2015

-->
    
      <section class="home-content">
           
        <!--  Background image-->
         <div id="bg">
  <img src="Images/about-bg.png" />
</div>

   <!-- Display message about website -->
        <div class="black-square" style="position: absolute; top: 1px; margin-left: 700px; width:550px;">
        <p style="font-family: 'apple_kid'; text-align: left; list-style-type: disc;">
                All graphics, sounds, text, and interactivity 
         <br />of this website are based on the videogame
         <br />EARTHBOUND (1994) for the Super Nintendo.   
        </p>
    </div>

      

        <!-- Unordered List displaying credits for original artwork, music, concept of website  -->
          <div class="black-square" id="credits">
        <ul style="font-family: 'apple_kid'; text-align: left; list-style-type: disc;">
            <li>Earthbound Credits</li>
           <li ><b class="purple">PRODUCED, DIRECTED BY</b></li>
           <li>Shigesato Itoi</li>
            <li></li>
           <li ><b class="purple">WRITTEN BY</b></li>
            <li>Shigesato Itoi</li>
            <li></li>
            <li><b class="purple">MUSIC BY</b></li>
            <li>Keiichi Suzuki</li>
            <li>Hirokazu Tanaka</li>
            <li></li>
            <li><b class="purple">GAME DESIGNER</b></li>
            <li>Akihiko Miura</li>
            <li></li>
            <li><b class="purple">ART DIRECTOR</b></li>
            <li>Kouichi Ooyama</li>
            <li></li>
            <li><b class="purple">SOUND DIRECTOR</b></li>
            <li>Hirokazu Tanaka</li>
            <li></li>
            <li><b class="purple">PROGRAM DIRECTOR</b></li>
           <li><i class="red">Satoru Iwata</i></li>
            <li></li>
            <li><b class="purple">PRESENTED BY</b></li>
           <li> Nintendo</li>
            <li></li>
            <li><b class="purple">IN ASSOCIATION WITH</b></li>
            <li>Ape inc.</li>
            <li></li>
            <li><b class="purple">AND</b></li>
            <li>Hal Laboratory, Inc.</li>
        </ul>
    </div>

            <!--Display user's avatar if it is stored in Session -->
          <asp:Image ID="character" runat="server"/>
          

        <!-- Flash background music -->
       <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="165" height="38" id="niftyPlayer1" align="">
<param name="movie" value="niftyplayer.swf?file=Music/sunrise.mp3&as=1"/>
<param name="quality" value="high"/>
<param name="bgcolor" value="#FFFFFF"/>
<embed src="niftyplayer.swf?file=Music/sunrise.mp3&as=1" quality="high" bgcolor="#FFFFFF" width="165" height="38" name="niftyPlayer1" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>
</object>

    </section>
</asp:Content>


