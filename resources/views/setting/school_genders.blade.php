@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">نوع الجنس للمدارس</h4>
                    <button class="btn btn-primary d-inline-block" id="addSchoolGender">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">نوع الجنس للمدارس</li>
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
                                    <th>نوع الجنس</th>
                                    <th>الملاحظات</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($schoolGenders as $index => $schoolGender)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $schoolGender->gender }}</td>
                                        <td>{{ $schoolGender->note }}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm edit-button" data-id="{{ $schoolGender->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger btn-sm delete-button" data-id="{{ $schoolGender->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $schoolGenders->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addSchoolGender').on('click', function() {
                Swal.fire({
                    title: 'إضافة نوع الجنس للمدرسة',
                    html: `
                        <div class="container-fluid">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="gender">نوع الجنس:</label>
                                    <input type="text" id="gender" class="form-control" placeholder="نوع الجنس">
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
                        const gender = Swal.getPopup().querySelector('#gender').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!gender) {
                            Swal.showValidationMessage(`الرجاء إدخال نوع الجنس`);
                        }
                        return { gender: gender, note: note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('school_genders.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                gender: result.value.gender,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة نوع الجنس للمدرسة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة نوع الجنس للمدرسة.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var schoolGenderId = $(this).data('id');
                $.ajax({
                    url: '/school_genders/' + schoolGenderId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل نوع الجنس للمدرسة',
                            html: `
                                <div class="container-fluid">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label for="gender">نوع الجنس:</label>
                                            <input type="text" id="gender" class="form-control" value="${data.gender}">
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
                                const gender = Swal.getPopup().querySelector('#gender').value;
                                const note = Swal.getPopup().querySelector('#note').value;
                                if (!gender) {
                                    Swal.showValidationMessage(`الرجاء إدخال نوع الجنس`);
                                }
                                return { gender: gender, note: note };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/school_genders/' + schoolGenderId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        gender: result.value.gender,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل نوع الجنس للمدرسة بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل نوع الجنس للمدرسة.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var schoolGenderId = $(this).data('id');
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
                            url: '/school_genders/' + schoolGenderId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف نوع الجنس للمدرسة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع الجنس للمدرسة.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع الجنس للمدرسة.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
