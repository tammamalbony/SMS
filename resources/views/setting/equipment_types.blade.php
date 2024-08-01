@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">أنواع المعدات</h4>
                    <button class="btn btn-primary d-inline-block" id="addEquipmentType">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">أنواع المعدات</li>
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
                                @foreach ($equipmentTypes as $index => $equipmentType)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $equipmentType->type }}</td>
                                        <td>{{ $equipmentType->note }}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm edit-button" data-id="{{ $equipmentType->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger btn-sm delete-button" data-id="{{ $equipmentType->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $equipmentTypes->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addEquipmentType').on('click', function() {
                Swal.fire({
                    title: 'إضافة نوع معدات',
                    html: `
                        <div class="container-fluid">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="type">نوع المعدات:</label>
                                    <input type="text" id="type" class="form-control" placeholder="نوع المعدات">
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
                        const type = Swal.getPopup().querySelector('#type').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!type) {
                            Swal.showValidationMessage(`الرجاء إدخال نوع المعدات`);
                        }
                        return { type: type, note: note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('equipment_types.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                type: result.value.type,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة نوع المعدات بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة نوع المعدات.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var equipmentTypeId = $(this).data('id');
                $.ajax({
                    url: '/equipment_types/' + equipmentTypeId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل نوع المعدات',
                            html: `
                                <div class="container-fluid">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label for="type">نوع المعدات:</label>
                                            <input type="text" id="type" class="form-control" value="${data.type}">
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
                                const type = Swal.getPopup().querySelector('#type').value;
                                const note = Swal.getPopup().querySelector('#note').value;
                                if (!type) {
                                    Swal.showValidationMessage(`الرجاء إدخال نوع المعدات`);
                                }
                                return { type: type, note: note };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/equipment_types/' + equipmentTypeId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        type: result.value.type,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل نوع المعدات بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل نوع المعدات.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var equipmentTypeId = $(this).data('id');
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
                            url: '/equipment_types/' + equipmentTypeId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف نوع المعدات بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع المعدات.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع المعدات.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
