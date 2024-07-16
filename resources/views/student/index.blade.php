@extends('layouts.app')

@section('content')
<div class="container">
    <h1>الطلاب</h1>
    <a href="{{ route('students.create') }}" class="btn btn-success mb-3">إضافة طالب جديد</a>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>المعرف</th>
                <th>الاسم الأول</th>
                <th>الاسم الأخير</th>
                <th>الجنس</th>
                <th>الأب</th>
                <th>الأم</th>
                <th>الإجراءات</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($students as $student)
                <tr>
                    <td>{{ $student->id }}</td>
                    <td>{{ $student->first_name }}</td>
                    <td>{{ $student->last_name }}</td>
                    <td>{{ $student->gender == 'male' ? 'ذكر' : 'أنثى' }}</td>
                    <td>{{ $student->father->name }}</td>
                    <td>{{ $student->mother->name }}</td>
                    <td>
                        <a href="{{ route('students.edit', $student) }}" class="btn btn-primary">تعديل</a>
                        <form action="{{ route('students.destroy', $student) }}" method="POST" style="display:inline-block;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger">حذف</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
