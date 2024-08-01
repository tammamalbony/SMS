@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">أنواع العمل الوظيفي</h4>
                    <button class="btn btn-primary d-inline-block" id="addKindOfEmployment">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">أنواع العمل الوظيفي</li>
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
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($kindsOfEmployment as $index => $kindOfEmployment)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $kindOfEmployment->name }}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm edit-button" data-id="{{ $kindOfEmployment->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger btn-sm delete-button" data-id="{{ $kindOfEmployment->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $kindsOfEmployment->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addKindOfEmployment').on('click', function() {
                Swal.fire({
                    title: 'إضافة نوع العمل الوظيفي',
                    html: `
                        <div class="container-fluid">
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <label for="name">اسم نوع العمل الوظيفي:</label>
                                    <input type="text" id="name" class="form-control" placeholder="اسم نوع العمل الوظيفي">
                                </div>
                            </div>
                        </div>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const name = Swal.getPopup().querySelector('#name').value;
                        if (!name) {
                            Swal.showValidationMessage(`الرجاء إدخال اسم نوع العمل الوظيفي`);
                        }
                        return { name: name };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('kinds_of_employment.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                name: result.value.name,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة نوع العمل الوظيفي بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة نوع العمل الوظيفي.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var kindOfEmploymentId = $(this).data('id');
                $.ajax({
                    url: '{{ route('kinds_of_employment.edit', 'kindOfEmploymentId') }}'.replace('kindOfEmploymentId', kindOfEmploymentId),
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل نوع العمل الوظيفي',
                            html: `
                                <div class="container-fluid">
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label for="name">اسم نوع العمل الوظيفي:</label>
                                            <input type="text" id="name" class="form-control" value="${data.name}">
                                        </div>
                                    </div>
                                </div>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const name = Swal.getPopup().querySelector('#name').value;
                                if (!name) {
                                    Swal.showValidationMessage(`الرجاء إدخال اسم نوع العمل الوظيفي`);
                                }
                                return { name: name };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '{{ route('kinds_of_employment.update', 'kindOfEmploymentId') }}'.replace('kindOfEmploymentId', kindOfEmploymentId),
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        name: result.value.name,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل نوع العمل الوظيفي بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل نوع العمل الوظيفي.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var kindOfEmploymentId = $(this).data('id');
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
                            url: '{{ route('kinds_of_employment.destroy', 'kindOfEmploymentId') }}'.replace('kindOfEmploymentId', kindOfEmploymentId),
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف نوع العمل الوظيفي بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع العمل الوظيفي.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع العمل الوظيفي.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
