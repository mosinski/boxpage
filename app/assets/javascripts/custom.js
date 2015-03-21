$(document).on('ready page:load', function () {
  $('[data-toggle="popover"]').popover({
    html: true,
    trigger: 'click',
    container: 'body'
  })
});
