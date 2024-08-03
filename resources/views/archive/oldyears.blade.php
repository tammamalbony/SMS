@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">السنوات القديمة</h4>
                    <button class="btn btn-primary d-inline-block" id="addOldYear">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">السنوات القديمة</li>
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
                                    <th>بداية السنة</th>
                                    <th>نهاية السنة</th>
                                    <th>الملاحظة</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($oldyears as $index => $year)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $year->start_year }}</td>
                                        <td>{{ $year->end_year }}</td>
                                        <td>{{ $year->note }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $year->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $year->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $oldyears->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addOldYear').on('click', function() {
                Swal.fire({
                    title: 'إضافة سنة قديمة',
                    html: `
                        <div class="container">
                            <div class="row mb-2">
                                <div class="col-md-6">
                                    <label for="start_year">بداية السنة:</label>
                                    <input type="number" id="start_year" class="form-control" placeholder="بداية السنة">
                                </div>
                                <div class="col-md-6">
                                    <label for="end_year">نهاية السنة:</label>
                                    <input type="number" id="end_year" class="form-control" placeholder="نهاية السنة">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <label for="note">الملاحظة:</label>
                                    <input type="text" id="note" class="form-control" placeholder="الملاحظة">
                                </div>
                            </div>
                        </div>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const start_year = Swal.getPopup().querySelector('#start_year').value;
                        const end_year = Swal.getPopup().querySelector('#end_year').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!start_year || !end_year) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                        }
                        return { start_year: start_year, end_year: end_year, note: note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('oldyears.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                start_year: result.value.start_year,
                                end_year: result.value.end_year,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة السنة القديمة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة السنة القديمة.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var yearId = $(this).data('id');
                $.ajax({
                    url: '/oldyears/' + yearId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل سنة قديمة',
                            html: `
                                <div class="container">
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <label for="start_year">بداية السنة:</label>
                                            <input type="number" id="start_year" class="form-control" value="${data.start_year}">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="end_year">نهاية السنة:</label>
                                            <input type="number" id="end_year" class="form-control" value="${data.end_year}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <label for="note">الملاحظة:</label>
                                            <input type="text" id="note" class="form-control" value="${data.note}">
                                        </div>
                                    </div>
                                </div>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const start_year = Swal.getPopup().querySelector('#start_year').value;
                                const end_year = Swal.getPopup().querySelector('#end_year').value;
                                const note = Swal.getPopup().querySelector('#note').value;
                                if (!start_year || !end_year) {
                                    Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                                }
                                return { start_year: start_year, end_year: end_year, note: note };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/oldyears/' + yearId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        start_year: result.value.start_year,
                                        end_year: result.value.end_year,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل السنة القديمة بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل السنة القديمة.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var yearId = $(this).data('id');
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
                            url: '/oldyears/' + yearId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف السنة القديمة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف السنة القديمة.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف السنة القديمة.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
