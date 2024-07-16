@extends('layouts.app')

@section('content')
<div class="container">
    <h1>{{ isset($father) ? 'تعديل بيانات الأب' : 'إضافة أب جديد' }}</h1>
    <form action="{{ isset($father) ? route('fathers.update', $father->id) : route('fathers.store') }}" method="POST">
        @csrf
        @if(isset($father))
            @method('PUT')
        @endif
        <div class="form-row">
            <div class="col">
                <label for="email">البريد الإلكتروني</label>
                <input type="email" name="email" class="form-control" value="{{ old('email', $father->email ?? '') }}" required>
            </div>
            <div class="col">
                <label for="password">كلمة المرور</label>
                <input type="password" name="password" class="form-control" {{ isset($father) ? '' : 'required' }}>
            </div>
        </div>
        <br>
        <div class="form-row">
            <div class="col">
                <label for="name">اسم الأب باللغة العربية</label>
                <input type="text" name="name" class="form-control" value="{{ old('name', $father->name ?? '') }}" required>
            </div>
            <div class="col">
                <label for="name_en">اسم الأب باللغة الانجليزية</label>
                <input type="text" name="name_en" class="form-control" value="{{ old('name_en', $father->name_en ?? '') }}" required>
            </div>
            <div class="col">
                <label for="last_name">الكنية</label>
                <input type="text" name="last_name" class="form-control" value="{{ old('last_name', $father->last_name ?? '') }}" required>
            </div>
        </div>
        <br>
        <div class="form-row">
            <div class="col">
                <label for="job">اسم الوظيفة باللغة العربية</label>
                <input type="text" name="job" class="form-control" value="{{ old('job', $father->job ?? '') }}" required>
            </div>
            <div class="col">
                <label for="job_en">اسم الوظيفة باللغة الانجليزية</label>
                <input type="text" name="job_en" class="form-control" value="{{ old('job_en', $father->job_en ?? '') }}" required>
            </div>
        </div>
        <br>
        <div class="form-row">
            <div class="col">
                <label for="national_id">رقم الهوية</label>
                <input type="text" name="national_id" class="form-control" value="{{ old('national_id', $father->national_id ?? '') }}" required>
            </div>
            <div class="col">
                <label for="passport_id">رقم جواز السفر</label>
                <input type="text" name="passport_id" class="form-control" value="{{ old('passport_id', $father->passport_id ?? '') }}" required>
            </div>
            <div class="col">
                <label for="phone">رقم الهاتف</label>
                <input type="text" name="phone" class="form-control" value="{{ old('phone', $father->phone ?? '') }}" required>
            </div>
        </div>
        <br>
        <div class="form-row">
            <div class="col">
                <label for="nationality_id">الجنسية</label>
                <select class="custom-select" name="nationality_id" required>
                    <option selected disabled>اختيار من القائمة...</option>
                    @foreach($nationalities as $nationality)
                        <option value="{{ $nationality->id }}" {{ old('nationality_id', $father->nationality_id ?? '') == $nationality->id ? 'selected' : '' }}>
                            {{ $nationality->name }}
                        </option>
                    @endforeach
                </select>
            </div>
            <div class="col">
                <label for="blood_type_id">فصيلة الدم</label>
                <select class="custom-select" name="blood_type_id" required>
                    <option selected disabled>اختيار من القائمة...</option>
                    @foreach($bloodTypes as $bloodType)
                        <option value="{{ $bloodType->id }}" {{ old('blood_type_id', $father->blood_type_id ?? '') == $bloodType->id ? 'selected' : '' }}>
                            {{ $bloodType->type }}
                        </option>
                    @endforeach
                </select>
            </div>
            <div class="col">
                <label for="religion_id">الديانة</label>
                <select class="custom-select" name="religion_id" required>
                    <option selected disabled>اختيار من القائمة...</option>
                    @foreach($religions as $religion)
                        <option value="{{ $religion->id }}" {{ old('religion_id', $father->religion_id ?? '') == $religion->id ? 'selected' : '' }}>
                            {{ $religion->name }}
                        </option>
                    @endforeach
                </select>
            </div>
        </div>
        <br>
        <div class="form-group">
            <label for="address">عنوان الأب</label>
            <textarea class="form-control" name="address" rows="4" required>{{ old('address', $father->address ?? '') }}</textarea>
        </div>
        <br>
        <button type="submit" class="btn btn-success">{{ isset($father) ? 'تحديث' : 'حفظ' }}</button>
    </form>
</div>
@endsection
