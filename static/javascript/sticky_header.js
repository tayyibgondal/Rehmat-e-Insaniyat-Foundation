// When the user scrolls the page, execute myFunction
window.onscroll = function() {myFunction()};

// Get the header
var header = document.getElementById("pg_subheader");

// Get the offset position of the navbar
var sticky = header.offsetTop;

if(document.getElementById('main_home') != undefined) {
  header.classList.add('transparent_bg');
}

// Add the sticky class to the header when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
    header.classList.add("main_hd_solid_bg");
  } else {
    header.classList.remove("sticky");
    header.classList.remove("main_hd_solid_bg");
  }
}