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
    $searchfield.css('display', 'none');
    console.log("finding search term...",$searchfield);
  });
  $(".js-example-basic-multiple").select2({
    width: '100%',
  });
  $(".js-example-basic-multiple").on('select2:opening select2:closing', function( event ) {
    var $searchfield = $( '#'+event.target.id).parent().find('.select2-search__field');
    $searchfield.css('display', 'none');
    console.log("finding search term...",$searchfield);
  });

  // increase quantity in cart
  $('.cart-table td.quantity .increase').on('click', function(){
    var currentRow = $(this).parent().parent();
    var value = parseInt($(this).next().val()) + 1;
    var sub_total = currencyToFloat($(currentRow).children('.price').text()) * value;
    $(this).next().val(value);
    $(currentRow).children('.sub-total').text(toCurrency(sub_total));

    calculateSubTotal();

  });
  
  // decrease quantity in cart
  $('.cart-table td.quantity .decrease').on('click', function(){
    if(parseInt($(this).prev().val()) > 1){
      var currentRow = $(this).parent().parent();
      var value = parseInt($(this).prev().val()) - 1;
      var sub_total = currencyToFloat($(currentRow).children('.price').text()) * value;
      $(this).prev().val(value);
      $(currentRow).children('.sub-total').text(toCurrency(sub_total));

      calculateSubTotal();
    }
    else {
      alert("Quantity can't be less than 1!");
    }
  });

  // click on remove button in cart
  $('.cart-table td.action > i').on('click', function(){
    $(this).parent().parent().remove();
    calculateSubTotal();
  });
});

function toCurrency(currency){
  return currency.toLocaleString('en-US', {
    style: 'currency',
    currency: 'USD',
  });
}

function currencyToFloat(currency){
  return parseFloat(currency.replace(/[$,]+/g,""));
}

function calculateSubTotal(){
  var total = 0;
  var $subTotal = $('.cart-totals > table > tbody > tr.cart-subtotal td:last');
  var $discount =  $('.cart-totals > table > tbody > tr.cart-coupon td:last');
  var $total =  $('.cart-totals > table > tbody > tr.order-total td:last')
  
  $('.cart-table table tbody > tr td.sub-total').each(function(){
    total = total + currencyToFloat($(this).text());
  });
  // update subtotal and total
  $subTotal.text(toCurrency(total));
  $total.text(toCurrency(total - currencyToFloat($discount.text())));

}