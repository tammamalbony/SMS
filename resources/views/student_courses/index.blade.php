@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">الدورات الطلابية</h4>
                    <button class="btn btn-primary d-inline-block" id="addStudentCourse">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">الدورات الطلابية</li>
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
                                    <th>الاسم</th>
                                    <th>الموقع</th>
                                    <th>النوع</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($studentCourses as $index => $studentCourse)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $studentCourse->name }}</td>
                                        <td>{{ $studentCourse->location->location }}</td>
                                        <td>{{ $studentCourse->type->type }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $studentCourse->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $studentCourse->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $studentCourses->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addStudentCourse').on('click', function() {
                Swal.fire({
                    title: 'إضافة دورة طلابية',
                    html: `
                        <label for="name">اسم الدورة:</label>
                        <input type="text" id="name" class="swal2-input" placeholder="اسم الدورة">
                        <label for="location_id">الموقع:</label>
                        <select id="location_id" class="swal2-input">
                            @foreach ($studentCourseLocations as $location)
                                <option value="{{ $location->id }}">{{ $location->location }}</option>
                            @endforeach
                        </select>
                        <label for="type_id">النوع:</label>
                        <select id="type_id" class="swal2-input">
                            @foreach ($studentCourseTypes as $type)
                                <option value="{{ $type->id }}">{{ $type->type }}</option>
                            @endforeach
                        </select>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const name = Swal.getPopup().querySelector('#name').value;
                        const location_id = Swal.getPopup().querySelector('#location_id').value;
                        const type_id = Swal.getPopup().querySelector('#type_id').value;
                        if (!name || !location_id || !type_id) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                        }
                        return { name: name, location_id: location_id, type_id: type_id };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('student_courses.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                name: result.value.name,
                                location_id: result.value.location_id,
                                type_id: result.value.type_id,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة الدورة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة الدورة.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var studentCourseId = $(this).data('id');
                $.ajax({
                    url: '/student_courses/' + studentCourseId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل دورة طلابية',
                            html: `
                                <label for="name">اسم الدورة:</label>
                                <input type="text" id="name" class="swal2-input" value="${data.name}">
                                <label for="location_id">الموقع:</label>
                                <select id="location_id" class="swal2-input">
                                    @foreach ($studentCourseLocations as $location)
                                        <option value="{{ $location->id }}" ${data.location_id == {{ $location->id }} ? 'selected' : ''}>{{ $location->location }}</option>
                                    @endforeach
                                </select>
                                <label for="type_id">النوع:</label>
                                <select id="type_id" class="swal2-input">
                                    @foreach ($studentCourseTypes as $type)
                                        <option value="{{ $type->id }}" ${data.type_id == {{ $type->id }} ? 'selected' : ''}>{{ $type->type }}</option>
                                    @endforeach
                                </select>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const name = Swal.getPopup().querySelector('#name').value;
                                const location_id = Swal.getPopup().querySelector('#location_id').value;
                                const type_id = Swal.getPopup().querySelector('#type_id').value;
                                if (!name || !location_id || !type_id) {
                                    Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                                }
                                return { name: name, location_id: location_id, type_id: type_id };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/student_courses/' + studentCourseId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        name: result.value.name,
                                        location_id: result.value.location_id,
                                        type_id: result.value.type_id,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل الدورة بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل الدورة.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var studentCourseId = $(this).data('id');
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
                            url: '/student_courses/' + studentCourseId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف الدورة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الدورة.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الدورة.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
