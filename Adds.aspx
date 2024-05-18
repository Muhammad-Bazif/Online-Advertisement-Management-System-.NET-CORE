<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adds.aspx.cs" Inherits="OnlineAdvertisement.Adds" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<title>Online Advertisement | Advertisements</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" /> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css' />
      <link rel="stylesheet" href="./css/common.css" />
      <link rel="stylesheet" href="./css/advertise.css" />
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
            <a class="nav-content" href="./index.aspx">Home</a>
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
            <h2>All Published Ads</h2>
      
        <div class="publish_btn">
  <asp:Button ID="Button2"  OnClick="Button1_Click" runat="server" CssClass="publish" Text=" Publish New " ></asp:Button><br />  
            <br />
  </div>
  <div class="dynamic_data">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-hover" OnRowDataBound="GridView1_RowDataBound"  DataKeyNames="advId">
    <Columns>
<%--        <asp:BoundField DataField="advId" HeaderText="ID" />--%>
       <asp:TemplateField HeaderText="Image">
                     <ItemTemplate>
                             <asp:Image ID="imgAdvertisement" runat="server" ImageUrl='<%# Eval("ImageData", "data:image/png;base64,{0}") %>' Width="50" Height="50" />
                     </ItemTemplate>
             <ControlStyle Height="50px" Width="50px" />
        </asp:TemplateField>
        <asp:BoundField DataField="advMode" HeaderText="Mode | Type" />
        <asp:BoundField DataField="budget" HeaderText="Cost | Expenses" />
        <asp:BoundField DataField="date" HeaderText="Submitted Date" />
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("status") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

		

        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="btnEdit" OnClick="btnEdit_Click" runat="server" CssClass="btn btn-info" Text=" Update" CommandArgument='<%# Eval("advId") %>'></asp:Button>
                <asp:Button ID="btnDelete" OnClick="btnDelete_Click" runat="server" CssClass="btn btn-danger" Text=" Delete" CommandArgument='<%# Eval("advId") %>'></asp:Button>
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











                
  
