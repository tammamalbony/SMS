@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">مواقع الأنشطة الشبابية</h4>
                    <button class="btn btn-primary d-inline-block" id="addYouthActivityLocation">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">مواقع الأنشطة الشبابية</li>
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
                                    <th>الموقع</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($youthActivityLocations as $index => $youthActivityLocation)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $youthActivityLocation->location }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $youthActivityLocation->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $youthActivityLocation->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $youthActivityLocations->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addYouthActivityLocation').on('click', function() {
                Swal.fire({
                    title: 'إضافة موقع نشاط شبابي',
                    html: `
                        <label for="location">الموقع:</label>
                        <input type="text" id="location" class="swal2-input" placeholder="الموقع">
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const location = Swal.getPopup().querySelector('#location').value;
                        if (!location) {
                            Swal.showValidationMessage(`الرجاء إدخال الموقع`);
                        }
                        return { location: location };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('youth_activity_locations.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                location: result.value.location,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة الموقع بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة الموقع.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var youthActivityLocationId = $(this).data('id');
                $.ajax({
                    url: '/youth_activity_locations/' + youthActivityLocationId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل موقع نشاط شبابي',
                            html: `
                                <label for="location">الموقع:</label>
                                <input type="text" id="location" class="swal2-input" value="${data.location}">
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const location = Swal.getPopup().querySelector('#location').value;
                                if (!location) {
                                    Swal.showValidationMessage(`الرجاء إدخال الموقع`);
                                }
                                return { location: location };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/youth_activity_locations/' + youthActivityLocationId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        location: result.value.location,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل الموقع بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل الموقع.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var youthActivityLocationId = $(this).data('id');
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
                            url: '/youth_activity_locations/' + youthActivityLocationId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف الموقع بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الموقع.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الموقع.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
