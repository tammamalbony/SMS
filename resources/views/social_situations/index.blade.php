@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">الأوضاع الاجتماعية</h4>
                    <button class="btn btn-primary d-inline-block" id="addSocialSituation">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">الأوضاع الاجتماعية</li>
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
                                    <th>الوضع</th>
                                    <th>الملاحظات</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($socialSituations as $index => $socialSituation)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $socialSituation->situation }}</td>
                                        <td>{{ $socialSituation->note }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $socialSituation->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $socialSituation->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $socialSituations->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addSocialSituation').on('click', function() {
                Swal.fire({
                    title: 'إضافة وضع اجتماعي',
                    html: `
                        <label for="situation">الوضع:</label>
                        <input type="text" id="situation" class="swal2-input" placeholder="الوضع">
                        <label for="note">الملاحظات:</label>
                        <textarea id="note" class="swal2-input" placeholder="الملاحظات"></textarea>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const situation = Swal.getPopup().querySelector('#situation').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!situation) {
                            Swal.showValidationMessage(`الرجاء إدخال الوضع`);
                        }
                        return { situation: situation, note: note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('social_situations.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                situation: result.value.situation,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة الوضع الاجتماعي بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة الوضع الاجتماعي.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var socialSituationId = $(this).data('id');
                $.ajax({
                    url: '/social_situations/' + socialSituationId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل وضع اجتماعي',
                            html: `
                                <label for="situation">الوضع:</label>
                                <input type="text" id="situation" class="swal2-input" value="${data.situation}">
                                <label for="note">الملاحظات:</label>
                                <textarea id="note" class="swal2-input">${data.note}</textarea>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const situation = Swal.getPopup().querySelector('#situation').value;
                                const note = Swal.getPopup().querySelector('#note').value;
                                if (!situation) {
                                    Swal.showValidationMessage(`الرجاء إدخال الوضع`);
                                }
                                return { situation: situation, note: note };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/social_situations/' + socialSituationId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        situation: result.value.situation,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل الوضع الاجتماعي بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل الوضع الاجتماعي.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var socialSituationId = $(this).data('id');
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
                            url: '/social_situations/' + socialSituationId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف الوضع الاجتماعي بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الوضع الاجتماعي.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الوضع الاجتماعي.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
