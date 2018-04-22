/*
 * select2
 * 事件：https://select2.org/programmatic-control/events
 * 方法：https://select2.org/programmatic-control/methods
 * 绑定数据格式 https://select2.org/data-sources/formats
 * 远程加载数据 https://select2.org/data-sources/ajax
 */

var formatState = function (state) {
    return state.text + "-";
    //console.log(state);
    if (!state.id) {
        return state.text;
    }
    var $state = $('<span><img src="/public/images/' + state.element.dataset.plantform + '.jpg" style="width:25px;" /> '
        + state.text + '</span>');


    return $state;
}
$(function () {
    $('.js-example-basic-single').select2({
        placeholder: '-请选择-',
        //tags: false,//还不知道干嘛的
    });

    //设置已选，后触发更新
    $('.js-example-basic-single').val(1);
    $('.js-example-basic-single').trigger('change');
    var val = $(".js-example-basic-single").val();
    console.log(val);

    $('.js-example-basic-multiple').select2({
        placeholder: '-请选择-'
    });

    $('.js-example-basic-multiple2').select2({
        placeholder: '-请选择-',
        //data: [{ id: 1, text: "A北京" }, { id: 2, text: "B上海" }, { id: 3, text: "C广州" }],
        data: [{
            text: "北京",
            children:
            [
                { id: 1, text: "H海淀区" },
                { id: 2, text: "C朝阳区" },
                { id: 3, text: "C昌平区" }
            ]
        }, {
            text: "上海",
            children:
            [
                { id: 4, text: "J静安区", selected: true },//默认选中
                { id: 5, text: "X徐汇区" },
                { id: 6, text: "Y杨浦区" }
            ]
        }, {
            text: "广州",
            children:
            [
                { id: 7, text: "T天河区" },
                { id: 8, text: "B白云区" },
                { id: 9, text: "P番禺区" }
            ]
        }],
        allowClear: true,//显示清除按钮
        maximumSelectionLength: 20 //设置最多选择个数
        , tags: true
        , tokenSeparators: [',', ' ']
    });
    $('.js-example-basic-multiple2').on('change', function (e) {
        //var data = e.params.data;
        //console.log(data);
        //取值
        var selected = $('.js-example-basic-multiple2').select2('data');
        //var selectedOptions = $('.js-example-basic-multiple2').find(':selected');//返回的是被选的option标签
        console.log(selected);
    });

    //多选设置选中
    $('.js-example-basic-multiple2').val(['1', '2']);
    $('.js-example-basic-multiple2').trigger('change');

    //取消被选
    //$('.js-example-basic-multiple2').val(null).trigger('change');
    //$(".js-example-basic-multiple2").select2("val", "");

    //清空后重新绑定数据
    //$('.js-example-basic-multiple2').select2("destroy");
    //$(".js-example-basic-multiple2").empty();
    //$('.js-example-basic-multiple2').select2({
    //    data: [
    //        { id: 1, text: "H海淀区" },
    //        { id: 2, text: "C朝阳区" },
    //        { id: 3, text: "C昌平区" }
    //    ]
    //});

    //$('.js-example-basic-multiple2').select2({ data: [] });
    //$('.js-example-basic-multiple2').select2('data', []);

    $(".js-example-templating").select2({
        templateSelection: formatState,
    });

    //       $("#select2-id").select2({
    //           templateResult: formatState, // 列表带图片
    //           templateSelection: formatState, // 选中的带图片

    //           language: "zh-CN", //设置 提示语言
    //           width: "100%", //设置下拉框的宽度
    //           placeholder: "请选择", // 空值提示内容，选项值为 null
    //           //placeholder: {id: '', text: "请选择"}, // 同上，这里默认空值为 ''
    //           minimumInputLength: 10,  //最小需要输入多少个字符才进行查询
    //allowClear: true, //是否允许清空选中
    //           tags: false,  //设置必须存在的选项 才能选中，设置不存在的值则为null,如果 placeholder: {id: '', text: "请选择"} 则为 ''
    //           selectOnClose: true, // 如果没有手动选中，下拉框消失后会自动选中被hover的选项 （不建议使用）
    //           closeOnSelect: false, // 选择后下拉框不会关闭（单选-不建议使用）
    //           minimumResultsForSearch: Infinity, // 隐藏搜索框
    //           theme: "classic", // 样式

    //           maximumSelectionLength: 3,  // 多选 - 设置最多可以选择多少项
    //           tokenSeparators: [',', ' '], // 多选 - 输入逗号和空格会自动完成一个选项 前提是：tags: true
    //       });
});

$(function () {
    $("#btn").click(function () {
        console.log($("#IsMenu3")[0].checked);
        //$("#IsMenu3")[0].checked = !$("#IsMenu3")[0].checked;
        //$("#IsMenu5")[0].checked = !$("#IsMenu5")[0].checked;
        var tt = $("#IsMenu2").attr("disabled");
        if (tt) {
            $("#IsMenu2").removeAttr("disabled");
        }
        else {
            $("#IsMenu2").attr("disabled", "t");
        }
    });
});
