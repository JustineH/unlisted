function initMap(){var a={lat:49.2821055,lng:-123.1104596};map=new google.maps.Map(document.getElementById("map"),{center:a,zoom:15,scrollwheel:!1});var o=new google.maps.Marker({position:a,map:map,draggable:!0,animation:google.maps.Animation.DROP})}var map;$(function(){$(".home-page").length>0?window.addEventListener("scroll",function(){window.scrollY>11?($(".navbar").addClass("navbar-bg"),$(".navbar-nav > li > a").css({color:"#262626","padding-top":"10px"}),console.log("activated")):($(".navbar").removeClass("navbar-bg"),$(".navbar-nav > li > a").css({color:"#fff","padding-top":"20px"}),console.log("deactivated"))},!1):window.addEventListener("scroll",function(){window.scrollY>11?($(".navbar").addClass("navbar-bg"),$(".navbar-nav > li > a").css({color:"#262626","padding-top":"10px"}),console.log("activated")):($(".navbar").removeClass("navbar-bg"),$(".navbar-nav > li > a").css({color:"#262626","padding-top":"20px"}),console.log("deactivated"))},!1),$("#welcome-carousel.carousel").carousel({interval:4e3}),$(".carousel").carousel({interval:!1})});