@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <div class="page-title">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4 class="mb-0 d-inline-block">تسجيل الحضور اليومي</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                    <li class="breadcrumb-item active">تسجيل الحضور اليومي</li>
                </ol>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 mb-30">
            <div class="card card-statistics h-100">
                <div class="card-body">
                    <form id="filterForm">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="school_year">السنة الدراسية:</label>
                                <select id="school_year" name="school_year" class="form-control">
                                    <option value="">اختر السنة الدراسية</option>
                                    @foreach($schoolYears as $schoolYear)
                                        <option value="{{ $schoolYear->id }}" {{ $loop->first ? 'selected' : '' }}>{{ $schoolYear->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="class_school_year">الصف:</label>
                                <select id="class_school_year" name="class_school_year" class="form-control">
                                    <option value="">اختر الصف</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="section">الشعبة:</label>
                                <select id="section" name="section" class="form-control">
                                    <option value="">اختر الشعبة</option>
                                </select>
                            </div>
                        </div>
                    </form>

                    <table class="table table-striped mt-3" id="verifiedStudentsTable">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>اسم الطالب</th>
                                <th>الحضور</th>
                                <th>نوع الغياب</th>
                            </tr>
                        </thead>
                        <tbody id="verifiedStudentsTableBody">
                            <!-- Verified students will be loaded here via AJAX -->
                        </tbody>
                    </table>
                    <button id="submitAllButton" class="btn btn-primary">حفظ جميع الحضور</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        function loadClassSchoolYears() {
            var schoolYearId = $('#school_year').val();
            if (schoolYearId) {
                $.ajax({
                    url: '{{ route('get.class_school_years') }}',
                    method: 'POST',
                    data: {
                        _token: '{{ csrf_token() }}',
                        school_year_id: schoolYearId
                    },
                    success: function(response) {
                        $('#class_school_year').empty().append('<option value="">اختر الصف</option>');
                        $('#section').empty().append('<option value="">اختر الشعبة</option>');
                        $.each(response, function(index, classSchoolYear) {
                            $('#class_school_year').append('<option value="' + classSchoolYear.id + '">' + classSchoolYear.name + '</option>');
                        });
                    }
                });
            } else {
                $('#class_school_year').empty().append('<option value="">اختر الصف</option>');
                $('#section').empty().append('<option value="">اختر الشعبة</option>');
            }
        }

        function loadSections() {
            var classSchoolYearId = $('#class_school_year').val();
            if (classSchoolYearId) {
                $.ajax({
                    url: '{{ route('get.sections') }}',
                    method: 'POST',
                    data: {
                        _token: '{{ csrf_token() }}',
                        class_school_year_id: classSchoolYearId
                    },
                    success: function(response) {
                        $('#section').empty().append('<option value="">اختر الشعبة</option>');
                        $.each(response, function(index, section) {
                            $('#section').append('<option value="' + section.id + '">' + section.name + '</option>');
                        });
                    }
                });
            } else {
                $('#section').empty().append('<option value="">اختر الشعبة</option>');
            }
        }

        function loadVerifiedStudents() {
            var sectionId = $('#section').val();
            if (sectionId) {
                $.ajax({
                    url: '{{ route('get.verified_students') }}',
                    method: 'POST',
                    data: {
                        _token: '{{ csrf_token() }}',
                        section_id: sectionId
                    },
                    success: function(response) {
                        $('#verifiedStudentsTableBody').empty();
                        $.each(response, function(index, student) {
                            var row = '<tr>' +
                                '<td>' + (index + 1) + '</td>' +
                                '<td>' + student.student.name_ar + '</td>' +
                                '<td>' +
                                    '<label><input type="radio" name="attendance_' + student.id + '" value="1" checked> حضور</label>' +
                                    '<label><input type="radio" name="attendance_' + student.id + '" value="2" ' + (student.attendances.length > 0 && student.attendances[0].absence_id ? 'checked' : '') + '> غياب مبرر</label>' +
                                    '<label><input type="radio" name="attendance_' + student.id + '" value="3" ' + (student.attendances.length > 0 && student.attendances[0].absence_id === null && student.attendances[0].is_present === false ? 'checked' : '') + '> غياب غير مبرر</label>' +
                                '</td>' +
                                '<td>' +
                                    '<select class="form-control absence-select" data-student-id="' + student.id + '" style="display:' + (student.attendances.length > 0 && student.attendances[0].absence_id ? 'block' : 'none') + '">' +
                                        @foreach($absences as $absence)
                                            '<option value="{{ $absence->id }}" ' + (student.attendances.length > 0 && student.attendances[0].absence_id == {{ $absence->id }} ? 'selected' : '') + '>{{ $absence->name }}</option>' +
                                        @endforeach
                                    '</select>' +
                                '</td>' +
                            '</tr>';
                            $('#verifiedStudentsTableBody').append(row);
                        });
                    }
                });
            }
        }

        $('#school_year').on('change', function() {
            loadClassSchoolYears();
        });

        $('#class_school_year').on('change', function() {
            loadSections();
        });

        $('#section').on('change', function() {
            loadVerifiedStudents();
        });

        $(document).on('click', 'input[name^="attendance_"]', function() {
            var studentId = $(this).attr('name').split('_')[1];
            if ($(this).val() == '2') { // غياب مبرر
                $('.absence-select[data-student-id="' + studentId + '"]').show();
                $('.absence-select[data-student-id="' + studentId + '"]').val($('.absence-select[data-student-id="' + studentId + '"] option:first').val());
            } else {
                $('.absence-select[data-student-id="' + studentId + '"]').hide();
                $('.absence-select[data-student-id="' + studentId + '"]').val('');
            }
        });

        $('#submitAllButton').on('click', function() {
            var attendanceData = [];
            $('#verifiedStudentsTableBody tr').each(function() {
                var studentId = $(this).find('input[name^="attendance_"]').attr('name').split('_')[1];
                var isPresent = $('input[name="attendance_' + studentId + '"]:checked').val();
                var absenceId = isPresent == '2' ? $('.absence-select[data-student-id="' + studentId + '"]').val() : null;
                var date = new Date().toISOString().split('T')[0]; // current date

                attendanceData.push({
                    verified_student_id: studentId,
                    date: date,
                    is_present: isPresent == '1', // Convert to boolean
                    absence_id: isPresent == '2' ? absenceId : null
                });
            });

            $.ajax({
                url: '{{ route('attendances.storeAll') }}',
                method: 'POST',
                data: {
                    _token: '{{ csrf_token() }}',
                    attendance_data: attendanceData
                },
                success: function(response) {
                    if (response.success) {
                        Swal.fire('تم الحفظ!', 'تم حفظ الحضور بنجاح.', 'success');
                    } else {
                        Swal.fire('خطأ!', 'حدث خطأ أثناء حفظ الحضور.', 'error');
                    }
                }
            });
        });

        // Automatically trigger the initial load
        loadClassSchoolYears();
    });
</script>
@endsection
