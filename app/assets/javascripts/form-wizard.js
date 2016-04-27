$(document).on('click', 'a#to-details', function () {
    $('#details-page').show();
    $('#basic-page').hide();
    $('a#detail-side-click').parent().addClass('side-nav-clicked').siblings().removeClass('side-nav-clicked');
});

$(document).on('click', 'a#back-to-basic', function(){
  $('#details-page').hide();
  $('#basic-page').show();
  $('a#basic-side-click').parent().addClass('side-nav-clicked').siblings().removeClass('side-nav-clicked');
});

$(document).on('click', 'a#to-amenities', function(){
  $('#details-page').hide();
  $('#amenities-page').show();
  $('a#amenity-side-click').parent().addClass('side-nav-clicked').siblings().removeClass('side-nav-clicked');
});

$(document).on('click', 'a#back-to-details', function(){
  $('#details-page').show();
  $('#amenities-page').hide();
  $('a#detail-side-click').parent().addClass('side-nav-clicked').siblings().removeClass('side-nav-clicked');
});

$(document).on('click', 'a#to-photos', function(){
  $('#amenities-page').hide();
  $('#photos-page').show();
  $('a#photo-side-click').parent().addClass('side-nav-clicked').siblings().removeClass('side-nav-clicked');
});

$(document).on('click', 'a#back-to-amenities', function(){
  $('#photos-page').hide();
  $('#amenities-page').show();
  $('a#amenity-side-click').parent().addClass('side-nav-clicked').siblings().removeClass('side-nav-clicked');
});

$(document).on('keyup', 'input.address-form', function(){
  var sellerAddress = $('input.address-form').val();
  sellerAddress = sellerAddress.toLowerCase().replace(/\b[a-z]/g, function(letter) {
    return letter.toUpperCase();
});
  $('#address-title').text(sellerAddress);
});

//-----------
// sidebar 
//----------- 

$(document).on('click', 'a#basic-side-click', function(){
  $('#basic-page').show();
  $('#details-page').hide();
  $('#amenities-page').hide();
  $('#photos-page').hide();
  $(this).parent().addClass('side-nav-clicked').siblings().removeClass('side-nav-clicked');
});

$(document).on('click', 'a#detail-side-click', function(){
  $('#details-page').show();
  $('#basic-page').hide();
  $('#amenities-page').hide();
  $('#photos-page').hide();
  $(this).parent().addClass('side-nav-clicked').siblings().removeClass('side-nav-clicked');
});

$(document).on('click', 'a#amenity-side-click', function(){
  $('#amenities-page').show();
  $('#details-page').hide();
  $('#basic-page').hide();
  $('#photos-page').hide();
  $(this).parent().addClass('side-nav-clicked').siblings().removeClass('side-nav-clicked');
});

$(document).on('click', 'a#photo-side-click', function(){
  $('#photos-page').show();
  $('#amenities-page').hide();
  $('#details-page').hide();
  $('#basic-page').hide();
  $(this).parent().addClass('side-nav-clicked').siblings().removeClass('side-nav-clicked');
});

