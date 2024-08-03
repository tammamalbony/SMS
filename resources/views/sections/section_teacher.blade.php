@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <div class="page-title">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4 class="mb-0 d-inline-block">إدارة المعلمين للشعبة: {{ $section->name }}</h4>
                <button class="btn btn-primary d-inline-block" id="addTeacher">إضافة</button>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                    <li class="breadcrumb-item active">إدارة المعلمين للشعبة</li>
                </ol>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 mb-30">
            <div class="card card-statistics h-100">
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>اسم المعلم</th>
                                <th>ملاحظة</th>
                                <th>المادة</th>
                                <th>العمليات</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($sectionTeachers as $index => $sectionTeacher)
                            <tr>
                                <td>{{ $index + 1 }}</td>
                                <td>{{ $sectionTeacher->teacher->name_ar }}</td>
                                <td>{{ $sectionTeacher->note }}</td>
                                <td>{{ $sectionTeacher->yearClassSubject->subjectDetail->subject->name_ar  }}</td>
                                <td>
                                    <button class="btn btn-primary edit-button" data-id="{{ $sectionTeacher->id }}" data-note="{{ $sectionTeacher->note }}" data-subject-detail-id="{{ $sectionTeacher->year_class_subject_id }}"><i class="fa fa-edit"></i></button>
                                    <button class="btn btn-danger delete-button" data-id="{{ $sectionTeacher->id }}"><i class="fa fa-trash"></i></button>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    {{-- <div class="d-flex justify-content-center">
                        {!! $section->teachers->links() !!}
                    </div> --}}
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#addTeacher').on('click', function() {
            Swal.fire({
                title: 'إضافة معلم',
                html: `
                    <label for="teacher_id">اختر المعلم:</label>
                    <select id="teacher_id" class="swal2-input">
                        @foreach($teachers as $teacher)
                            <option value="{{ $teacher->id }}">{{ $teacher->name_ar }}</option>
                        @endforeach
                    </select>
                    <label for="note">ملاحظة:</label>
                    <textarea id="note" class="swal2-input" placeholder="أضف ملاحظة"></textarea>
                    <label for="subject_detail_id">اختر المادة:</label>
                    <select id="subject_detail_id" class="swal2-input">
                        @foreach($yearClassSubject as $subjectDetail)
                            <option value="{{ $subjectDetail->id }}">{{ $subjectDetail->subjectDetail->subject->name_ar }}</option>
                        @endforeach
                    </select>
                `,
                confirmButtonText: 'حفظ البيانات',
                showCancelButton: true,
                cancelButtonText: 'إلغاء',
                preConfirm: () => {
                    const teacher_id = Swal.getPopup().querySelector('#teacher_id').value;
                    const note = Swal.getPopup().querySelector('#note').value;
                    const subject_detail_id = Swal.getPopup().querySelector('#subject_detail_id').value;
                    if (!teacher_id || !subject_detail_id) {
                        Swal.showValidationMessage(`الرجاء اختيار معلم المادة`);
                    }
                    return { teacher_id: teacher_id, note: note, subject_detail_id: subject_detail_id };
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '{{ route('section_teacher.store', $section->id) }}',
                        method: 'POST',
                        data: {
                            _token: '{{ csrf_token() }}',
                            teacher_id: result.value.teacher_id,
                            note: result.value.note,
                            subject_detail_id: result.value.subject_detail_id,
                        },
                        success: function(response) {
                            if (response.success) {
                                Swal.fire('تم الإضافة!', 'تم إضافة المعلم بنجاح.', 'success').then(() => {
                                    location.reload();
                                });
                            } else {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة المعلم.', 'error');
                            }
                        }
                    });
                }
            });
        });

        $('.edit-button').on('click', function() {
            var sectionTeacherId = $(this).data('id');
            var note = $(this).data('note');
            var subjectDetailId = $(this).data('subject-detail-id');
            console.log("sectionTeacherId : " +sectionTeacherId);
            console.log("note : " +note);
            console.log("subjectDetailId : " +subjectDetailId);
            Swal.fire({
                title: 'تعديل ملاحظة المعلم',
                html: `
                    <label for="note">ملاحظة:</label>
                    <textarea id="note" class="swal2-input">${note}</textarea>
                    <label for="subject_detail_id">اختر المادة:</label>
                    <select id="subject_detail_id" class="swal2-input">
                        @foreach($yearClassSubject as $subjectDetail)
                            <option value="{{ $subjectDetail->id }}" ${ {{ $subjectDetail->id }} == subjectDetailId ? 'selected' : ''}>{{ $subjectDetail->subjectDetail->subject->name_ar  }}</option>
                        @endforeach
                    </select>
                `,
                confirmButtonText: 'حفظ البيانات',
                showCancelButton: true,
                cancelButtonText: 'إلغاء',
                preConfirm: () => {
                    const note = Swal.getPopup().querySelector('#note').value;
                    const subject_detail_id = Swal.getPopup().querySelector('#subject_detail_id').value;
                    return { note: note, subject_detail_id: subject_detail_id };
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '/sections/{{ $section->id }}/teachers/' + sectionTeacherId,
                        method: 'PUT',
                        data: {
                            _token: '{{ csrf_token() }}',
                            note: result.value.note,
                            subject_detail_id: result.value.subject_detail_id,
                        },
                        success: function(response) {
                            if (response.success) {
                                Swal.fire('تم التعديل!', 'تم تعديل ملاحظة المعلم بنجاح.', 'success').then(() => {
                                    location.reload();
                                });
                            } else {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل ملاحظة المعلم.', 'error');
                            }
                        }
                    });
                }
            });
        });

        $('.delete-button').on('click', function() {
            var sectionTeacherId = $(this).data('id');
            Swal.fire({
                title: 'هل أنت متأكد?',
                text: "لن تتمكن من التراجع عن هذا!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'نعم, احذفه!',
                cancelButtonText: 'إلغاء'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '/sections/{{ $section->id }}/teachers/' + sectionTeacherId,
                        type: 'DELETE',
                        data: {
                            _token: '{{ csrf_token() }}'
                        },
                        success: function(response) {
                            if (response.success) {
                                Swal.fire('تم الحذف!', 'تم حذف المعلم بنجاح.', 'success').then(() => {
                                    location.reload();
                                });
                            } else {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المعلم.', 'error');
                            }
                        },
                        error: function(response) {
                            Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المعلم.', 'error');
                        }
                    });
                }
            });
        });
    });
</script>
@endsection
