$("#modal-window").find(".modal-content").html("<%= j (render 'destroy') %>");
jQuery("#modal-window").modal();