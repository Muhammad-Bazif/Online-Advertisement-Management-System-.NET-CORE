<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="OnlineAdvertisement.Boards.View" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<title>Online Advertisement | Agents</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'/>
      <link rel="stylesheet" href="../css/common.css" />
    <link rel="stylesheet" href="../css/bilboardView1.css"/>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
               <a class="nav-content" href="../index.aspx">Home</a>
              <a class="nav-content" href="../Adds.aspx">Advertise</a>
   <a class="nav-content" href="../adsDetails.aspx">ADS Details</a>
   <a class="nav-content" href="../createPoster.aspx">Poster Making</a>
              <a class="nav-content" href="../Adds.aspx">Published</a>
            <a class="nav-content" href="../frmProfile.aspx">Profile</a>           
            <a class="nav-content" href="../frmLogout.aspx">Logout</a>
          </li>
        </ul>
      </div>
    </div>
    <div class="container">
        <h2>All Billboards Published</h2>
        <div class="publish_btn">
<asp:Button ID="Button2"  OnClick="Button1_Click" runat="server" CssClass="publish" Text=" New " ></asp:Button>
        </div>
        <div class="dynamic_data">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  CssClass="table table-responsive">
    <Columns>
                  <asp:TemplateField HeaderText="Image">
    <ItemTemplate>
        <asp:Image ID="imgAdvertisement" runat="server" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("ImageData")) %>' Width="50" Height="50" />
    </ItemTemplate>
    <ControlStyle Height="50px" Width="50px" />
</asp:TemplateField>
        <asp:BoundField  HeaderStyle-BackColor="White" DataField="publishDate" HeaderText="Date Published" />
        <asp:BoundField  HeaderStyle-BackColor="White" DataField="manager" HeaderText="Mode" />
        <asp:BoundField   HeaderStyle-BackColor="White" DataField="description" HeaderText="Budget" />
        <asp:BoundField  HeaderStyle-BackColor="White" DataField="addsDesc" HeaderText="Details" />
        <asp:BoundField  HeaderStyle-BackColor="White" DataField="location" HeaderText="Published Location" />
        
         <asp:TemplateField HeaderText="Status">
       <ItemTemplate>
        <asp:Label ID="lblStatus" runat="server" Text='<%# GetStatusString(Convert.ToInt32(Eval("status"))) %>'></asp:Label>
       </ItemTemplate>
   </asp:TemplateField>
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                
                <asp:Button ID="btnEdit"  OnClick="btnEdit_Click" runat="server" CssClass="btn btn-info" Text=" Update " CommandArgument='<%#Eval("Id") %>'></asp:Button>  &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnDelete"  OnClick="btnDelete_Click" runat="server" CssClass="btn btn-danger" Text=" Delete " CommandArgument='<%#Eval("Id") %>'></asp:Button>
            </ItemTemplate >
        </asp:TemplateField>
        
    </Columns>

</asp:GridView>
            </div>
                
            <div class="col-md-10">
                <label  runat="server" id="Label1" style="color:darkred; margin-left:200px;"></label>
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
          
       
		