@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <div class="page-title">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4 class="mb-0 d-inline-block">قائمة المعلمين</h4>
                <a class="btn btn-primary d-inline-block" href="{{ url('/teachers/create') }}">إضافة معلم</a>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                    <li class="breadcrumb-item active">قائمة المعلمين</li>
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
                                <th>اسم المعلم</th>
                                <th>اسم المستخدم</th>
                                <th>الجنس</th>
                                <th>تاريخ التعيين</th>
                                <th>العمل الوظيفي</th>
                                <th>الإجراءات</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($teachers as $index => $teacher)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ $teacher->name_ar }}</td>
                                    <td>{{ $teacher->email }}</td>
                                    <td>{{ $teacher->gender_id == 5 ? 'ذكر' : 'أنثى' }}</td>
                                    <td>{{ $teacher->joining_date }}</td>
                                    <td>{{ $teacher->specialization_id == 10 ? 'إدارة' : ($teacher->specialization_id == 11 ? 'تدريس' : 'خدمات') }}</td>
                                    <td>
                                        <a href="{{ route('teachers.edit', $teacher->id) }}" class="btn btn-primary"><i class="fa fa-edit"></i></a>
                                        <button class="btn btn-danger delete-button" data-id="{{ $teacher->id }}"><i class="fa fa-trash"></i></button>
                                        <a href="{{ url('job_sequences/'.$teacher->id) }}" class="btn btn-info"><i class="fa fa-info-circle"></i></a>
                                        <a href="{{ url('rewards_punishments/'.$teacher->id) }}" class="btn btn-warning"><i class="fa fa-certificate"></i></a>
                                        <a href="{{ url('courses/'.$teacher->id) }}" class="btn btn-success"><i class="fa fa-check"></i></a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-center">
                        {!! $teachers->links() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $('.delete-button').on('click', function() {
        var teacherId = $(this).data('id');
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
                    url: '/teachers/' + teacherId +"/delete",
                    type: 'POST',
                    data: {
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        if (response.success) {
                            Swal.fire(
                                'تم الحذف!',
                                'تم حذف المعلم بنجاح.',
                                'success'
                            ).then(() => {
                                location.reload();
                            });
                        } else {
                            Swal.fire(
                                'خطأ!',
                                'حدث خطأ أثناء حذف المعلم.',
                                'error'
                            );
                        }
                    },
                    error: function(response) {
                        Swal.fire(
                            'خطأ!',
                            'حدث خطأ أثناء حذف المعلم.',
                            'error'
                        );
                    }
                });
            }
        });
    });
});
</script>
@endsection
