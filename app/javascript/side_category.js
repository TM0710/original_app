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

  const lists = document.querySelectorAll(".list");
  lists.forEach(function(list) {
    list.addEventListener('mouseover', function() {
      this.setAttribute("style", "background-color: #EEEEEE;");
    });
    list.addEventListener('mouseout', function() {
      this.removeAttribute("style", "background-color" )
    });
  });

  const favorite = document.querySelector(".favorite-link");
  favorite.addEventListener('mouseover', function() {
    this.setAttribute("style", "background-color: #EEEEEE;");
  });
  favorite.addEventListener('mouseout', function() {
    this.removeAttribute("style", "background-color" )
  });
});
