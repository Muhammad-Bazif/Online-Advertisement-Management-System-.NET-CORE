<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="OnlineAdvertisement.Boards.Edit" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
<title>Online Advertisement | Edit </title>

<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'/>
<link rel="stylesheet" href="../css/common.css" />
    <link rel="stylesheet" href="../css/billboardEdit.css" />
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
            <a class="nav-content" href="../Boards/View.aspx"
              >Billboards Management</a
            >
           
            <a class="nav-content" href="../frmLogout.aspx">Logout</a>
          </li>
        </ul>
      </div>
    </div>
                <div class="container">
        <h2> Edit Bill Board</h2>
    <div class="data">
             <div class="col-md-8">
     Mode
     <asp:TextBox ID="manager" runat="server" required="required" CssClass = "form-control" ></asp:TextBox>
 </div>

 <div class="col-md-8">
     Location
     <input type="text" id="location" runat="server" required="required" class ="form-control" />
 </div>

 <div class="col-md-8">
     Budget
     <input type="text" id="description" runat="server" required="required" class ="form-control" />
 </div>
 
     
 <div class="col-md-8">
     Description
     <asp:TextBox ID="addsDesc" runat="server" required="required" class = "form-control" ></asp:TextBox>
 </div>
 <div class="col-md-8">
     Date
    <input  type="Date" id="publishDate"  runat="server" required="required" class = "form-control"/>
 </div>
 <div class="col-md-8">
     For What
    <input  type="text" id="purpose"  runat="server" required="required" class = "form-control"/>
 </div>
 <div class="col-md-offset-6 col-md-6" style="margin-top:20px;">
     <asp:Button ID="Submit" runat="server" class="btn btn-default" Text=" Submit " OnClick="Submit_Click"/>
 </div> 
 
 
		 <div class="col-md-8">
     <label  runat="server" id="lblMessage" style="color:darkred;"></label>
			 </div>
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




    


    