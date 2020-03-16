$("#modal-window").find(".modal-content").html("<%= j (render 'destroy') %>");
$("#modal-window").modal();