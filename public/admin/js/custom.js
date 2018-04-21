$(function () {
    $('#show-number').change(function () {
        $('#show-number-form').submit();
    });

    $('option[value=' + $('[name=paginateNumber]').val() + ']').attr('selected', true);

});