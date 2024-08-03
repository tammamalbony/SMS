@extends('layouts.app')

@section('content')
    <h1> نتائج الطالب : {{ $verifiedStudent->student->name_ar }}</h1>
    <h2>الصف : {{ $verifiedStudent->section->classsSchoolYear->classs->class_name_ar }} </h2>
    <h3>السنة : {{ $verifiedStudent->section->classsSchoolYear->schoolYear->name }} </h3>
    <div class="container-fluid ">
        @foreach ($yearClassSubjects as $yearClassSubject)
            @if(!isset($yearClassSubject->subjectDetail))
                {{-- @dd($yearClassSubject->subject_detail_id) --}}
            @elseif (isset($yearClassSubject->subjectDetail))
                <div class="row card shadow-sm">
                    <div class="col-12 d-flex justify-content-center align-items-center order-1 bg-course">
                        <h5>
                            {{-- @dd( $yearClassSubject->subjectDetail->subject) --}}
                            {{ $yearClassSubject->subjectDetail->subject->name_ar }} :
                        </h5>
                        <h5 class="mx-2">
                            {{-- {{ __('(العلامة)') }} --}}
                            @if ($yearClassSubject->subjectDetail->is_failing)
                                * <div class="text-danger text-sm"> المادة مرسبة لوحدها</div>
                            @endif
                            ({{ __('الدرجة العظمة:') }}
                            {{ $yearClassSubject->subjectDetail->max_grade }},
                            {{ __('حد الرسوب:') }}
                            {{ $yearClassSubject->subjectDetail->failing_grade }})
                        </h5>
                    </div>
                </div>
                <div class="row mb-5 ">
                    @foreach ($terms as $term)
                        <div class="col-6 order-4 py-2 card shadow-sm card-cutom mx-0">
                            <div class="row ">
                                <h6 class="col-6  order-1 ">
                                    {{ $term->name }} :
                                </h6>
                                @php $total = 0 @endphp
                                @foreach ($yearClassSubject->partsInputs as $part)
                                    @if ($part->term_id == null || $part->term_id == $term->id)
                                    @endif
                                    @php
                                        $examResult = $part->getExamResult(
                                            $yearClassSubject->id,
                                            $yearClassSubject->c_s_y->id,
                                            $part->id,
                                            $verifiedStudent->id,
                                        );

                                    @endphp
                                    <div class="col-6 order-4 card shadow-sm card-cutom ">
                                        <h5>
                                            {{ $part->name }} :
                                        </h5>
                                        @if ($examResult)
                                            @php  $total = $total + $examResult->failing_grade @endphp
                                            <form action="{{ route('exam_results.update', $examResult->id) }}"
                                                class="@if ($examResult->failing_grade == 0) border-danger @endif"
                                                method="POST">
                                                @csrf
                                                @method('PUT')
                                                <input type="hidden" name="part_id" value="{{ $examResult->part_id }}">
                                                <input type="hidden" name="subject_detail_id"
                                                    value="{{ $examResult->subject_detail_id }}">
                                                <input type="hidden" name="class_id" value="{{ $examResult->class_id }}">
                                                <input type="hidden" name="verified_student_id"
                                                    value="{{ $examResult->verified_student_id }}">
                                                <input type="hidden" id="max_grade_{{ $examResult->id }}" name="max_grade"
                                                    value="{{ $examResult->max_grade }}" required>
                                                <input type="hidden" id="failing_grade_{{ $examResult->id }}"
                                                    name="failing_grade" value="{{ $examResult->failing_grade }}" required>
                                                <input type="hidden" id="subject_is_failing_{{ $examResult->id }}"
                                                    name="subject_is_failing" value="1">
                                                <div class="form-group">
                                                    <label for="value_{{ $examResult->id }}">
                                                        {{ __('القيمة العظمى :') }}
                                                        {{ $part->max_per_cent }}% =>
                                                        {{-- {{ $examResult->max_grade }} *
                                                        {{ $part->max_per_cent }}/ 100 = --}}
                                                        {{ ($examResult->max_grade * $part->max_per_cent) / 100 }}درجة
                                                    </label>
                                                    @if ($examResult->islocked)
                                                        <p class="form-control-static">{{ $examResult->value }}</p>
                                                    @else
                                                        <input type="number" id="value_{{ $examResult->id }}"
                                                            name="value" step="0.01" class="form-control"
                                                            value="{{ $examResult->value }}" required>
                                                        <div class="invalid-feedback"
                                                            id="value-error_{{ $examResult->id }}" style="display:none;">
                                                            {{ __('Value must be between 0 and') }}
                                                            {{ $examResult->failing_grade }}
                                                        </div>
                                                    @endif
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                                        <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                                            <input type="hidden"
                                                                id="islocked_hidden_{{ $examResult->id }}" name="islocked"
                                                                value="0">
                                                            <input type="checkbox" id="islocked_{{ $examResult->id }}"
                                                                name="islocked" value="1" class="custom-switch-input"
                                                                {{ $examResult->islocked ? 'checked' : '' }}
                                                                {{ $examResult->islocked ? 'disabled' : '' }}>
                                                            <span class="custom-switch-indicator"></span>
                                                            <label class="custom-switch-description mb-0 cursor-pointer"
                                                                for="islocked_{{ $examResult->id }}">{{ __('(مغلق)') }}</label>
                                                        </label>
                                                    </div>

                                                    <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                                        <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                                            <input type="hidden"
                                                                id="isverfied_hidden_{{ $examResult->id }}"
                                                                name="isverfied" value="0">
                                                            <input type="checkbox" id="isverfied_{{ $examResult->id }}"
                                                                name="isverfied" value="1" class="custom-switch-input"
                                                                {{ $examResult->isverfied ? 'checked' : '' }}
                                                                {{ $examResult->islocked ? 'disabled' : '' }}>
                                                            <span class="custom-switch-indicator"></span>
                                                            <label class="custom-switch-description mb-0 cursor-pointer"
                                                                for="isverfied_{{ $examResult->id }}">{{ __('(تم التحقق)') }}</label>
                                                        </label>
                                                    </div>
                                                </div>
                                                @if (!$examResult->islocked)
                                                    <button type="submit"
                                                        class="btn btn-warning mt-3">{{ __('(تحديث)') }}</button>
                                                @endif
                                            </form>

                                            @if (!$examResult->islocked)
                                                <script>
                                                    document.getElementById('value_{{ $examResult->id }}').addEventListener('input', function() {
                                                        const value = parseFloat(this.value);
                                                        const maxGrade = parseFloat(document.getElementById('failing_grade_{{ $examResult->id }}').value);
                                                        const errorSpan = document.getElementById('value-error_{{ $examResult->id }}');

                                                        if (value > maxGrade || value < 0) {
                                                            errorSpan.style.display = 'block';
                                                            this.classList.add('is-invalid');
                                                        } else {
                                                            errorSpan.style.display = 'none';
                                                            this.classList.remove('is-invalid');
                                                        }
                                                    });
                                                </script>
                                            @endif
                                        @else
                                            @php  $total = $total + $part->max_per_cent @endphp
                                            @php $max  =  ($yearClassSubject->subjectDetail->max_grade * $part->max_per_cent) / 100 @endphp
                                            <form method="POST" action="{{ route('exam_results.store') }}"
                                                class="@if ($part->max_per_cent == 0) border-danger-custom @endif">
                                                @csrf
                                                <input type="hidden" name="part_id" value="{{ $part->id }}">
                                                <input type="hidden" name="class_id"
                                                    value="{{ $yearClassSubject->c_s_y->id }}">
                                                <input type="hidden" name="subject_detail_id"
                                                    value="{{ $yearClassSubject->id }}">
                                                <input type="hidden" name="verified_student_id"
                                                    value="{{ $verifiedStudent->id }}">
                                                <input type="hidden" id="max_grade_{{ $part->id }}" name="max_grade"
                                                    value="{{ $max }}"
                                                    required>
                                                <input type="hidden" id="failing_grade_{{ $part->id }}"
                                                    name="failing_grade" value="{{ $part->max_per_cent }}" required>
                                                <input type="hidden" id="subject_is_failing_{{ $part->id }}"
                                                    name="subject_is_failing"
                                                    value="{{ $yearClassSubject->subjectDetail->is_failing ? 1 : 0 }}">

                                                <div class="form-group">
                                                    <label for="value_{{ $part->id }}">
                                                        {{ __('القيمة العظمى :') }}
                                                        {{ $part->max_per_cent }}% =>
                                                        {{-- {{ $yearClassSubject->subjectDetail->max_grade }} *
                                                        {{ $part->max_per_cent }}/ 100 = --}}
                                                        {{ $max }}
                                                        درجة
                                                    </label>
                                                    <input type="number" id="value_{{ $part->id }}" name="value"
                                                        step="0.01" class="form-control" required>
                                                    <div class="invalid-feedback" id="value-error_{{ $part->id }}"
                                                        style="display:none;">
                                                        {{ __('Value must be between 0 and') }}
                                                        {{ $max }}
                                                    </div>
                                                </div>
                                                {{-- <div class="form-group">
                                                    <label for="short_name_{{ $part->id }}">{{ __('(اسم مختصر)') }}</label>
                                                    <input type="text" id="short_name_{{ $part->id }}" name="short_name" class="form-control"
                                                        required>
                                                </div> --}}
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                                        <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                                            <input type="hidden"
                                                                id="islocked_hidden_{{ $part->id }}" name="islocked"
                                                                value="0">
                                                            <input type="checkbox" id="islocked_{{ $part->id }}"
                                                                name="islocked" value="1"
                                                                class="custom-switch-input">
                                                            <span class="custom-switch-indicator"></span>
                                                            <label class="custom-switch-description mb-0 cursor-pointer"
                                                                for="islocked_{{ $part->id }}">{{ __('(مغلق)') }}</label>
                                                        </label>
                                                    </div>

                                                    <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                                        <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                                            <input type="hidden"
                                                                id="isverfied_hidden_{{ $part->id }}"
                                                                name="isverfied" value="0">
                                                            <input type="checkbox" id="isverfied_{{ $part->id }}"
                                                                name="isverfied" value="1"
                                                                class="custom-switch-input">
                                                            <span class="custom-switch-indicator"></span>
                                                            <label class="custom-switch-description mb-0 cursor-pointer"
                                                                for="isverfied_{{ $part->id }}">{{ __('(تم التحقق)') }}</label>
                                                        </label>
                                                    </div>

                                                </div>

                                                <button type="submit"
                                                    class="btn btn-primary mt-3">{{ __('(حفظ)') }}</button>
                                            </form>

                                            <script>
                                                document.getElementById('value_{{ $part->id }}').addEventListener('input', function() {
                                                    const value = parseFloat(this.value);
                                                    const maxGrade = parseFloat(document.getElementById('max_grade_{{ $part->id }}').value);
                                                    const errorSpan = document.getElementById('value-error_{{ $part->id }}');

                                                    if (value > maxGrade || value < 0) {
                                                        errorSpan.style.display = 'block';
                                                        this.classList.add('is-invalid');
                                                    } else {
                                                        errorSpan.style.display = 'none';
                                                        this.classList.remove('is-invalid');
                                                    }
                                                });
                                            </script>
                                        @endif
                                    </div>
                                @endforeach

                                <h6 class="col-6 order-2">
                                    <div class="text-primary">
                                        الإجمالي : {{ $total }} %
                                    </div>

                                    @if ($total > 100)
                                        <div class="text-danger">
                                            مجموع نسب درجات الأجزاء للفصل الواحد يجب ألا يتجاوز 100
                                        </div>
                                    @elseif($total < 100)
                                        <div class="text-warning">
                                            مجموع نسب درجات الأجزاء للفصل الواحد يجب أن يكون مساوٍ 100
                                        </div>
                                    @endif
                                </h6>

                            </div>

                        </div>
                    @endforeach
                </div>
            @endif
        @endforeach
    </div>
@endsection
