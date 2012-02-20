//= require jquery_ujs

$ () ->
  $('a[rel~="external"]').each () ->
    $(this).attr target: '_blank'

    $(this).click () ->
      _gaq.push ['_trackEvent', 'Outbound Links', $(this).href, $(this).text]
