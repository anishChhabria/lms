$("#menu-toggle").click(function(e) {
  e.preventDefault();
  $("#wrapper").toggleClass("toggled");
});


var Table_contents = document.getElementById("Table-contents");
// Get the button that opens the modal
var Users = document.getElementById("Users");
// When the user clicks the button, open the modal 
Users.onclick = function() {
Users.style.display = "index.html";
}