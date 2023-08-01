
window.onload = function() {
    let left = document.querySelector('#arrow-left');
    let right = document.querySelector('#arrow-right');
    let bannerList = document.querySelector('.bannerList');

    let index = 0;

    var interval = setInterval(function(){
        imgChange();
    }, 3500)

    function imgChange(){
        index += 1;
        if (index > 2) {
            index = 0;
        };
        
        bannerList.style.transform = `translate3d(-${1400 * index}px, 0, 0)`;
    }

    left.addEventListener('click', () => {
        
        index -= 1;
        if (index < 0) {
            index = 2;
        };
        bannerList.style.transform = `translate3d(-${1400 * index}px, 0, 0)`;

        
     });
     
     right.addEventListener('click', () => {
        
        index += 1;
        if (index > 2) {
            index = 0;
        };
        
        bannerList.style.transform = `translate3d(-${1400 * index}px, 0, 0)`;
     });
}