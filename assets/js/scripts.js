window.onscroll = function scrollSun() {
    $('.background-sun').css('top', (400+this.scrollY/2)+'px');
}