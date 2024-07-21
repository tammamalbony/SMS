@extends('layouts.app')

@section('content')
    <h1>Exam Results for {{ $verifiedStudent->student->name_ar }}</h1>

    <div class="row">
        @foreach ($exams as $exam)
            <div class="exam-result col-6 ">
                <h2>{{ $exam->term->name }}</h2>
                @foreach ($yearClassSubjects as $yearClassSubject)
                    @php
                        $examResult = $exam->getExamResult(
                            $yearClassSubject->id,
                            $yearClassSubject->c_s_y->school_year_id,
                            $exam->id,
                            $verifiedStudent->id,
                        );
                    @endphp

                    <h6>
                        {{ $yearClassSubject->subjectDetail->subject->name_ar }} :
                    </h6>

                    @if ($examResult)
                        <form action="{{ route('exam_results.update', $examResult->id) }}" method="POST">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="exam_id" value="{{ $examResult->exam_id }}">
                            <input type="hidden" name="subject_detail_id" value="{{ $examResult->subject_detail_id }}">
                            <input type="hidden" name="class_id" value="{{ $examResult->class_id }}">
                            <input type="hidden" name="verified_student_id" value="{{ $examResult->verified_student_id }}">
                            <input type="hidden" id="max_grade_{{ $examResult->id }}" name="max_grade"
                                value="{{ $examResult->max_grade }}" required>
                            <input type="hidden" id="failing_grade_{{ $examResult->id }}" name="failing_grade"
                                value="{{ $examResult->failing_grade }}" required>
                            <input type="hidden" id="subject_is_failing_{{ $examResult->id }}" name="subject_is_failing"
                                value="1">

                            <div class="form-group">
                                <label for="value_{{ $examResult->id }}">
                                    {{ __('Value (القيمة)') }}
                                    @if ($examResult->subject_is_failing)
                                        *
                                    @endif
                                    ({{ __('Max:') }} {{ $examResult->max_grade }}, {{ __('Min:') }}
                                    {{ $examResult->failing_grade }})
                                </label>
                                @if ($examResult->islocked)
                                    <p class="form-control-static">{{ $examResult->value }}</p>
                                @else
                                    <input type="number" id="value_{{ $examResult->id }}" name="value" step="0.01"
                                        class="form-control" value="{{ $examResult->value }}" required>
                                    <div class="invalid-feedback" id="value-error_{{ $examResult->id }}"
                                        style="display:none;">
                                        {{ __('Value must be between 0 and') }} {{ $examResult->max_grade }}
                                    </div>
                                @endif
                            </div>

                            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                    <input type="hidden" id="islocked_hidden_{{ $examResult->id }}" name="islocked"
                                        value="0">
                                    <input type="checkbox" id="islocked_{{ $examResult->id }}" name="islocked"
                                        value="1" class="custom-switch-input"
                                        {{ $examResult->islocked ? 'checked' : '' }}
                                        {{ $examResult->islocked ? 'disabled' : '' }}>
                                    <span class="custom-switch-indicator"></span>
                                    <label class="custom-switch-description mb-0 cursor-pointer"
                                        for="islocked_{{ $examResult->id }}">{{ __('Locked (مغلق)') }}</label>
                                </label>
                            </div>

                            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                    <input type="hidden" id="isverfied_hidden_{{ $examResult->id }}" name="isverfied"
                                        value="0">
                                    <input type="checkbox" id="isverfied_{{ $examResult->id }}" name="isverfied"
                                        value="1" class="custom-switch-input"
                                        {{ $examResult->isverfied ? 'checked' : '' }}
                                        {{ $examResult->islocked ? 'disabled' : '' }}>
                                    <span class="custom-switch-indicator"></span>
                                    <label class="custom-switch-description mb-0 cursor-pointer"
                                        for="isverfied_{{ $examResult->id }}">{{ __('Verified (تم التحقق)') }}</label>
                                </label>
                            </div>

                            @if (!$examResult->islocked)
                                <button type="submit" class="btn btn-warning mt-3">{{ __('Update (تحديث)') }}</button>
                            @endif
                        </form>

                        @if (!$examResult->islocked)
                            <script>
                                document.getElementById('value_{{ $examResult->id }}').addEventListener('input', function() {
                                    const value = parseFloat(this.value);
                                    const maxGrade = parseFloat(document.getElementById('max_grade_{{ $examResult->id }}').value);
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
                        <form method="POST" action="{{ route('exam_results.store') }}">
                            @csrf
                            <input type="hidden" name="exam_id" value="{{ $exam->id }}">
                            <input type="hidden" name="class_id" value="{{ $yearClassSubject->c_s_y->id }}">
                            <input type="hidden" name="subject_detail_id" value="{{ $yearClassSubject->id }}">
                            <input type="hidden" name="verified_student_id" value="{{ $verifiedStudent->id }}">
                            <input type="hidden" id="max_grade_{{ $exam->id }}" name="max_grade"
                                value="{{ $yearClassSubject->subjectDetail->max_grade }}" required>
                            <input type="hidden" id="failing_grade_{{ $exam->id }}" name="failing_grade"
                                value="{{ $yearClassSubject->subjectDetail->failing_grade }}" required>
                            <input type="hidden" id="subject_is_failing_{{ $exam->id }}" name="subject_is_failing"
                                value="{{ $yearClassSubject->subjectDetail->is_failing ? 1 : 0 }}">

                            <div class="form-group">
                                <label for="value_{{ $exam->id }}">
                                    {{ __('Value (القيمة)') }}
                                    @if ($yearClassSubject->subjectDetail->is_failing)
                                        *
                                    @endif
                                    ({{ __('Max:') }} {{ $yearClassSubject->subjectDetail->max_grade }},
                                    {{ __('Min:') }} {{ $yearClassSubject->subjectDetail->failing_grade }})
                                </label>
                                <input type="number" id="value_{{ $exam->id }}" name="value" step="0.01"
                                    class="form-control" required>
                                <div class="invalid-feedback" id="value-error_{{ $exam->id }}"
                                    style="display:none;">
                                    {{ __('Value must be between 0 and') }}
                                    {{ $yearClassSubject->subjectDetail->max_grade }}
                                </div>
                            </div>

                            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                    <input type="hidden" id="islocked_hidden_{{ $exam->id }}" name="islocked"
                                        value="0">
                                    <input type="checkbox" id="islocked_{{ $exam->id }}" name="islocked"
                                        value="1" class="custom-switch-input">
                                    <span class="custom-switch-indicator"></span>
                                    <label class="custom-switch-description mb-0 cursor-pointer"
                                        for="islocked_{{ $exam->id }}">{{ __('Locked (مغلق)') }}</label>
                                </label>
                            </div>

                            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                    <input type="hidden" id="isverfied_hidden_{{ $exam->id }}" name="isverfied"
                                        value="0">
                                    <input type="checkbox" id="isverfied_{{ $exam->id }}" name="isverfied"
                                        value="1" class="custom-switch-input">
                                    <span class="custom-switch-indicator"></span>
                                    <label class="custom-switch-description mb-0 cursor-pointer"
                                        for="isverfied_{{ $exam->id }}">{{ __('Verified (تم التحقق)') }}</label>
                                </label>
                            </div>

                            <button type="submit" class="btn btn-primary mt-3">{{ __('Submit (إرسال)') }}</button>
                        </form>

                        <script>
                            document.getElementById('value_{{ $exam->id }}').addEventListener('input', function() {
                                const value = parseFloat(this.value);
                                const maxGrade = parseFloat(document.getElementById('max_grade_{{ $exam->id }}').value);
                                const errorSpan = document.getElementById('value-error_{{ $exam->id }}');

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
                @endforeach
            </div>
        @endforeach
    </div>
@endsection
