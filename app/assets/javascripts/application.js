// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery
//= require bootstrap-sprockets
//= require_tree .


// Top nav bar behaviour
// Creates bg and font colour when scrolled
$(function(){
if ($('#welcome-carousel').length > 0){
    window.addEventListener("scroll", function() {
        if (window.scrollY > 11) {
            $('.navbar').addClass("navbar-bg");
            $('.navbar-nav > li > a').css({
                'color': '#262626',
                'padding-top': '10px'
            });
            console.log("activated");
        }
        else {
          $('.navbar').removeClass("navbar-bg");
            $('.navbar-nav > li > a').css({
                'color': '#fff',
                'padding-top': '20px'
            });
            console.log("deactivated");
        }
    },false);
}else{
    window.addEventListener("scroll", function() {
        if (window.scrollY > 11) {
            $('.navbar').addClass("navbar-bg");
            $('.navbar-nav > li > a').css({
                'color': '#262626',
                'padding-top': '10px'
            });
            console.log("activated");
        }
        else {
          $('.navbar').removeClass("navbar-bg");
            $('.navbar-nav > li > a').css({
                'color': '#262626',
                'padding-top': '20px'
            });
            console.log("deactivated");
        }
    },false);
}

// Home page carousel
// rotate every 4 sec
$('section.carousel').carousel({
  interval: 4000
});

// Pause all other carousel
$('.carousel').carousel({
  interval: false
});

});




