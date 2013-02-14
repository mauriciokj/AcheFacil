$(document).ready(function () {
    $(".prateleira").draggable({ revert: "invalid"});
});

$(document).ready(function () {
    $(".ambiente_interno").droppable({
        accept:".prateleira",
        hoverClass:"active",
        drop:function (event, props) {
            $.get("ambientes/vincula_prateleira",
                {drag_id:$(props.draggable).attr("id"),
                    drop_id:$(this).attr("id"),
                    valor:$(this).attr("value"),
                    style:$(props.draggable).attr("style")
                },
                function(){}
                );
        }
    });
});
