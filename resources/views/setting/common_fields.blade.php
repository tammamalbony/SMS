@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <div class="page-title">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4 class="mb-0 d-inline-block">الحقول الشائعة</h4>
                <button class="btn btn-primary d-inline-block" id="addCommonField">إضافة جديد</button>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                    <li class="breadcrumb-item active">الحقول الشائعة</li>
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
                            @foreach ($commonFields as $index => $commonField)
                            <tr>
                                <td>{{ $index + 1 }}</td>
                                <td>{{ $commonField->name }}</td>
                                <td>
                                    <button class="btn btn-primary edit-button" data-id="{{ $commonField->id }}"><i class="fa fa-edit"></i></button>
                                    <button class="btn btn-danger delete-button" data-id="{{ $commonField->id }}"><i class="fa fa-trash"></i></button>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-center">
                        {!! $commonFields->links() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#addCommonField').on('click', function() {
            Swal.fire({
                title: 'إضافة حقل جديد',
                html: '<input type="text" id="name" class="swal2-input" placeholder="الاسم">',
                confirmButtonText: 'حفظ',
                showCancelButton: true,
                cancelButtonText: 'إلغاء',
                preConfirm: () => {
                    const name = document.getElementById('name').value;
                    if (!name ) {
                        Swal.showValidationMessage('يجب ملء جميع الحقول');
                    }
                    return { name: name};
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '{{ route("common-fields.store") }}',
                        type: 'POST',
                        data: {
                            _token: '{{ csrf_token() }}',
                            name: result.value.name,
                        },
                        success: function(response) {
                            Swal.fire('تم!', 'تم إضافة الحقل بنجاح.', 'success').then(() => {
                                location.reload();
                            });
                        },
                        error: function(response) {
                            Swal.fire('خطأ!', 'حدث خطأ أثناء الإضافة.', 'error');
                        }
                    });
                }
            });
        });

        $('.edit-button').each(function() {
            $(this).on('click', function() {
                var id = $(this).data('id');
                $.get('/common-fields/' + id + '/edit', function(data) {
                    Swal.fire({
                        title: 'تعديل الحقل',
                        html: '<input type="text" id="name" class="swal2-input" value="' + data.name + '">',
                        confirmButtonText: 'حفظ التعديلات',
                        showCancelButton: true,
                        cancelButtonText: 'إلغاء',
                        preConfirm: () => {
                            const name = document.getElementById('name').value;
                            if (!name) {
                                Swal.showValidationMessage('يجب ملء جميع الحقول');
                            }
                            return { name: name };
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url: '/common-fields/' + id,
                                type: 'PUT',
                                data: {
                                    _token: '{{ csrf_token() }}',
                                    name: result.value.name,
                                },
                                success: function(response) {
                                    Swal.fire('تم!', 'تم تعديل الحقل بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                },
                                error: function(response) {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء التعديل.', 'error');
                                }
                            });
                        }
                    });
                });
            });
        });

        $('.delete-button').each(function() {
            $(this).on('click', function() {
                var id = $(this).data('id');
                Swal.fire({
                    title: 'هل أنت متأكد؟',
                    text: "لا يمكن التراجع عن هذا الإجراء!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'نعم، احذفه',
                    cancelButtonText: 'إلغاء',
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '/common-fields/' + id,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                Swal.fire('تم الحذف!', 'تم حذف الحقل بنجاح.', 'success').then(() => {
                                    location.reload();
                                });
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء الحذف.', 'error');
                            }
                        });
                    }
                });
            });
        });
    });
</script>
@endsection
