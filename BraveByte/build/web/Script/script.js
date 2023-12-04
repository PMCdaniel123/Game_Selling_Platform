const pagesRight = document.querySelector(".body-page_right");
const pagesRightSelect = document.querySelector(".body-page_right_select");
const pagesLeft = document.querySelector(".body-page_left");
const pages = document.querySelector(".page");
const bodyPage = document.querySelector(".body-page");
const loginPage = document.querySelector(".login");
const signPage = document.querySelector(".sign-up");
const bodyLeft = document.querySelector(".body-page_left");
const bodyRight = document.querySelector(".body-page_right");
const loginButton = document.querySelector(".login-button");
const signUpButton = document.querySelector(".sign-up-button");
const backButton = document.querySelector(".body-page_back-button");
const forgotPasswordButtons = document.querySelectorAll(".forgot-password-button");
const forgotPassword = document.querySelector(".forgot-password");


function increaseHeight(element) {
  element.style.transition = "height 1s";
  element.style.height = "100%";
  bodyPage.style.height = "90%";
}
function countdownAndExpand() {
  setTimeout(() => {
    increaseHeight(pages);

    setTimeout(() => {
      pagesRightSelect.style.transform = "scale(1)";
    }, 1000);
  }, 1500);
}

const clearSelection = () => {
  pagesRight.style.width = "0%";
  pagesLeft.style.width = "90%";
  pagesLeft.style.alignItems = "flex-start";
  pagesLeft.style.justifyContent = "center";
  pagesRightSelect.style.display = "none";
  backButton.style.display = "block";
};

loginButton.addEventListener("click", function () {
  clearSelection();
  loginPage.style.display = "flex";
});

signUpButton.addEventListener("click", function () {
  clearSelection();
  signPage.style.display = "flex";
});


forgotPasswordButtons.forEach(button => {
  button.addEventListener("click", function () {
    clearSelection();
    forgotPassword.style.display = "flex";
    loginPage.style.display = "none";
  });
});

backButton.addEventListener("click", function () {
  signPage.style.display = "none";
  loginPage.style.display = "none";
  forgotPassword.style.display = "none";
  pagesRight.style.width = "80%";
  pagesLeft.style.width = "10%";
  pagesLeft.style.alignItems = "flex-start";
  pagesLeft.style.justifyContent = "center";
  pagesRightSelect.style.display = "flex";
  backButton.style.display = "none";
});
countdownAndExpand();