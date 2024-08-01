@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">أنواع التعيينات</h4>
                    <button class="btn btn-primary d-inline-block" id="addTypeOfAppointment">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">أنواع التعيينات</li>
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
                                    <th>نوع التوظيف</th>
                                    <th>النوع</th>
                                    <th>الملاحظات</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($typesOfAppointments as $index => $typeOfAppointment)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $typeOfAppointment->typeOfEmployment->type }}</td>
                                        <td>{{ $typeOfAppointment->type }}</td>
                                        <td>{{ $typeOfAppointment->note }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $typeOfAppointment->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $typeOfAppointment->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $typesOfAppointments->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addTypeOfAppointment').on('click', function() {
                Swal.fire({
                    title: 'إضافة نوع موعد',
                    html: `
                        <label for="type_of_employment_id">نوع التوظيف:</label>
                        <select id="type_of_employment_id" class="swal2-input">
                            @foreach ($typesOfEmployment as $typeOfEmployment)
                                <option value="{{ $typeOfEmployment->id }}">{{ $typeOfEmployment->type }}</option>
                            @endforeach
                        </select>
                        <label for="type">نوع التعيين:</label>
                        <input type="text" id="type" class="swal2-input" placeholder="نوع التعيين">
                        <label for="note">الملاحظات:</label>
                        <textarea id="note" class="swal2-input" placeholder="الملاحظات"></textarea>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const type_of_employment_id = Swal.getPopup().querySelector('#type_of_employment_id').value;
                        const type = Swal.getPopup().querySelector('#type').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!type_of_employment_id || !type) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                        }
                        return { type_of_employment_id: type_of_employment_id, type: type, note: note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('types_of_appointments.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                type_of_employment_id: result.value.type_of_employment_id,
                                type: result.value.type,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة نوع التعيين بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة نوع التعيين.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var typeOfAppointmentId = $(this).data('id');
                $.ajax({
                    url: '/types_of_appointments/' + typeOfAppointmentId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل نوع موعد',
                            html: `
                                <label for="type_of_employment_id">نوع التوظيف:</label>
                                <select id="type_of_employment_id" class="swal2-input">
                                    @foreach ($typesOfEmployment as $typeOfEmployment)
                                        <option value="{{ $typeOfEmployment->id }}" ${data.type_of_employment_id == {{ $typeOfEmployment->id }} ? 'selected' : ''}>{{ $typeOfEmployment->type }}</option>
                                    @endforeach
                                </select>
                                <label for="type">نوع التعيين:</label>
                                <input type="text" id="type" class="swal2-input" value="${data.type}">
                                <label for="note">الملاحظات:</label>
                                <textarea id="note" class="swal2-input">${data.note}</textarea>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const type_of_employment_id = Swal.getPopup().querySelector('#type_of_employment_id').value;
                                const type = Swal.getPopup().querySelector('#type').value;
                                const note = Swal.getPopup().querySelector('#note').value;
                                if (!type_of_employment_id || !type) {
                                    Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                                }
                                return { type_of_employment_id: type_of_employment_id, type: type, note: note };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/types_of_appointments/' + typeOfAppointmentId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        type_of_employment_id: result.value.type_of_employment_id,
                                        type: result.value.type,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل نوع التعيين بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل نوع التعيين.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var typeOfAppointmentId = $(this).data('id');
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
                            url: '/types_of_appointments/' + typeOfAppointmentId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف نوع التعيين بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع التعيين.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف نوع التعيين.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
