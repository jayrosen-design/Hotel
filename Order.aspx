<%@ Page Title="Hotel Select" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">  
    <!--
   COP2552 001: Object Oriented Programming 2
   Final Project
   Hotel

   Author: Jay Rosen
   Date: 12/10/2015

-->
    
    <link href="Styles/Order.css" rel="stylesheet" /> 
    
      <!-- javascript to play sound when buttons are clicked-->
    <script>
        var buy1 = new Audio();
        buy1.src = 'SFX/buy1.wav';

        var buy2 = new Audio();
        buy2.src = 'SFX/buy2.wav';
</script>

</asp:Content>

   
<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
 
       

    <section class="content">
  
          <!-- main form container-->
    <div class="black-square" style="position: relative;height: 650px; width: 1000px; margin-left: 26%; top:-150px; left: -50px; ">
     
          <!-- Formating for Drop Down list for hotels-->
<p style="margin-left: -20%; margin-top: -20px;">  
      <!-- Labels for calendars -->
    <asp:Label id="start_date" runat="server">Check in</asp:Label>
         <asp:Label id="end_date" runat="server">Check out</asp:Label>
      <!--The actual drop down list for hotels  -->
       <asp:DropDownList ID="ddlRooms" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="roomID" >
        </asp:DropDownList></p>
          <!-- Database connection with SQL select statement for form-->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>'
            SelectCommand="SELECT [roomID], [Name], [ShortDescription], [LongDescription], [ImageFile], [RoomPrice] FROM [rooms]" UpdateCommand="SELECT roomID, Name, ShortDescription, LongDescription, categoryID, ImageFile, RoomPrice, available FROM rooms"></asp:SqlDataSource>
       
        <div id="RoomData">
              <!-- Display name for hotel room (but the CSS has made it hidden)-->
            <asp:Label ID="lblName" runat="server"></asp:Label>
             <!-- Display the short description of hotel -->
            <asp:Label ID="lblShortDescription" runat="server"></asp:Label>
              <!-- Display the long description of the hotel -->
            <asp:Label ID="lblLongDescription" runat="server"></asp:Label>
              <!-- Display the price of hotel per night-->
            <asp:Label ID="lblRoomPrice" runat="server"></asp:Label>
          
              <!-- text box to enter number of rooms-->
            <div class="input-buttons";>
            <label id="lblQuantity">Rooms &nbsp;  &nbsp; </label>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                   <!-- range validator for number of rooms to not exceed 500-->
                <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="validator" 
                    ControlToValidate="txtQuantity" Display="Dynamic" 
                    ErrorMessage="Quantity must range from 1 to 500."
                    MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator><br />
             <!-- buttons to add selected room to cart-->
                 <asp:Button ID="btnAdd" runat="server" CssClass="button" Text="Add to Cart" onMouseDown="buy1.play()" OnClick="btnAdd_Click" />  &nbsp;  &nbsp;  &nbsp;
             <!-- button to go to cart-->
                 <asp:Button ID="btnCart" runat="server" CssClass="button" Text="Go to Cart" onMouseDown="buy2.play()"  CausesValidation="False" PostBackUrl="~/Cart.aspx" />
       </div>
        </div>
         <!-- display image of hotel-->
         <asp:Image ID="imgProduct" runat="server" Width="360px" Height="360px" CssClass="hotel-image" />
           
        <!-- calendar 1 control -->
         <asp:Calendar ID="Calendar1"  runat="server"></asp:Calendar>
         <!--calendar 2 control -->
         <asp:Calendar ID="Calendar2"  runat="server"></asp:Calendar>
          <!-- Required and Compare validators for calendar objects to be coded here-->
      
         
        
      
        </div>
          <!--Display user's avatar if it is stored in Session -->
          <asp:Image ID="character" runat="server"/>


          <!-- Flash music player for background music-->
               <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="165" height="38" id="niftyPlayer1" align="">
<param name="movie" value="niftyplayer.swf?file=Music/enjoy_your_stay.mp3&as=1"/>
<param name="quality" value="high"/>
<param name="bgcolor" value="#FFFFFF"/>
<embed src="niftyplayer.swf?file=Music/enjoy_your_stay.mp3&as=1" quality="high" bgcolor="#FFFFFF" width="165" height="38" name="niftyPlayer1" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>

</object>

    </section>
    </asp:Content>
