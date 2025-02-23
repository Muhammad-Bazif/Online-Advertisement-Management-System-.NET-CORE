﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createPoster.aspx.cs" Inherits="OnlineAdvertisement.createPoster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" id="fullpage">
<head runat="server">
    <title>Online Advertisement | Poster</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="
         https://fonts.googleapis.com/css?family=Noto+Sans|Padauk|Concert+One|Hind|Josefin+Sans|Raleway|Nunito+Sans|Oswald|Poppins|Anton|Roboto|Lato|Montserrat|Baloo|Muli"
        rel="stylesheet">
    <link href=" http://fonts.webtoolhub.com/font-n17979-kruti-dev-010.aspx" rel="stylesheet">
    <link href=" https://www.dafont.com/stanberry.font" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <link rel="stylesheet" href="fonts.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script type="text/javascript" src="js/html2canvas.js"></script>
    <script type="text/javascript" src="js/jquery.plugin.html2canvas.js"></script>
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .slidecontainer {
            width: 100%;
        }

        .slider {
            -webkit-appearance: none;
            width: 100%;
            height: 25px;
            background: #d3d3d3;
            outline: none;
            opacity: 0.7;
            -webkit-transition: .2s;
            transition: opacity .2s;
        }

            .slider:hover {
                opacity: 1;
            }

            .slider::-webkit-slider-thumb {
                -webkit-appearance: none;
                appearance: none;
                width: 25px;
                height: 25px;
                background: #;
                cursor: pointer;
            }

            .slider::-moz-range-thumb {
                width: 25px;
                height: 25px;
                background: #4CAF50;
                cursor: pointer;
            }
    </style>
    <style>
        body {
            margin: 0 !important;
        }

        #target {
            margin: 0 !important;
            z-index: 0;
            float: left;
            padding: 0 !important;
            box-shadow: 0px 2px 8px #c2c2c2;
        }

        #myarea {
            outline: 0;
            border: none;
            background-color: transparent;
        }

        .textbox {
            background-color: transparent;
            font-size: 25px;
            border: none;
            outline: none;
        }

        .rightside {
            width: 48%;
            padding-right: 8%;
        }

        .colors, .bkcolors, .shcolors {
            width: 26px;
            height: 26px;
            border: none;
            padding: 8px;
        }

        #myRange {
            margin-left: 1%;
            margin-top: 1%;
            display: inline-block;
            width: 93% !important;
        }

        .sliders {
            margin-left: 1%;
            margin-top: 1%;
            display: inline-block;
            width: 93% !important;
        }

        .colorpalet {
            margin-left: 0%;
            margin-top: 15px !important;
            width: fit-content;
            /* display: inline; */
            padding-top: 0%;
        }

        .colorbox {
            padding-left: 5px;
            margin-left: 24px;
        }

        .container {
            padding-bottom: 17px;
            background-color: #f7f7f7;
            box-shadow: 0px 2px 8px #c2c2c2;
        }

        .dropdown {
            margin-top: 13px;
            font-size: 17px;
            border-radius: 5px;
            background-color: #dddddd;
            border: none;
            padding: 8px;
        }

        .htu {
            background-color: #f7f7f7;
            padding: 11px;
            border-radius: 5px;
            left: 1%;
            top: 80% !important;
            float: left;
            position: absolute;
            box-shadow: 0px 2px 8px #c2c2c2;
        }

        .mainholder {
            height: 100%;
            padding: 2%;
        }

        .controllers {
            padding-left: 15px;
        }

        .savebtn {
            background-color: #008cff;
            color: white;
        }

        #target {
            width: 605px;
            height: 605px;
            position: relative;
            margin-top: 3% !important;
            margin-left: 11% !important;
        }

        @font-face {
            font-family: Kruti;
            src: url(kruti.ttf);
        }

        @font-face {
            font-family: Stanberry;
            src: url(Stanberry.ttf);
        }

        .br-0 {
            border-radius: 0px !important;
        }

        .w-100 {
            width: 100%;
            height: 100%;
        }

        .p-0 {
            border: 1px solid #9c2424;
            background-color: brown;
            color: white;
            font-weight: 500;
            border: 1px solid #4f4f4f;
            background-color: #646464;
            font-size: 1.2vw;
        }

            .p-0:hover {
                border: 1px solid #9c2424;
                background-color: white;
                color: black;
                font-weight: 5004caf50;
                border: 1px solid #4f4f4f;
            }

            .p-0:focus {
                outline: none !important;
                border: none !important;
                box-shadow: none !important;
            }

        .no-hvr:hover {
            border: 1px solid #9c2424;
            background-color: #9c2424 !important;
            color: white !important;
            font-weight: 500;
            border: 1px solid #4f4f4f;
            background-color: #4f4f4f !important;
        }

        .no-hvr {
            border: 1px solid #9c2424;
            background-color: #9c2424 !important;
            color: white !important;
            font-weight: 500;
            border: 1px solid #4f4f4f;
            background-color: #4f4f4f !important;
        }

        .h-add {
        }

        .fl {
            float: left;
        }
        .controlbox {
            opacity: 0.9;
            padding: 0;
            box-shadow: 0px 2px 10px black;
            transition: 1s;
        }

            .controlbox:hover {
                opacity: 1;
                box-shadow: 0px 2px 10px black;
            }

        .themearrow {
            position: absolute;
            top: 2%;
            left: 2%;
            font-size: 29px;
            color: #5f5959;
        }

        .icons {
            margin-left: 11px;
            font-size: 20px;
        }

        ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
            color: #d8d5d5;
            opacity: 1; /* Firefox */
        }

        #image-holder {
            display: block;
            position: fixed;
            top: 0px;
            left: 0px;
            z-index: 1000;
            width: 100%;
            height: 100%;
            background-color: #2d2d2de8;
            text-align: center;
        }

        #showimage {
            margin-top: 2%;
        }

        #closeholder {
            color: white;
            position: absolute;
            float: right;
            right: 0;
            top: 0;
            font-weight: 800;
            font-size: 37px;
            font-family: Muli;
            padding: 1%;
            padding-right: 2%;
            background-color: #00000063;
            padding-left: 2%;
            margin: 1%;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body onload="fontsizeadder(this);" onresize="fontsizeadder(this);" style="background-image: url('images/backgroun.png'); display: none;">
    <div class="header">
      <div class="txt-animation">
        <h1 class="qw1">Online Advertisement</h1>
        <h1 class="qw2">Advertise Your Business</h1>
      </div>
      <div class="nav">
        <ul id="ul">
          <li>
               <a class="nav-content" href="./index.aspx">Home</a>
            <a class="nav-content" href="./Adds.aspx">Advertise</a>
            <a class="nav-content" href="./frmProfile.aspx">Profile</a>
            <a class="nav-content" href="../Boards/View.aspx"
              >Billboards Management</a
            >
            <a class="nav-content" href="./frmLogout.aspx">Logout</a>
          </li>
        </ul>
      </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">

                <div id="image-holder" style="display: none; position: fixed; top: 0; left: 0; z-index: 1000; width: 100%; height: 100%;">
                    <p onclick="closeholder()" id="closeholder" style="font-color: white;">X</p>
                    <img id="showimage" src="" />
                </div>

                <form method="POST" enctype="multipart/form-data" action="save.php" id="myForm">
                    <input type="hidden" name="img_val" id="img_val" value="" />
                </form>

                <div id="target">
                    <div id="main_bg" style="z-index: 0; position: absolute; height: 100%; width: 100%;"></div>
                </div>
            </div>

            <div class="col-md-4 controlbox">
                <!--<p class = "htu" style = "margin-left: 14px;margin-top: 0;margin-top: 4px;"> Double click on an element to add properties on it <br>
                  Double click and drag to move to element<br> Keep elements in the box to have them in picture <br> 
                  throw them outside the box to discard them</p>-->
                <div class="controllers" style="display: block-inline;">
                    <div class="row h-add">
                        <div class="col-md-6 p-0">
                            <button class="btn p-0 br-0 w-100" style="border: none;" onclick="location.reload();">NEW POSTER<i class="fa fa-file-image-o icons" aria-hidden="true"></i></button>
                        </div>
                        <div class="col-md-6 p-0">
                            <label class="savebtn btn p-0 br-0 w-100" style="border: none; padding-top: 11px !important;">
                                SAVE POSTER<i class="fa fa-floppy-o icons" aria-hidden="true"></i><input hidden type="submit" value="Save Image" onclick="capture();" style="" />
                            </label>
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-6 p-0">
                            <label class="btn p-0 br-0 w-100" style="border: none; margin: 0px; padding-top: 11px !important;">UPLOAD IMAGE<i class="fa fa-upload icons" aria-hidden="true"></i><input type='file' onchange="addimage(this);" hidden /></label>
                        </div>
                        <div class="col-md-6 p-0">
                            <button class="btn p-0 br-0 w-100" style="border: none;" onclick="addtext();">ADD TEXT<i class="fa fa-font icons" aria-hidden="true"></i></button>
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-6 p-0">
                            <select class="btn p-0 br-0 w-100" style="border: none; text-align-last: center;" id="frames" class="dropdown fontholder" name="fonts" onchange="addframes(this);">
                                <option value="images/selectshape">SELECT FRAMES</option>
                                <option value="images/innervoice">innervoice</option>
                                <option value="images/wittyfeed">dark</option>
                                <option value="images/wittyfeed_white">light</option>
                                <option value="img1/17.jpg">Pulse</option>
                                <option value="img/3">Sochne Wali Baat hai</option>
                                <option value="images/natkhat">Natkhat Chutkule</option>
                           <option value="images/gyanchand">Gyanchand</option>
                                  <option value="images/innervoice_img">Innervoice with Image</option>
                           <option value="images/breakthesilence">Break The Silence</option>
                            </select>
                        </div>
                        <div class="col-md-6 p-0">
                            <select class="btn p-0 br-0 w-100" style="border: none; text-align-last: center;" id="frames" class="dropdown fontholder" name="fonts" onchange="changeRatio(this);">
                                <option value="1">SELECT ASPECT RATIO</option>
                                <option value="1">Standard</option>
                                <option value="2">4:3</option>
                                <option value="3">16:9</option>
                            </select>
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-4 p-0 no-hvr">
                            <center style="margin-top: 9%;">TEXT COLOR</center>
                        </div>
                        <div class="col-md-8 p-0">
                            <div class="col-md-2 p-0 w-100 fl" style="border-left: none; border-top: none; border-bottom: none;">
                                <button class="colors btn p-0 br-0 w-100" style="border: none; background-color: #ffffff"></button>
                            </div>
                            <div class="col-md-2 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <button class="colors btn p-0 br-0 w-100" style="border: none; background-color: #046fc2"></button>
                            </div>
                            <div class="col-md-2 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <button class="colors btn p-0 br-0 w-100" style="border: none; background-color: #ffba01"></button>
                            </div>
                            <div class="col-md-2 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <button class="colors btn p-0 br-0 w-100" style="border: none; background-color: #000000"></button>
                            </div>
                            <div class="col-md-4 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <input class="btn p-0 br-0 w-100 textcolors" style="border: none;" placeholder="#000000" />
                            </div>
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-4 p-0 no-hvr">
                            <center style="margin-top: 0%;">BACKGROUND COLOR</center>
                        </div>
                        <div class="col-md-8 p-0">
                            <div class="col-md-2 p-0 w-100 fl" style="border-left: none; border-top: none; border-bottom: none;">
                                <button class="bkcolors btn p-0 br-0 w-100" style="border: none; background-color: #ffffff"></button>
                            </div>
                            <div class="col-md-2 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <button class="bkcolors btn p-0 br-0 w-100" style="border: none; background-color: #046fc2"></button>
                            </div>
                            <div class="col-md-2 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <button class="bkcolors btn p-0 br-0 w-100" style="border: none; background-color: #ffba01"></button>
                            </div>
                            <div class="col-md-2 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <button class="bkcolors btn p-0 br-0 w-100" style="border: none; background-color: #000000"></button>
                            </div>
                            <div class="col-md-4 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <input class="btn p-0 br-0 w-100" style="border: none;" placeholder="#000000" />
                            </div>
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-4 p-0 ">
                            <button class="btn p-0 br-0 w-100" style="border: none;" onclick="scale(event)">RESIZE<i class="fa fa-expand icons" aria-hidden="true"></i></button>
                        </div>
                        <div class="col-md-8 p-0">
                            <input disabled class="p-0 br-0 w-100 btn sliders" type="range" min="1" max="100" value="100" id="myRange">
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-4 p-0">
                            <button class="btn p-0 br-0 w-100" style="border: none;" onclick="fontsize(event);">FONTSIZE<i class="fa fa-text-height icons" aria-hidden="true"></i></button>
                        </div>
                        <div class="col-md-8 p-0">
                            <input disabled class="btn p-0 br-0 w-100 sliders" type="range" min="0" max="150" value="0" id="fontsize">
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-4 p-0">
                            <button onclick="opacity(event)" class="btn p-0 br-0 w-100" style="border: none;">TRANSPARENCY</button>
                        </div>
                        <div class="col-md-8 p-0">
                            <input disabled class="btn p-0 br-0 w-100 sliders" type="range" min="0" max="10" value="10" id="opac">
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-12 p-0">
                            <select onchange="fontfamily(this);" class="btn p-0 br-0 w-100" style="border: none; text-align-last: center;" name="fonts" onchange="fontfamily(this);">
                                <option value="Select Font">SELECT FONT</option>
                                <option value="arial">Arial</option>
                                <option value="Roboto">Roboto</option>
                                <option value="Hind">Hindi</option>
                                <option value="Raleway">Raleway</option>
                                <option value="Josefin sans">Josefin</option>
                                <option value="Concert One">Concert One</option>
                                <option value="Montserrat">Montserrat</option>
                                <option value="Baloo">Baloo</option>
                                <option value="Muli">Muli</option>
                                <%--                           <option value="Kruti">Kruti Dev 010</option>--%>
                                <option value="Stanberry">Stanberry</option>
                            </select>
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-1 p-0 w-100 fl">
                            <button class="btn p-0 br-0 w-100 bold" style="border: none;"><b>B</b></button>
                        </div>
                        <div class="col-md-1 p-0 w-100 fl">
                            <button class="btn p-0 br-0 w-100 italic" style="border: none;"><i>I</i></button>
                        </div>
                        <div class="col-md-1 p-0 w-100 fl">
                            <button class="btn p-0 br-0 w-100 underline" style="border: none;"><u>U</u></button>
                        </div>
                        <div class="col-md-1 p-0 w-100 fl">
                            <button class="btn p-0 br-0 w-100 leftalign" style="border: none;"><i class="fa fa-align-left" aria-hidden="true"></i></button>
                        </div>
                        <div class="col-md-1 p-0 w-100 fl">
                            <button class="btn p-0 br-0 w-100 rightalign" style="border: none;"><i class="fa fa-align-right" aria-hidden="true"></i></button>
                        </div>
                        <div class="col-md-1 p-0 w-100 fl">
                            <button class="btn p-0 br-0 w-100 centeralign" style="border: none;"><i class="fa fa-align-center" aria-hidden="true"></i></button>
                        </div>
                        <div class="col-md-1 p-0 w-100 fl">
                            <button class="btn p-0 br-0 w-100 justifyalign" style="border: none;"><i class="fa fa-align-justify" aria-hidden="true"></i></button>
                        </div>
                        <div class="col-md-5 p-0 w-100 fl">
                            <button class="btn p-0 br-0 w-100 centerwhole" style="border: none;">CENTER</button>
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-12 p-0">
                            <select class="btn p-0 br-0 w-100" style="border: none; text-align-last: center;" id="shapes" name="fonts" onchange="addshape(this);">
                                <option value="selectshape">SELECT SHAPE</option>
                                <%--  <option value="images/wittylogo"> logo</option>
                           <option value="images/wittyfeed_india_logo"> logo</option>--%>
                                <option value="images/innervoicelogo">Innervoice logo</option>
                                <option value="images/ivlogo">iv logo</option>
                                <option value="images/wflogo">logo</option>
                                <option value="Color Layer">TINT</option>
                                <option value="images/quotes">Quotes</option>
                                <option value="square">square</option>
                                <option value="rectangle">rectangle</option>
                                <option value="line">line</option>
                            </select>
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-4 p-0 no-hvr">
                            <center style="margin-top: 9%;" style="border: none;">SHAPE COLOR</center>
                        </div>
                        <div class="col-md-8 p-0">
                            <div class="col-md-2 p-0 w-100 fl" style="border-left: none; border-top: none; border-bottom: none;">
                                <button class="shcolors btn p-0 br-0 w-100" style="border: none; background-color: #ffffff"></button>
                            </div>
                            <div class="col-md-2 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <button class="shcolors btn p-0 br-0 w-100" style="border: none; background-color: #046fc2"></button>
                            </div>
                            <div class="col-md-2 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <button class="shcolors btn p-0 br-0 w-100" style="border: none; background-color: #ffba01"></button>
                            </div>
                            <div class="col-md-2 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <button class="shcolors btn p-0 br-0 w-100" style="border: none; background-color: #000000"></button>
                            </div>
                            <div class="col-md-4 p-0 w-100 fl" style="border-top: none; border-bottom: none;">
                                <input class="btn p-0 br-0 w-100" style="border: none; font-color: white" placeholder="#000000" />
                            </div>
                        </div>
                    </div>
                    <div class="row h-add">
                        <div class="col-md-6 p-0">
                            <button onclick="picheja();" class="btn p-0 br-0 w-100" style="border: none;"><i class="fa fa-chevron-down" style="margin-right: 11px; font-size: 20px;" aria-hidden="true"></i>SEND BACK</button>
                        </div>
                        <div class="col-md-6 p-0">
                            <button onclick="aageaa();" class="btn p-0 br-0 w-100" style="border: none;">BRING FRONT<i class="fa fa-chevron-up icons" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        //////////////////////////////////////////////////ONLOAD FontSIZE adder/////////////////////////////////////////

        function fontsizeadder(elem) {
            var browserHeight = window.innerHeight;
            var rowHeight = browserHeight / 13;
            console.log(rowHeight);
            var elementArray = document.getElementsByClassName("h-add");
            console.log(elementArray);
            for (var i = 0; i < elementArray.length; ++i)
                elementArray[i].style.height = rowHeight + "px";
            document.getElementsByTagName("BODY")[0].style.display = "block";
            /*	var value = "";
                 for(var i = 1 ; i <= 55; i++){
                       document.getElementById('fontsizer').innerHTML = value + "<option value="+i+">"+i+"</option>";
                       value = value + "<option value="+i+">"+i+"</option>";
                 }
            */
        }

        universallayerindex = 0;
        textlayerindex = 0;
        imagelayerindex = 0;
        selectedid = 0;

        function picheja() {
            if (document.getElementById(selectedid).style.zIndex >= 1)
                document.getElementById(selectedid).style.zIndex = parseInt(document.getElementById(selectedid).style.zIndex) - 1;
        }


        function aageaa() {
            document.getElementById(selectedid).style.zIndex = parseInt(document.getElementById(selectedid).style.zIndex) + 1;
        }


        ////////////////////////////////////////////////////////////////COLORS TEXT ALIGNMENT///////////////////////////////////////////////////////


        $(document).ready(function () {
            $('.colors').click(function () {
                color = this.style.backgroundColor;
                document.execCommand("ForeColor", false, color);
            });
        });

        $(document).ready(function () {
            $('.clr').click(function () {
                color = document.getElementById("textcolorbox").value;
                document.execCommand("ForeColor", false, color);
            });
        });
        $(document).ready(function () {
            $('.bold').click(function () {
                document.execCommand("bold");
            });
        });
        $(document).ready(function () {
            $('.italic').click(function () {
                document.execCommand("italic");
            });
        });
        $(document).ready(function () {
            $('.centerwhole').click(function () {
                console.log("hellobhai");
                var elem = document.getElementById(selectedid);
                console.log(elem);
                x = elem.offsetWidth;
                y = elem.offsetHeight;
                X = (605 - x) / 2;
                Y = (605 - y) / 2;
                console.log(x, y, X, Y);
                elem.style.left = X + "px";
                elem.style.top = Y + "px";
            });
        });
        $(document).ready(function () {
            $('.underline').click(function () {
                document.execCommand("underline");
            });
        });
        $(document).ready(function () {
            $('.leftalign').click(function () {
                document.execCommand('justifyLeft');
            });
        });
        function setbgcolor(color) {
            document.getElementById("main_bg").style.backgroundColor = color;
        }
        $(document).ready(function () {
            $('.centeralign').click(function () {
                document.execCommand('justifyCenter');
            });
        });
        $(document).ready(function () {
            $('.rightalign').click(function () {
                document.execCommand('justifyRight');
            });
        });
        $(document).ready(function () {
            $('.justifyalign').click(function () {
                document.execCommand('justifyFull');
            });
        });
        $(document).ready(function () {
            $('.bkcolors').click(function () {
                color = this.style.backgroundColor;
                document.getElementById("main_bg").style.backgroundColor = color;
                console.log(color);
            });
        });
        $(document).ready(function () {
            $('.trybk').click(function () {
                color = document.getElementById("bkcolorbox").value;;
                document.getElementById("main_bg").style.backgroundColor = color;
                console.log(color);
            });
        });
        $(document).ready(function () {
            $('.shcolors').click(function () {
                color = this.style.backgroundColor;
                //console.log("id_"+selectedid);
                document.getElementById(selectedid).style.backgroundColor = color;
                console.log(color);
            });
        });


        //////////////////////////////////////////////////////////////////SCALE/////////////////////////////////////////////////////////


        function scale(event) {
            document.getElementById("myRange").disabled = false;
            document.getElementById("myRange").value = 50;
            var elem = document.getElementById(selectedid);
            console.log(selectedid);
            slider = document.getElementById("myRange");
            //console.log(elem.id);
            event = document.getElementById("shapes");
            slider.oninput = function () {
                if (elem.tagName == "IMG") {
                    elem.style.width = document.getElementById("myRange").value + "%";
                    //elem.style.height = document.getElementById("myRange").value + "%";
                    console.log(elem.tagName);
                }
                if (elem.tagName == "DIV") {
                    console.log(elem.tagName + elem.value);
                    if (event.value == "circle" || elem.value == "square") {
                        elem.style.width = document.getElementById("myRange").value + "%";
                        console.log(elem.offsetWidth);
                        elem.style.height = elem.offsetWidth;
                    }
                    if (event.value == "line") {
                        elem.style.width = document.getElementById("myRange").value + "%";
                    }
                    if (event.value == "rectangle") {
                        elem.style.width = document.getElementById("myRange").value + "%";
                        console.log(elem.offsetWidth);
                    }
                }
            }
        }


        ////////////////////////////////////////////////////////////////////OPACITY/////////////////////////////////////////////////////////


        function opacity(event) {
            document.getElementById("opac").disabled = false;
            document.getElementById("opac").value = 10;
            var elem = document.getElementById(selectedid);
            console.log(selectedid);
            slider = document.getElementById("opac");
            slider.oninput = function () {
                elem.style.opacity = document.getElementById("opac").value / 10;
            }
        }


        //////////////////////////////////////////////////////////////FONT FAMILY///////////////////////////////////////////////////////////


        function fontfamily(eleme) {
            console.log(eleme);
            var elem = document.getElementById(selectedid);
            console.log(selectedid);
            elem.style.fontFamily = eleme.value;
        }


        ////////////////////////////////////////////////////////////////ADD SHAPE/////////////////////////////////////////////////////////////


        function addshape(elem) {
            value = document.getElementById("target").innerHTML;
            if (textlayerindex != 0) {
                for (i = 0; i < universallayerindex; i++) {
                    console.log(document.getElementById("id_" + i).tagName);
                    if (document.getElementById("id_" + i).tagName == "TEXTAREA") {
                        strings.push(document.getElementById("id_" + i).value);
                        console.log("hello");
                    }
                }
            }
            if (elem.value == "square") { console.log(elem.value); document.getElementById("target").innerHTML = value + "" + '<div src = "" id = "id_' + universallayerindex + '" onclick = "dragElement(this);" style = " height: 100px; width: 100px; z-index : ' + universallayerindex + ';overflow : hidden; background-color: black; position : absolute;max-width: 500px;max-height: 500px;"/>'; }
            else if (elem.value == "rectangle") { console.log(elem.value); document.getElementById("target").innerHTML = value + "" + '<div src = "" id = "id_' + universallayerindex + '" onclick = "dragElement(this);" style = " height: 50px; width: 100px; z-index : ' + universallayerindex + ';overflow : hidden; background-color: red; position : absolute;max-width: 500px;max-height: 500px;"/>'; }
            else if (elem.value == "circle") { console.log(elem.value); document.getElementById("target").innerHTML = value + "" + '<div src = "" id = "id_' + universallayerindex + '" onclick = "dragElement(this);" style = " border-radius: 50%; height: 50px; width: 50px; z-index : ' + universallayerindex + ';overflow : hidden; background-color: red; position : absolute;max-width: 500px;max-height: 500px;"/>'; }
            else if (elem.value == "line") { console.log(elem.value); document.getElementById("target").innerHTML = value + "" + '<div src = "" id = "id_' + universallayerindex + '" onclick = "dragElement(this);" style = " height: 5px; width: 100px; z-index : ' + universallayerindex + ';overflow : hidden; background-color: red; position : absolute;max-width: 500px;max-height: 500px;"/>'; }
            else if (elem.value == "Color Layer") { selectedid = universallayerindex; console.log(elem.value); document.getElementById("target").innerHTML = value + "" + '<div src = "" id = "id_' + universallayerindex + '" onclick = "dragElement(this);" style = "opacity:0.6;height: 100%; width: 100%; z-index : ' + universallayerindex + ';overflow : hidden; background-color: black; position : absolute;"/>'; }
            else
                document.getElementById("target").innerHTML = value + "" + '<img onclick = "dragElement(this);" src = "' + elem.value + '.png" id = "id_' + universallayerindex + '" style = "width: 100%; z-index : ' + universallayerindex + ';position : absolute;"/>';

            if (textlayerindex != 0) {
                for (i = 0; i < universallayerindex; i++) {
                    if (document.getElementById("id_" + i).tagName == "TEXTAREA")
                        document.getElementById("id_" + i).value = strings[i];
                }
            }
            universallayerindex = universallayerindex + 1;
        }


        //////////////////////////////////////////////////////////////ADD FRAME////////////////////////////////////////////////////////////////


        function addframes(elem) {
            value = document.getElementById("target").innerHTML;
            strings = [];
            if (textlayerindex != 0) {
                for (i = 0; i < universallayerindex; i++) {
                    console.log(document.getElementById("id_" + i).className);
                    if (document.getElementById("id_" + i).className == "textbox")
                        strings.push(document.getElementById("id_" + i).value);
                }
            }

            if (elem.value != 'images/gyanchand') {//not gyanchand add frame
                document.getElementById("target").innerHTML = value + "" + '<img src = "' + elem.value + '.png" id = "id_' + universallayerindex + '" style = " height: 100%; width: 100%; z-index : ' + universallayerindex + ';position : absolute;"/>';
                value = value + '<img src = "' + elem.value + '.png" id = "id_' + universallayerindex + '" style = " height: 100%; width: 100%; z-index : ' + universallayerindex + ';position : absolute;"/>';
                universallayerindex++;
            }

            if (elem.value == 'images/1') {//done
                addtext("Muli", "white");
            }

            if (elem.value == 'images/swbh') {//done
                addtext("Stanberry", "black");
            }

            if (elem.value == 'images/natkhat') {//done
                addtext("kruti", "black", "800");
            }
            if (elem.value == 'images/wittyfeed_white') {//done
                addtext("Montserrat", "black");
            }
            if (elem.value == 'images/wittyfeed') {//done
                addtext("Montserrat", "white");
            }
            if (elem.value == 'images/indiakapulse') {//done
                addtext("Raleway", "black");
            }
            if (elem.value == 'images/gyanchand') {
                document.getElementById("target").innerHTML = value + "" + '<img src = "' + elem.value + '.png" id = "id_' + universallayerindex + '" style = " height: 100%; width: 100%; z-index : 100;position : absolute;"/>';
                value = value + "" + '<img src = "' + elem.value + '.png" id = "id_' + universallayerindex + '" style = " height: 100%; width: 100%; z-index : 100;position : absolute;"/>';
                universallayerindex++
                document.getElementById("target").innerHTML = value + "" + '<div class = "textbox" type = "text" onclick = "dragElement(this);" id = id_' + universallayerindex + ' style = "font-family: baloo;z-index : 100; color: black; position : absolute; top: 50%; left: 29%;" contenteditable>पाठ दर्ज करें</div>';
                universallayerindex++;
            }


            if (elem.value == 'images/quoteoftheday') {
                document.getElementById("target").innerHTML = value + "" + '<img src = "' + elem.value + '.png" id = "id_' + universallayerindex + '" style = " height: 100%; width: 100%; z-index : 100;position : absolute;"/>';
                value = value + "" + '<img src = "' + elem.value + '.png" id = "id_' + universallayerindex + '" style = " height: 100%; width: 100%; z-index : 100;position : absolute;"/>';
                universallayerindex++
                document.getElementById("target").innerHTML = value + "" + '<div class = "textbox" type = "text" onclick = "dragElement(this);" id = id_' + universallayerindex + ' style = "font-family: Muli;z-index : 100; color: white; font-weight: bold; position : absolute; top: 50%; left: 29%;" contenteditable>Enter Your Text</div>';
                universallayerindex++;
            }

            if (textlayerindex != 0) {
                for (i = 0; i < universallayerindex; i++) {
                    if (document.getElementById("id_" + i).className == "textbox")
                        document.getElementById("id_" + i).value = strings[i];
                }
            }
        }

        //////////////////////////////////////////////////////FONT SIZE///////////////////////////////////////////////////

        function fontsize(event) {
            document.getElementById("fontsize").disabled = false;
            document.getElementById("fontsize").value = 0;
            var elem = document.getElementById(selectedid);
            console.log("fontsize change on : " + selectedid);
            console.log(elem);
            slider = document.getElementById("fontsize");
            slider.oninput = function () {
                elem.style.fontSize = document.getElementById("fontsize").value + "px";
            }
        }


        ////////////////////////////////////////////////////////////////READ URL////////////////////////////////////////////////////////

        function readURL(input) {
            console.log("inside read url");
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('id_' + (universallayerindex - 1)).src = e.target.result;
                }
                reader.readAsDataURL(input.files[0]);
            }
            imagelayerindex = imagelayerindex + 1;
            universallayerindex = universallayerindex + 1;
        }
        var z = 0;


        ///////////////////////////////////////////////////////////ADD IMAGE////////////////////////////////////////////////////////


        function addimage(input) {
            console.log("Image adder");
            value = document.getElementById("target").innerHTML;
            strings = [];
            if (textlayerindex != 0) {
                for (i = 0; i < universallayerindex; i++) {
                    //console.log(document.getElementById("id_"+i).className);
                    if (document.getElementById("id_" + i).className == "textbox")
                        strings.push(document.getElementById("id_" + i).value);
                }
            }

            document.getElementById("target").innerHTML = value + "" + '<img src = "" id = "id_' + universallayerindex + '" onclick = "dragElement(this);" style = " max-width:100%; max-height:100%;z-index : ' + universallayerindex + ';overflow : hidden; position : absolute;"/>';

            if (textlayerindex != 0) {
                for (i = 0; i < universallayerindex; i++) {
                    if (document.getElementById("id_" + i).className == "textbox")
                        document.getElementById("id_" + i).value = strings[i];
                }
            }

            readURL(input);
        }

        var textindex = 0;


        ///////////////////////////////////////////////////////////ADD TEXT/////////////////////////////////////////////////////


        function addtext(font = "arial", color = "gray", weight = "500") {
            value = document.getElementById("target").innerHTML;
            strings = [];
            if (textlayerindex != 0) {
                for (i = 0; i < universallayerindex; i++) {
                    console.log(i + " " + document.getElementById("id_" + i).className);
                    if (document.getElementById("id_" + i).className == "textbox")
                        strings.push(document.getElementById("id_" + i).value);
                }
            }

            document.getElementById("target").innerHTML = value + "" + '<div class = "textbox" type = "text" onclick = "dragElement(this);" id = id_' + universallayerindex + ' style = "font-family: ' + font + ';z-index : ' + universallayerindex + '; color: ' + color + '; position : absolute; top: 42%; left: 34%; font-weight: ' + weight + '" contenteditable>Put your text here</div>';

            if (textlayerindex != 0) {
                for (i = 0; i < universallayerindex; i++) {
                    if (document.getElementById("id_" + i).className == "textbox")
                        document.getElementById("id_" + i).value = strings[i];
                }
            }

            textlayerindex++;
            universallayerindex = universallayerindex + 1;
        }


        ////////////////////////////////////////////////////////////////DRAG ELEMENT///////////////////////////////////////////////////


        function dragElement(elmnt) {
            selectedid = elmnt.id;
            console.log(elmnt.id + "this is selected");
            var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
            if (document.getElementById(elmnt.id + "header")) {
                /* if present, the header is where you move the DIV from:*/
                document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
            } else {
                /* otherwise, move the DIV from anywhere inside the DIV:*/
                elmnt.onmousedown = dragMouseDown;
            }

            function showCoords(event) {
                var x = event.clientX;
                var y = event.clientY;
                return x, y;
            }

            function dragMouseDown(e) {
                e = e || window.event;
                // get the mouse cursor position at startup:
                pos3 = e.clientX;
                pos4 = e.clientY;
                document.onmouseup = closeDragElement;
                // call a function whenever the cursor moves:
                document.onmousemove = elementDrag;
            }

            function elementDrag(e) {
                e = e || window.event;
                // calculate the new cursor position:
                pos1 = pos3 - e.clientX;
                pos2 = pos4 - e.clientY;
                pos3 = e.clientX;
                pos4 = e.clientY;
                // set the element's new position:
                elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
                elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
            }

            function closeDragElement() {
                /* stop moving when mouse button is released:*/
                document.onmouseup = null;
                document.onmousemove = null;
            }
        }
        function capture() {
            document.getElementById('fullpage').style.zoom = 3;

            $('#target').html2canvas({
                onrendered: function (canvas) {
                    // Set hidden field's value to image data (base-64 string)
                    $('#img_val').val(canvas.toDataURL("image/jpeg", 1.0));

                    // Display the captured image on the page
                    document.getElementById("showimage").src = canvas.toDataURL("image/png", 1.0);
                    document.getElementById("image-holder").style.display = "block";

                    // Create a download link
                    var downloadLink = document.createElement('a');
                    downloadLink.href = canvas.toDataURL("image/png", 1.0);
                    downloadLink.download = 'captured_image.png';

                    // Append the link to the body and simulate a click
                    document.body.appendChild(downloadLink);
                    downloadLink.click();

                    // Remove the link from the body
                    document.body.removeChild(downloadLink);

                    // Optionally, you can make an API call to save the canvas URL in the database
                    // Your API call code goes here
                }
            });

            document.getElementById('fullpage').style.zoom = 1;
        }





        ///////////////////////////////////////////////////CLOSE HOLDER///////////////////////////////////////////////////////////////

        function closeholder() {
            document.getElementById("image-holder").style.display = "none";
        }


        ///////////////////////////////////////////////////Ratio Change///////////////////////////////////////////////////////////////

        function changeRatio(input) {
            if (input.value === "1") {
                document.getElementById('target').style.height = "605px";
            }
            else if (input.value === "2") {
                document.getElementById('target').style.height = "454px";
            }
            else if (input.value === "3") {
                document.getElementById('target').style.height = "339px";
            }
        }
    </script>
    <style type="text/css">
        #target {
            border: 1px solid #CCC;
            padding: 5px;
            margin: 5px;
        }

        h2, h3 {
            color: #003d5d;
        }

        #more {
            font-family: Verdana;
            color: purple;
            background-color: #d8da3d;
        }
    </style>

<

</body>
</html>
