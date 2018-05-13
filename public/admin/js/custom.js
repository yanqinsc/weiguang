$(function () {
    $('#show-number').change(function () {
        $('#show-number-form').submit();
    });

    $('option[value=' + $('[name=paginate_number]').val() + ']').attr('selected', true);

    $('.a-remove').click(function () {
        $('#form-destroy').attr('action', $(this).attr('data-url')).show();
    });

    $('#comfirm-cancel').click(function () {
        $('#form-destroy').hide();
    })

    $('#current-title', window.parent.document).html($('#title').val());
    $('#current-title-right', window.parent.document).html($('#title').val());
});

// used in ability list and role permissions
$(function () {
    $('.sub-menu').click(getSubmenu);
});

function getSubmenu() {
    let trId = $(this).parent('td').parent('tr').attr('id');
    let subClass = $('tr[class^=' + trId + ']');
    if ($(this).hasClass('fa-plus-square-o')) {
        $(this).removeClass('fa-plus-square-o').addClass('fa-minus-square-o');
        if (subClass.length > 0) {
            subClass.show();
        }
    } else {
        $(this).removeClass('fa-minus-square-o').addClass('fa-plus-square-o');
        subClass.hide();
    }

    // if element doesn't exist then create it
    if (!subClass.length) {
        let url = '/home/ability/submenu?pid=' + $(this).attr('data-pid');
        $.get(url, function (result) {
            result.forEach(function (item, index) {
                let len = trId.match(eval('/-/g')).length;
                let delimiter = '';
                for (i = 0; i < len; i++) {
                    delimiter += '— ';
                }
                let title = '<i class="sub-menu fa  fa-plus-square-o" data-pid="' + item.id + '"></i> ' + item.title;
                if (item.sub_count === 1) {
                    title = item.title;
                }
                title = delimiter + title;
                let checkBox = '';
                if ($('input[type=checkbox]').length > 0) {
                    checkBox = '<td class="sorting_1"><input class="assign" type="checkbox" value="' + item.id + '"></td>';
                }
                let html =
                    '<tr class="' + trId + '" id="' + trId + '-' + item.id + '">' +
                    checkBox +
                    '<td class="sorting_1">' + item.order + '</td>' +
                    '<td class="sorting_1">' + item.id + '</td>' +
                    '<td>' + title + '</td>' +
                    '<td>' + item.name + '</td>' +
                    '<td>' + item.route_name + '</td>' +
                    '<td>' +
                    '<a href="/home/ability/create?id=' + item.id + '" title="添加下级权限">' +
                    '<i class="fa fa-plus"></i>' +
                    '</a> ' +
                    '<a href="/home/ability/' + item.id + '/edit" title="编辑">' +
                    '<i class="fa fa-edit"></i>' +
                    '</a> ' +
                    '<a href="javascript:void(0) " data-url="/home/ability/' + item.id + '" title="删除" class="a-remove">' +
                    '<i class="fa fa-trash"></i>' +
                    '</a>' +
                    '</td>' +
                    '</tr>';
                $('#' + trId).after(html);
                // update the click event that bind on button
                $('.sub-menu').unbind().click(getSubmenu);
            });
        });
    }

    $('.assign').change(function () {
        if ($(this).attr('checked')) {
            alert(321);
        }
    });
}