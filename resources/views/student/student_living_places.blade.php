@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">أماكن إقامة الطلاب</h4>
                    <button class="btn btn-primary d-inline-block" id="addLivingPlace">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">أماكن الإقامة</li>
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
                                    <th>الملاحظة</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($livingPlaces as $index => $place)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $place->name }}</td>
                                        <td>{{ $place->note }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $place->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $place->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $livingPlaces->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
     $(document).ready(function() {
        $('#addLivingPlace').on('click', function() {
            Swal.fire({
                title: 'إضافة مكان إقامة',
                html: `
                    <label for="name">اسم المكان:</label>
                    <input type="text" id="name" class="swal2-input" placeholder="اسم المكان">
                    <label for="note">الملاحظة:</label>
                    <input type="text" id="note" class="swal2-input" placeholder="الملاحظة">
                `,
                confirmButtonText: 'حفظ البيانات',
                showCancelButton: true,
                cancelButtonText: 'إلغاء',
                preConfirm: () => {
                    const name = Swal.getPopup().querySelector('#name').value;
                    const note = Swal.getPopup().querySelector('#note').value;
                    if (!name) {
                        Swal.showValidationMessage(`الرجاء إدخال اسم المكان`);
                    }
                    return { name: name, note: note };
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '{{ route('student-living-places.store') }}',
                        method: 'POST',
                        data: {
                            _token: '{{ csrf_token() }}',
                            name: result.value.name,
                            note: result.value.note,
                        },
                        success: function(response) {
                            if (response.success) {
                                Swal.fire('تم الإضافة!', 'تم إضافة مكان الإقامة بنجاح.', 'success').then(() => {
                                    location.reload();
                                });
                            } else {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة مكان الإقامة.', 'error');
                            }
                        }
                    });
                }
            });
        });

        $('.edit-button').on('click', function() {
            var placeId = $(this).data('id');
            $.ajax({
                url: '/student-living-places/' + placeId + '/edit',
                method: 'GET',
                success: function(data) {
                    Swal.fire({
                        title: 'تعديل مكان إقامة',
                        html: `
                            <label for="name">اسم المكان:</label>
                            <input type="text" id="name" class="swal2-input" value="${data.name}">
                            <label for="note">الملاحظة:</label>
                            <input type="text" id="note" class="swal2-input" value="${data.note}">
                        `,
                        confirmButtonText: 'حفظ البيانات',
                        showCancelButton: true,
                        cancelButtonText: 'إلغاء',
                        preConfirm: () => {
                            const name = Swal.getPopup().querySelector('#name').value;
                            const note = Swal.getPopup().querySelector('#note').value;
                            if (!name) {
                                Swal.showValidationMessage(`الرجاء إدخال اسم المكان`);
                            }
                            return { name: name, note: note };
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url: '/student-living-places/' + placeId,
                                method: 'PUT',
                                data: {
                                    _token: '{{ csrf_token() }}',
                                    name: result.value.name,
                                    note: result.value.note,
                                },
                                success: function(response) {
                                    if (response.success) {
                                        Swal.fire('تم التعديل!', 'تم تعديل مكان الإقامة بنجاح.', 'success').then(() => {
                                            location.reload();
                                        });
                                    } else {
                                        Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل مكان الإقامة.', 'error');
                                    }
                                }
                            });
                        }
                    });
                }
            });
        });

        $('.delete-button').on('click', function() {
            var placeId = $(this).data('id');
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
                        url: '/student-living-places/' + placeId,
                        type: 'DELETE',
                        data: {
                            _token: '{{ csrf_token() }}'
                        },
                        success: function(response) {
                            if (response.success) {
                                Swal.fire('تم الحذف!', 'تم حذف مكان الإقامة بنجاح.', 'success').then(() => {
                                    location.reload();
                                });
                            } else {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف مكان الإقامة.', 'error');
                            }
                        },
                        error: function(response) {
                            Swal.fire('خطأ!', 'حدث خطأ أثناء حذف مكان الإقامة.', 'error');
                        }
                    });
                }
            });
        });
    });
    </script>
@endsection
