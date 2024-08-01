@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">حالات المعدات</h4>
                    <button class="btn btn-primary d-inline-block" id="addEquipmentStatus">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">حالات المعدات</li>
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
                                    <th>الحالة</th>
                                    <th>الملاحظات</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($equipmentStatuses as $index => $equipmentStatus)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $equipmentStatus->status }}</td>
                                        <td>{{ $equipmentStatus->note }}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm edit-button" data-id="{{ $equipmentStatus->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger btn-sm delete-button" data-id="{{ $equipmentStatus->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $equipmentStatuses->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addEquipmentStatus').on('click', function() {
                Swal.fire({
                    title: 'إضافة حالة معدات',
                    html: `
                        <div class="container-fluid">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="status">حالة المعدات:</label>
                                    <input type="text" id="status" class="form-control" placeholder="حالة المعدات">
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
                        const status = Swal.getPopup().querySelector('#status').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!status) {
                            Swal.showValidationMessage(`الرجاء إدخال حالة المعدات`);
                        }
                        return { status: status, note: note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('equipment_statuses.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                status: result.value.status,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة حالة المعدات بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة حالة المعدات.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var equipmentStatusId = $(this).data('id');
                $.ajax({
                    url: '/equipment_statuses/' + equipmentStatusId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل حالة المعدات',
                            html: `
                                <div class="container-fluid">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label for="status">حالة المعدات:</label>
                                            <input type="text" id="status" class="form-control" value="${data.status}">
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
                                const status = Swal.getPopup().querySelector('#status').value;
                                const note = Swal.getPopup().querySelector('#note').value;
                                if (!status) {
                                    Swal.showValidationMessage(`الرجاء إدخال حالة المعدات`);
                                }
                                return { status: status, note: note };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/equipment_statuses/' + equipmentStatusId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        status: result.value.status,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل حالة المعدات بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل حالة المعدات.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var equipmentStatusId = $(this).data('id');
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
                            url: '/equipment_statuses/' + equipmentStatusId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف حالة المعدات بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف حالة المعدات.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف حالة المعدات.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
