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
    var $currentRow = $(this).parent().parent();
    var value = parseInt($(this).next().val()) + 1;
    var sub_total = currencyToFloat($currentRow.children('.price').text()) * value;

    $('.cart-table > table > tbody td.actions button').prop({'disabled': false});
    $(this).next().val(value);
    $currentRow.children('.sub-total').text(toCurrency(sub_total));
    $currentRow.addClass('updated');

    calculateSubTotal();

  });
  
  // decrease quantity in cart
  $('.cart-table td.quantity .decrease').on('click', function(){
    if(parseInt($(this).prev().val()) > 1){
      var $currentRow = $(this).parent().parent();
      var value = parseInt($(this).prev().val()) - 1;
      var sub_total = currencyToFloat($currentRow.children('.price').text()) * value;

      $('.cart-table > table > tbody td.actions button').prop({'disabled': false});
      $(this).prev().val(value);
      $currentRow.children('.sub-total').text(toCurrency(sub_total));
      $currentRow.addClass('updated');
      
      calculateSubTotal();
    }
    else {
      alert("Quantity can't be less than 1!")
    }
  });

  // click on remove button in cart
  $('.cart-table td.action > a').on('click', function(){
    var url = $(this).attr('href');
    if (confirm('Are you sure?')) {
      $(this).parent().parent().remove();
      calculateSubTotal();
      $.ajax({
        url: url,
        method: 'DELETE',
        success: function(response) {
          
        },
        error: function(response) {
          alert('Can not delete!');
        }
      });
    } 
  });

  // click on button Update Cart
  $('.cart .cart-table table tbody tr td.actions button').on('click', function(){
    $('.cart .cart-table table tbody tr.updated').each(function(){
      var id = $(this).data('id');
      var quantity = parseInt($(this).find('.quantity input').val());

      $.ajax({
        url: `/cart_details/${id}`,
        method: 'PATCH',
        data: {quantity: quantity},
        success: function(response){
            alert("Updated!");
        },
        error: function(jqXHR, textStatus, errorThrown){

        }
      })
    });
  });

  // click on checked input in cart
  $('.cart .cart-table table tbody tr td.status').on('click', function(){
    calculateSubTotal();
  })

  // click on proceed to checkout
  $('.cart-totals .proceed-to-checkout button').on('click', function(){
    var $checkedRows = $('.cart-table table tbody > tr').has('input[type="checkbox"]:checked');
    $checkedRows.each(function(){
      var id = $(this).data('id');
      $.ajax({
        url: `/cart_details/${id}`,
        method: 'PUT',
        data: {status: true},
        success: function(response){
            
        },
        error: function(jqXHR, textStatus, errorThrown){

        }
      })

    });
  });

  $('.order .payment .payment-method #shipping_address').on('change', function(){
    if($(this).val() != ''){
      $('.order .payment .place-order button').prop('disabled', false);
    }
    else
      $('.order .payment .place-order button').prop('disabled', true);
  });
  
  // click on place order 
  $('.order .payment .place-order button').on('click', function(){
    var data = {};
    data["payment_method"] = $('.order .payment .payment-method input:checked').val();
    if($('.order .payment .payment-method #shipping_address').val() != ''){
      var id = $(this).data('id');
      data["shipping_address"] = $('.order .payment .payment-method #shipping_address').val();
      data["status"] = true;
      $.ajax({
        url: `/order/${id}`,
        method: 'PUT',
        data: data,
        success: function(response){
            // delete all cart-details in order
          deleteCartDetails();
           
        },
        error: function(jqXHR, textStatus, errorThrown){
          alert("Faile to update!")
        }
      });
    }
    else {
      alert('Please type Shipping Address before placing order!');
    }
  });

  // click on Done to process order in Shop page
  $('.shop-order-processing table tr td a').on('click', function(){
    $(this).closest('tr').remove();
    alert('Processing order!')
  })

  // // click on shops tab
  // $('.shop-tabs .nav-tabs .nav-item a').on('click', function(){
  //   $('.shop-tabs .nav-tabs .nav-item a.active').removeProp('aria-current').removeClass('active');
  //   $(this).addClass('active');
  // });
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
  var $total =  $('.cart-totals > table > tbody > tr.order-total td:last');
  var $checkedRows = $('.cart-table table tbody > tr').has('input[type="checkbox"]:checked');
  $checkedRows.each(function(){
    total += currencyToFloat($(this).find('td.sub-total').text());
  });
  
  // update subtotal and total
  $subTotal.text(toCurrency(total));
  $total.text(toCurrency(total - currencyToFloat($discount.text())));
  if($checkedRows.length) 
    $('.cart-totals .proceed-to-checkout button').prop('disabled', false);
  else  $('.cart-totals .proceed-to-checkout button').prop('disabled', true);
}

function deleteCartDetails(){
  $(".order .order-review tr.item").each(function(){
    var id = $(this).data("id");
    $.ajax({
      url: `/cart_details/${id}`,
      method: 'DELETE',
      success: function(result) {
        
      }
    })
  });
}