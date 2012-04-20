// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
    
    $(".add-travel-package").click(function(){
        $(this).parent("tr").before("<tr colspan=13 class=travel_odd>" 
                                      + "<td>" 
                                      + "<input name=travel_package[name] type=text class=small-text-box>" 
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[one_pax_g_or_d] type=text class=small-text-box>"
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[two_pax_g_or_d] type=text class=small-text-box>"
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[three_pax_g_or_d] type=text class=small-text-box>"
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[one_pax_g_and_d] type=text class=small-text-box>"
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[two_pax_g_and_d] type=text class=small-text-box>"
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[three_pax_g_and_d] type=text class=small-text-box>"
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[four_pax_g_and_d] type=text class=small-text-box>"
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[four_to_nine_pax] type=text class=small-text-box>"
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[ten_to_fifteen_pax] type=text class=small-text-box>"
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[sixteen_to_twentyfive_pax] type=text class=small-text-box>"
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[five_to_nine_pax] type=text class=small-text-box>"
                                      + "</td>"
                                      + "<td>"
                                      +  "<input name=travel_package[twenty_more_pax] type=text class=small-text-box>"
                                      + "</td>"
                                      + "</tr>");
        $(this).parent("tr").before("<tr colspan=13><td colspan=13 class=add-travel-package><input type=submit class=save-button value=SAVE><a>Cancel</a></td></tr>");
        
    });
    
});