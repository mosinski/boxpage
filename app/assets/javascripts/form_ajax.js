$(document).on("ajax:success", "form", function(e, data, status, xhr) {
  if (!data.success) {
    $("#form_errors").html("").hide();
    $("#form_errors").removeClass(' alert-success');
    $("#form_errors").addClass("alert alert-danger animated fadeInUp");
    $.each(data.errors, function( index, error ){
      $("#form_errors").append("<b>"+error+"</b><br>");
    });
    $("#form_errors").show();
  } else {
    $("#form_errors").removeClass(' alert-danger');
    $("#form_errors").addClass("alert alert-success animated fadeInUp");
    $("#form_errors").html(data.notice).show();
    window.location = '/'
  }
});

$(document).on("keypress", "input", function(e) {
  $("#form_errors").removeClass(' fadeInUp');
  $("#form_errors").addClass("fadeInOut");
  $("#form_errors").fadeOut( 1000 );
  $("#form_errors").removeClass(' fadeInOut');
});
