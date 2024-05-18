<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="OnlineAdvertisement.details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<%--    <title>Online Advertisement | adsdetails</title>--%>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="./css/details.css" />
    <title>Online Advertisement | Ads Details</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
      integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

</head>
<body>
    <div class="header">
        <div class="txt-animation">
          <h1 class="qw1">Online Advertisement</h1>
          <h1 class="qw2">Advertise Your Business</h1>
        </div>
        <div class="nav">
        
        </div>
      </div>
      <div class="container">
        <div class="inner">
            <div class="box">
                <div class="img-round clr1"><i class="fa-solid fa-clipboard"></i></div>
                <h1>Maximise leads and conversions</h1>
                <p>Get better quality leads and enhance conversions.</p>
            </div>
            <div class="box">
                <div class="img-round clr2"><i class="fa-solid fa-signal"></i></div>
                <h1>Increase online sales</h1>
                <p>Show up where shoppers are and increase site traffic and sales.</p>
            </div>
            <div class="box">
                <div class="img-round clr3"><i class="fa-solid fa-store"></i></div>
                <h1>Drive in-store foot traffic</h1>
                <p>Bring people through your doors and increase offline sales.</p>
            </div>
            <div class="box">
                <div class="img-round clr4"><i class="fa-solid fa-earth-americas"></i></div>
                <h1>Show your brand to more people</h1>
                <p>Put your brand out there to increase reach and engagement.</p>
            </div>
            <div class="box">
                <div class="img-round clr5"><i class="fa-solid fa-mobile"></i></div>
                <h1>Market your app to new users</h1>
                <p>Put your app in front of the right users to drive downloads and engagement.</p>
            </div>
        </div>

        <div class="inner inner1">
          <h1><span>Choose</span> Your Plan</h1>
          <a class="btn" href="./frmLogin.aspx">Get Started</a>
          <div class="adtpyes">
            <div class="adtpyes">
              <div class="box_common box google">
              <div class="ad-type"><h1>Google</h1></div>
              <h2>PKR 999</h2>
              <h3>Time : 7days</h3>
              <h3>Impression : 100k - 340k</h3>
              <h3>Views : 2.2k - 6.7k</h3>
              <h3>CPV :PKR 0.73 - PKR 2</h3>
             </div> 
              <div class="box_common box google">
              <div class="ad-type"><h1>Google</h1></div>
              <h2>PKR 1999</h2>
              <h3>Time : 15days</h3>
              <h3>Impression : 230k - 680k</h3>
              <h3>Views : 4.5k - 14k</h3>
              <h3>CPV :PKR 0.73 - PKR 2</h3>
             </div>
              <div class="box_common box google">
              <div class="ad-type"><h1>Google</h1></div>
              <h2>PKR 3299</h2>
              <h3>Time : 30days</h3>
              <h3>Impression : 380k - 900k</h3>
              <h3>Views : 7.5k - 23k</h3>
              <h3>CPV :PKR 0.73 - PKR 2</h3>
             </div>
            </div>
            <div class="box_common box">
            <div class="ad-type"><h1>facebook</h1></div>
            <h2>PKR 2099</h2>
            <h3>Time : 7days</h3>
            <h3>Impression : 33k - 40k</h3>
            <h3>Views : 14k - 18k</h3>
            <h3>CPV :PKR 0.52 - PKR 2</h3>
           </div> 
            <div class="box_common box">
            <div class="ad-type"><h1>facebook</h1></div>
            <h2>PKR 4299</h2>
            <h3>Time : 15days</h3>
            <h3>Impression : 100k - 120k</h3>
            <h3>Views : 40k - 60k</h3>
            <h3>CPV :PKR 0.42 - PKR 2</h3>
           </div>
            <div class="box_common box">
            <div class="ad-type"><h1>facebook</h1></div>
            <h2>PKR 8999</h2>
            <h3>Time : 30days</h3>
            <h3>Impression : 140k - 200k</h3>
            <h3>Views : 80k - 100k</h3>
            <h3>CPV :PKR 0.42 - PKR 2</h3>
           </div>
            </div> 
          <div class="adtpyes">
              <div class="box_common box youtube">
              <div class="ad-type"><h1>Youtube</h1></div>
              <h2>PKR 799</h2>
              <h3>Time : 7days</h3>
              <h3>Impression : 13k - 35k</h3>
              <h3>Views : 5k - 13k</h3>
              <h3>CPV :PKR 0.42 - PKR 2</h3>
             </div> 
              <div class="box_common box youtube">
              <div class="ad-type"><h1>Youtube</h1></div>
              <h2>PKR 1499</h2>
              <h3>Time : 15days</h3>
              <h3>Impression : 24k - 68k</h3>
              <h3>Views : 10k - 23k</h3>
              <h3>CPV :PKR 0.42 - PKR 2</h3>
             </div>
              <div class="box_common box youtube">
              <div class="ad-type"><h1>Youtube</h1></div>
              <h2>PKR 3299</h2>
              <h3>Time : 30days</h3>
              <h3>Impression : 50k - 150k</h3>
              <h3>Views : 20k - 46k</h3>
              <h3>CPV :PKR 0.42 - PKR 2</h3>
             </div>
             
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
</body>
</html>