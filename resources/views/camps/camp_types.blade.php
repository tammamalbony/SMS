@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">أنواع المعسكرات</h4>
                    <button class="btn btn-primary d-inline-block" id="addCampType">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">أنواع المعسكرات</li>
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
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($campTypes as $index => $campType)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $campType->type }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $campType->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $campType->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $campTypes->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addCampType').on('click', function() {
                Swal.fire({
                    title: 'إضافة نوع مخيم',
                    html: `
                        <label for="type">نوع المعسكر:</label>
                        <input type="text" id="type" class="swal2-input" placeholder="نوع المعسكر">
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const type = Swal.getPopup().querySelector('#type').value;
                        if (!type) {
                            Swal.showValidationMessage(`الرجاء إدخال نوع المعسكر`);
                        }
                        return { type: type };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('camp_types.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                type: result.value.type,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة نوع المعسكر بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة نوع المعسكر.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var campTypeId = $(this).data('id');
                $.ajax({
                    url: '/camp_types/' + campTypeId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل نوع مخيم',
                            html: `
                                <label for="type">نوع المعسكر:</label>
                                <input type="text" id="type" class="swal2-input" value="${data.type}">
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const type = Swal.getPopup().querySelector('#type').value;
                                if (!type) {
                                    Swal.showValidationMessage(`الرجاء إدخال نوع المعسكر`);
                                }
                                return { type: type };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/camp_types/' + campTypeId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        type: result.value.type,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل نوع المعسكر بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل نوع المعسكر.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var campTypeId = $(this).data('id');
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
                            url: '/camp_types/' + campTypeId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف نوع المعسكر بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع المعسكر.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع المعسكر.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
