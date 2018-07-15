$(function () {
    let loginPage = $("#login-page");
    if (loginPage.length && top.location !== self.location) {
        top.location = self.location;
    } else {
        if (top.location === self.location) {
            alert(self.location);
        }
    }
});