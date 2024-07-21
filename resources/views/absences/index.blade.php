@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">أنواع الغياب</h4>
                    <button class="btn btn-primary d-inline-block" id="addAbsence">إضافة نوع غياب</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">أنواع الغياب</li>
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
                                    <th>الحد الأقصى</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($absences as $index => $absence)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $absence->name }}</td>
                                        <td>{{ $absence->limit }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $absence->id }}" data-name="{{ $absence->name }}" data-limit="{{ $absence->limit }}"><i class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $absence->id }}"><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $absences->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addAbsence').on('click', function() {
                Swal.fire({
                    title: 'إضافة نوع غياب',
                    html: `
                        <label for="name">الاسم:</label>
                        <input type="text" id="name" class="swal2-input" placeholder="الاسم">
                        <label for="limit">الحد الأقصى:</label>
                        <input type="number" id="limit" class="swal2-input" placeholder="الحد الأقصى">
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const name = Swal.getPopup().querySelector('#name').value;
                        const limit = Swal.getPopup().querySelector('#limit').value;
                        if (!name || !limit) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                        }
                        return { name, limit };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('absences.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                ...result.value,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة نوع الغياب بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة نوع الغياب.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var absenceId = $(this).data('id');
                var name = $(this).data('name');
                var limit = $(this).data('limit');
                Swal.fire({
                    title: 'تعديل نوع غياب',
                    html: `
                        <label for="name">الاسم:</label>
                        <input type="text" id="name" class="swal2-input" value="${name}">
                        <label for="limit">الحد الأقصى:</label>
                        <input type="number" id="limit" class="swal2-input" value="${limit}">
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const name = Swal.getPopup().querySelector('#name').value;
                        const limit = Swal.getPopup().querySelector('#limit').value;
                        if (!name || !limit) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                        }
                        return { name, limit };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '/absences/' + absenceId,
                            method: 'PUT',
                            data: {
                                _token: '{{ csrf_token() }}',
                                ...result.value,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم التعديل!', 'تم تعديل نوع الغياب بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل نوع الغياب.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var absenceId = $(this).data('id');
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
                            url: '/absences/' + absenceId,
                            method: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف نوع الغياب بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع الغياب.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع الغياب.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
