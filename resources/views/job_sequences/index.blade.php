@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">التسلسل الوظيفي</h4>
                    <button class="btn btn-primary d-inline-block" id="addJobSequence" data-id="{{$id }}">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">التسلسل الوظيفي</li>
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
                                    <th>اسم المعلم</th>
                                    <th>اسم المدرسة</th>
                                    <th>الصفة الوظيفية</th>
                                    <th>السنة</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($jobSequences as $index => $jobSequence)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $jobSequence->teacher->name_ar }}</td>
                                        <td>{{ $jobSequence->school_name }}</td>
                                        <td>{{ $jobSequence->job_title }}</td>
                                        <td>{{ $jobSequence->year }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $jobSequence->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $jobSequence->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $jobSequences->links() !!}
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
            
            $('#addJobSequence').on('click', function() {
                var teacher_id =  $(this).data('id')

                Swal.fire({
                    title: 'إضافة تسلسل وظيفي',
                    html: `
               <label for="notes">المعلم</label>
                <select id="teacher_id" class="swal2-input">
                    <option value="">اختر المعلم</option>
                    @foreach ($teachers as $teacher)
                        <option value="{{ $teacher->id }}" ${teacher_id == {{ $teacher->id }} ? 'selected' : '' }>{{ $teacher->name_ar }}</option>
                    @endforeach
                </select>
                <label for="notes">اسم المدرسة :</label>
                <input type="text" id="school_name" class="swal2-input" placeholder="اسم المدرسة">
                 <label for="notes">الصفة الوظيفية :</label>
                <input type="text" id="job_title" class="swal2-input" placeholder="الصفة الوظيفية">
                <label for="notes">السنة :</label>
                <input type="date" id="year" class="swal2-input" placeholder="السنة">
            `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const teacher_id = Swal.getPopup().querySelector('#teacher_id').value
                        const school_name = Swal.getPopup().querySelector('#school_name').value
                        const job_title = Swal.getPopup().querySelector('#job_title').value
                        const year = Swal.getPopup().querySelector('#year').value
                        if (!teacher_id || !school_name || !job_title || !year) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`)
                        }
                        return {
                            teacher_id: teacher_id,
                            school_name: school_name,
                            job_title: job_title,
                            year: year
                        }
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('job_sequences.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                teacher_id: result.value.teacher_id,
                                school_name: result.value.school_name,
                                job_title: result.value.job_title,
                                year: result.value.year
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!',
                                        'تم إضافة التسلسل الوظيفي بنجاح.', 'success'
                                        ).then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!',
                                        'حدث خطأ أثناء إضافة التسلسل الوظيفي.',
                                        'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var jobId = $(this).data('id');
                $.ajax({
                    url: '/job_sequences/' + jobId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل تسلسل وظيفي',
                            html: `
                        <label for="notes">المعلم</label>
                        <select id="teacher_id" class="swal2-input">
                            <option value="">اختر المعلم</option>
                            @foreach ($teachers as $teacher)
                                <option value="{{ $teacher->id }}" ${data.job_sequence.teacher_id == {{ $teacher->id }} ? 'selected' : '' }>{{ $teacher->name_ar }}</option>
                            @endforeach
                        </select>
                         <label for="notes">اسم المدرسة :</label>
                        <input type="text" id="school_name" class="swal2-input" value="${data.job_sequence.school_name}">
                         <label for="notes">الصفة الوظيفية :</label>
                        <input type="text" id="job_title" class="swal2-input" value="${data.job_sequence.job_title}">
                         <label for="notes">السنة :</label>
                        <input type="date" id="year" class="swal2-input" value="${data.job_sequence.year}">
                    `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const teacher_id = Swal.getPopup().querySelector(
                                    '#teacher_id').value
                                const school_name = Swal.getPopup().querySelector(
                                    '#school_name').value
                                const job_title = Swal.getPopup().querySelector(
                                    '#job_title').value
                                const year = Swal.getPopup().querySelector('#year')
                                    .value
                                if (!teacher_id || !school_name || !job_title || !
                                    year) {
                                    Swal.showValidationMessage(
                                        `الرجاء إدخال جميع الحقول`)
                                }
                                return {
                                    teacher_id: teacher_id,
                                    school_name: school_name,
                                    job_title: job_title,
                                    year: year
                                }
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/job_sequences/' + jobId + "/update",
                                    method: 'post',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        teacher_id: result.value.teacher_id,
                                        school_name: result.value.school_name,
                                        job_title: result.value.job_title,
                                        year: result.value.year
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!',
                                                'تم تعديل التسلسل الوظيفي بنجاح.',
                                                'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!',
                                                'حدث خطأ أثناء تعديل التسلسل الوظيفي.',
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
                var jobId = $(this).data('id');
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
                            url: '/job_sequences/' + jobId + "/delete",
                            type: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire(
                                        'تم الحذف!',
                                        'تم حذف التسلسل الوظيفي بنجاح.',
                                        'success'
                                    ).then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire(
                                        'خطأ!',
                                        'حدث خطأ أثناء حذف التسلسل الوظيفي.',
                                        'error'
                                    );
                                }
                            },
                            error: function(response) {
                                Swal.fire(
                                    'خطأ!',
                                    'حدث خطأ أثناء حذف التسلسل الوظيفي.',
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
