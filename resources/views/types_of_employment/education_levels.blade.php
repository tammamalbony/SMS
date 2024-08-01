@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">مستويات التعليم</h4>
                    <button class="btn btn-primary d-inline-block" id="addEducationLevel">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">مستويات التعليم</li>
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
                                    <th>المستوى</th>
                                    <th>الملاحظات</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($educationLevels as $index => $educationLevel)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $educationLevel->level }}</td>
                                        <td>{{ $educationLevel->note }}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm edit-button" data-id="{{ $educationLevel->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger btn-sm delete-button" data-id="{{ $educationLevel->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                                    <a href="{{ route('education_levels.specializations.index', $educationLevel->id) }}" class="btn btn-info btn-sm"><i
                                                        class="fa fa-cogs"></i> تخصصات</a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $educationLevels->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addEducationLevel').on('click', function() {
                Swal.fire({
                    title: 'إضافة مستوى التعليم',
                    html: `
                        <div class="container-fluid">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="level">مستوى التعليم:</label>
                                    <input type="text" id="level" class="form-control" placeholder="مستوى التعليم">
                                </div>
                                <div class="col-md-6">
                                    <label for="note">الملاحظات:</label>
                                    <textarea id="note" class="form-control" placeholder="الملاحظات"></textarea>
                                </div>
                            </div>
                        </div>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const level = Swal.getPopup().querySelector('#level').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!level) {
                            Swal.showValidationMessage(`الرجاء إدخال مستوى التعليم`);
                        }
                        return { level: level, note: note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('education_levels.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                level: result.value.level,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة مستوى التعليم بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة مستوى التعليم.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var educationLevelId = $(this).data('id');
                $.ajax({
                    url: '/education_levels/' + educationLevelId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل مستوى التعليم',
                            html: `
                                <div class="container-fluid">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label for="level">مستوى التعليم:</label>
                                            <input type="text" id="level" class="form-control" value="${data.level}">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="note">الملاحظات:</label>
                                            <textarea id="note" class="form-control">${data.note}</textarea>
                                        </div>
                                    </div>
                                </div>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const level = Swal.getPopup().querySelector('#level').value;
                                const note = Swal.getPopup().querySelector('#note').value;
                                if (!level) {
                                    Swal.showValidationMessage(`الرجاء إدخال مستوى التعليم`);
                                }
                                return { level: level, note: note };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/education_levels/' + educationLevelId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        level: result.value.level,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل مستوى التعليم بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل مستوى التعليم.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var educationLevelId = $(this).data('id');
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
                            url: '/education_levels/' + educationLevelId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف مستوى التعليم بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف مستوى التعليم.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف مستوى التعليم.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
