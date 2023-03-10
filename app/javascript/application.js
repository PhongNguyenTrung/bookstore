// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false 
import "jquery"
import "jquery_ujs"
import "popper"
import "bootstrap"
import "select2"

$(document).on("turbo:load", () => {
  console.log("turbo!");
  $(".multiselect-modal").select2({
    dropdownParent: $('#newBook'),
    width: '100%',
  });
  $(".multiselect-modal").on('select2:opening select2:closing', function( event ) {
    var $searchfield = $( '#'+event.target.id).parent().find('.select2-search__field');
    // $searchfield.prop('disabled', true);
    $searchfield.css('display', 'none');
    // $searchfield.attr('inputmode','none')
    console.log("finding search term...",$searchfield);
  });
  $(".js-example-basic-multiple").select2({
    // theme: "bootstrap4",
    // placeholder: "Choose book's category",
    width: '100%',
  });
  $(".js-example-basic-multiple").on('select2:opening select2:closing', function( event ) {
    var $searchfield = $( '#'+event.target.id).parent().find('.select2-search__field');
    // $searchfield.prop('disabled', true);
    $searchfield.css('display', 'none');
    // $searchfield.attr('inputmode','none')
    console.log("finding search term...",$searchfield);
  });
});