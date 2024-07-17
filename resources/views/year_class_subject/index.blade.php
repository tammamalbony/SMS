@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>قائمة الفصول الدراسية والتفاصيل للسنة الدراسية: {{ $classsSchoolYear->id }}</h1>

        <button id="addNew" class="btn btn-success mb-3">إضافة جديد</button>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>تفاصيل المادة</th>
                    <th>الترتيب</th>
                    <th>إجراءات</th>
                </tr>
            </thead>
            <tbody id="sortable-list" class="draggable-content-lists">
                @foreach ($yearClassSubjects as $yearClassSubject)
                    <tr id="yearClassSubject-{{ $yearClassSubject->id }}"  data-id="{{ $yearClassSubject->id }}">
                        <td>{{ $yearClassSubject->id }}</td>
                        <td>{{ $yearClassSubject->subjectDetail->subject->name_ar }}</td>
                        <td>{{ $yearClassSubject->order }}</td>
                        <td>
                            <button class="btn btn-primary editButton" data-id="{{ $yearClassSubject->id }}"
                                data-subject="{{ $yearClassSubject->subjectDetail->id }}">تعديل</button>
                            <button class="btn btn-danger"
                                onclick="deleteYearClassSubject({{ $yearClassSubject->id }})">حذف</button>
                            <form id="delete-form-{{ $yearClassSubject->id }}"
                                action="{{ url('school-years/' . $classsSchoolYear->id . '/year_class_subjects/' . $yearClassSubject->id . '/delete') }}"
                                method="POST" style="display: none;">
                                @csrf
                                @method('POST')
                            </form>
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
        document.getElementById('addNew').addEventListener('click', function() {
            Swal.fire({
                title: 'إضافة تفاصيل جديدة',
                html: '<form id="create-form">' +
                    '@csrf' +
                    '<input type="hidden" name="classses_school_year_id" value="{{ $classsSchoolYear->id }}">' +
                    '<div class="mb-3">' +
                    '<label for="subject_detail_id" class="form-label">تفاصيل المادة</label>' +
                    '<select name="subject_detail_id" id="subject_detail_id" class="form-select">' +
                    @foreach ($subjectDetails as $subjectDetail)
                        @if ($subjectDetail->grade->id == $classsSchoolYear->classs->grade->id)
                            '<option value="{{ $subjectDetail->id }}">{{ $subjectDetail->subject->name_ar }}</option>' +
                        @endif
                    @endforeach
                '</select>' +
                '</div>' +
                '<button type="submit" class="btn btn-success">إضافة</button>' +
                '</form>',
                showConfirmButton: false
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
                Swal.fire({
                    title: 'تعديل التفاصيل',
                    html: '<form id="edit-form">' +
                        '<input type="hidden" name="_method" value="PUT">' +
                        '<input type="hidden" name="classses_school_year_id" value="{{ $classsSchoolYear->id }}">' +
                        '<input type="hidden" name="_token" value="{{ csrf_token() }}">' +
                        '<div class="mb-3">' +
                        '<label for="subject_detail_id" class="form-label">تفاصيل المادة</label>' +
                        '<select name="subject_detail_id" id="subject_detail_id" class="form-select">' +
                        @foreach ($subjectDetails as $subjectDetail)
                            @if ($subjectDetail->grade->id == $classsSchoolYear->classs->grade->id)
                                '<option value="{{ $subjectDetail->id }}" ' + (subjectid ==
                                    {{ $subjectDetail->id }} ?
                                    'selected' : '') +
                                '>{{ $subjectDetail->subject->name_ar }}</option>' +
                            @endif
                        @endforeach
                    '</select>' +
                    '</div>' +
                    '<button type="submit" class="btn btn-success">تحديث</button>' +
                    '</form>',
                    showConfirmButton: false
                });

                document.getElementById('edit-form').addEventListener('submit', function(
                    event) {
                    event.preventDefault();

                    let form = event.target;
                    let formData = new FormData(form);

                    fetch(`/year_class_subjects/${id}`, {
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
                                    title: 'تم التحديث!',
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
        });
    </script>
@endsection
