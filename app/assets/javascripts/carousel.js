$(function() {
  $('.owl-stage').slick({
    arrows: false,
  });
  $('.owl-dot').on('mouseover', function() {
    $('.owl-stage').slick('slickGoTo', $(this).index());
  });
});