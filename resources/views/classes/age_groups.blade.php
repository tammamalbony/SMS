@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">الفئات العمرية</h4>
                    <button class="btn btn-primary d-inline-block" id="addAgeGroup">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">الفئات العمرية</li>
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
                                    <th>العمر الأدنى</th>
                                    <th>العمر الأقصى</th>
                                    <th>الصف</th>
                                    <th>الملاحظات</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($ageGroups as $index => $ageGroup)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $ageGroup->name }}</td>
                                        <td>{{ $ageGroup->min_age }}</td>
                                        <td>{{ $ageGroup->max_age }}</td>
                                        <td>{{ $ageGroup->classs->class_name_ar }}</td>
                                        <td>{{ $ageGroup->note }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $ageGroup->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $ageGroup->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $ageGroups->appends(['classs_id' => $classs_id])->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addAgeGroup').on('click', function() {
                Swal.fire({
                    title: 'إضافة فئة عمرية',
                    html: `
                    <div class="container-fluid">
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="name">اسم الفئة:</label>
                                <input type="text" id="name" class="form-control" placeholder="اسم الفئة">
                            </div>
                             <div class="col-md-4">
                                <label for="min_age">العمر الأدنى:</label>
                                <input type="number" id="min_age" class="form-control" placeholder="العمر الأدنى">
                            </div>
                            <div class="col-md-4">
                                <label for="max_age">العمر الأقصى:</label>
                                <input type="number" id="max_age" class="form-control" placeholder="العمر الأقصى">
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <label for="classs_id">الفئة:</label>
                                <select id="classs_id" class="form-control">
                                    @foreach ($classes as $class)
                                        <option value="{{ $class->id }}">{{ $class->class_name_ar }} --- {{ $class->grade->grade_name_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12">
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
                        const name = Swal.getPopup().querySelector('#name').value;
                        const min_age = Swal.getPopup().querySelector('#min_age').value;
                        const max_age = Swal.getPopup().querySelector('#max_age').value;
                        const classs_id = Swal.getPopup().querySelector('#classs_id').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!name || !min_age || !max_age || !classs_id) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                        }
                        return {
                            name: name,
                            min_age: min_age,
                            max_age: max_age,
                            classs_id: classs_id,
                            note: note
                        };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('age_groups.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                name: result.value.name,
                                min_age: result.value.min_age,
                                max_age: result.value.max_age,
                                classs_id: result.value.classs_id,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!',
                                            'تم إضافة الفئة العمرية بنجاح.', 'success')
                                        .then(() => {
                                            location.reload();
                                        });
                                } else {
                                    Swal.fire('خطأ!',
                                        'حدث خطأ أثناء إضافة الفئة العمرية.',
                                        'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var ageGroupId = $(this).data('id');
                $.ajax({
                    url: '/age_groups/' + ageGroupId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل فئة عمرية',
                            html: `
                                    <div class="container-fluid">
                                        <div class="row mb-3">
                                            <div class="col-md-4">
                                                <label for="name">اسم الفئة:</label>
                                                <input type="text" id="name" class="form-control" value="${data.name}">
                                            </div>
                                           <div class="col-md-4">
                                                <label for="min_age">العمر الأدنى:</label>
                                                <input type="number" id="min_age" class="form-control" value="${data.min_age}">
                                            </div>
                                            <div class="col-md-4">
                                                <label for="max_age">العمر الأقصى:</label>
                                                <input type="number" id="max_age" class="form-control" value="${data.max_age}">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                             <div class="col-md-6">
                                                <label for="classs_id">الفئة:</label>
                                                <select id="classs_id" class="form-control">
                                                    @foreach ($classes as $class)
                                                        <option value="{{ $class->id }}" ${data.classs_id == {{ $class->id }} ? 'selected' : ''}>
                                                            {{ $class->class_name_ar }} --- {{ $class->grade->grade_name_ar }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-12">
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
                                const name = Swal.getPopup().querySelector('#name')
                                    .value;
                                const min_age = Swal.getPopup().querySelector(
                                    '#min_age').value;
                                const max_age = Swal.getPopup().querySelector(
                                    '#max_age').value;
                                const classs_id = Swal.getPopup().querySelector(
                                    '#classs_id').value;
                                const note = Swal.getPopup().querySelector('#note')
                                    .value;
                                if (!name || !min_age || !max_age || !classs_id) {
                                    Swal.showValidationMessage(
                                        `الرجاء إدخال جميع الحقول المطلوبة`);
                                }
                                return {
                                    name: name,
                                    min_age: min_age,
                                    max_age: max_age,
                                    classs_id: classs_id,
                                    note: note
                                };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/age_groups/' + ageGroupId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        name: result.value.name,
                                        min_age: result.value.min_age,
                                        max_age: result.value.max_age,
                                        classs_id: result.value.classs_id,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!',
                                                'تم تعديل الفئة العمرية بنجاح.',
                                                'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!',
                                                'حدث خطأ أثناء تعديل الفئة العمرية.',
                                                'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var ageGroupId = $(this).data('id');
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
                            url: '/age_groups/' + ageGroupId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!',
                                            'تم حذف الفئة العمرية بنجاح.', 'success')
                                        .then(() => {
                                            location.reload();
                                        });
                                } else {
                                    Swal.fire('خطأ!',
                                        'حدث خطأ أثناء حذف الفئة العمرية.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الفئة العمرية.',
                                    'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
