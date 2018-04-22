var clients = [];
$(function () {
    clients = $.clientsInit();
})
$.clientsInit = function () {
    var dataJson = {
        authorizeMenu: [],
    };
    var init = function () {
        $.ajax({
            url: "../Home/GetClientsDataJson",
            type: "get",
            dataType: "json",
            async: false,
            success: function (ret) {
                var data = ret.Data;

                dataJson.authorizeMenu = data.authorizeMenu;
            }
        });
    }
    init();
    return dataJson;
}