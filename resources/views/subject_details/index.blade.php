@extends('layouts.app')

@section('content')
<div class="container">
    <h1>تفاصيل المواد</h1>
    <button class="btn btn-primary add-detail-button" data-id="">إضافة تفاصيل مادة</button>
    <table class="table">
        <thead>
            <tr>
                <th>مادة</th>
                <th>المرحلة</th>
                <th>الدرجة العظمى</th>
                <th>مرسبة</th>
                <th>نشط</th>
                <th>العمليات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($subjectDetails as $detail)
            <tr>
                <td>{{ $detail->subject->name_ar }}</td>
                <td>{{ $detail->grade->grade_name_ar }}</td>
                <td>{{ $detail->max_grade}}</td>
                <td>{{ $detail->is_failing}}</td>
                <td>{{ $detail->is_active}}</td>
                <td>
                    <button class="btn btn-primary edit-detail-button" data-id="{{ $detail->id }}"><i
                        class="fa fa-edit"></i></button>
                    <button class="btn btn-danger delete-button" onclick="confirmDelete({{ $detail->id }})" ><i
                        class="fa fa-trash"></i></button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
    <div class="d-flex justify-content-center">
        {!! $subjectDetails->links() !!}
    </div>
</div>

<script>
$(document).ready(function() {
    $('.add-detail-button').on('click', function() {
        var isEdit = $(this).hasClass('edit-detail-button');
        var detailId = $(this).data('id');
        var url = isEdit ? '/subject_details/'+ detailId +'/update/' : '{{ url("subject_details/store") }}';
        var method =  'POST';
        var title = isEdit ? 'تعديل تفاصيل مادة' : 'إضافة تفاصيل مادة';

        Swal.fire({
            title: title,
            html: `
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4">
                            <label for="max_grade">أعلى درجة:</label>
                            <input type="number" id="max_grade" class="swal2-input" placeholder="أعلى درجة">
                        </div>
                        <div class="col-md-4">
                            <label for="min_grade">الحد الأدنى للنجاح:</label>
                            <input type="number" id="min_grade" class="swal2-input" placeholder="درجة الأدنى للنجاح">
                        </div>
                           <div class="col-md-4">
                            <label for="failing_grade">درجة الرسوب:</label>
                            <input type="number" id="failing_grade" class="swal2-input" placeholder="درجة الرسوب">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                    <input type="hidden" id="is_failing_hidden" value="0">
                                    <input type="checkbox" id="is_failing" value="1" class="custom-switch-input" />
                                    <span class="custom-switch-indicator"></span>
                                    <label class="custom-switch-description mb-0 cursor-pointer" for="is_failing">مادة مرسبة لوحدها</label>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                    <input type="hidden" id="is_active_hidden" value="0">
                                    <input type="checkbox" id="is_active" value="1" class="custom-switch-input" />
                                    <span class="custom-switch-indicator"></span>
                                    <label class="custom-switch-description mb-0 cursor-pointer" for="is_active">نشط</label>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="grade_id">المرحلة الدراسية:</label>
                            <select id="grade_id" class="swal2-input">
                                <option value="">اختر المرحلة الدراسية</option>
                                @foreach ($grades as $grade)
                                    <option value="{{ $grade->id }}">{{ $grade->grade_name_ar }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="subject_id"> المادة:</label>
                            <select id="subject_id" class="swal2-input">
                                <option value="">اختر المادة</option>
                                @foreach ($subjects as $subject)
                                    <option value="{{ $subject->id }}">{{ $subject->name_ar }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
            `,
            confirmButtonText: 'حفظ البيانات',
            showCancelButton: true,
            cancelButtonText: 'إلغاء',
            preConfirm: () => {
                return {
                    subject_id: $('#subject_id').val(),
                    max_grade: $('#max_grade').val(),
                    min_grade: $('#min_grade').val(),
                    failing_grade: $('#failing_grade').val(),
                    is_failing: $('#is_failing').is(':checked') ? 1 : 0,
                    is_active: $('#is_active').is(':checked') ? 1 : 0,
                    grade_id: $('#grade_id').val()
                };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: url,
                    method: method,
                    data: {
                        _token: '{{ csrf_token() }}',
                        ...result.value
                    },
                    success: function(response) {
                        Swal.fire('تم الإضافة!', 'تم إضافة/تعديل تفاصيل المادة بنجاح.', 'success').then(() => {
                            location.reload();
                        });
                    },
                    error: function(response) {
                        Swal.fire('خطأ!', response.responseJSON.message, 'error');
                    }
                });
            }
        });
    });

    $('.edit-detail-button').on('click', function() {
        var detailId = $(this).data('id');
        var url = '/subject_details/' + detailId + '/edit';
        $.ajax({
            url: url,
            method: 'POST',
            data: {
                _token: '{{ csrf_token() }}'
            },
            success: function(response) {
                if (response.success) {
                    var data = response.data;
                    Swal.fire({
                        title: 'تعديل تفاصيل مادة',
                        html: `
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="max_grade">أعلى درجة:</label>
                                        <input type="number" id="max_grade" class="swal2-input" value="${data.subjectDetail.max_grade}">
                                    </div>
                                      <div class="col-md-4">
                                        <label for="min_grade">الحد الأدنى للنجاح:</label>
                                        <input type="number" id="min_grade" class="swal2-input" placeholder="درجة الأدنى للنجاح">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="failing_grade">درجة الرسوب:</label>
                                        <input type="number" id="failing_grade" class="swal2-input" value="${data.subjectDetail.failing_grade}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                            <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                                <input type="hidden" id="is_failing_hidden" value="0">
                                                <input type="checkbox" id="is_failing" value="1" class="custom-switch-input" ${data.subjectDetail.is_failing ? 'checked' : ''} />
                                                <span class="custom-switch-indicator"></span>
                                                <label class="custom-switch-description mb-0 cursor-pointer" for="is_failing">مادة مرسبة لوحدها</label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                            <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                                <input type="hidden" id="is_active_hidden" value="0">
                                                <input type="checkbox" id="is_active" value="1" class="custom-switch-input" ${data.subjectDetail.is_active ? 'checked' : ''} />
                                                <span class="custom-switch-indicator"></span>
                                                <label class="custom-switch-description mb-0 cursor-pointer" for="is_active">نشط</label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="grade_id">المرحلة الدراسية:</label>
                                        <select id="grade_id" class="swal2-input">
                                            <option value="">اختر المرحلة الدراسية</option>
                                            ${data.grades.map(grade => `<option value="${grade.id}" ${data.subjectDetail.grade_id == grade.id ? 'selected' : ''}>${grade.grade_name_ar}</option>`).join('')}
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="subject_id">المادة :</label>
                                        <select id="subject_id" class="swal2-input">
                                            <option value="">اختر المادة </option>
                                            ${data.subjects.map(subject => `<option value="${subject.id}" ${data.subjectDetail.subject_id == subject.id ? 'selected' : ''}>${subject.name_ar}</option>`).join('')}
                                        </select>
                                    </div>
                                </div>
                            </div>
                        `,
                        confirmButtonText: 'حفظ البيانات',
                        showCancelButton: true,
                        cancelButtonText: 'إلغاء',
                        preConfirm: () => {
                            return {
                                subject_id: $('#subject_id').val(),
                                max_grade: $('#max_grade').val(),
                                min_grade: $('#min_grade').val(),
                                failing_grade: $('#failing_grade').val(),
                                is_failing: $('#is_failing').is(':checked') ? 1 : 0,
                                is_active: $('#is_active').is(':checked') ? 1 : 0,
                                grade_id: $('#grade_id').val()
                            };
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url : `/subject_details/${detailId}/update`,
                                method: 'POST',
                                data: {
                                    _token: '{{ csrf_token() }}',
                                    ...result.value
                                },
                                success: function(response) {
                                    Swal.fire('تم التعديل!', 'تم تعديل تفاصيل المادة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                },
                                error: function(response) {
                                    Swal.fire('خطأ!', response.responseJSON.message, 'error');
                                }
                            });
                        }
                    });
                }
            },
            error: function(response) {
                Swal.fire('خطأ!', 'لم يتم العثور على تفاصيل.', 'error');
            }
        });
    });
});
function confirmDelete(id) {
    Swal.fire({
        title: 'هل أنت متأكد?',
        text: "لن تتمكن من التراجع عن هذا!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'نعم، احذفه!',
        cancelButtonText: 'إلغاء'
    }).then((result) => {
        if (result.isConfirmed) {
            const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            const url = `/subject_details/${id}/delete`;

            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': token
                },
                body: JSON.stringify({ _method: 'POST' }) 
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    Swal.fire('Deleted!', data.message, 'success').then(() => {
                        window.location.reload();
                    });
                } else {
                    Swal.fire('Error', data.message, 'error');
                }
            })
            .catch(error => {
                Swal.fire('Error', 'Something went wrong!', 'error');
            });
        }
    });
}
</script>
@endsection
