/* 페이지 진입시에 처음 보여질 기능*/
$(".signup-form").hide();
$(".signup").css("background", "#f4f4f4");

/**클릭시 반응 기능 */
$(".login").click(function(){
  $(".signup-form").hide();
  $(".login-form").show();
  $(".signup").css("background", "#f4f4f4");
  $(".login").css("background", "#fff");
});

$(".signup").click(function(){
  $(".signup-form").show();
  $(".login-form").hide();
  $(".login").css("background", "#f4f4f4");
  $(".signup").css("background", "#fff");
});

/*$(".btn").click(function(){
  $(".btn").css("background", "#828282");
});*/