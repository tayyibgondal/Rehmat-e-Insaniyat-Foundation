// Get the button:
let mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  console.log('Help me please!');
  var i = 1;                  //  set your counter to 1

  function myLoop() {         //  create a loop function
    setTimeout(function() {   //  call a 3s setTimeout when the loop is called
      if(document.body.scrollTop != 0 || document.documentElement.scrollTop != 0){
        document.body.scrollTop -= 0.09 * i * i; // For Safari
        document.documentElement.scrollTop -= 0.09 *  i * i; // For Chrome, Firefox, IE and Opera
      }
      else return;
      i++;                    //  increment the counter
      if (i < 10000) {           //  if the counter < 10, call the loop function
        myLoop();             //  ..  again which will trigger another 
      }                       //  ..  setTimeout()
    }, 10)
  }
  
  myLoop();
}