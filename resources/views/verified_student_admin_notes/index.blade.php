@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">ملاحظات المسؤول للطالب: {{ $verifiedStudent->student->name }}</h4>
                    <button class="btn btn-primary d-inline-block" id="addNote">إضافة ملاحظة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">ملاحظات المسؤول</li>
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
                                    <th>الملاحظة</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($notes as $index => $note)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $note->note }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $note->id }}" data-note="{{ $note->note }}"><i class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $note->id }}"><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $notes->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addNote').on('click', function() {
                Swal.fire({
                    title: 'إضافة ملاحظة',
                    html: `
                        <label for="note">الملاحظة:</label>
                        <textarea id="note" class="swal2-input" placeholder="الملاحظة"></textarea>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!note) {
                            Swal.showValidationMessage(`الرجاء إدخال الملاحظة`);
                        }
                        return { note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '/verified_students/{{ $verifiedStudent->id }}/admin_notes',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                ...result.value,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة الملاحظة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة الملاحظة.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var noteId = $(this).data('id');
                var noteContent = $(this).data('note');
                Swal.fire({
                    title: 'تعديل ملاحظة',
                    html: `
                        <label for="note">الملاحظة:</label>
                        <textarea id="note" class="swal2-input">${noteContent}</textarea>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!note) {
                            Swal.showValidationMessage(`الرجاء إدخال الملاحظة`);
                        }
                        return { note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '/verified_students/{{ $verifiedStudent->id }}/admin_notes/' + noteId,
                            method: 'PUT',
                            data: {
                                _token: '{{ csrf_token() }}',
                                ...result.value,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم التعديل!', 'تم تعديل الملاحظة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل الملاحظة.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var noteId = $(this).data('id');
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
                            url: '/verified_students/{{ $verifiedStudent->id }}/admin_notes/' + noteId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف الملاحظة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الملاحظة.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الملاحظة.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
