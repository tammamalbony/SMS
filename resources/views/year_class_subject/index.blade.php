@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>قائمة المواد: {{ $classsSchoolYear->schoolYear->name }}</h1>
        <h2>
            الصف : {{ $classsSchoolYear->classs->class_name_ar }}
        </h2>
        @if ($hasnew == true)
            <button id="addNew" class="btn btn-success mb-3">إضافة مادة جديدة</button>
        @endif
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>تفاصيل المادة</th>
                    <th>الترتيب</th>
                    <th>المادة مرسبة</th>
                    <th>مادة اختيارية أجنبية</th>
                    <th>اللغة الأجنبية</th>
                    <th>إجراءات</th>
                </tr>
            </thead>
            <tbody id="sortable-list" class="draggable-content-lists">
                @foreach ($yearClassSubjects as $yearClassSubject)
                    <tr id="yearClassSubject-{{ $yearClassSubject->id }}" data-id="{{ $yearClassSubject->id }}">
                        <td>{{ $yearClassSubject->id }}</td>
                        <td>{{ $yearClassSubject->subjectDetail->subject->name_ar }}</td>
                        <td>{{ $yearClassSubject->order }}</td>
                        <td>{{ $yearClassSubject->is_falling }}</td>
                        <td>{{ $yearClassSubject->is_optional_foreign_subject ? 'نعم' : 'لا' }}</td>
                        <td>{{ $yearClassSubject->foreignLanguage ? $yearClassSubject->foreignLanguage->name : '-' }}</td>
                        <td>
                            <button class="btn btn-primary editButton" data-id="{{ $yearClassSubject->id }}"
                                data-subject="{{ $yearClassSubject->subject_detail_id }}"
                                data-isfalling="{{ $yearClassSubject->is_falling }}"
                                data-isoptionalforeign="{{ $yearClassSubject->is_optional_foreign_subject }}"
                                data-foreignlanguage="{{ $yearClassSubject->foreign_language_id }}">تعديل</button>
                            <button class="btn btn-danger"
                                onclick="deleteYearClassSubject({{ $yearClassSubject->id }})">حذف</button>
                            <form id="delete-form-{{ $yearClassSubject->id }}"
                                action="{{ url('school-years/' . $classsSchoolYear->id . '/year_class_subjects/' . $yearClassSubject->id . '/delete') }}"
                                method="POST" style="display: none;">
                                @csrf
                                @method('POST')
                            </form>
                            <a href="{{ url('parts?year_class_subject_id=' . $yearClassSubject->id) }}"
                                class="btn btn-info">عرض الأجزاء</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', (event) => {
            let sortable = new Sortable(document.getElementById('sortable-list'), {
                animation: 150,
                onEnd: function(evt) {
                    let order = [];
                    document.querySelectorAll('#sortable-list tr').forEach((row, index) => {
                        order.push({
                            id: row.getAttribute('data-id'),
                            order: index + 1
                        });
                    });

                    fetch("{{ route('year_class_subject.update_order', ['classsSchoolYear' => $classsSchoolYear->id]) }}", {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')
                                    .getAttribute('content')
                            },
                            body: JSON.stringify({
                                order: order
                            })
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                Swal.fire({
                                    title: 'تم تحديث الترتيب!',
                                    text: data.success,
                                    icon: 'success',
                                    confirmButtonText: 'حسنًا'
                                });
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                }
            });
        });

        @if ($hasnew == true)
            document.getElementById('addNew').addEventListener('click', function() {
                Swal.fire({
                    title: 'إضافة تفاصيل جديدة',
                    html: `<form id="create-form">
                        @csrf
                        <input type="hidden" name="classses_school_year_id" value="{{ $classsSchoolYear->id }}">
                        <div class="mb-3">
                            <label for="subject_detail_id" class="form-label">تفاصيل المادة</label>
                            <select name="subject_detail_id" id="subject_detail_id" class="form-select">
                                @foreach ($subjectDetails as $subjectDetail)
                                    @if ($subjectDetail->grade->id == $classsSchoolYear->classs->grade->id)
                                        @if (!$yearClassSubjects->contains(fn($yearClassSubject) => $yearClassSubject->subject_detail_id == $subjectDetail->id))
                                            <option value="{{ $subjectDetail->id }}">{{ $subjectDetail->subject->name_ar }} || Max : {{ $subjectDetail->max_grade }} ||  Falling: {{ $subjectDetail->failing_grade }}</option>
                                        @endif
                                    @endif
                                @endforeach
                            </select>
                        </div>
                        <div class="mb-3 custom-switches-stacked">
                            <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                <input type="hidden" name="is_falling" value="0">
                                <input type="checkbox" name="is_falling" value="1" class="custom-switch-input">
                                <span class="custom-switch-indicator"></span>
                                <label class="custom-switch-description mb-0 cursor-pointer" for="is_falling">مرسبة</label>
                            </label>
                        </div>
                        <div class="mb-3 custom-switches-stacked">
                            <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                <input type="hidden" name="is_optional_foreign_subject" value="0">
                                <input type="checkbox" name="is_optional_foreign_subject" value="1" class="custom-switch-input" id="is_optional_foreign_subject">
                                <span class="custom-switch-indicator"></span>
                                <label class="custom-switch-description mb-0 cursor-pointer" for="is_optional_foreign_subject">مادة اختيارية أجنبية</label>
                            </label>
                        </div>
                        <div class="mb-3" id="foreign_language_id_container" style="display: none;">
                            <label for="foreign_language_id" class="form-label">اللغة الأجنبية</label>
                            <select name="foreign_language_id" id="foreign_language_id" class="form-select">
                                <option value="">اختر اللغة</option>
                                @foreach ($languages as $language)
                                    <option value="{{ $language->id }}">{{ $language->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success">إضافة</button>
                    </form>`,
                    showConfirmButton: false
                });

                document.getElementById('is_optional_foreign_subject').addEventListener('change', function() {
                    if (this.checked) {
                        document.getElementById('foreign_language_id_container').style.display = 'block';
                    } else {
                        document.getElementById('foreign_language_id_container').style.display = 'none';
                    }
                });

                document.getElementById('create-form').addEventListener('submit', function(event) {
                    event.preventDefault();

                    let form = event.target;
                    let formData = new FormData(form);

                    fetch("{{ url('school-years/' . $classsSchoolYear->id . '/year_class_subjects/') }}", {
                            method: 'POST',
                            headers: {
                                'X-CSRF-TOKEN': formData.get('_token'),
                                'Accept': 'application/json'
                            },
                            body: formData
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                Swal.fire({
                                    title: 'تمت الإضافة!',
                                    text: data.success,
                                    icon: 'success',
                                    confirmButtonText: 'حسنًا'
                                }).then(() => {
                                    location.reload();
                                });
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                });
            });
        @endif

        function deleteYearClassSubject(id) {
            Swal.fire({
                title: 'هل أنت متأكد؟',
                text: "لن تتمكن من التراجع عن هذا!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'نعم، احذفه!'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('delete-form-' + id).submit();
                }
            });
        }

        document.querySelectorAll('.editButton').forEach(button => {
            button.addEventListener('click', function() {
                let id = this.getAttribute('data-id');
                let subjectid = this.getAttribute('data-subject');
                let is_falling_checked = this.getAttribute('data-isfalling') == 1 ? 'checked' : '';
                let is_optional_foreign_checked = this.getAttribute('data-isoptionalforeign') == 1 ? 'checked' : '';
                let foreign_language_id = this.getAttribute('data-foreignlanguage');

                Swal.fire({
                    title: 'تعديل التفاصيل',
                    html: `<form id="edit-form">
                        <input type="hidden" name="_method" value="PUT">
                        <input type="hidden" name="classses_school_year_id" value="{{ $classsSchoolYear->id }}">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        <div class="mb-3">
                            <label for="subject_detail_id" class="form-label">تفاصيل المادة</label>
                            <select name="subject_detail_id" id="subject_detail_id" class="form-select">
                                @foreach ($subjectDetails as $subjectDetail)
                                    @if ($subjectDetail->grade->id == $classsSchoolYear->classs->grade->id)
                                        <option value="{{ $subjectDetail->id }}" ${subjectid == {{ $subjectDetail->id }} ? 'selected' : ''}>{{ $subjectDetail->subject->name_ar }} || Max : {{ $subjectDetail->max_grade }} ||  Falling: {{ $subjectDetail->failing_grade }}</option>
                                    @endif
                                @endforeach
                            </select>
                        </div>
                        <div class="mb-3 custom-switches-stacked">
                            <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                <input type="hidden" name="is_falling" value="0">
                                <input type="checkbox" name="is_falling" value="1" class="custom-switch-input" ${is_falling_checked}>
                                <span class="custom-switch-indicator"></span>
                                <label class="custom-switch-description mb-0 cursor-pointer" for="is_falling">مرسبة</label>
                            </label>
                        </div>
                        <div class="mb-3 custom-switches-stacked">
                            <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                <input type="hidden" name="is_optional_foreign_subject" value="0">
                                <input type="checkbox" name="is_optional_foreign_subject" value="1" class="custom-switch-input" id="is_optional_foreign_subject" ${is_optional_foreign_checked}>
                                <span class="custom-switch-indicator"></span>
                                <label class="custom-switch-description mb-0 cursor-pointer" for="is_optional_foreign_subject">مادة اختيارية أجنبية</label>
                            </label>
                        </div>
                        <div class="mb-3" id="foreign_language_id_container" style="display: ${is_optional_foreign_checked ? 'block' : 'none'};">
                            <label for="foreign_language_id" class="form-label">اللغة الأجنبية</label>
                            <select name="foreign_language_id" id="foreign_language_id" class="form-select">
                                <option value="">اختر اللغة</option>
                                @foreach ($languages as $language)
                                    <option value="{{ $language->id }}" ${foreign_language_id == {{ $language->id }} ? 'selected' : ''}>{{ $language->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success">تحديث</button>
                    </form>`,
                    showConfirmButton: false
                });

                document.getElementById('is_optional_foreign_subject').addEventListener('change', function() {
                    if (this.checked) {
                        document.getElementById('foreign_language_id_container').style.display = 'block';
                    } else {
                        document.getElementById('foreign_language_id_container').style.display = 'none';
                    }
                });

                document.getElementById('edit-form').addEventListener('submit', function(event) {
                    event.preventDefault();

                    let form = event.target;
                    let formData = new FormData(form);
                    formData.append('_method', 'PUT'); // Include _method field to simulate PUT request

                    fetch(`{{ url('school-years/' . $classsSchoolYear->id . '/year_class_subjects') }}/${id}/update`, {
                            method: 'POST', // Use POST method to send the request
                            headers: {
                                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                                'Accept': 'application/json'
                            },
                            body: formData
                        })
                        .then(response => response.json())
                        .then(data => {
                            console.log(data); // Debugging: log the response data
                            if (data.success) {
                                Swal.fire({
                                    title: 'تم التحديث!',
                                    text: data.success,
                                    icon: 'success',
                                    confirmButtonText: 'حسنًا'
                                }).then(() => {
                                    location.reload();
                                });
                            } else {
                                Swal.fire({
                                    title: 'خطأ!',
                                    text: data.error || 'حدث خطأ أثناء التحديث',
                                    icon: 'error',
                                    confirmButtonText: 'حسنًا'
                                });
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            Swal.fire({
                                title: 'خطأ!',
                                text: 'حدث خطأ أثناء التحديث',
                                icon: 'error',
                                confirmButtonText: 'حسنًا'
                            });
                        });
                });
            });
        });
    </script>
@endsection
