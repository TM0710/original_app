window.addEventListener('turbo:load', function(){
  const sideCategorys = document.querySelectorAll(".side-category");
  sideCategorys.forEach(function(sideCategory) {
    sideCategory.addEventListener('mouseover', function() {
      this.setAttribute("style", "background-color: #EEEEEE;");
    });
    sideCategory.addEventListener('mouseout', function() {
      this.removeAttribute("style", "background-color" )
    });
  });
});
