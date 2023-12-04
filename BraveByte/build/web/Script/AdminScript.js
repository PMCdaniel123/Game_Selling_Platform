const addGame = document.querySelector(".add-games");
const showUsers = document.querySelector(".list-user");
const addGamePage = document.querySelector(".add-game");
const showUsersPage = document.querySelector(".show-list-user");



addGame.addEventListener("click", () => {
    addGamePage.style.display = "flex";
    showUsersPage.style.display = "none";

})

showUsers.addEventListener("click", () => {
    addGamePage.style.display = "none";
    showUsersPage.style.display = "block";

})