
$('body').on('click', '#add_new_tip', function (e) {
    e.preventDefault();
    const key = randomString();

    let html = '<div id="formTipModal">';
    html += $('#formTipForm').html();
    html += '</div>';

    Swal.fire({
        html: html,
        showCancelButton: false,
        showConfirmButton: false,
        customClass: {
            content: 'p-0 text-left',
        },
        width: '48rem',
    });
});

$('body').on('click', '#saveFormTip', function (e) {
    e.preventDefault();
    const $this = $(this);
    let form = $('#formTipModal .js-form');
    handleFormTip(form, $this);
});

$('body').on('click', '.edit-form_tip', function (e) {
    e.preventDefault();
    const $this = $(this);

    editFormTip($this);
});

$('body').on('change', '.js-edit-formTip-locale-ajax', function (e) {
    e.preventDefault();
    const $this = $(this);
    const locale = $this.val();

    editFormTip($this, locale);
});

function editFormTip($this, locale) {
    const item_id = $this.attr('data-item-id');
    const form_id = $this.attr('data-form-id');

    const rendomKey = randomString();

    const edit_data = {
        item_id: form_id,
        locale: locale
    };

    $.post(adminPanelPrefix + '/forms/' + form_id + '/tip/'+item_id+'/edit', edit_data, function (result) {
        if (result && result.formTip) {
            const formTip = result.formTip;

            let html = '<div id="formTipModal">';
            html += $('#formTipForm').html();
            html += '</div>';

            html = html.replaceAll(adminPanelPrefix + '/forms/' + form_id + '/tip/store', adminPanelPrefix + '/forms/' + form_id + '/tip/' + item_id + '/update');

            Swal.fire({
                html: html,
                showCancelButton: false,
                showConfirmButton: false,
                customClass: {
                    content: 'p-0 text-left',
                },
                width: '48rem',
                onOpen: () => {
                    var $modal = $('#formTipModal');

                    Object.keys(formTip).forEach(key => {
                        $modal.find('[name="' + key + '"]').val(formTip[key]);
                    });

                    var localeSelect = $modal.find('select[name="locale"]');

                    if (localeSelect) {
                        localeSelect.addClass('js-edit-formTip-locale-ajax');
                        localeSelect.attr('data-item-id', item_id);
                        localeSelect.attr('data-form-id', form_id);
                    }
                }
            });
        }
    });
}
//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEe
function encodeAnyInputValue(inputValue) {
    var encodedValue = btoa(encodeURIComponent(inputValue));
    return "btoa64_" + encodedValue + "_btoa64";
}
window.handleFormTip = function (form, $this) {
    var data = serializeObjectByTag(form);
    Object.keys(data).forEach(key => {
        if(key != "form_id"){
            data[key] = encodeAnyInputValue(data[key]);
        }
    });
    var action = form.attr('data-action');
    $this.addClass('loadingbar primary').prop('disabled', true);
    form.find('input').removeClass('is-invalid');
    form.find('textarea').removeClass('is-invalid');
    $.post(action, data, function (result) {
        if (result && result.code === 200) {
            Swal.fire({
                icon: 'success',
                html: '<h3 class="font-20 text-center text-dark-blue py-25"> Saved </h3>',
                showConfirmButton: false,
                width: '25rem'
            });
            setTimeout(function () {
                window.location.reload();
            }, 500);
        }
    }).fail(function (err) {
        $this.removeClass('loadingbar primary').prop('disabled', false);
        var errors = err.responseJSON;
        if (errors && errors.errors) {
            Object.keys(errors.errors).forEach(function (key) {
                var error = errors.errors[key];
                var element = form.find('.js-ajax-' + key);
                element.addClass('is-invalid');
                element.parent().find('.invalid-feedback').text(error[0]);
            });
        }
    });
};


/*-----------------------------*/


$('body').on('click', '#add_new_about', function (e) {
    e.preventDefault();
    const key = randomString();

    let html = '<div id="formAboutModal">';
    html += $('#formAboutForm').html(); 
    html += '</div>';

    Swal.fire({
        html: html,
        showCancelButton: false,
        showConfirmButton: false,
        customClass: {
            content: 'p-0 text-left',
        },
        width: '48rem',
    });
});

$('body').on('click', '#saveFormAbout', function (e) {
    e.preventDefault();
    const $this = $(this);
    let form = $('#formAboutModal .js-form');
    handleFormAbout(form, $this);
});

$('body').on('click', '.edit-form_about', function (e) {
    e.preventDefault();
    const $this = $(this);
    editFormAbout($this);
});

$('body').on('change', '.js-edit-formAbout-locale-ajax', function (e) {
    e.preventDefault();
    const $this = $(this);
    const locale = $this.val();

    editFormAbout($this, locale);
});

function editFormAbout($this, locale) {
    const item_id = $this.attr('data-item-id');
    const form_id = $this.attr('data-form-id');

    const rendomKey = randomString();

    const edit_data = {
        item_id: form_id,
        locale: locale
    };
    $.post(adminPanelPrefix + '/forms/' + form_id + '/about/'+item_id+'/edit', edit_data, function (result) {
        if (result && result.formAbout) {
            const formAbout = result.formAbout;

            let html = '<div id="formAboutModal">';
            html += $('#formAboutForm').html();
            html += '</div>';

            html = html.replaceAll(adminPanelPrefix + '/forms/' + form_id + '/about/store', adminPanelPrefix + '/forms/' + form_id + '/about/' + item_id + '/update');

            Swal.fire({
                html: html,
                showCancelButton: false,
                showConfirmButton: false,
                customClass: {
                    content: 'p-0 text-left',
                },
                width: '48rem',
                onOpen: () => {
                    var $modal = $('#formAboutModal');

                    Object.keys(formAbout).forEach(key => {
                        $modal.find('[name="' + key + '"]').val(formAbout[key]);
                    });

                    var localeSelect = $modal.find('select[name="locale"]');

                    if (localeSelect) {
                        localeSelect.addClass('js-edit-formAbout-locale-ajax');
                        localeSelect.attr('data-item-id', item_id);
                        localeSelect.attr('data-form-id', form_id);
                    }
                }
            });
        }
    });
}
window.handleFormAbout = function (form, $this) {
    var data = serializeObjectByTag(form);
    //EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEe
    Object.keys(data).forEach(key => {
        if(key != "form_id"){
            data[key] = encodeAnyInputValue(data[key]);
        }
    });
    var action = form.attr('data-action');
    $this.addClass('loadingbar primary').prop('disabled', true);
    form.find('input').removeClass('is-invalid');
    form.find('textarea').removeClass('is-invalid');
    $.post(action, data, function (result) {
        if (result && result.code === 200) {
            Swal.fire({
                icon: 'success',
                html: '<h3 class="font-20 text-center text-dark-blue py-25"> Saved </h3>',
                showConfirmButton: false,
                width: '25rem'
            });
            setTimeout(function () {
                window.location.reload();
            }, 500);
        }
    }).fail(function (err) {
        $this.removeClass('loadingbar primary').prop('disabled', false);
        var errors = err.responseJSON;
        if (errors && errors.errors) {
            Object.keys(errors.errors).forEach(function (key) {
                var error = errors.errors[key];
                var element = form.find('.js-ajax-' + key);
                element.addClass('is-invalid');
                element.parent().find('.invalid-feedback').text(error[0]);
            });
        }
    });
};