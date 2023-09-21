var current = 0;
showSlides();

function showSlides() {
   var slides1 = document.querySelectorAll("#slides1 > img");

   for(let i =0; i<slides1.length; i++) {
      slides1[i].style.display = "none";

   }
   
   current++;
   if(current > slides1.length)
      current = 1;
   slides1[current -1].style.display = "block";

   setTimeout(showSlides, 3000);
}




//
//
//const swiper = new Swiper(".swiper", {
//  // Optional parameters
//  loop: true,
//
//  // If we need pagination
//  pagination: {
//    el: ".swiper-pagination",
//  },
//
//  // Navigation arrows
//  navigation: {
//    nextEl: ".swiper-button-next",
//    prevEl: ".swiper-button-prev",
//  },
//
//  // And if we need scrollbar
//  scrollbar: {
//    el: ".swiper-scrollbar",
//  },
//});
