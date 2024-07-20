@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">مستندات {{ $type }}: {{ $model->name }}</h4>
                    <button class="btn btn-primary d-inline-block" id="addDocument">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item"><a href="{{ route('students.index') }}">الطلاب</a></li>
                        <li class="breadcrumb-item active">مستندات</li>
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
                                    <th>المستند</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($documents as $index => $document)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $document->name }}</td>
                                        <td>
                                            @if(Str::endsWith($document->file_path, ['jpg', 'jpeg', 'png']))
                                            <img src="{{ asset('storage/' . $document->file_path) }}" alt="{{ $document->name }}" width="50">
                                            @else
                                                <a href="{{ asset('storage/' . $document->file_path) }}" target="_blank">عرض المستند</a>
                                            @endif
                                        </td>
                                        <td>
                                            <button class="btn btn-danger delete-button" data-id="{{ $document->id }}"><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $documents->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addDocument').on('click', function() {
                Swal.fire({
                    title: 'إضافة مستند',
                    html: `
                        <label for="name">اسم المستند:</label>
                        <input type="text" id="name" class="swal2-input" placeholder="اسم المستند">
                        <label for="file">المستند:</label>
                        <input type="file" id="file" class="swal2-input" accept=".jpg,.jpeg,.png,.pdf">
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const name = Swal.getPopup().querySelector('#name').value;
                        const file = Swal.getPopup().querySelector('#file').files[0];
                        if (!name || !file) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                        }
                        return { name: name, file: file };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        let formData = new FormData();
                        formData.append('_token', '{{ csrf_token() }}');
                        formData.append('name', result.value.name);
                        formData.append('file', result.value.file);

                        $.ajax({
                            url: '{{ route('documents.store', [$type, $model->id]) }}',
                            method: 'POST',
                            data: formData,
                            contentType: false,
                            processData: false,
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة المستند بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة المستند.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var documentId = $(this).data('id');
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
                            url: '{{ route('documents.destroy', [$type, $model->id, '']) }}/' + documentId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف المستند بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المستند.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المستند.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
