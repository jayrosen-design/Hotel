<%@ Page Title="Editor" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Editor.aspx.cs" Inherits="Editor" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">  
  <link href="Styles/Editor.css" rel="stylesheet" /> 
   <!--
   COP2552 001: Object Oriented Programming 2
   Final Project
   Hotel

   Author: Jay Rosen
   Date: 12/10/2015

--> 
    
  



</asp:Content>


<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
      

     <div class="encounter black-square" style="position: absolute; left: 600px; top: 50px;">
            <asp:ImageButton ID="Logo" AlternateText="Hotel" ImageUrl="~/Images/logo_white.gif" OnClick="Home_Click" onMouseDown="psilearn.play()" runat="server" />
       </div>

     
     
    

        <div id="gridview" style="position: absolute; top: 200px; left: 1300px; border: 10px white ridge;border-radius: 15px;">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                DataKeyNames="Email" DataSourceID="SqlDataSource1"
                AutoGenerateColumns="False" SelectedIndex="0"
                CellPadding="4" GridLines="None" ForeColor="Black" Width="320px" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Email" HeaderText="Email"
                        ReadOnly="True" Visible="False"></asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Last">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FirstName" HeaderText="First">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="120px" />
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                
                <HeaderStyle BackColor="#9090e8" Font-Bold="True" ForeColor="white" CssClass="headerstyle" />
                <RowStyle BackColor="#9090e8" ForeColor="white" CssClass="rowstyle" />
                <AlternatingRowStyle BackColor="#9080a8" ForeColor="white" CssClass="rowstyle"/>
                <SelectedRowStyle BackColor="black" ForeColor="White" CssClass="rowstyle" />
                <PagerSettings Mode="Numeric" />
                <PagerStyle BackColor="white" ForeColor="black" CssClass="headerstyle"
                    HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                SelectCommand="SELECT [Email], [LastName], [FirstName] 
                               FROM [Customers] ORDER BY [LastName]"></asp:SqlDataSource>
       

        </div>
     <div class="black-square" style="z-index: 4; position: absolute; top: 200px; left: 200px;">

        <div id="detailsview">
            <asp:DetailsView ID="DetailsView1" runat="server"
                DataSourceID="SqlDataSource2" DataKeyNames="Email"
                Height="50px" Width="350px" AutoGenerateRows="False"
                OnItemDeleted="DetailsView1_ItemDeleted"
                OnItemInserted="DetailsView1_ItemInserted"
                OnItemUpdated="DetailsView1_ItemUpdated" AllowPaging="True">
                <Fields>
                    <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' 
                                Width="225px" MaxLength="25"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="Email is a required field.">*
                            </asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FirstName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>' 
                                Width="150px" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtFirstName" ErrorMessage="First Name is a required field.">*
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>' 
                                Width="150px" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtFirstName" ErrorMessage="First Name is a required field.">*
                            </asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LastName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>' 
                                Width="150px" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtLastName" ErrorMessage="Last Name is a required field.">*
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>' 
                                Width="150px" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtLastName" ErrorMessage="Last Name is a required field.">*
                            </asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' 
                                Width="225px" MaxLength="40"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtAddress" ErrorMessage="Address is a required field.">*
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' 
                                Width="225px" MaxLength="40"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtAddress" ErrorMessage="Address is a required field.">*
                            </asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>' 
                                Width="150px" MaxLength="30"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtCity" ErrorMessage="City is a required field.">*
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>' 
                                Width="150px" MaxLength="30"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtCity" ErrorMessage="City is a required field.">*
                            </asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource3" DataTextField="StateName" 
                                DataValueField="StateCode" Width="156px" 
                                SelectedValue='<%# Bind("State") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource3" DataTextField="StateName" 
                                DataValueField="StateCode" Width="156px" 
                                SelectedValue='<%# Bind("State") %>'>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ZipCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtZipCode" runat="server" Text='<%# Bind("ZipCode") %>' 
                                Width="75px" MaxLength="9"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtZipCode" ErrorMessage="Zip Code is a required field.">*
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtZipCode" runat="server" Text='<%# Bind("ZipCode") %>' 
                                Width="75px" MaxLength="9"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtZipCode" ErrorMessage="Zip Code is a required field.">*
                            </asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("ZipCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PhoneNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("PhoneNumber") %>' 
                                Width="150px" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtPhone" ErrorMessage="Phone is a required field.">*
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("PhoneNumber") %>' 
                                Width="150px" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtPhone" ErrorMessage="Phone is a required field.">*
                            </asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                        ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>


            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT [Email], [FirstName], [LastName], [Address], [City], [State], [ZipCode], [PhoneNumber] FROM [Customers] WHERE ([Email] = @Email)"
                DeleteCommand="DELETE FROM [Customers] WHERE [Email] = @original_Email AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [PhoneNumber] = @original_PhoneNumber"
                InsertCommand="INSERT INTO [Customers] ([Email], [FirstName], [LastName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (@Email, @FirstName, @LastName, @Address, @City, @State, @ZipCode, @PhoneNumber)"
                UpdateCommand="UPDATE [Customers] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [PhoneNumber] = @PhoneNumber WHERE [Email] = @original_Email AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [PhoneNumber] = @original_PhoneNumber">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="Email"
                    PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                    <asp:Parameter Name="original_State" Type="String" />
                    <asp:Parameter Name="original_ZipCode" Type="String" />
                    <asp:Parameter Name="original_PhoneNumber" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                    <asp:Parameter Name="original_State" Type="String" />
                    <asp:Parameter Name="original_ZipCode" Type="String" />
                    <asp:Parameter Name="original_PhoneNumber" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateName]">
            </asp:SqlDataSource>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                HeaderText="Please correct the following errors:" CssClass="error" />
            <p>
                <asp:Label ID = "lblError" runat="server" EnableViewState="False" CssClass="error"></asp:Label>
            </p>
        </div>
        </div>    
      
      <img src="Images/pokey.gif" style="position: absolute; top: 300px; left: 650px;"  class="hotel-man" />
     
     <div class="encounter black-square" style="position: absolute; left: 600px; top: 700px;">
           <p>New souls checked into Hotel !</p>
       </div>


    <div id="music">
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="165" height="38" id="niftyPlayer1" align="">
<param name="movie" value="niftyplayer.swf?file=Music/Giygas_Intro.mp3&as=1"/>
<param name="quality" value="high"/>
<param name="bgcolor" value="#FFFFFF"/>
<embed src="niftyplayer.swf?file=Music/Giygas_Intro.mp3&as=1" quality="high" bgcolor="#FFFFFF" width="165" height="38" name="niftyPlayer1" align="" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>

</object>
       </div>
       

      

    </asp:Content>

