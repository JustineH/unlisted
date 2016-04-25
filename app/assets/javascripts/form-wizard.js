$(document).on('click', 'a#to-details', function () {
    $('#details-page').show();
    $('#basic-page').hide();
});

$(document).on('click', 'a#back-to-basic', function(){
  $('#details-page').hide();
  $('#basic-page').show();
});

$(document).on('click', 'a#to-amenities', function(){
  $('#details-page').hide();
  $('#amenities-page').show();
});

$(document).on('click', 'a#back-to-details', function(){
  $('#details-page').show();
  $('#amenities-page').hide();
});

$(document).on('click', 'a#to-photos', function(){
  $('#amenities-page').hide();
  $('#photos-page').show();
});

$(document).on('click', 'a#back-to-amenities', function(){
  $('#photos-page').hide();
  $('#amenities-page').show();
});

$(document).on('keyup', 'input.address-form', function(){
  var sellerAddress = $('input.address-form').val();
  sellerAddress = sellerAddress.toLowerCase().replace(/\b[a-z]/g, function(letter) {
    return letter.toUpperCase();
});
  $('#address-title').text(sellerAddress);
});