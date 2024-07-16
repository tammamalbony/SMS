@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">الدورات</h4>
                    <button class="btn btn-primary d-inline-block" id="addCourse" data-id="{{ $id }}">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">الدورات</li>
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
                                    <th>اسم الدورة</th>
                                    <th>ملاحظات</th>
                                    <th>السنة</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($courses as $index => $course)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $course->teacher->name_ar }}</td>
                                        <td>{{ $course->course_name }}</td>
                                        <td>{{ $course->notes }}</td>
                                        <td>{{ $course->year }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $course->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $course->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $courses->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        $(document).ready(function() {
            $('#addCourse').on('click', function() {
                var teacher_id =  $(this).data('id')
                Swal.fire({
                    title: 'إضافة دورة',
                    html: `
                <label for="teacher_id">المعلم:</label>
                <select id="teacher_id" class="swal2-input">
                    <option value="">اختر المعلم</option>
                    @foreach ($teachers as $teacher)
                        <option value="{{ $teacher->id }}"  ${teacher_id == {{ $teacher->id }} ? 'selected' : '' }>{{ $teacher->name_ar }}</option>
                    @endforeach
                </select>
                <label for="teacher_id">اسم الدورة:</label>
                <input type="text" id="course_name" class="swal2-input" placeholder="اسم الدورة">
                <label for="teacher_id">ملاحظات:</label>
                <input type="text" id="notes" class="swal2-input" placeholder="ملاحظات">
                <label for="teacher_id">السنة:</label>
                <input type="date" id="year" class="swal2-input" placeholder="السنة">
            `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const teacher_id = Swal.getPopup().querySelector('#teacher_id').value
                        const course_name = Swal.getPopup().querySelector('#course_name').value
                        const notes = Swal.getPopup().querySelector('#notes').value
                        const year = Swal.getPopup().querySelector('#year').value
                        if (!teacher_id || !course_name || !year) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`)
                        }
                        return {
                            teacher_id: teacher_id,
                            course_name: course_name,
                            notes: notes,
                            year: year
                        }
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('courses.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                teacher_id: result.value.teacher_id,
                                course_name: result.value.course_name,
                                notes: result.value.notes,
                                year: result.value.year
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة الدورة بنجاح.',
                                        'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة الدورة.',
                                        'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var courseId = $(this).data('id');
                $.ajax({
                    url: '/courses/' + courseId + '/edit',
                    method: 'POST',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل دورة',
                            html: `
                        <label for="teacher_id">المعلم:</label>
                        <select id="teacher_id" class="swal2-input">
                            <option value="">اختر المعلم</option>
                            @foreach ($teachers as $teacher)
                                <option value="{{ $teacher->id }}" ${data.course.teacher_id == {{ $teacher->id }} ? 'selected' : '' }>{{ $teacher->name_ar }}</option>
                            @endforeach
                        </select>
                        <label for="teacher_id">اسم الدورة:</label>
                        <input type="text" id="course_name" class="swal2-input" value="${data.course.course_name}">
                        <label for="teacher_id">ملاحظات:</label>
                        <input type="text" id="notes" class="swal2-input" value="${data.course.notes}">
                        <label for="teacher_id">السنة:</label>
                        <input type="date" id="year" class="swal2-input" value="${data.course.year}">
                    `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const teacher_id = Swal.getPopup().querySelector(
                                    '#teacher_id').value
                                const course_name = Swal.getPopup().querySelector(
                                    '#course_name').value
                                const notes = Swal.getPopup().querySelector(
                                    '#notes').value
                                const year = Swal.getPopup().querySelector('#year')
                                    .value
                                if (!teacher_id || !course_name || !year) {
                                    Swal.showValidationMessage(
                                        `الرجاء إدخال جميع الحقول`)
                                }
                                return {
                                    teacher_id: teacher_id,
                                    course_name: course_name,
                                    notes: notes,
                                    year: year
                                }
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/courses/' + courseId+'/update',
                                    method: 'POST',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        teacher_id: result.value.teacher_id,
                                        course_name: result.value.course_name,
                                        notes: result.value.notes,
                                        year: result.value.year
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!',
                                                'تم تعديل الدورة بنجاح.',
                                                'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!',
                                                'حدث خطأ أثناء تعديل الدورة.',
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
                var courseId = $(this).data('id');
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
                            url: '/courses/' + courseId +'/delete',
                            type: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire(
                                        'تم الحذف!',
                                        'تم حذف الدورة بنجاح.',
                                        'success'
                                    ).then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire(
                                        'خطأ!',
                                        'حدث خطأ أثناء حذف الدورة.',
                                        'error'
                                    );
                                }
                            },
                            error: function(response) {
                                Swal.fire(
                                    'خطأ!',
                                    'حدث خطأ أثناء حذف الدورة.',
                                    'error'
                                );
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
