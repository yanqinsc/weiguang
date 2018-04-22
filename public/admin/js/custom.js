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