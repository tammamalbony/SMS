@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">أنواع التعليم</h4>
                    <button class="btn btn-primary d-inline-block" id="addEducationType">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">أنواع التعليم</li>
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
                                    <th>النوع</th>
                                    <th>الملاحظات</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($educationTypes as $index => $educationType)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $educationType->type }}</td>
                                        <td>{{ $educationType->note }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $educationType->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $educationType->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $educationTypes->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addEducationType').on('click', function() {
                Swal.fire({
                    title: 'إضافة نوع تعليم',
                    html: `
                        <label for="type">نوع التعليم:</label>
                        <input type="text" id="type" class="swal2-input" placeholder="نوع التعليم">
                        <label for="note">الملاحظات:</label>
                        <textarea id="note" class="swal2-input" placeholder="الملاحظات"></textarea>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const type = Swal.getPopup().querySelector('#type').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!type) {
                            Swal.showValidationMessage(`الرجاء إدخال نوع التعليم`);
                        }
                        return { type: type, note: note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('education_types.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                type: result.value.type,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة نوع التعليم بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة نوع التعليم.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var educationTypeId = $(this).data('id');
                $.ajax({
                    url: '/education_types/' + educationTypeId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل نوع تعليم',
                            html: `
                                <label for="type">نوع التعليم:</label>
                                <input type="text" id="type" class="swal2-input" value="${data.type}">
                                <label for="note">الملاحظات:</label>
                                <textarea id="note" class="swal2-input">${data.note}</textarea>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const type = Swal.getPopup().querySelector('#type').value;
                                const note = Swal.getPopup().querySelector('#note').value;
                                if (!type) {
                                    Swal.showValidationMessage(`الرجاء إدخال نوع التعليم`);
                                }
                                return { type: type, note: note };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/education_types/' + educationTypeId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        type: result.value.type,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل نوع التعليم بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل نوع التعليم.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var educationTypeId = $(this).data('id');
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
                            url: '/education_types/' + educationTypeId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف نوع التعليم بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع التعليم.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع التعليم.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
