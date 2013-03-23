$(document).ready(function () {
    $("#prateleiras").on("change", function (event) {
        prateleira = $(this).attr('value');
        $.ajax({ url: "/seleciona_prateleira_produto/" + prateleira })
    })
});

/**
 * Created with JetBrains RubyMine.
 * User: mauriciokj
 * Date: 22/03/13
 * Time: 21:24
 * To change this template use File | Settings | File Templates.
 */
