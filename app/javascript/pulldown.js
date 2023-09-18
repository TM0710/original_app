document.addEventListener('turbo:load', function() {
  const userButton = document.getElementById("user_nav");
  const logoutButton = document.getElementById("logout");
  userButton.addEventListener('click', function() {
    if (logoutButton.getAttribute("style") == "display:block;") {
      logoutButton.removeAttribute("style")
    } else {
      logoutButton.setAttribute("style", "display:block;")
    }
  })

  const roomButton = document.getElementById("room_nav");
  const now_roomButton = document.getElementById("now_room");
  roomButton.addEventListener('click', function() {
    if (now_roomButton.getAttribute("style") == "display:block;") {
      now_roomButton.removeAttribute("style")
    } else {
      now_roomButton.setAttribute("style", "display:block;")
    }
  })

  const deleteButton = document.getElementById("delete_nav");
  const room_deleteButton = document.getElementById("delete_btn");
  deleteButton.addEventListener('click', function() {
    if (room_deleteButton.getAttribute("style") == "display:block;") {
      room_deleteButton.removeAttribute("style")
    } else {
      room_deleteButton.setAttribute("style", "display:block;")
    }
  })
});
