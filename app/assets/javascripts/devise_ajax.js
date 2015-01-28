$(document).on("ajax:success", "form#sign_up_user, form#sign_in_user, form#edit_user", function(e, data, status, xhr) {
  if (!data.success) {
    $("#devise_errors").html("").hide();
    $("#devise_errors").removeClass(' alert-success');
    $("#devise_errors").addClass("alert alert-danger animated fadeInUp");
    $.each(data.errors, function( index, error ){
      $("#devise_errors").append("<b>"+error+"</b><br>");
    });
    $("#devise_errors").show();
  } else {
    $("#devise_errors").removeClass(' alert-danger');
    $("#devise_errors").addClass("alert alert-success animated fadeInUp");
    $("#devise_errors").html(data.notice).show();
    window.location = '/'
  }
});

$(document).on("keypress", "input", function(e) {
  $("#devise_errors").removeClass(' fadeInUp');
  $("#devise_errors").addClass("fadeInOut");
  $("#devise_errors").fadeOut( 1000 );
  $("#devise_errors").removeClass(' fadeInOut');
});
