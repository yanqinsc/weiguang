$(function () {
    let loginPage = $("#login-page");
    if (loginPage.length && top.location !== self.location) {
        top.location = self.location;
    } else {
        if (top.location === self.location) {
            let link = self.location.href;
            top.location.href = link.indexOf('home') !== -1 ? '/home' : '/panel';
        }
    }
});