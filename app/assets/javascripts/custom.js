$(document).on('ready page:load', function () {
  $//('[data-toggle="popover"]').popover({html:true, trigger: 'focus'})
  $('[data-toggle="popover"]').popover({
    html: true,
    trigger: 'manual',
    container: 'body'
}).click(function(e) {
    $(this).popover('toggle');
    e.stopPropagation();
});
});
$(document).on('click','html', function () {
  $('[data-toggle="popover"]').popover('hide');
});