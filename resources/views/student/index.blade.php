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
                        <a href="{{ route('students.edit', $student) }}" class="btn btn-primary">   <i class="fas fa-edit"></i></a>
                        <form action="{{ route('students.destroy', $student) }}" method="POST" style="display:inline-block;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger">   <i class="fas fa-trash"></i></button>
                        </form>
                        <a href="{{ route('students.additional_details.index', $student) }}" class="btn btn-info">
                            <i class="fas fa-info-circle"></i>
                        </a>
                        <a href="{{ route('documents.index', ['type' => 'student', 'id' => $student->id]) }}" class="btn btn-secondary">
                            <i class="fas fa-file-alt"></i>
                        </a>
                        <a href="{{ route('documents.index', ['type' => 'father', 'id' => $student->father->id]) }}" class="btn btn-secondary" title="مستندات الأب">
                            <i class="fas fa-user-tie"></i>
                        </a>
                        <a href="{{ route('documents.index', ['type' => 'wife', 'id' => $student->mother->id]) }}" class="btn btn-secondary" title="مستندات الأم">
                            <i class="fas fa-female"></i>
                        </a>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
