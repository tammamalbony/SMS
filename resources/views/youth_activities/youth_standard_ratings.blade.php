@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">تقييم معايير الشباب</h4>
                    <button class="btn btn-primary d-inline-block" id="addYouthStandardRating">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">تقييم معايير الشباب</li>
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
                                    <th>التقييم</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($youthStandardRatings as $index => $youthStandardRating)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $youthStandardRating->rate }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $youthStandardRating->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $youthStandardRating->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $youthStandardRatings->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addYouthStandardRating').on('click', function() {
                Swal.fire({
                    title: 'إضافة تقييم معيار شبابي',
                    html: `
                        <label for="rate">التقييم:</label>
                        <input type="text" id="rate" class="swal2-input" placeholder="التقييم">
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const rate = Swal.getPopup().querySelector('#rate').value;
                        if (!rate) {
                            Swal.showValidationMessage(`الرجاء إدخال التقييم`);
                        }
                        return { rate: rate };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('youth_standard_ratings.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                rate: result.value.rate,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة التقييم بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة التقييم.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var youthStandardRatingId = $(this).data('id');
                $.ajax({
                    url: '/youth_standard_ratings/' + youthStandardRatingId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل تقييم معيار شبابي',
                            html: `
                                <label for="rate">التقييم:</label>
                                <input type="text" id="rate" class="swal2-input" value="${data.rate}">
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const rate = Swal.getPopup().querySelector('#rate').value;
                                if (!rate) {
                                    Swal.showValidationMessage(`الرجاء إدخال التقييم`);
                                }
                                return { rate: rate };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/youth_standard_ratings/' + youthStandardRatingId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        rate: result.value.rate,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل التقييم بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل التقييم.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var youthStandardRatingId = $(this).data('id');
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
                            url: '/youth_standard_ratings/' + youthStandardRatingId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف التقييم بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف التقييم.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف التقييم.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
