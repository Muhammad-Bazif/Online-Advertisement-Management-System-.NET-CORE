<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="OnlineAdvertisement.Index" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Online Advertisement | Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	 <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="./css/index1.css" />

<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
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
        <div class="online">
          <div  data-aos-duration="800"data-aos="flip-left"class="content">
            <h1>Run World Class Influencer Marketing Campaigns.</h1>
            <p>
              We enables world class original influencer campaigns for leading
              brands.
            </p>
            <a class="btn2" href="../Adds.aspx">Get Started</a>
          </div>
          <div class="rimg">
            <img src="../images/11.png" alt="" />
          </div>
          <!-- <a class="btn" href="./Publish Adds.html">Click to Advertise</a> -->
        </div>
        <div class="main2">
          <h1>We are here to Grow Your Business</h1>
          <div class="mk3">
            <div class="line"></div>
            <div class="lr"></div>
          </div>
          <div class="m4p">
            <div class="pi1">
              <img
                class="imm"
                src="../images/marketing-market-social-svgrepo-com.svg"
                alt=""
              />
            </div>
            <div class="pi2">
              <img class="imm" src="../images/5.jpg" alt="" />
            </div>
            <div class="pi3">
              <img class="imm" src="../images/3.png" alt="" />
            </div>
            <div class="pi4">
              <img class="imm" src="../images/7.png" alt="" />
            </div>
            <div class="pi5">
              <img class="imm" src="../images/10.jpg" alt="" />
            </div>
          </div>
        </div>
        <div class="billboard">
          <a class="btn" href="../Adds.aspx">Click to Advertise</a>
        </div>
        <div class="online on2">
          <div class="rimg rimg2">
            <div class="imgs">
              <img
                data-aos-duration="800"
                src="../images/16 (1).jpg"
                data-aos="zoom-in-down"
                alt=""
              />
            </div>
            <div class="imgs">
              <img
                data-aos-duration="800"
                src="../images/12.jpg"
                data-aos="zoom-in-down"
                alt=""
              />
            </div>
            <div class="imgs">
              <img src="../images/19.png" data-aos-duration="800" data-aos="zoom-in-down" alt="" />
            </div>
            <div class="imgs">
              <img src="../images/17.jpg"data-aos-duration="800" data-aos="zoom-in-down" alt="" />
            </div>
          </div>
          <div data-aos-duration="800" data-aos="flip-left"class="content c2">
            <h1>Creative Strategy & Direction</h1>
            <p>
              We infuse your brand’s core messaging into everything we produce
              by working alongside the talent to create authentic, story-driven
              content that lives beyond the campaign. We create key strategy
              points, geared toward distribution and promotion, optimized for
              brand recognition and conversion.
            </p>
            <a class="btn2" href="login.html">Get Started</a>
          </div>
        </div>
        <div class="img2">
          <img
            src="../images/vecteezy_flat-isometric-concept-illustration-social-media-strategy_6202177.jpg"
            alt=""
          />
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
      </div>
    </form>
	<script>
        AOS.init();
    </script>
</body>



</html>