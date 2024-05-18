﻿        window.onload = function () {
            var scrollY = parseInt('<%=Request.Form["scrollY"] %>');
            if (!isNaN(scrollY)) {
                window.scrollTo(0, scrollY);
            }
        };
window.onscroll = function () {
    var scrollY = document.body.scrollTop;
    if (scrollY == 0) {
        if (window.pageYOffset) {
            scrollY = window.pageYOffset;
        }
        else {
            scrollY = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
        }
    }
    if (scrollY > 0) {
        var input = document.getElementById("scrollY");
        if (input == null) {
            input = document.createElement("input");
            input.setAttribute("type", "hidden");
            input.setAttribute("id", "scrollY");
            input.setAttribute("name", "scrollY");
            document.forms[0].appendChild(input);
        }
        input.value = scrollY;
    }
};