$(document).on('turbolinks:load', function() {
  $('#owl-item').slick({
    arrows: false,
  });
});

//   $('.owl-dot').slick({
//     asNavFor: '#owl-item',
//     slidedToShow: 2,
//     slidesToScroll: 1,
//     centerMode: true,
//     focusOnSelect: true,
//     mouseover: true,
//     prevArrow: false,
//     nextArrow: false,
//     variableWidth: true,
//     centerMode: false,
//   });
// });


  // let slideWidth = $('.owl-stage').outerWidth();
  // let slideNum = $('.owl-stage').length;
  // let slideSetWidth = slideWidth * slideNum * 1.1
  // $('#main').css('width', slideSetWidth);

  // $('.mini-item-image').mouseover(function() {
  //   let index = $('.mini-item-image').index(this);
  //   setTimeout(function() {
  //     $('#main').animate({
  //       left: slideWidth * -index
  //     }, 350);
  //   }, 350);
  // })



//   let image_count = $('.owl-dots .owl-dot').length;
//   switch(image_count){
//     case 1 : $('.owl-dots').slick({
//         asNavFor:         '.owl-stage',
//         focusOnSelect:    true,
//         slidesToShow:     1,
//         draggable:        false,
//       });
//     ; break;

//     case 2 : $('.owl-dots').slick({
//         asNavFor:         '.owl-stage',
//         focusOnSelect:    true,
//         slidesToShow:     2,
//         draggable:        false,
//       });
//     ; break;

//     case 3 : $('.owl-dots').slick({
//         asNavFor:         '.owl-stage',
//         focusOnSelect:    true,
//         slidesToShow:     3,
//         draggable:        false,
//       });
//     ; break;

//     case 4 : $('.owl-dots').slick({
//         asNavFor:         '.owl-stage',
//         focusOnSelect:    true,
//         slidesToShow:     4,
//         draggable:        false,
//       });
//     ; break;

//     case 5 : $('.owl-dots').slick({
//         asNavFor:         '.owl-stage',
//         focusOnSelect:    true,
//         slidesToShow:     5,
//         draggable:        false,
//       });
//     ; break;

//     case 6 : $('.owl-dots').slick({
//         asNavFor:         '.owl-stage',
//         focusOnSelect:    true,
//         slidesToShow:     6,
//         draggable:        false,
//       });
//     ; break;

//     case 7 : $('.owl-dots').slick({
//         asNavFor:         '.owl-stage',
//         focusOnSelect:    true,
//         slidesToShow:     7,
//         draggable:        false,
//       });
//     ; break;

//     case 8 : $('.owl-dots').slick({
//         asNavFor:         '.owl-stage',
//         focusOnSelect:    true,
//         slidesToShow:     8,
//         draggable:        false,
//       });
//     ; break;

//     case 9 : $('.owl-dots').slick({
//         asNavFor:         '.owl-stage',
//         focusOnSelect:    true,
//         slidesToShow:     9,
//         draggable:        false,
//       });
//     ; break;

//     case 10 : $('.owl-dots').slick({
//         asNavFor:         '.owl-stage',
//         focusOnSelect:    true,
//         slidesToShow:     10,
//         draggable:        false,
//       });
//     ; break;
//   }
// });