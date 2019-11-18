$(document).on('turbolinks:load', function(){
  $('#sidebarCollapse').on('click', function () {
    $(this).toggleClass('active');
    $('#sidebar').toggleClass('active');
    $.cookie.set('admin_sidebar_collapse', $(this).hasClass('active'));
  });

  var sidebarController = $('#sidebar').data('current-controller');
  if (sidebarController.length > 0) {
    $('#sidebar a.active').removeClass('active');
    $('#sidebar ul.collapse.show').removeClass('show');
    var activeLi = $('#sidebar a[data-controller="' + sidebarController + '"]');
    activeLi.addClass('active');
    activeLi.parent().parent('ul.collapse').addClass('show');
  }
});