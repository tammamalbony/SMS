@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">الأمراض</h4>
                    <button class="btn btn-primary d-inline-block" id="addDisease">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">الأمراض</li>
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
                                    <th>الاسم</th>
                                    <th>الوصف</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($diseases as $index => $disease)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $disease->type->type }}</td>
                                        <td>{{ $disease->name }}</td>
                                        <td>{{ $disease->description }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $disease->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $disease->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $diseases->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addDisease').on('click', function() {
                Swal.fire({
                    title: 'إضافة مرض',
                    html: `
                        <label for="type_id">نوع المرض:</label>
                        <select id="type_id" class="swal2-input">
                            @foreach ($diseaseTypes as $type)
                                <option value="{{ $type->id }}">{{ $type->type }}</option>
                            @endforeach
                        </select>
                        <label for="name">اسم المرض:</label>
                        <input type="text" id="name" class="swal2-input" placeholder="اسم المرض">
                        <label for="description">الوصف:</label>
                        <textarea id="description" class="swal2-input" placeholder="الوصف"></textarea>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const type_id = Swal.getPopup().querySelector('#type_id').value;
                        const name = Swal.getPopup().querySelector('#name').value;
                        const description = Swal.getPopup().querySelector('#description').value;
                        if (!type_id || !name ) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                        }
                        return { type_id: type_id, name: name, description: description };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('diseases.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                type_id: result.value.type_id,
                                name: result.value.name,
                                description: result.value.description,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة المرض بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة المرض.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var diseaseId = $(this).data('id');
                $.ajax({
                    url: '/diseases/' + diseaseId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل مرض',
                            html: `
                                <label for="type_id">نوع المرض:</label>
                                <select id="type_id" class="swal2-input">
                                    @foreach ($diseaseTypes as $type)
                                        <option value="{{ $type->id }}" ${data.type_id == {{ $type->id }} ? 'selected' : ''}>{{ $type->type }}</option>
                                    @endforeach
                                </select>
                                <label for="name">اسم المرض:</label>
                                <input type="text" id="name" class="swal2-input" value="${data.name}">
                                <label for="description">الوصف:</label>
                                <textarea id="description" class="swal2-input">${data.description}</textarea>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const type_id = Swal.getPopup().querySelector('#type_id').value;
                                const name = Swal.getPopup().querySelector('#name').value;
                                const description = Swal.getPopup().querySelector('#description').value;
                                if (!type_id || !name) {
                                    Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                                }
                                return { type_id: type_id, name: name, description: description };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/diseases/' + diseaseId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        type_id: result.value.type_id,
                                        name: result.value.name,
                                        description: result.value.description,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل المرض بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل المرض.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var diseaseId = $(this).data('id');
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
                            url: '/diseases/' + diseaseId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف المرض بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المرض.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المرض.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
