@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">تغييرات أفراد العائلة</h4>
                    <button class="btn btn-primary d-inline-block" id="addFamilyMembersChange">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">تغييرات أفراد العائلة</li>
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
                                    <th>الملاحظات</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($familyMembersChanges as $index => $familyMembersChange)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $familyMembersChange->name }}</td>
                                        <td>{{ $familyMembersChange->note }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $familyMembersChange->id }}"><i
                                                    class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $familyMembersChange->id }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $familyMembersChanges->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('#addFamilyMembersChange').on('click', function() {
                Swal.fire({
                    title: 'إضافة تغيير فرد عائلة',
                    html: `
                        <label for="name">الاسم:</label>
                        <input type="text" id="name" class="swal2-input" placeholder="الاسم">
                        <label for="note">الملاحظات:</label>
                        <textarea id="note" class="swal2-input" placeholder="الملاحظات"></textarea>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const name = Swal.getPopup().querySelector('#name').value;
                        const note = Swal.getPopup().querySelector('#note').value;
                        if (!name) {
                            Swal.showValidationMessage(`الرجاء إدخال الاسم`);
                        }
                        return { name: name, note: note };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('family_members_changes.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                name: result.value.name,
                                note: result.value.note,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة تغيير فرد العائلة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة تغيير فرد العائلة.', 'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var familyMembersChangeId = $(this).data('id');
                $.ajax({
                    url: '/family_members_changes/' + familyMembersChangeId + '/edit',
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل تغيير فرد عائلة',
                            html: `
                                <label for="name">الاسم:</label>
                                <input type="text" id="name" class="swal2-input" value="${data.name}">
                                <label for="note">الملاحظات:</label>
                                <textarea id="note" class="swal2-input">${data.note}</textarea>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const name = Swal.getPopup().querySelector('#name').value;
                                const note = Swal.getPopup().querySelector('#note').value;
                                if (!name) {
                                    Swal.showValidationMessage(`الرجاء إدخال الاسم`);
                                }
                                return { name: name, note: note };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/family_members_changes/' + familyMembersChangeId,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        name: result.value.name,
                                        note: result.value.note,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!', 'تم تعديل تغيير فرد العائلة بنجاح.', 'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل تغيير فرد العائلة.', 'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var familyMembersChangeId = $(this).data('id');
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
                            url: '/family_members_changes/' + familyMembersChangeId,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف تغيير فرد العائلة بنجاح.', 'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف تغيير فرد العائلة.', 'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف تغيير فرد العائلة.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
