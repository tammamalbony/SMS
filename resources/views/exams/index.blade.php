@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">الامتحانات للسنة الدراسية: {{ $classsSchoolYear->schoolYear->name }}</h4>
                    <button class="btn btn-primary d-inline-block" id="addExam">إضافة امتحان</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">الامتحانات</li>
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
                                    <th>الدرجة القصوى</th>
                                    <th>الحد الأدنى</th>
                                    <th>المجموع</th>
                                    <th>الفصل</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($exams as $index => $exam)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $exam->title }}</td>
                                        <td>{{ $exam->max_degree }}</td>
                                        <td>{{ $exam->min_mark }}</td>
                                        <td>{{ $exam->total }}</td>
                                        <td>{{ $exam->term->name }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $exam->id }}"><i class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $exam->id }}"><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $exams->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addExam').on('click', function() {
                Swal.fire({
                    title: 'إضافة امتحان',
                    html: `
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="title">العنوان:</label>
                                    <input type="text" id="title" class="swal2-input" placeholder="العنوان">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="max_degree">الدرجة القصوى:</label>
                                    <input type="number" id="max_degree" class="swal2-input" placeholder="الدرجة القصوى">
                                </div>
                                <div class="col-md-6">
                                    <label for="min_mark">الحد الأدنى:</label>
                                    <input type="number" id="min_mark" class="swal2-input" placeholder="الحد الأدنى">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="total">المجموع:</label>
                                    <input type="number" id="total" class="swal2-input" placeholder="المجموع">
                                </div>
                                <div class="col-md-6">
                                    <label for="part_id">جزء:</label>
                                    <input type="number" id="part_id" class="swal2-input" placeholder="جزء (اختياري)">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="term_id">الفصل:</label>
                                    <select id="term_id" class="swal2-input">
                                        @foreach($terms as $term)
                                            <option value="{{ $term->id }}">{{ $term->name }}</option>
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
                        const title = Swal.getPopup().querySelector('#title').value;
                        const max_degree = Swal.getPopup().querySelector('#max_degree').value;
                        const min_mark = Swal.getPopup().querySelector('#min_mark').value;
                        const total = Swal.getPopup().querySelector('#total').value;
                        const part_id = Swal.getPopup().querySelector('#part_id').value;
                        const term_id = Swal.getPopup().querySelector('#term_id').value;
                        if (!title || !max_degree || !min_mark || !total || !term_id) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                        }
                        return { title, max_degree, min_mark, total, part_id, term_id };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '/classs_school_years/{{ $classsSchoolYear->id }}/exams/store',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                ...result.value,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة الامتحان بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة الامتحان.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var examId = $(this).data('id');
                $.ajax({
                    url: '/classs_school_years/{{ $classsSchoolYear->id }}/exams/' + examId + '/edit',
                    method: 'POST',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل امتحان',
                            html: `
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="title">العنوان:</label>
                                            <input type="text" id="title" class="swal2-input" value="${data.title}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="max_degree">الدرجة القصوى:</label>
                                            <input type="number" id="max_degree" class="swal2-input" value="${data.max_degree}">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="min_mark">الحد الأدنى:</label>
                                            <input type="number" id="min_mark" class="swal2-input" value="${data.min_mark}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="total">المجموع:</label>
                                            <input type="number" id="total" class="swal2-input" value="${data.total}">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="part_id">جزء:</label>
                                            <input type="number" id="part_id" class="swal2-input" value="${data.part_id}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="term_id">الفصل:</label>
                                            <select id="term_id" class="swal2-input">
                                                @foreach($terms as $term)
                                                    <option value="{{ $term->id }}" ${data.term_id == {{ $term->id }} ? 'selected' : ''}>{{ $term->name }}</option>
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
                                const title = Swal.getPopup().querySelector('#title').value;
                                const max_degree = Swal.getPopup().querySelector('#max_degree').value;
                                const min_mark = Swal.getPopup().querySelector('#min_mark').value;
                                const total = Swal.getPopup().querySelector('#total').value;
                                const part_id = Swal.getPopup().querySelector('#part_id').value;
                                const term_id = Swal.getPopup().querySelector('#term_id').value;
                                if (!title || !max_degree || !min_mark || !total || !term_id) {
                                    Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                                }
                                return { title, max_degree, min_mark, total, part_id, term_id };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/classs_school_years/{{ $classsSchoolYear->id }}/exams/' + examId +'/update',
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        ...result.value,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل الامتحان بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل الامتحان.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var examId = $(this).data('id');
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
                            url: '/classs_school_years/{{ $classsSchoolYear->id }}/exams/' + examId + '/delete',
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف الامتحان بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الامتحان.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الامتحان.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
