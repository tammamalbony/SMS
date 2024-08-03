{{-- resources/views/student/exam_result_form.blade.php --}}
@php
    $examResult = $part->getExamResult(
        $yearClassSubject->id,
        $yearClassSubject->c_s_y->id,
        $part->id,
        $verifiedStudent->id,
    );
@endphp

<h6>{{ $yearClassSubject->subjectDetail->subject->name_ar }} :</h6>
@if ($examResult)
    <form action="{{ route('exam_results.update', $examResult->id) }}" method="POST">
        @csrf
        @method('PUT')
        <input type="hidden" name="part_id" value="{{ $examResult->part_id }}">
        <input type="hidden" name="subject_detail_id" value="{{ $examResult->subject_detail_id }}">
        <input type="hidden" name="class_id" value="{{ $examResult->class_id }}">
        <input type="hidden" name="verified_student_id" value="{{ $examResult->verified_student_id }}">
        <input type="hidden" id="max_grade_{{ $examResult->id }}" name="max_grade" value="{{ $examResult->max_grade }}" required>
        <input type="hidden" id="failing_grade_{{ $examResult->id }}" name="failing_grade" value="{{ $examResult->failing_grade }}" required>
        <input type="hidden" id="subject_is_failing_{{ $examResult->id }}" name="subject_is_failing" value="1">

        <div class="form-group">
            <label for="value_{{ $examResult->id }}">
                @if ($examResult->subject_is_failing) * @endif
                ({{ __('الحد الأقصى:') }} {{ $examResult->max_grade }}, {{ __('حد الرسوب:') }} {{ $examResult->failing_grade }})
            </label>
            @if ($examResult->islocked)
                <p class="form-control-static">{{ $examResult->value }}</p>
            @else
                <input type="number" id="value_{{ $examResult->id }}" name="value" step="0.01" class="form-control" value="{{ $examResult->value }}" required>
                <div class="invalid-feedback" id="value-error_{{ $examResult->id }}" style="display:none;">
                    {{ __('Value must be between 0 and') }} {{ $examResult->max_grade }}
                </div>
            @endif
        </div>

        <div class="d-flex justify-content-between align-items-center">
            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                    <input type="hidden" id="islocked_hidden_{{ $examResult->id }}" name="islocked" value="0">
                    <input type="checkbox" id="islocked_{{ $examResult->id }}" name="islocked" value="1" class="custom-switch-input" {{ $examResult->islocked ? 'checked' : '' }} {{ $examResult->islocked ? 'disabled' : '' }}>
                    <span class="custom-switch-indicator"></span>
                    <label class="custom-switch-description mb-0 cursor-pointer" for="islocked_{{ $examResult->id }}">{{ __('(مغلق)') }}</label>
                </label>
            </div>

            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                    <input type="hidden" id="isverfied_hidden_{{ $examResult->id }}" name="isverfied" value="0">
                    <input type="checkbox" id="isverfied_{{ $examResult->id }}" name="isverfied" value="1" class="custom-switch-input" {{ $examResult->isverfied ? 'checked' : '' }} {{ $examResult->islocked ? 'disabled' : '' }}>
                    <span class="custom-switch-indicator"></span>
                    <label class="custom-switch-description mb-0 cursor-pointer" for="isverfied_{{ $examResult->id }}">{{ __('Verified (تم التحقق)') }}</label>
                </label>
            </div>
        </div>
        @if (!$examResult->islocked)
            <button type="submit" class="btn btn-warning mt-3">{{ __('(تحديث)') }}</button>
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
        <input type="hidden" name="part_id" value="{{ $part->id }}">
        <input type="hidden" name="class_id" value="{{ $yearClassSubject->c_s_y->id }}">
        <input type="hidden" name="subject_detail_id" value="{{ $yearClassSubject->id }}">
        <input type="hidden" name="verified_student_id" value="{{ $verifiedStudent->id }}">
        <input type="hidden" id="max_grade_{{ $part->id }}" name="max_grade" value="{{ $yearClassSubject->subjectDetail->max_grade }}" required>
        <input type="hidden" id="failing_grade_{{ $part->id }}" name="failing_grade" value="{{ $yearClassSubject->subjectDetail->failing_grade }}" required>
        <input type="hidden" id="subject_is_failing_{{ $part->id }}" name="subject_is_failing" value="{{ $yearClassSubject->subjectDetail->is_failing ? 1 : 0 }}">

        <div class="form-group">
            <label for="value_{{ $part->id }}">
                @if ($yearClassSubject->subjectDetail->is_failing) * @endif
                ({{ __('الحد الأقصى:') }} {{ $yearClassSubject->subjectDetail->max_grade }}, {{ __('حد الرسوب:') }} {{ $yearClassSubject->subjectDetail->failing_grade }})
            </label>
            <input type="number" id="value_{{ $part->id }}" name="value" step="0.01" class="form-control" required>
            <div class="invalid-feedback" id="value-error_{{ $part->id }}" style="display:none;">
                {{ __('Value must be between 0 and') }} {{ $yearClassSubject->subjectDetail->max_grade }}
            </div>
        </div>

        <div class="d-flex justify-content-between align-items-center">
            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                    <input type="hidden" id="islocked_hidden_{{ $part->id }}" name="islocked" value="0">
                    <input type="checkbox" id="islocked_{{ $part->id }}" name="islocked" value="1" class="custom-switch-input">
                    <span class="custom-switch-indicator"></span>
                    <label class="custom-switch-description mb-0 cursor-pointer" for="islocked_{{ $part->id }}">{{ __('(مغلق)') }}</label>
                </label>
            </div>

            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                    <input type="hidden" id="isverfied_hidden_{{ $part->id }}" name="isverfied" value="0">
                    <input type="checkbox" id="isverfied_{{ $part->id }}" name="isverfied" value="1" class="custom-switch-input">
                    <span class="custom-switch-indicator"></span>
                    <label class="custom-switch-description mb-0 cursor-pointer" for="isverfied_{{ $part->id }}">{{ __('(تم التحقق)') }}</label>
                </label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary mt-3">{{ __('(حفظ)') }}</button>
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
