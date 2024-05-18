<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminUserDetails.aspx.cs" Inherits="OnlineAdvertisement.adminUserDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<title>Online Advertisement | Admin Dashboard</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'/>
 <link rel="stylesheet" href="./css/adminUserDetail.css" />
 <link rel="stylesheet" href="./css/common.css" />
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
         <li><a href="adminDashboard.aspx">Panel</a></li>
       <li><a href="adminViewUser.aspx">View Users</a></li>
       <li><a href="adminViewBillboards.aspx">View Billboards</a></li>
       <li><a href="adminViewAdvertisements.aspx">View Advertisements</a></li>
         <li><a href="adminLogout.aspx">Logout</a></li>
     </ul>
   </div>
 </div>


    <div class="container">
    <h2>Advertisements</h2>
  <div class="col-lg-12">
             <asp:GridView ID="GridViewAdvertisements" runat="server" AutoGenerateColumns="false" CssClass="table table-hover">
        <Columns>
        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="imgUser" runat="server" Height="100px" Width="120px" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("ImageData")) %>' />
            </ItemTemplate>
        </asp:TemplateField>
                            <asp:TemplateField  HeaderText="Download">
    <ItemTemplate>
        <asp:Button  CssClass="btn" ID="btnDownload" runat="server" Text="Download" OnClick="DownloadImage_ClickADS" CommandArgument='<%# Eval("advId") %>' />
    </ItemTemplate>
</asp:TemplateField>

        <asp:BoundField DataField="advMode" HeaderText="Mode | Type" />
        <asp:BoundField DataField="budget" HeaderText="Cost | Expenses" />
        <asp:BoundField DataField="date" HeaderText="Submitted Date" />
       <%-- <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <button type="button" class="btn btn-info" onclick="showAdvertisementDetails('<%# Eval("advId") %>')">View Details</button>
            </ItemTemplate>
        </asp:TemplateField>--%>

     

    </Columns>
</asp:GridView>
   </div>
</div>   
                <div class="container">
    <h2>Billboards</h2>
  <div class="col-lg-12">
            <asp:GridView ID="GridViewBillboards" runat="server" AutoGenerateColumns="false" CssClass="table table-hover">
 <Columns>
                     <asp:TemplateField HeaderText="Image">
    <ItemTemplate>
        <asp:Image ID="imgAdvertisement" runat="server" ImageUrl='<%# "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("ImageData")) %>' Width="50" Height="50" />
    </ItemTemplate>
    <ControlStyle Height="100px" Width="120px" />
</asp:TemplateField>
                <asp:TemplateField HeaderText="Download">
    <ItemTemplate>
        <asp:Button CssClass="btn" ID="btnDownload" runat="server" Text="Download" OnClick="DownloadImage_Click" CommandArgument='<%# Eval("Id") %>' />
    </ItemTemplate>
</asp:TemplateField>
     <asp:BoundField  HeaderStyle-BackColor="White" DataField="publishDate" HeaderText="Date Published" />
     <asp:BoundField  HeaderStyle-BackColor="White" DataField="manager" HeaderText="Published By" />
     <asp:BoundField   HeaderStyle-BackColor="White" DataField="description" HeaderText="Description" />
     <asp:BoundField  HeaderStyle-BackColor="White" DataField="addsDesc" HeaderText="Budget" />
     <asp:BoundField  HeaderStyle-BackColor="White" DataField="location" HeaderText="Published Location" />  
 </Columns>
</asp:GridView>

    

   </div>
</div> 
		   <footer class="footer">
     <ul>
    <li>
      <a href="https://adsmanager.facebook.com/adsmanager/manage/campaigns?act=358186540266867&nav_entry_point=comet_bookmark&breakdown_regrouping=1" target="_blank" class="facebook"
        ><i class="fa-brands fa-facebook-f"></i
      ></a>
    </li>
  <%--  <li>
      <a href="#" class="twitter"
        ><i class="fa-brands fa-x-twitter"></i
      ></a>
    </li>--%>
    <li>
      <a target="_blank" href="https://ads.google.com/aw/campaigns/new/express?campaignId=20993152031&ocid=1566780228&subid=pk-en-ha-awa-bk-a-c00%21o3~CjwKCAiA0PuuBhBsEiwAS7fsNcMF2SdIXsD7so1NM4q78q0mGHYRIqet7npW2vZu1lJ3UZxLQHHrFxoCaioQAvD_BwE~139970873518~aud-1644668058405%3Akwd-94527731~17785156036~611029899033_apac-ha&step=cgl&mode=signup&euid=324664319&__u=3535301831&uscid=1566780228&__c=2301953572&authuser=0&sourceid=emp&workflowSessionId=aD1EADC57-3D1B-492C-B9C7-04D528356D72--1" class="instagram"
        ><i class="fa-brands fa-google"></i
      ></a>
    </li>
    <li>
      <a target="_blank" href="https://studio.youtube.com/channel/UCkD5uGn9CknLL7bLadp8shQ/content/promotions?d=pcd" class="linkdin"
        ><i class="fa-brands fa-youtube"></i
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

             





       
    














     

	






		