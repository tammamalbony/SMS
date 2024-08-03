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
                        <a href="{{ route('students.edit', $student) }}" class="btn btn-primary" title="تعديل الطالب">
                            <i class="fas fa-edit"></i>
                        </a>
                        <form action="{{ route('students.destroy', $student) }}" method="POST" style="display:inline-block;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger" title="حذف الطالب">
                                <i class="fas fa-trash"></i>
                            </button>
                        </form>
                        <a href="{{ route('students.additional_details.index', $student) }}" class="btn btn-info" title="تفاصيل إضافية عن الطالب">
                            <i class="fas fa-info-circle"></i>
                        </a>
                        <a href="{{ route('documents.index', ['type' => 'student', 'id' => $student->id]) }}" class="btn btn-secondary" title="مستندات الطالب">
                            <i class="fas fa-file-alt"></i>
                        </a>
                        <a href="{{ route('documents.index', ['type' => 'father', 'id' => $student->father->id]) }}" class="btn btn-secondary" title="مستندات الأب">
                            <i class="fas fa-user-tie"></i>
                        </a>
                        <a href="{{ route('documents.index', ['type' => 'mother', 'id' => $student->mother->id]) }}" class="btn btn-secondary" title="مستندات الأم">
                            <i class="fas fa-female"></i>
                        </a>
                        @if (!$student->hasVerified())
                            <button class="btn btn-success" onclick="showVerifyModal({{ $student->id }})" title="تثبيت التسجيل">
                                <i class="fas fa-check-circle"></i>
                            </button>
                        @endif
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
    {{ $students->links() }}
</div>

<script>
    function showVerifyModal(studentId) {
        Swal.fire({
            title: 'تأكيد التسجيل',
            html: `
               <form id="verify-form-${studentId}" method="POST" action="{{ url('/students') }}/${studentId}/verify">
                    @csrf
                    <div class="form-group">
                        <label for="school_year-${studentId}">السنة الدراسية:</label>
                        <select id="school_year-${studentId}" name="school_year" class="form-control" onchange="loadClassSchoolYears(${studentId})">
                            <option value="">اختر السنة الدراسية</option>
                            @foreach($schoolYears as $schoolYear)
                                <option value="{{ $schoolYear->id }}" {{ $loop->first ? 'selected' : '' }}>{{ $schoolYear->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="class_school_year-${studentId}">الصف:</label>
                        <select id="class_school_year-${studentId}" name="class_school_year" class="form-control" onchange="loadSections(${studentId})">
                            <option value="">اختر الصف</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="section-${studentId}">الشعبة:</label>
                        <select id="section-${studentId}" name="section" class="form-control">
                            <option value="">اختر الشعبة</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="language-${studentId}">اللغة:</label>
                        <select id="language-${studentId}" name="language" class="form-control">
                            <option value="">اختر اللغة</option>
                            @foreach($languages as $language)
                                <option value="{{ $language->id }}">{{ $language->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="general_record-${studentId}">السجل العام:</label>
                        <input type="text" class="form-control" id="general_record-${studentId}" name="general_record">
                    </div>
                    <div class="form-group">
                        <label for="confirm_register_date-${studentId}">تاريخ تأكيد التسجيل:</label>
                        <input type="date" class="form-control" id="confirm_register_date-${studentId}" name="confirm_register_date">
                    </div>
                </form>
            `,
            showCancelButton: true,
            confirmButtonText: 'تأكيد',
            cancelButtonText: 'إلغاء',
            preConfirm: () => {
                document.getElementById(`verify-form-${studentId}`).submit();
            }
        });

        loadClassSchoolYears(studentId);
    }

    function loadClassSchoolYears(studentId) {
        var schoolYearId = $(`#school_year-${studentId}`).val();
        if (schoolYearId) {
            $.ajax({
                url: '{{ route('get.class_school_years') }}',
                method: 'POST',
                data: {
                    _token: '{{ csrf_token() }}',
                    school_year_id: schoolYearId
                },
                success: function(response) {
                    $(`#class_school_year-${studentId}`).empty().append('<option value="">اختر الصف</option>');
                    $(`#section-${studentId}`).empty().append('<option value="">اختر الشعبة</option>');
                    $.each(response, function(index, classSchoolYear) {
                        $(`#class_school_year-${studentId}`).append('<option value="' + classSchoolYear.id + '">' + classSchoolYear.name + '</option>');
                    });
                }
            });
        } else {
            $(`#class_school_year-${studentId}`).empty().append('<option value="">اختر الصف</option>');
            $(`#section-${studentId}`).empty().append('<option value="">اختر الشعبة</option>');
        }
    }

    function loadSections(studentId) {
        var classSchoolYearId = $(`#class_school_year-${studentId}`).val();
        if (classSchoolYearId) {
            $.ajax({
                url: '{{ route('get.sections') }}',
                method: 'POST',
                data: {
                    _token: '{{ csrf_token() }}',
                    class_school_year_id: classSchoolYearId
                },
                success: function(response) {
                    $(`#section-${studentId}`).empty().append('<option value="">اختر الشعبة</option>');
                    $.each(response, function(index, section) {
                        $(`#section-${studentId}`).append('<option value="' + section.id + '">' + section.name + '</option>');
                    });
                }
            });
        } else {
            $(`#section-${studentId}`).empty().append('<option value="">اختر الشعبة</option>');
        }
    }
</script>
@endsection
