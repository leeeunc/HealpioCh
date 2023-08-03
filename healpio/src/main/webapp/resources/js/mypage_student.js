function showContent(contentType) {
    console.log(contentType);

    const contentTypes = ['info', 'scrap', 'reservation', 'prev'];
    const contentContainers = {
        info: document.querySelector('.content-info'),
        scrap: document.querySelector('.content-scrap-container'),
        reservation: document.querySelector('.content-reservation-container'),
        prev: document.querySelector('.content-prev-container'),
    };

    contentTypes.forEach((type) => {
        const container = contentContainers[type];
        if (type === contentType) {
            container.style.display = 'block';
        } else {
            container.style.display = 'none';
        }
    });
}