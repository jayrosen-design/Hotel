<%@ Page Title="Register" Language="C#" MasterPageFile="~/CheckOut.master" AutoEventWireup="true" CodeFile="Admin_Login.aspx.cs" Inherits="Admin_Login" %>
<%@ MasterType VirtualPath="~/CheckOut.master" %>

<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
     <!--
   COP2552 001: Object Oriented Programming 2
   Final Project
   Hotel

   Author: Jay Rosen
   Date: 12/10/2015

-->
    
    
     <link href="Styles/Admin.css" rel="stylesheet" /> 

    <!--  Javascript to play a sound when a button is clicked -->
        <script>
            var die = new Audio();
            die.src = 'SFX/die.wav';

            var okdesuka = new Audio();
            okdesuka.src = 'SFX/okdesuka.wav';

            var psilearn = new Audio();
            psilearn.src = 'SFX/psilearn.wav';
        </script>
    
    <!-- background image -->
        <div id="bg">
  <img src="Images/trip.gif" />
</div>

    <!--  Logo is inside of a centered black box-->
     <div class="black-square field center"">
     <asp:ImageButton ID="Logo" AlternateText="Hotel" ImageUrl="~/Images/logo_white.gif" OnClick="Home_Click" runat="server" onMouseDown="psilearn.play()" style="margin-left: 90px; margin-top: 50px;"/>
        <br />
        
         <br />
  
         <!-- Password text field with required field validator  -->
<p>Password &nbsp; <asp:TextBox ID="txtPassword"  TextMode="Password" runat="server" CssClass="entry"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="Password" runat="server" 
                    ErrorMessage="<br/>Enter password to access database" ControlToValidate="txtPassword" 
                    CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
    
    </p>
<br />

  <!-- Button Continue to Database Editor, C# will proccess request if password is correct  -->
<p><asp:Button ID="btnContinue" runat="server" Text="Enter" CssClass="button" OnClick="Continue_Click"  onMouseDown="okdesuka.play()" />
  
  &nbsp;  &nbsp; &nbsp;  
    <!-- Button to return to default homepage-->
            <asp:Button ID="Run" runat="server" Text="Run Away" CssClass="button" OnClick="Run_Click"  onMouseDown="die.play()" />
 
  
    
    </p>
       
    </div>
            <!-- Flash based music player for background music -->
    <div id="music">
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="165" height="38" id="niftyPlayer1" align="">
<param name="movie" value="niftyplayer.swf?file=Music/bad_morning.mp3&as=1"/>
<param name="quality" value="high"/>
<param name="bgcolor" value="#FFFFFF"/>
<embed src="niftyplayer.swf?file=Music/bad_morning.mp3&as=1" quality="high" bgcolor="#FFFFFF" width="165" height="38" name="niftyPlayer1" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>
</object>
      </div> 
       

      

    </asp:Content>

