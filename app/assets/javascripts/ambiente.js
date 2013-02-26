$(document).ready(function () {
    $(".prateleira_drag").draggable({ revert: "invalid"});
});

$(document).ready(function () {
    $(".drop").droppable({
        accept: ".prateleira",
        hoverClass: "active",
        drop: function (event, props) {
            $.get("ambientes/vincula_prateleira",
                {drag_id: $(props.draggable).attr("id"),
                    drop_id: $(this).attr("id"),
                    valor: $(this).attr("value"),
                    style: $(props.draggable).attr("style")
                },
                function () {
                }
            );
        }
    });
});

$(document).ready(function () {
    $(".seleciona_produto").on("click", function (event) {
        window.location = "/pesquisa/" + $('#produto_'+ $(this).attr('id') ).attr('value');
    });
});

$(document).ready(function () {
    $(".click").on("click", function (event) {
        window.location = "/produtos/seleciona_prateleira?prateleira_id=" + $(this).attr('id')  + "&produto_id=" + $('#produto_id').attr('value')+ "&selecionada=" + $(this).attr('selecionada') ;
    });
});