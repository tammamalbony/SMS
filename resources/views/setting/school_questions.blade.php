@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">الأسئلة المدرسية</h4>
                    <button class="btn btn-primary d-inline-block" id="addQuestion">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">الأسئلة المدرسية</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mb-30">
                <div class="card card-statistics h-100">
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>العنوان</th>
                                    <th>الوصف</th>
                                    <th>النوع</th>
                                    <th>الترتيب</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody id="sortable-list">
                                @foreach ($schoolQuestions as $index => $question)
                                    <tr id="question-{{ $question->id }}" data-id="{{ $question->id }}">
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $question->title }}</td>
                                        <td>{{ $question->description }}</td>
                                        <td>{{ $question->type }}</td>
                                        <td>{{ $question->order }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $question->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $question->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                            @if (($question->type == 'select_many' || $question->type == 'select_one') &&   $question->hasOptions())
                                                <button class="btn btn-info relation-button" title="ربط مع سؤال "
                                                    data-id="{{ $question->id }}"><i class="fa fa-link"></i></button>
                                            @endif
                                            <button class="btn btn-secondary link-option-button"
                                                onclick="linkOption({{ $question->id }})" title="ربط مع خيار"
                                                data-id="{{ $question->id }}"><i class="fa fa-link"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $schoolQuestions->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function linkOption(targetid) {
            // First, open a modal with a dropdown of all questions
            Swal.fire({
                title: 'Link Questions to Options',
                html: `<select id="all-questions" class="swal2-input" onchange="loadOptions2(this.value ,${targetid})">
                  <option value="">Select a Question</option>
               </select>
               <div id="options-container"></div>`, // Container for checkboxes
                didOpen: () => {
                    Swal.showLoading();
                    // Fetch all questions
                    fetch('/get-school-questions-options')
                        .then(response => response.json())
                        .then(data => {
                            Swal.hideLoading();
                            const questionSelect = document.getElementById('all-questions');
                            data.forEach(question => {
                                const option = new Option(question.title, question.id);
                                questionSelect.add(option);
                            });
                        })
                        .catch(error => {
                            console.error('Error loading questions:', error);
                            Swal.update({
                                html: 'Failed to load questions',
                                showConfirmButton: true
                            });
                        });
                },
                preConfirm: () => {
                    const selectedOptions = Array.from(document.querySelectorAll(
                        '#options-container input[type="checkbox"]:checked')).map(input => input.value);
                    return {
                        questionId: targetid,
                        optionIds: selectedOptions
                    };
                },
                confirmButtonText: 'ربط',
                showCancelButton: true,
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    console.log('Linked Options:', result.value);
                    fetch('/school-questions/link', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute(
                                    'content')
                            },
                            body: JSON.stringify(result.value)
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                Swal.fire('Success', 'Options linked successfully', 'success');
                            } else {
                                Swal.fire('Error', 'Failed to link options', 'error');
                            }
                        })
                        .catch(error => {
                            console.error('Error submitting linked options:', error);
                            Swal.fire('Error', 'Failed to submit linked options', 'error');
                        });
                }
            });
        }

        function loadOptions(questionId) {
            if (!questionId) {
                document.getElementById('options-container').innerHTML = '';
                return;
            }
            Swal.showLoading();
            // Fetch options for the selected question
            fetch(`/school-questions/${questionId}/options`)
                .then(response => response.json())
                .then(data => {
                    Swal.hideLoading();
                    let optionsHtml = '';
                    data.forEach(option => {
                        optionsHtml += `<div><input type="checkbox" id="option-${option.id}" value="${option.id}">
                                <label for="option-${option.id}">${option.option_text}</label></div>`;
                    });
                    document.getElementById('options-container').innerHTML = optionsHtml;
                })
                .catch(error => {
                    console.error('Error loading options:', error);
                    document.getElementById('options-container').innerHTML = 'Failed to load options';
                });
        }
        function loadOptions2(questionId,targetid) {
            if (!questionId) {
                document.getElementById('options-container').innerHTML = '';
                return;
            }
            Swal.showLoading();
            // Fetch options for the selected question
            fetch(`/school-questions/${questionId}/options/${targetid}`)
                .then(response => response.json())
                .then(data => {
                    Swal.hideLoading();
                    let optionsHtml = '';
                    data.forEach(option => {
                        optionsHtml += `<div><input type="checkbox" id="option-${option.id}" value="${option.id}" ${option.checked == true ? "checked" : ""}>
                                <label for="option-${option.id}">${option.option_text}</label></div>`;
                    });
                    document.getElementById('options-container').innerHTML = optionsHtml;
                })
                .catch(error => {
                    console.error('Error loading options:', error);
                    document.getElementById('options-container').innerHTML = 'Failed to load options';
                });
        }


        document.addEventListener('DOMContentLoaded', (event) => {


            $("#sortable-list").sortable({
                update: function(event, ui) {
                    let order = $(this).sortable('toArray', {
                        attribute: 'data-id'
                    });
                    $.ajax({
                        url: '{{ route('school-questions.updateOrder') }}',
                        method: 'POST',
                        data: {
                            _token: '{{ csrf_token() }}',
                            order: order
                        },
                        success: function(response) {
                            if (response.success) {
                                Swal.fire('تم التحديث!', 'تم تحديث ترتيب الأسئلة بنجاح.',
                                    'success');
                            } else {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء تحديث الترتيب.', 'error');
                            }
                        }
                    });
                }
            });
        });

        function toggleOptions(type, options = []) {
            const container = document.getElementById('options-container');
            container.innerHTML = '';

            if (type === 'select_many' || type === 'select_one') {
                options.forEach((option, index) => {
                    container.innerHTML +=
                        `<div class="input-group mb-2">
                            <input type="text" class="form-control option-input" value="${option.option_text || option}" placeholder="خيار">
                            <button class="btn btn-danger" onclick="removeOption(this)">حذف</button>
                        </div>`;
                });

                container.innerHTML +=
                    `<button type="button" class="btn btn-secondary" onclick="addOption()">إضافة خيار</button>`;
            }
        }

        function addOption() {
            const container = document.getElementById('options-container');
            const options = Array.from(container.querySelectorAll('.option-input')).map(input => input.value);

            container.innerHTML = '';
            options.forEach(option => {
                container.innerHTML +=
                    `<div class="input-group mb-2">
                <input type="text" class="form-control option-input" value="${option}" placeholder="خيار">
                <button class="btn btn-danger" onclick="removeOption(this)">حذف</button>
            </div>`;
            });

            container.innerHTML +=
                `<div class="input-group mb-2">
            <input type="text" class="form-control option-input" placeholder="خيار">
            <button class="btn btn-danger" onclick="removeOption(this)">حذف</button>
        </div>`;
            container.innerHTML +=
                `<button type="button" class="btn btn-secondary" onclick="addOption()">إضافة خيار</button>`;
        }

        function removeOption(button) {
            button.closest('.input-group').remove();
        }
        $(document).ready(function() {


            $(document).on('change', '#question-select', function() {
                var selectedQuestionId = $(this).val();

                if (selectedQuestionId) {
                    $.ajax({
                        url: '/school-questions/' + selectedQuestionId + '/options',
                        method: 'GET',
                        success: function(options) {
                            var questionOptionsHtml = '';
                            options.forEach(function(option) {
                                questionOptionsHtml +=
                                    `<option value="${option.id}">${option.option_text}</option>`;
                            });

                            $('#related-options').html(questionOptionsHtml);
                        }
                    });
                } else {
                    $('#related-options').html('');
                }
            });
            $('.relation-button').on('click', function() {
                var questionId = $(this).data('id');

                $.ajax({
                    url: '/school-questions/' + questionId + '/options',
                    method: 'GET',
                    success: function(options) {
                        var optionsHtml = options.map(option => `
                    <div class="input-group mb-2">
                        <input type="text" class="form-control option-input" value="${option.option_text}" placeholder="خيار" readonly>
                        <select class="form-control question-select" data-option-id="${option.id}">
                            <option value="">اختر سؤالاً لتحديد العلاقة</option>
                            @foreach ($schoolQuestions as $q)
                                <option value="{{ $q->id }}" 
                                    @if (isset($q->dependent_option_id) && $q->dependent_option_id != null) ${ {{ $q->dependent_option_id }} == option.id ? 'selected' : '' } @endif
                                    >{{ $q->title }}</option>
                            @endforeach
                        </select>
                    </div>
                `).join('');

                        Swal.fire({
                            title: 'تحديد علاقة الخيار',
                            html: `
                        <div id="options-container">${optionsHtml}</div>
                    `,
                            confirmButtonText: 'حفظ العلاقات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const relations = [];
                                document.querySelectorAll('.question-select')
                                    .forEach(select => {
                                        if (select.value) {
                                            relations.push({
                                                option_id: select
                                                    .dataset.optionId,
                                                related_question_id: select
                                                    .value
                                            });
                                        }
                                    });
                                return {
                                    relations
                                };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '{{ route('school-questions.updateRelations') }}',
                                    method: 'POST',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        relations: result.value.relations
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم الحفظ!',
                                                'تم تحديث العلاقات بنجاح.',
                                                'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!',
                                                'حدث خطأ أثناء تحديث العلاقات.',
                                                'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });
            $('#addQuestion').on('click', function() {
                Swal.fire({
                    title: 'إضافة سؤال',
                    html: `
                        <label for="title">عنوان السؤال:</label>
                        <input type="text" id="title" class="swal2-input" placeholder="عنوان السؤال">
                        <label for="description">الوصف:</label>
                        <textarea id="description" class="swal2-input" placeholder="الوصف"></textarea>
                        <label for="type">النوع:</label>
                        <select id="type" class="swal2-input" onchange="toggleOptions(this.value)">
                            <option value="true_or_false">صح أو خطأ</option>
                            <option value="select_many">اختيار متعدد</option>
                            <option value="select_one">اختيار واحد</option>
                        </select>
                        <div id="options-container"></div>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const title = Swal.getPopup().querySelector('#title').value;
                        const description = Swal.getPopup().querySelector('#description').value;
                        const type = Swal.getPopup().querySelector('#type').value;
                        const options = Array.from(Swal.getPopup().querySelectorAll(
                            '.option-input')).map(input => input.value);

                        if (!title || !type) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                        }

                        if ((type === 'select_many' || type === 'select_one') && options.some(
                                option => !option)) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الخيارات`);
                        }

                        return {
                            title,
                            description,
                            type,
                            options
                        };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('school-questions.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                title: result.value.title,
                                description: result.value.description,
                                type: result.value.type,
                                options: result.value.options,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة السؤال بنجاح.',
                                        'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة السؤال.',
                                        'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var questionId = $(this).data('id');

                $.ajax({
                    url: '/school-questions/' + questionId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        var html = `
                                <label for="title">عنوان السؤال:</label>
                                <input type="text" id="title" class="swal2-input" value="${data.title}">
                                <label for="description">الوصف:</label>
                                <textarea id="description" class="swal2-input">${data.description}</textarea>
                                <label for="type">النوع:</label>
                                <select id="type" class="swal2-input">
                                    <option value="true_or_false" ${data.type == 'true_or_false' ? 'selected' : ''}>صح أو خطأ</option>
                                    <option value="select_many" ${data.type == 'select_many' ? 'selected' : ''}>اختيار متعدد</option>
                                    <option value="select_one" ${data.type == 'select_one' ? 'selected' : ''}>اختيار واحد</option>
                                </select>
                                <div id="options-container">
                            `;
                        if (data.type === 'select_many' || data.type === 'select_one') {
                            if (data.options) {
                                data.options.forEach(option => {
                                    html +=
                                        `<div class="input-group mb-2">
                                        <input type="text" class="form-control option-input" value="${option.option_text || option}" placeholder="خيار">
                                        <button class="btn btn-danger" onclick="removeOption(this)">حذف</button>
                                    </div>`
                                });
                                html +=
                                    `<button type="button" class="btn btn-secondary" onclick="addOption()">إضافة خيار</button>`;
                            }
                        }
                        html += `</div>`;
                        Swal.fire({
                            title: 'تعديل سؤال',
                            html: html,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            didOpen: () => {
                                toggleOptions(data.type, data.options);
                            },
                            preConfirm: () => {
                                const title = Swal.getPopup().querySelector(
                                    '#title').value;
                                const description = Swal.getPopup().querySelector(
                                    '#description').value;
                                const type = Swal.getPopup().querySelector('#type')
                                    .value;
                                const options = Array.from(Swal.getPopup()
                                    .querySelectorAll('.option-input')).map(
                                    input => input.value);

                                if (!title || !type) {
                                    Swal.showValidationMessage(
                                        `الرجاء إدخال جميع الحقول`);
                                }

                                if ((type === 'select_many' || type ===
                                        'select_one') && options.some(option => !
                                        option)) {
                                    Swal.showValidationMessage(
                                        `الرجاء إدخال جميع الخيارات`);
                                }

                                return {
                                    title,
                                    description,
                                    type,
                                    options
                                };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/school-questions/' + questionId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        title: result.value.title,
                                        description: result.value.description,
                                        type: result.value.type,
                                        options: result.value.options,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!',
                                                'تم تعديل السؤال بنجاح.',
                                                'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!',
                                                'حدث خطأ أثناء تعديل السؤال.',
                                                'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var questionId = $(this).data('id');
                Swal.fire({
                    title: 'هل أنت متأكد?',
                    text: "لن تتمكن من التراجع عن هذا!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'نعم, احذفه!',
                    cancelButtonText: 'إلغاء'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '/school-questions/' + questionId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف السؤال بنجاح.',
                                        'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف السؤال.',
                                        'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف السؤال.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
