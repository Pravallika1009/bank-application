/**
 * 
 */
const mobileMenu = document.getElementById('mobile-menu');
const navList = document.querySelector('.nav-list');


mobileMenu.addEventListener('click', () => {
    navList.classList.toggle('active'); // Toggle visibility of the nav list
    if (navList.classList.contains('active')) {
        navList.style.display = 'flex'; // Show the menu
    } else {
        navList.style.display = 'none'; // Hide the menu
    }
});



