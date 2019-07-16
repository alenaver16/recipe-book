let counter = 2;

$(document).ready(() => {
    $('#create-ingridient').on('click', createNewIngridient);
    $('#add-ingridient').on('click', addIngridientTemplate);
});

function addIngridientTemplate() {
    let template = initializeTemplate();
    $(".ingridients-container").append(template);
    counter++;
}

function createNewIngridient() {
    let name = $('#create-ingridient-name').val();
    $.ajax({
        url: 'create-ingridient',
        type: 'post',
        data: {name: name},
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function (response) {
            let option = '<option value="' + response["ingridient_id"] + '">' + response["name"] + '</option>';
            $(".select-box-container").append(option);

            let ingridient = {
                id: response["ingridient_id"],
                name: response["name"]
            };

            ingridients.push(ingridient);
            $("#create-ingridient-form").modal("hide");
            $('#create-ingridient-name').val('');
        },
        error: function (error) {
            alert('Something went wrong!');
        }
    });
}

function initializeTemplate() {
    let options;
    for (let i = 0; i < ingridients.length; i++) {
        options += '<option value="' + ingridients[i].id + '">' + ingridients[i].name + '</option>';
    }

    let template = '<div class="ingridients-row">' +
        '<select class="form-control select-box-container" name="ingridient[' + counter + '][ingridient_id]">' +
        options +
        '</select>' +
        '<input class="form-control ml-10 mr-10" name="ingridient[' + counter + '][count]" type="text">' +
        '<button type="button" onclick="removeRow(this)" class="btn btn-danger remove-button"><strong>X</strong></button>' +
        '</div>';

    return template;
}

function removeRow(e) {
    let row = $(e).closest(".ingridients-row");
    row.remove();
}