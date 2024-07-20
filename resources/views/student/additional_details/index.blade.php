@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">تفاصيل إضافية للطالب: {{ $student->first_name }} {{ $student->last_name }}</h4>
                    <button class="btn btn-primary d-inline-block" id="addDetail">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">تفاصيل إضافية</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mb-30">
                <div class="card card-statistics h-100">
                    <div class="card-body">
                        @if($additionalDetail)
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>عدد سنوات الفشل</th>
                                        <th>المدرسة السابقة</th>
                                        <th>نوع التسجيل</th>
                                        <th>العمليات</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>{{ $additionalDetail->number_of_fail_years }}</td>
                                        <td>{{ $additionalDetail->previous_school }}</td>
                                        <td>{{ $additionalDetail->registrationType->name }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $student->id }}"><i class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $student->id }}"><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        @else
                            <p>لا توجد تفاصيل إضافية لهذا الطالب.</p>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addDetail').on('click', function() {
                Swal.fire({
                    title: 'إضافة تفاصيل إضافية',
                    html: `
                        <label for="number_of_fail_years">عدد سنوات الفشل:</label>
                        <input type="number" id="number_of_fail_years" class="swal2-input" placeholder="عدد سنوات الفشل">
                        <label for="previous_school">المدرسة السابقة:</label>
                        <input type="text" id="previous_school" class="swal2-input" placeholder="المدرسة السابقة">
                        <label for="registration_type_id">نوع التسجيل:</label>
                        <select id="registration_type_id" class="swal2-input">
                            @foreach($registrationTypes as $type)
                                <option value="{{ $type->id }}">{{ $type->name }}</option>
                            @endforeach
                        </select>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const number_of_fail_years = Swal.getPopup().querySelector('#number_of_fail_years').value;
                        const previous_school = Swal.getPopup().querySelector('#previous_school').value;
                        const registration_type_id = Swal.getPopup().querySelector('#registration_type_id').value;
                        if (!number_of_fail_years || !registration_type_id) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                        }
                        return { number_of_fail_years, previous_school, registration_type_id };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('students.additional_details.store', $student->id) }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                number_of_fail_years: result.value.number_of_fail_years,
                                previous_school: result.value.previous_school,
                                registration_type_id: result.value.registration_type_id,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة التفاصيل بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة التفاصيل.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var studentId = $(this).data('id');
                $.ajax({
                    url: '/students/' + studentId + '/additional-details/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل تفاصيل إضافية',
                            html: `
                                <label for="number_of_fail_years">عدد سنوات الفشل:</label>
                                <input type="number" id="number_of_fail_years" class="swal2-input" value="${data.additionalDetail.number_of_fail_years}">
                                <label for="previous_school">المدرسة السابقة:</label>
                                <input type="text" id="previous_school" class="swal2-input" value="${data.additionalDetail.previous_school}">
                                <label for="registration_type_id">نوع التسجيل:</label>
                                <select id="registration_type_id" class="swal2-input">
                                    ${data.registrationTypes.map(type => `<option value="${type.id}" ${type.id === data.additionalDetail.registration_type_id ? 'selected' : ''}>${type.name}</option>`).join('')}
                                </select>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const number_of_fail_years = Swal.getPopup().querySelector('#number_of_fail_years').value;
                                const previous_school = Swal.getPopup().querySelector('#previous_school').value;
                                const registration_type_id = Swal.getPopup().querySelector('#registration_type_id').value;
                                if (!number_of_fail_years || !registration_type_id) {
                                    Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                                }
                                return { number_of_fail_years, previous_school, registration_type_id };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/students/' + studentId + '/additional-details',
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        number_of_fail_years: result.value.number_of_fail_years,
                                        previous_school: result.value.previous_school,
                                        registration_type_id: result.value.registration_type_id,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل التفاصيل بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل التفاصيل.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var studentId = $(this).data('id');
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
                            url: '/students/' + studentId + '/additional-details',
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف التفاصيل بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف التفاصيل.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف التفاصيل.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
