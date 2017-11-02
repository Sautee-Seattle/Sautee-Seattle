// Wrap every letter in a span
$(function() {
  $('.ml9 .letters').each(function(){
    $(this).html($(this).text().replace(/([^\x00-\x80]|\w)/g, "<span class='letter'>$&</span>"));
  });

  anime.timeline({loop: true})
  .add({
    targets: '.ml9 .letter',
    scale: [0, 1],
    duration: 1500,
    elasticity: 600,
    delay: function(el, i) {
      return 45 * (i+1)
    }
  }).add({
    targets: '.ml9',
    opacity: 0,
    duration: 1000,
    easing: "easeOutExpo",
    delay: 1000
  });

  function loadingAnimation() {
    var overlay = document.getElementById("spinner");
    overlay.style.display = 'none';
    $('#home-page').fadeIn(2500);
    $('.wrapper').fadeIn(2500);
  };
  window.onload = setTimeout(loadingAnimation, 2500);
})
