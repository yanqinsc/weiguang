$(function () {
    if (top.location === self.location) {
        let link = self.location.href;
        top.location.href = link.indexOf('home') !== -1 ? '/home' : '/panel';
    }
});