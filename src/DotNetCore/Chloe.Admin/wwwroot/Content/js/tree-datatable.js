
function holdAll(btn, eleId) {
    var hold = $(btn).text() == "折叠";//当前列表的状态
    if (hold)
        $(btn).text("展开");
    else
        $(btn).text("折叠");

    var $tbody = $("#" + eleId);
    var $elesToHold;
    if (hold)
        $elesToHold = $tbody.find("[level=0] .glyphicon-triangle-bottom");
    else {
        //$elesToHold = $tbody.find("[level=0] .glyphicon-triangle-right");
        $elesToHold = $tbody.find(".glyphicon-triangle-right");//全部展开
    }

    $elesToHold.click();
}
function expandChildren(ele) {
    $ele = $(ele);

    var $tr = $ele.parent().parent();
    var id = $tr.attr("id");

    var selector = "tr[parent-id='" + id + "']";
    var $children = $tr.siblings(selector);

    var fold = false;
    if ($ele.hasClass("glyphicon-triangle-bottom")) {
        fold = true;
        $ele.removeClass("glyphicon-triangle-bottom");
        $ele.addClass("glyphicon-triangle-right");
    }
    else {
        $ele.removeClass("glyphicon-triangle-right");
        $ele.addClass("glyphicon-triangle-bottom");
        $children.show();//只展开子节点
        return;
    }

    for (var i = 0; i < $children.length; i++) {
        var child = $children[i];
        expandChildrenInner(child, fold);
    }
}
function expandChildrenInner(tr, fold) {
    var $tr = $(tr);
    var id = $tr.attr("id");

    var selector = "tr[parent-id='" + id + "']";
    var $children = $tr.siblings(selector);

    var isGroup = $children.length >= 0;

    for (var i = 0; i < $children.length; i++) {
        var child = $children[i];
        expandChildrenInner(child, fold);
    }

    var $icon = $tr.find(".glyphicon");
    if (fold) {
        $tr.hide();
        if (isGroup) {
            $icon.removeClass("glyphicon-triangle-bottom");
            $icon.addClass("glyphicon-triangle-right");
        }
    }
    else {
        $tr.show();
        if (isGroup) {
            $icon.removeClass("glyphicon-triangle-right");
            $icon.addClass("glyphicon-triangle-bottom");
        }
    }
}
function appendRetract(level) {
    var s = "";
    for (var i = 0; i < level * 4; i++) {
        s += "&nbsp;";
    }
    return s;
}

function bindSortable(ele, onOrderChanged) {
    var sortable = Sortable.create(ele, {
        handle: ".drag-ele",
        onChoose: function (/**Event*/evt) {
            evt.oldIndex;  // element index within parent

            //$("#tt").val($(evt.item).text());
        },
        onStart: function (/**Event*/evt) {
            evt.oldIndex;  // element index within parent

            var $item = $(evt.item);
            if (isRootNode($item)) {
                var $eles = $item.parent().children();
                var parentLastShowOffspringIndex = $eles.length - 1;
                for (var i = $eles.length - 1; i >= 0; i--) {
                    if ($($eles[i]).css("display") != "none") {
                        parentLastShowOffspringIndex = i;
                        break;
                    }
                }
                evt.item.parentLastShowOffspringIndex = parentLastShowOffspringIndex;
            }
            else {
                var $parent = $("#" + $(evt.item).attr("parent-id"));
                evt.item.parentLastShowOffspringIndex = findLastShowOffspringIndex($parent);
            }
        },
        onEnd: function (/**Event*/evt) {
            var itemEl = evt.item;  // dragged HTMLElement
            evt.to;    // target list
            evt.from;  // previous list
            evt.oldIndex;  // element's old index within old parent
            evt.newIndex;  // element's new index within new parent

            var $item = $(evt.item);

            if (evt.newIndex == evt.item.parentLastShowOffspringIndex) {
                adjustChildren($item);
                adjustChildren($item.prev());
                if (onOrderChanged)
                    onOrderChanged();
                return;
            }

            var $item_prev = $item.prev();
            if ($item_prev.attr("parent-id") == $item.attr("parent-id")) {
                //往下拖放置的位置前一个元素如果是同辈，则允许放置
                adjustChildren($item);
                if ($item_prev.length > 0)
                    adjustChildren($item_prev);
                if (onOrderChanged)
                    onOrderChanged();
                return;
            }

            var $item_next = $item.next();
            if ($item_next.attr("parent-id") == $item.attr("parent-id")) {
                //往上拖放置的位置后一个元素如果是同辈，则允许放置
                adjustChildren($item);
                return;
            }

            //还原到原来的位置
            var e = $item.parent().children()[evt.oldIndex];
            if (evt.oldIndex > evt.newIndex) {
                $(e).after($item);
            }
            else {
                $(e).before($item);
            }
        }
    });
}

function isRootNode($ele) {
    return $ele.attr("level") == "0"
}
function adjustChildren($ele) {
    //调整子节点的位置，全移到 $ele 后面
    var id = $ele[0].id;
    var $children = $ele.parent().find("[parent-id=" + id + "]");
    $ele.after($children);
    for (var i = 0; i < $children.length; i++) {
        adjustChildren($($children[i]));
    }
}
function findLastShowOffspringIndex($ele) {
    var lastOffspringIndex = findLastOffspringIndex($ele);
    var firstChildIndex = findFirstChildIndex($ele);
    var $eles = $ele.parent().children();
    for (var i = lastOffspringIndex; i >= firstChildIndex; i--) {
        if ($($eles[i]).css("display") != "none")
            return i;
    }

    return lastOffspringIndex;
}
function findFirstChildIndex($ele) {
    var $eles = $ele.parent().children();
    for (var i = 0; i < $eles.length; i++) {
        if ($($eles[i]).attr("parent-id") == $ele[0].id)
            return i;
    }

    return -1;
}
function findLastOffspringIndex($ele) {
    //获取 $ele 折叠区域内最后一个 tr 的索引
    var id = findLastOffspringId($ele);
    var $eles = $ele.parent().children();
    for (var i = 0; i < $eles.length; i++) {
        if ($eles[i].id == id)
            return i;
    }
}
function findLastOffspringId($ele) {
    var id = $ele[0].id;
    var $children = $ele.parent().find("[parent-id=" + id + "]");

    if ($children.length == 0) {
        return id;
    }

    return findLastOffspringId($($children[$children.length - 1]));
}
