@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">المواد الدراسية</h4>
                    <button class="btn btn-primary d-inline-block" id="addSubject">إضافة مادة</button>
                    {{-- <button class="btn btn-primary d-inline-block" id="addSubjectDetail">إضافة تفاصيل مادة</button> --}}
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">المواد الدراسية</li>
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
                                    <th>الاسم بالعربية</th>
                                    <th>الاسم بالإنجليزية</th>
                                    <th>الأصل</th>
                                    <th>ملاحظات</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($subjects as $index => $subject)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $subject->name_ar }}</td>
                                        <td>{{ $subject->name_en }}</td>
                                        <td>{{ $subject->parent ? $subject->parent->name_ar : '—' }}</td>
                                        <td>{{ $subject->note }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $subject->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $subject->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $subjects->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('#addSubject').on('click', function() {
                Swal.fire({
                    title: 'إضافة مادة',
                    html: `
                        <label for="name_ar">الاسم بالعربية:</label>
                        <input type="text" id="name_ar" class="swal2-input" placeholder="الاسم بالعربية">
                        <label for="name_en">الاسم بالإنجليزية:</label>
                        <input type="text" id="name_en" class="swal2-input" placeholder="الاسم بالإنجليزية">
                        <label for="parent_id">الأصل:</label>
                        <select id="parent_id" class="swal2-input">
                            <option value="">اختر الأصل</option>
                            @foreach ($parentSubjects as $parent)
                                <option value="{{ $parent->id }}">{{ $parent->name_ar }}</option>
                            @endforeach
                        </select>
                        <label for="note">ملاحظات:</label>
                        <textarea id="note" class="swal2-textarea" placeholder="ملاحظات"></textarea>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const name_ar = Swal.getPopup().querySelector('#name_ar').value
                        const name_en = Swal.getPopup().querySelector('#name_en').value
                        const parent_id = Swal.getPopup().querySelector('#parent_id').value
                        const note = Swal.getPopup().querySelector('#note').value
                        if (!name_ar || !name_en) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`)
                        }
                        return {
                            name_ar,
                            name_en,
                            parent_id,
                            note
                        }
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('subjects.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                name_ar: result.value.name_ar,
                                name_en: result.value.name_en,
                                parent_id: result.value.parent_id,
                                note: result.value.note
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة المادة بنجاح.',
                                        'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة المادة.',
                                        'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', response.responseJSON.message,
                                    'error');
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var subjectId = $(this).data('id');
                $.ajax({
                    url: '/subjects/' + subjectId + '/edit',
                    method: 'GET',
                    success: function(response) {
                        var data = response.data
                        Swal.fire({
                            title: 'تعديل مادة',
                            html: `
                                <label for="name_ar">الاسم بالعربية:</label>
                                <input type="text" id="name_ar" class="swal2-input" value="${data.name_ar}">
                                <label for="name_en">الاسم بالإنجليزية:</label>
                                <input type="text" id="name_en" class="swal2-input" value="${data.name_en}">
                                <label for="order">الترتيب: ${data.order}</label>
                                <label for="parent_id">الأصل:</label>
                                <select id="parent_id" class="swal2-input">
                                    <option value="">اختر الأصل</option>
                                    @foreach ($parentSubjects as $parent)
                                        <option value="{{ $parent->id }}" ${data.parent_id == {{ $parent->id }} ? 'selected' : '' }>{{ $parent->name_ar }}</option>
                                    @endforeach
                                </select>
                                <label for="note">ملاحظات:</label>
                                <textarea id="note" class="swal2-textarea">${data.note}</textarea>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const name_ar = Swal.getPopup().querySelector(
                                    '#name_ar').value
                                const name_en = Swal.getPopup().querySelector(
                                    '#name_en').value
                                const parent_id = Swal.getPopup().querySelector(
                                    '#parent_id').value
                                const note = Swal.getPopup().querySelector('#note')
                                    .value
                                if (!name_ar || !name_en) {
                                    Swal.showValidationMessage(
                                        `الرجاء إدخال جميع الحقول`)
                                }
                                return {
                                    name_ar,
                                    name_en,
                                    parent_id,
                                    note
                                }
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/subjects/' + subjectId + "/update",
                                    method: 'POST',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        name_ar: result.value.name_ar,
                                        name_en: result.value.name_en,
                                        order: result.value.order,
                                        parent_id: result.value.parent_id,
                                        note: result.value.note
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!',
                                                'تم تعديل المادة بنجاح.',
                                                'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!',
                                                'حدث خطأ أثناء تعديل المادة.',
                                                'error');
                                        }
                                    },
                                    error: function(response) {
                                        Swal.fire('خطأ!', response
                                            .responseJSON.message,
                                            'error');
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var subjectId = $(this).data('id');
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
                            url: '/subjects/' + subjectId + "/delete",
                            type: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف المادة بنجاح.',
                                        'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المادة.',
                                        'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المادة.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
