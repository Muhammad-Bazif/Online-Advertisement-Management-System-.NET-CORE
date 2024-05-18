<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="OnlineAdvertisement.adminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Advertisement | Admin Dashboard</title>
<%--    <link rel="stylesheet" href="./css/adminDashboard1.css" />--%>
    <link rel="stylesheet" href="./css/adminDashboard3.css" />
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
    <form id="form1" runat="server">
     <div class="header">
    <div class="txt-animation">
      <h1 class="qw1">Online Advertisement</h1>
      <h1 class="qw2">Advertise Your Business</h1>
    </div>

    <div class="nav">
      <ul id="ul">
        <li><a href="adminViewUser.aspx">View Users</a></li>
        <li><a href="adminViewBillboards.aspx">View Billboards</a></li>
        <li><a href="adminViewAdvertisements.aspx">View Advertisements</a></li>
                            <li><a href="adminLogout.aspx">Logout</a></li>

      </ul>
    </div>
  </div>
   
   <div class="admin-panel">
  <div class="content">

    <div class="data-box" id="totalUsersBox">
      <span id="spanTotalUsers" runat="server">100</span>
    </div>
    <div class="data-box" id="totalAdsBox">

      <span id="spanTotalAdvertisements" runat="server">50</span>
    </div>
    <div class="data-box" id="totalBillboardsBox">
      <span id="spanTotalBillboards" runat="server">20</span>
    </div>
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
