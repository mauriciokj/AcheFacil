$(document).ready(function () {
    $(".ambiente").on("click", function (event) {
        url = "/pesquisa/" + $('#produto_id').attr('value')+ '/ID?ambiente=' +  $(this).attr('id');
        window.location = url;
    });
});/**
 * Created with JetBrains RubyMine.
 * User: mauriciokj
 * Date: 16/03/13
 * Time: 00:10
 * To change this template use File | Settings | File Templates.
 */
