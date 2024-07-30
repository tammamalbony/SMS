@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">المخيمات</h4>
                    <button class="btn btn-primary d-inline-block" id="addCamp">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">المخيمات</li>
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
                                    <th>التاريخ</th>
                                    <th>التقييم</th>
                                    <th>الموقع</th>
                                    <th>النوع</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($camps as $index => $camp)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $camp->date }}</td>
                                        <td>{{ $camp->rate }}</td>
                                        <td>{{ $camp->location->location }}</td>
                                        <td>{{ $camp->type->type }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $camp->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $camp->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $camps->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addCamp').on('click', function() {
                Swal.fire({
                    title: 'إضافة مخيم',
                    html: `
                        <label for="date">التاريخ:</label>
                        <input type="date" id="date" class="swal2-input">
                        <label for="rate">التقييم:</label>
                        <input type="text" id="rate" class="swal2-input" placeholder="التقييم">
                        <label for="location_id">الموقع:</label>
                        <select id="location_id" class="swal2-input">
                            @foreach ($campLocations as $location)
                                <option value="{{ $location->id }}">{{ $location->location }}</option>
                            @endforeach
                        </select>
                        <label for="type_id">النوع:</label>
                        <select id="type_id" class="swal2-input">
                            @foreach ($campTypes as $type)
                                <option value="{{ $type->id }}">{{ $type->type }}</option>
                            @endforeach
                        </select>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const date = Swal.getPopup().querySelector('#date').value;
                        const rate = Swal.getPopup().querySelector('#rate').value;
                        const location_id = Swal.getPopup().querySelector('#location_id').value;
                        const type_id = Swal.getPopup().querySelector('#type_id').value;
                        if (!date || !rate || !location_id || !type_id) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                        }
                        return { date: date, rate: rate, location_id: location_id, type_id: type_id };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('camps.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                date: result.value.date,
                                rate: result.value.rate,
                                location_id: result.value.location_id,
                                type_id: result.value.type_id,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة المخيم بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة المخيم.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var campId = $(this).data('id');
                $.ajax({
                    url: '/camps/' + campId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل مخيم',
                            html: `
                                <label for="date">التاريخ:</label>
                                <input type="date" id="date" class="swal2-input" value="${data.date}">
                                <label for="rate">التقييم:</label>
                                <input type="text" id="rate" class="swal2-input" value="${data.rate}">
                                <label for="location_id">الموقع:</label>
                                <select id="location_id" class="swal2-input">
                                    @foreach ($campLocations as $location)
                                        <option value="{{ $location->id }}" ${data.location_id == {{ $location->id }} ? 'selected' : ''}>{{ $location->location }}</option>
                                    @endforeach
                                </select>
                                <label for="type_id">النوع:</label>
                                <select id="type_id" class="swal2-input">
                                    @foreach ($campTypes as $type)
                                        <option value="{{ $type->id }}" ${data.type_id == {{ $type->id }} ? 'selected' : ''}>{{ $type->type }}</option>
                                    @endforeach
                                </select>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const date = Swal.getPopup().querySelector('#date').value;
                                const rate = Swal.getPopup().querySelector('#rate').value;
                                const location_id = Swal.getPopup().querySelector('#location_id').value;
                                const type_id = Swal.getPopup().querySelector('#type_id').value;
                                if (!date || !rate || !location_id || !type_id) {
                                    Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                                }
                                return { date: date, rate: rate, location_id: location_id, type_id: type_id };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/camps/' + campId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        date: result.value.date,
                                        rate: result.value.rate,
                                        location_id: result.value.location_id,
                                        type_id: result.value.type_id,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل المخيم بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل المخيم.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var campId = $(this).data('id');
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
                            url: '/camps/' + campId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف المخيم بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المخيم.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المخيم.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
