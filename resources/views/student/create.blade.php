@extends('layouts.app')

@section('content')
<div class="container">
    <h1>{{ isset($student) ? 'تحديث معلومات الطالب' : 'إضافة طالب جديد' }}</h1>

    <form action="{{ isset($student) ? route('students.update', $student) : route('students.store') }}" method="POST">
        @csrf
        @if (isset($student))
            @method('PUT')
        @endif

        <div class="row mb-3">
            <div class="col-12">
                <h2>المعلومات الشخصية</h2>
            </div>
            <div class="col-md-6">
                <label for="name_ar">الاسم باللغة العربية:</label>
                <input type="text" id="name_ar" name="name_ar" class="form-control" value="{{ isset($student) ? $student->name_ar : '' }}" required>
            </div>

            <div class="col-md-6">
                <label for="name_en">الاسم باللغة الانجليزية:</label>
                <input type="text" id="name_en" name="name_en" class="form-control" value="{{ isset($student) ? $student->name_en : '' }}" required>
            </div>

            <div class="col-md-6">
                <label for="email">البريد الإلكتروني:</label>
                <input type="email" id="email" name="email" class="form-control" value="{{ isset($student) ? $student->email : '' }}" required>
            </div>

            <div class="col-md-6">
                <label for="password">كلمة المرور:</label>
                <input type="password" id="password" name="password" class="form-control" {{ isset($student) ? '' : 'required' }}>
            </div>

            <div class="col-md-6">
                <label for="birthdate">تاريخ الميلاد:</label>
                <input type="date" id="birthdate" name="birthdate" class="form-control" value="{{ isset($student) ? $student->birthdate : '' }}" required>
            </div>

            <div class="col-md-6">
                <label for="gender">الجنس:</label>
                <select id="gender" name="gender" class="form-control" required>
                    <option value="male" {{ isset($student) && $student->gender == 'male' ? 'selected' : '' }}>ذكر</option>
                    <option value="female" {{ isset($student) && $student->gender == 'female' ? 'selected' : '' }}>أنثى</option>
                </select>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-12">
                <h2>معلومات الطالب</h2>
            </div>
            <div class="col-md-6">
                <label for="national_id">الرقم الوطني:</label>
                <input type="text" id="national_id" name="national_id" class="form-control" value="{{ isset($student) ? $student->national_id : '' }}" required>
            </div>

            <div class="col-md-6">
                <label for="passport_id">رقم جواز السفر:</label>
                <input type="text" id="passport_id" name="passport_id" class="form-control" value="{{ isset($student) ? $student->passport_id : '' }}" required>
            </div>

            <div class="col-md-6">
                <label for="phone">رقم الهاتف:</label>
                <input type="text" id="phone" name="phone" class="form-control" value="{{ isset($student) ? $student->phone : '' }}" required>
            </div>

            <div class="col-md-6">
                <label for="mobile">رقم الموبايل:</label>
                <input type="text" id="mobile" name="mobile" class="form-control" value="{{ isset($student) ? $student->mobile : '' }}" required>
            </div>

            <div class="col-md-6">
                <label for="father_id">الأب:</label>
                <select id="father_id" name="father_id" class="form-control" required>
                    <option value="">اختر الأب...</option>
                    @foreach ($fathers as $father)
                        <option value="{{ $father->id }}" {{ isset($student) && $student->father_id == $father->id ? 'selected' : '' }}>{{ $father->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-6">
                <label for="mother_id">الأم:</label>
                <select id="mother_id" name="mother_id" class="form-control" required>
                    <option value="">اختر الأم...</option>
                    @if (isset($student))
                        @foreach ($mothers as $mother)
                            <option value="{{ $mother->id }}" {{ $student->mother_id == $mother->id ? 'selected' : '' }}>{{ $mother->name }}</option>
                        @endforeach
                    @endif
                </select>
            </div>

            <div class="col-md-6">
                <label for="record_place">مكان القيد:</label>
                <input type="text" id="record_place" name="record_place" class="form-control" value="{{ isset($student) ? $student->record_place : '' }}" required>
            </div>

            <div class="col-md-6">
                <label for="record_id">رقم القيد:</label>
                <input type="text" id="record_id" name="record_id" class="form-control" value="{{ isset($student) ? $student->record_id : '' }}" required>
            </div>
        </div>

        <div class="row mb-3">
            <h2>معلومات إضافية</h2>

            <div class="col-md-4">
                <label for="nationality_id">الجنسية:</label>
                <select id="nationality_id" name="nationality_id" class="form-control" required>
                    @foreach ($nationalities as $nationality)
                        <option value="{{ $nationality->id }}" {{ isset($student) && $student->nationality_id == $nationality->id ? 'selected' : '' }}>{{ $nationality->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-4">
                <label for="blood_type_id">فصيلة الدم:</label>
                <select id="blood_type_id" name="blood_type_id" class="form-control" required>
                    @foreach ($bloodTypes as $bloodType)
                        <option value="{{ $bloodType->id }}" {{ isset($student) && $student->blood_type_id == $bloodType->id ? 'selected' : '' }}>{{ $bloodType->type }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-4">
                <label for="religion_id">الديانة:</label>
                <select id="religion_id" name="religion_id" class="form-control" required>
                    @foreach ($religions as $religion)
                        <option value="{{ $religion->id }}" {{ isset($student) && $student->religion_id == $religion->id ? 'selected' : '' }}>{{ $religion->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">{{ isset($student) ? 'تحديث' : 'إضافة' }}</button>
    </form>
</div>

<script>
    document.getElementById('father_id').addEventListener('change', function () {
        var fatherId = this.value;
        var motherSelect = document.getElementById('mother_id');

        // Clear previous options
        motherSelect.innerHTML = '<option value="">اختر الأم...</option>';

        if (fatherId) {
            fetch('{{ route('students.getMothers') }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({ father_id: fatherId })
            })
            .then(response => response.json())
            .then(data => {
                data.forEach(function (mother) {
                    var option = document.createElement('option');
                    option.value = mother.id;
                    option.textContent = mother.name;
                    motherSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error:', error));
        }
    });
</script>
@endsection
