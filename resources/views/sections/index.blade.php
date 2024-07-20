@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">الشعب : {{ $classsYear->schoolYear->name }}</h4>
                    <button class="btn btn-primary d-inline-block" id="addSection"
                        data-classsSchoolYear="{{ $classsYear->id }}">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">الشعب</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mb-30">
                <div class="card card-statistics h-100">
                    <div class="card-body">
                        @if (session('success'))
                            <div class="alert alert-success">{{ session('success') }}</div>
                        @endif
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>الاسم</th>
                                    <th>نوع الشعبة</th>
                                    <th>السنة الدراسية</th>
                                    <th>المعلم</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($sections as $index => $section)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $section->name }}</td>
                                        <td>{{ $section->sectionType->name }}</td>
                                        <td>{{ $section->classsSchoolYear->SchoolYear->name }}</td>
                                        <td>{{ $section->teacher->name_ar }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button" data-id="{{ $section->id }}"
                                                data-url="{{ route('sections.edit', ['classsSchoolYear' => $section->classs_school_year_id, 'section' => $section->id]) }}"
                                                data-updates="/year-class-subject/{{ $section->classs_school_year_id }}/sections/{{ $section->id }}/update/">
                                                <i class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button" data-id="{{ $section->id }}"
                                                data-url="/year-class-subject/{{ $section->classs_school_year_id }}/sections/{{ $section->id }}/delete/"><i
                                                    class="fa fa-trash"></i></button>
                                            <button class="btn btn-info verified-students-button"
                                                data-id="{{ $section->id }}"
                                                data-url="{{ route('sections.verified-students', ['section' => $section->id]) }}">
                                                <i class="fa fa-users"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $sections->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('.verified-students-button').on('click', function() {
                var sectionId = $(this).data('id');
                var url = $(this).data('url');
                window.location.href = url;
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            $('#addSection').on('click', function() {
                const classsSchoolYear = this.getAttribute('data-classsSchoolYear');
                Swal.fire({
                    title: 'إضافة قسم',
                    html: `
                        <label for="name">اسم الشعبة:</label>
                        <input type="text" id="name" class="swal2-input" placeholder="اسم الشعبة">
                        <label for="section_type_id">نوع الشعبة:</label>
                        <select id="section_type_id" class="swal2-input">
                            <option value="">اختر نوع الشعبة</option>
                            @foreach ($sectionTypes as $sectionType)
                                <option value="{{ $sectionType->id }}">{{ $sectionType->name }}</option>
                            @endforeach
                        </select>
                        <label for="classs_school_year_id">السنة الدراسية:</label>
                        <select id="classs_school_year_id" class="swal2-input">
                            <option value="">اختر السنة الدراسية</option>
                                <option value="{{ $classsYear->id }}" selected>{{ $classsYear->schoolYear->name }}</option>
                        </select>
                        <label for="teacher_id">المعلم:</label>
                        <select id="teacher_id" class="swal2-input">
                            <option value="">اختر المعلم</option>
                            @foreach ($teachers as $teacher)
                                <option value="{{ $teacher->id }}">{{ $teacher->name_ar }}</option>
                            @endforeach
                        </select>
                    `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const name = Swal.getPopup().querySelector('#name').value;
                        const section_type_id = Swal.getPopup().querySelector(
                            '#section_type_id').value;
                        const classs_school_year_id = Swal.getPopup().querySelector(
                            '#classs_school_year_id').value;
                        const teacher_id = Swal.getPopup().querySelector('#teacher_id').value;
                        if (!name || !section_type_id || !classs_school_year_id || !
                            teacher_id) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                        }
                        return {
                            name: name,
                            section_type_id: section_type_id,
                            classs_school_year_id: classs_school_year_id,
                            teacher_id: teacher_id
                        };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: `{{ route('sections.store', ['classsSchoolYear' => ':classsSchoolYear']) }}`
                                .replace(':classsSchoolYear', classsSchoolYear),
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                name: result.value.name,
                                section_type_id: result.value.section_type_id,
                                classs_school_year_id: result.value.classs_school_year_id,
                                teacher_id: result.value.teacher_id,
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!', 'تم إضافة الشعبة بنجاح.',
                                        'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة الشعبة.',
                                        'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var sectionId = $(this).data('id');
                var editUrl = $(this).data('url');
                var updateUrl = $(this).data('updates');
                $.ajax({
                    url: editUrl,
                    method: 'GET',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل قسم',
                            html: `
                                <label for="name">اسم الشعبة:</label>
                                <input type="text" id="name" class="swal2-input" value="${data.section.name}">
                                <label for="section_type_id">نوع الشعبة:</label>
                                <select id="section_type_id" class="swal2-input">
                                    @foreach ($sectionTypes as $sectionType)
                                        <option value="{{ $sectionType->id }}" ${data.section_type_id == {{ $sectionType->id }} ? 'selected' : ''}>{{ $sectionType->name }}</option>
                                    @endforeach
                                </select>
                                <label for="classs_school_year_id">السنة الدراسية:</label>
                                <select id="classs_school_year_id" class="swal2-input">
                                        <option value="{{ $classsYear->id }}" selected>{{ $classsYear->schoolYear->name }}</option>
                                </select>
                                <label for="teacher_id">المعلم:</label>
                                <select id="teacher_id" class="swal2-input">
                                    @foreach ($teachers as $teacher)
                                        <option value="{{ $teacher->id }}" ${data.teacher_id == {{ $teacher->id }} ? 'selected' : ''}>{{ $teacher->name_ar }}</option>
                                    @endforeach
                                </select>
                            `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const name = Swal.getPopup().querySelector('#name')
                                    .value;
                                const section_type_id = Swal.getPopup()
                                    .querySelector('#section_type_id').value;
                                const classs_school_year_id = Swal.getPopup()
                                    .querySelector('#classs_school_year_id').value;
                                const teacher_id = Swal.getPopup().querySelector(
                                    '#teacher_id').value;
                                if (!name || !section_type_id || !
                                    classs_school_year_id || !teacher_id) {
                                    Swal.showValidationMessage(
                                        `الرجاء إدخال جميع الحقول`);
                                }
                                return {
                                    name: name,
                                    section_type_id: section_type_id,
                                    classs_school_year_id: classs_school_year_id,
                                    teacher_id: teacher_id
                                };
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: updateUrl,
                                    method: 'PUT',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        name: result.value.name,
                                        section_type_id: result.value
                                            .section_type_id,
                                        classs_school_year_id: result.value
                                            .classs_school_year_id,
                                        teacher_id: result.value.teacher_id,
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!',
                                                'تم تعديل الشعبة بنجاح.',
                                                'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!',
                                                'حدث خطأ أثناء تعديل الشعبة.',
                                                'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var sectionId = $(this).data('id');
                var deleteUrl = $(this).data('url');

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
                            url: deleteUrl,
                            type: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الحذف!', 'تم حذف الشعبة بنجاح.',
                                        'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الشعبة.',
                                        'error');
                                }
                            },
                            error: function(response) {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف الشعبة.', 'error');
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
