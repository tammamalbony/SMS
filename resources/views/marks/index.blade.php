@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">العلامات</h4>
                    <button class="btn btn-primary d-inline-block" id="addMark">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">العلامات</li>
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
                                    <th>ملاحظة</th>
                                    <th>معلومات</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($marks as $index => $mark)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $mark->name }}</td>
                                        <td>{{ $mark->note }}</td>
                                        <td>{{ $mark->info }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $mark->id }}"><i class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $mark->id }}"><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $marks->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addMark').on('click', function() {
                Swal.fire({
                    title: 'إضافة علامة',
                    html: `
                        <label for="name">اسم العلامة:</label>
                        <input type="text" id="name" class="swal2-input" placeholder="اسم العلامة">
                        <label for="note">ملاحظة:</label>
                        <textarea id="note" class="swal2-input" placeholder="ملاحظة"></textarea>
                        <label for="info">معلومات:</label>
                        <textarea id="info" class="swal2-input" placeholder="معلومات"></textarea>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const name = Swal.getPopup().querySelector('#name').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        const info = Swal.getPopup().querySelector('#info').value;
                        if (!name) {
                            Swal.showValidationMessage(`الرجاء إدخال اسم العلامة`);
                        }
                        return { name: name, note: note, info: info };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('marks.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                name: result.value.name,
                                note: result.value.note,
                                info: result.value.info,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة العلامة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة العلامة.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var markId = $(this).data('id');
                $.ajax({
                    url: '/marks/' + markId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        if(data.note == null){
                            data.note = ''
                        }
                        if(data.info == null){
                            data.info = ''
                        }
                        Swal.fire({
                            title: 'تعديل علامة',
                            html: `
                                <label for="name">اسم العلامة:</label>
                                <input type="text" id="name" class="swal2-input" value="${data.name}">
                                <label for="note">ملاحظة:</label>
                                <textarea id="note" class="swal2-input">${data.note}</textarea>
                                <label for="info">معلومات:</label>
                                <textarea id="info" class="swal2-input">${data.info}</textarea>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const name = Swal.getPopup().querySelector('#name').value;
                                const note = Swal.getPopup().querySelector('#note').value;
                                const info = Swal.getPopup().querySelector('#info').value;
                                if (!name) {
                                    Swal.showValidationMessage(`الرجاء إدخال اسم العلامة`);
                                }
                                return { name: name, note: note, info: info };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/marks/' + markId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        name: result.value.name,
                                        note: result.value.note,
                                        info: result.value.info,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل العلامة بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل العلامة.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var markId = $(this).data('id');
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
                            url: '/marks/' + markId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف العلامة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف العلامة.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف العلامة.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
