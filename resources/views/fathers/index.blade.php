@extends('layouts.app')

@section('content')
<div class="container">
    <h1>الآباء</h1>
    <a href="{{ route('fathers.create') }}" class="btn btn-primary mb-3">إضافة أب جديد</a>
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>الرقم</th>
                <th>البريد الإلكتروني</th>
                <th>الاسم</th>
                <th>الإجراءات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($fathers as $father)
            <tr>
                <td>{{ $father->id }}</td>
                <td>{{ $father->email }}</td>
                <td>{{ $father->name }}</td>
                <td>
                    <a href="{{ route('fathers.edit', $father->id) }}" class="btn btn-warning">تعديل</a>
                    <button onclick="deleteFather({{ $father->id }})" class="btn btn-danger">حذف</button>
                    @if(isset($father))
                    <a href="{{ route('fathers.wives.index', $father->id) }}" class="btn btn-primary">إدارة الزوجات</a>
                @endif
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
<script>
function deleteFather(id) {
    Swal.fire({
        title: 'هل أنت متأكد؟',
        text: "لا يمكن التراجع عن هذا الإجراء!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'نعم، احذفها!',
        cancelButtonText: 'إلغاء'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: `fathers/${id}`,
                type: "DELETE",
                data: {
                    "_token": "{{ csrf_token() }}"
                },
                success: function(response) {
                    window.location.reload();
                },
                error: function(xhr) {
                    Swal.fire({
                        icon: 'error',
                        title: 'خطأ',
                        text: 'حدث خطأ أثناء حذف الأب'
                    });
                }
            });
        }
    });
}
</script>
@endsection
