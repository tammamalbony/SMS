@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">الأنشطة الشبابية</h4>
                    <button class="btn btn-primary d-inline-block" id="addYouthActivity">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">الأنشطة الشبابية</li>
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
                                    <th>النوع</th>
                                    <th>الموقع</th>
                                    <th>الملاحظات</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($youthActivities as $index => $youthActivity)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $youthActivity->name }}</td>
                                        <td>{{ $youthActivity->type->type }}</td>
                                        <td>{{ $youthActivity->location->location }}</td>
                                        <td>{{ $youthActivity->note }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $youthActivity->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $youthActivity->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $youthActivities->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addYouthActivity').on('click', function() {
                Swal.fire({
                    title: 'إضافة نشاط شبابي',
                    html: `
                        <label for="name">اسم النشاط:</label>
                        <input type="text" id="name" class="swal2-input" placeholder="اسم النشاط">
                        <label for="type_id">نوع النشاط:</label>
                        <select id="type_id" class="swal2-input">
                            @foreach ($youthActivityTypes as $type)
                                <option value="{{ $type->id }}">{{ $type->type }}</option>
                            @endforeach
                        </select>
                        <label for="location_id">الموقع:</label>
                        <select id="location_id" class="swal2-input">
                            @foreach ($youthActivityLocations as $location)
                                <option value="{{ $location->id }}">{{ $location->location }}</option>
                            @endforeach
                        </select>
                        <label for="note">ملاحظات:</label>
                        <textarea id="note" class="swal2-input" placeholder="ملاحظات"></textarea>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const name = Swal.getPopup().querySelector('#name').value;
                        const type_id = Swal.getPopup().querySelector('#type_id').value;
                        const location_id = Swal.getPopup().querySelector('#location_id').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!name || !type_id || !location_id) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                        }
                        return { name: name, type_id: type_id, location_id: location_id, note: note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('youth_activities.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                name: result.value.name,
                                type_id: result.value.type_id,
                                location_id: result.value.location_id,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة النشاط بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة النشاط.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var youthActivityId = $(this).data('id');
                $.ajax({
                    url: '/youth_activities/' + youthActivityId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل نشاط شبابي',
                            html: `
                                <label for="name">اسم النشاط:</label>
                                <input type="text" id="name" class="swal2-input" value="${data.name}">
                                <label for="type_id">نوع النشاط:</label>
                                <select id="type_id" class="swal2-input">
                                    @foreach ($youthActivityTypes as $type)
                                        <option value="{{ $type->id }}" ${data.type_id == {{ $type->id }} ? 'selected' : ''}>{{ $type->type }}</option>
                                    @endforeach
                                </select>
                                <label for="location_id">الموقع:</label>
                                <select id="location_id" class="swal2-input">
                                    @foreach ($youthActivityLocations as $location)
                                        <option value="{{ $location->id }}" ${data.location_id == {{ $location->id }} ? 'selected' : ''}>{{ $location->location }}</option>
                                    @endforeach
                                </select>
                                <label for="note">ملاحظات:</label>
                                <textarea id="note" class="swal2-input">${data.note}</textarea>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const name = Swal.getPopup().querySelector('#name').value;
                                const type_id = Swal.getPopup().querySelector('#type_id').value;
                                const location_id = Swal.getPopup().querySelector('#location_id').value;
                                const note = Swal.getPopup().querySelector('#note').value;
                                if (!name || !type_id || !location_id) {
                                    Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                                }
                                return { name: name, type_id: type_id, location_id: location_id, note: note };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/youth_activities/' + youthActivityId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        name: result.value.name,
                                        type_id: result.value.type_id,
                                        location_id: result.value.location_id,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل النشاط بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل النشاط.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var youthActivityId = $(this).data('id');
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
                            url: '/youth_activities/' + youthActivityId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف النشاط بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف النشاط.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف النشاط.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
