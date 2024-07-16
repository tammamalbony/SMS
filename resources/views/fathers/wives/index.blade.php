@extends('layouts.app')

@section('content')
<div class="container">
    <h1>زوجات الأب: {{ $father->name }}</h1>
    <a href="{{ route('fathers.wives.create', $father->id) }}" class="btn btn-primary mb-3">إضافة زوجة جديدة</a>
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>الرقم</th>
                <th>الاسم</th>
                <th>الإجراءات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($wives as $wife)
            <tr>
                <td>{{ $wife->id }}</td>
                <td>{{ $wife->name }}</td>
                <td>
                    <a href="{{ route('fathers.wives.edit', [$father->id, $wife->id]) }}" class="btn btn-warning">تعديل</a>
                    <form action="{{ route('fathers.wives.destroy', [$father->id, $wife->id]) }}" method="POST" style="display:inline;">
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
