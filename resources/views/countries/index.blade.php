@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">الدول</h4>
                    <button class="btn btn-primary d-inline-block" id="addCountry">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">الدول</li>
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
                                @foreach ($countries as $index => $country)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $country->name }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $country->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $country->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                            <a href="{{ route('governates.index', $country->id) }}" class="btn btn-info"><i
                                                    class="fa fa-map"></i> المحافظات</a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $countries->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addCountry').on('click', function() {
                Swal.fire({
                    title: 'إضافة دولة',
                    html: `
                        <label for="name">اسم الدولة:</label>
                        <input type="text" id="name" class="swal2-input" placeholder="اسم الدولة">
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const name = Swal.getPopup().querySelector('#name').value;
                        if (!name) {
                            Swal.showValidationMessage(`الرجاء إدخال اسم الدولة`);
                        }
                        return { name: name };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('countries.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                name: result.value.name,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة الدولة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة الدولة.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var countryId = $(this).data('id');
                $.ajax({
                    url: '/countries/' + countryId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل دولة',
                            html: `
                                <label for="name">اسم الدولة:</label>
                                <input type="text" id="name" class="swal2-input" value="${data.name}">
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const name = Swal.getPopup().querySelector('#name').value;
                                if (!name) {
                                    Swal.showValidationMessage(`الرجاء إدخال اسم الدولة`);
                                }
                                return { name: name };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/countries/' + countryId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        name: result.value.name,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل الدولة بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل الدولة.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var countryId = $(this).data('id');
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
                            url: '/countries/' + countryId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف الدولة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الدولة.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الدولة.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
