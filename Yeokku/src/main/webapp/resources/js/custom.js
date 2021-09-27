(function ($) {
  "use strict";

  var review = $('.client_review_slider');
  if (review.length) {
    review.owlCarousel({
      items: 3,
      loop: true,
      dots: false,
      autoplay: true,
      margin: 40,
      autoplayHoverPause: true,
      autoplayTimeout: 5000,
      nav: true,
      navText: [
        '<i class="ti-angle-left"></i>',
        '<i class="ti-angle-right"></i>'
      ],
      responsive: {
        0: {
          items: 1,
          nav: false
        },
        576: {
          items: 2,
          nav: false
        },
        768: {
          items: 2,
          nav: false

        },
        991: {
          items: 3,
          nav: true
        }
      }
    });
  }
  var event = $('.event_slider');
  if (event.length) {
    event.owlCarousel({
      items: 1,
      loop: true,
      dots: false,
      autoplay: true,
      margin: 40,
      autoplayHoverPause: true,
      autoplayTimeout: 5000,
      nav: true,
      navText: [
        '<i class="ti-angle-left"></i>',
        '<i class="ti-angle-right"></i>'
      ],
      responsive: {
        0: {
          nav: false
        },
        600: {
          nav: false
        },
        991: {
          nav: true
        }
      }
    });
  }
  
  var nc_select = $('.nc_select');
  if(nc_select.length){
    nc_select.niceSelect();
  }

  $('#datepicker_1').datepicker();
  $('#datepicker_2').datepicker();  
  $('#datepicker_3').datepicker();
  $('#datepicker_4').datepicker();  
  $('#datepicker_5').datepicker();
  $('#datepicker_6').datepicker();
  $('#datepicker_7').datepicker();
  $('#datepicker_8').datepicker();

  $('.gallery_img').magnificPopup({
    type: 'image',
    gallery:{
      enabled:true
    }
  });

  $('.popup-youtube, .popup-vimeo').magnificPopup({
    // disableOn: 700,
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 160,
    preloader: false,
    fixedContentPos: false
  });




}(jQuery));