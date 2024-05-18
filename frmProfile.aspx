<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmProfile.aspx.cs" Inherits="OnlineAdvertisement.frmProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<title>Online Advertisement | Profile</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'/>
  <link rel="stylesheet" href="./css/common.css" />
  <link rel="stylesheet" href="./css/profile1.css"/>
</head>
<body>
    <form runat="server">
    <div class="header">
      <div class="txt-animation">
        <h1 class="qw1">Online Advertisement</h1>
        <h1 class="qw2">Advertise Your Business</h1>
      </div>
      <div class="nav">
        <ul id="ul">
          <li>
            <a class="nav-content" href="./Adds.aspx">Advertise</a>
   <a class="nav-content" href="./adsDetails.aspx">ADS Details</a>
   <a class="nav-content" href="./createPoster.aspx">Poster Making</a>
              <a class="nav-content" href="./frmProfile.aspx">Profile</a>
            <a class="nav-content" href="../Boards/View.aspx"
              >Billboards Management</a
            >
       
            <a class="nav-content" href="./frmLogout.aspx">Logout</a>
          </li>
        </ul>
      </div>
    </div>
   
	<div class="container">
    <h2>Your Profile Details</h2>
    <div class=" col-lg-12">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  CssClass="table table-hover">
    <Columns>
        <asp:BoundField DataField="name" HeaderText="Employee" /> 
        <asp:BoundField DataField="email" HeaderText="Email" />
        <asp:BoundField DataField="contact" HeaderText="Contact No" />
        <asp:BoundField DataField="address" HeaderText="Address" />
        <asp:BoundField DataField="password" HeaderText="Password" />
        
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="btnEdit"  OnClick="btnEdit_Click" runat="server" CssClass="btn btn-primary" Text="Update" CommandArgument='<%#Eval("userId") %>'></asp:Button>
                <asp:Button ID="btnDelete"  OnClick="btnDelete_Click" runat="server" CssClass="btn btn-danger" Text="Delete" CommandArgument='<%#Eval("userId") %>'></asp:Button>
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>
    </div>
</div>
      <footer class="footer">
        <ul>
          <li>
            <a href="#" class="facebook"
              ><i class="fa-brands fa-facebook-f"></i
            ></a>
          </li>
          <li>
            <a href="#" class="twitter"
              ><i class="fa-brands fa-x-twitter"></i
            ></a>
          </li>
          <li>
            <a href="#" class="instagram"
              ><i class="fa-brands fa-instagram"></i
            ></a>
          </li>
          <li>
            <a href="#" class="linkdin"
              ><i class="fa-brands fa-linkedin-in"></i
            ></a>
          </li>
        </ul>
        <marquee class="trademark"
          >© 2023 Online Advertisement. All rights reserved.</marquee
        >
      </footer>
    </form>
</body>

</html>