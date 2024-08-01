@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">حالة المباني</h4>
                    <button class="btn btn-primary d-inline-block" id="addBuildingStatus">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">حالة المباني</li>
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
                                @foreach ($buildingStatuses as $index => $buildingStatus)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $buildingStatus->status }}</td>
                                        <td>{{ $buildingStatus->note }}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm edit-button" data-id="{{ $buildingStatus->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger btn-sm delete-button" data-id="{{ $buildingStatus->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $buildingStatuses->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addBuildingStatus').on('click', function() {
                Swal.fire({
                    title: 'إضافة حالة مبنى',
                    html: `
                        <div class="container-fluid">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="status">الحالة:</label>
                                    <input type="text" id="status" class="form-control" placeholder="الحالة">
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
                            Swal.showValidationMessage(`الرجاء إدخال الحالة`);
                        }
                        return { status: status, note: note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('building_statuses.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                status: result.value.status,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة حالة المبنى بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة حالة المبنى.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var buildingStatusId = $(this).data('id');
                $.ajax({
                    url: '/building_statuses/' + buildingStatusId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل حالة المبنى',
                            html: `
                                <div class="container-fluid">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label for="status">الحالة:</label>
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
                                    Swal.showValidationMessage(`الرجاء إدخال الحالة`);
                                }
                                return { status: status, note: note };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/building_statuses/' + buildingStatusId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        status: result.value.status,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل حالة المبنى بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل حالة المبنى.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var buildingStatusId = $(this).data('id');
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
                            url: '/building_statuses/' + buildingStatusId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف حالة المبنى بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف حالة المبنى.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف حالة المبنى.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
