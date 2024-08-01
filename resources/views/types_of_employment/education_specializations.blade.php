@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">تخصصات التعليم - {{ $educationLevel->level }}</h4>
                    <button class="btn btn-primary d-inline-block" id="addSpecialization">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item"><a href="{{ route('education_levels.index') }}">مستويات التعليم</a></li>
                        <li class="breadcrumb-item active">تخصصات التعليم</li>
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
                                    <th>التخصص</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($specializations as $index => $specialization)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $specialization->name }}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm edit-button" data-id="{{ $specialization->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger btn-sm delete-button" data-id="{{ $specialization->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $specializations->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addSpecialization').on('click', function() {
                Swal.fire({
                    title: 'إضافة تخصص',
                    html: `
                        <div class="container-fluid">
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <label for="name">اسم التخصص:</label>
                                    <input type="text" id="name" class="form-control" placeholder="اسم التخصص">
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
                            Swal.showValidationMessage(`الرجاء إدخال اسم التخصص`);
                        }
                        return { name: name };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('education_levels.specializations.store', $educationLevel->id) }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                name: result.value.name,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة التخصص بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة التخصص.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var specializationId = $(this).data('id');
                $.ajax({
                    url: '{{ route('education_levels.specializations.edit', [$educationLevel->id, 'specializationId']) }}'.replace('specializationId', specializationId),
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل التخصص',
                            html: `
                                <div class="container-fluid">
                                    <div class="row mb-3">
                                        <div class="col-md-12">
                                            <label for="name">اسم التخصص:</label>
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
                                    Swal.showValidationMessage(`الرجاء إدخال اسم التخصص`);
                                }
                                return { name: name };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '{{ route('education_levels.specializations.update', [$educationLevel->id, 'specializationId']) }}'.replace('specializationId', specializationId),
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        name: result.value.name,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل التخصص بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل التخصص.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var specializationId = $(this).data('id');
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
                            url: '{{ route('education_levels.specializations.destroy', [$educationLevel->id, 'specializationId']) }}'.replace('specializationId', specializationId),
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف التخصص بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف التخصص.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف التخصص.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
