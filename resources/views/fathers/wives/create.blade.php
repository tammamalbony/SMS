@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h1> {{ isset($wife) ? 'تعديل بيانات الزوجة' : 'إضافة زوجة جديدة' }}</h1>
            <h2>زوجات الأب: {{ $father->name }}</h2>
        </div>
        <form
            action="{{ isset($wife) ? route('fathers.wives.update', [$father->id, $wife->id]) : route('fathers.wives.store', $father->id) }}"
            method="POST">
            @csrf
            @if (isset($wife))
                @method('PUT')
            @endif
            <div class="form-row">
                <div class="col">
                    <label for="name">اسم الزوجة باللغة العربية</label>
                    <input type="text" name="name" class="form-control" value="{{ old('name', $wife->name ?? '') }}"
                        required>
                </div>
                <div class="col">
                    <label for="name_en">اسم الزوجة باللغة الانجليزية</label>
                    <input type="text" name="name_en" class="form-control"
                        value="{{ old('name_en', $wife->name_en ?? '') }}" required>
                </div>
            </div>
            <br>
            <div class="form-row">
                <div class="col">
                    <label for="job">اسم الوظيفة باللغة العربية</label>
                    <input type="text" name="job" class="form-control" value="{{ old('job', $wife->job ?? '') }}"
                        required>
                </div>
                <div class="col">
                    <label for="job_en">اسم الوظيفة باللغة الانجليزية</label>
                    <input type="text" name="job_en" class="form-control"
                        value="{{ old('job_en', $wife->job_en ?? '') }}" required>
                </div>
            </div>
            <br>
            <div class="form-row">
                <div class="col">
                    <label for="national_id">رقم الهوية</label>
                    <input type="text" name="national_id" class="form-control"
                        value="{{ old('national_id', $wife->national_id ?? '') }}" required>
                </div>
                <div class="col">
                    <label for="passport_id">رقم جواز السفر</label>
                    <input type="text" name="passport_id" class="form-control"
                        value="{{ old('passport_id', $wife->passport_id ?? '') }}" required>
                </div>
                <div class="col">
                    <label for="phone">رقم الهاتف</label>
                    <input type="text" name="phone" class="form-control" value="{{ old('phone', $wife->phone ?? '') }}"
                        required>
                </div>
            </div>
            <br>
            <div class="form-row">
                <div class="col">
                    <label for="nationality_id">الجنسية</label>
                    <select class="custom-select" name="nationality_id" required>
                        <option selected disabled>اختيار من القائمة...</option>
                        @foreach ($nationalities as $nationality)
                            <option value="{{ $nationality->id }}"
                                {{ old('nationality_id', $wife->nationality_id ?? '') == $nationality->id ? 'selected' : '' }}>
                                {{ $nationality->name }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <div class="col">
                    <label for="blood_type_id">فصيلة الدم</label>
                    <select class="custom-select" name="blood_type_id" required>
                        <option selected disabled>اختيار من القائمة...</option>
                        @foreach ($bloodTypes as $bloodType)
                            <option value="{{ $bloodType->id }}"
                                {{ old('blood_type_id', $wife->blood_type_id ?? '') == $bloodType->id ? 'selected' : '' }}>
                                {{ $bloodType->type }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <div class="col">
                    <label for="religion_id">الديانة</label>
                    <select class="custom-select" name="religion_id" required>
                        <option selected disabled>اختيار من القائمة...</option>
                        @foreach ($religions as $religion)
                            <option value="{{ $religion->id }}"
                                {{ old('religion_id', $wife->religion_id ?? '') == $religion->id ? 'selected' : '' }}>
                                {{ $religion->name }}
                            </option>
                        @endforeach
                    </select>
                </div>
            </div>
            <br>
            <button type="submit" class="btn btn-success">{{ isset($wife) ? 'تحديث' : 'حفظ' }}</button>
        </form>
    </div>
@endsection
