@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">الطلاب المؤكدون في القسم: {{ $section->name }}</h4>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item"><a href="{{ route('sections.index', ['classsSchoolYear' =>  $section->classs_school_year_id]) }}">الشعب</a></li>
                        <li class="breadcrumb-item active">الطلاب المؤكدون</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mb-30">
                <button id="addVerifiedStudent" class="btn btn-success mb-3">إضافة جديد</button>
                <div class="card card-statistics h-100">
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>اسم الطالب</th>
                                    <th>تأكيد التسجيل</th>
                                    <th>الحالة</th>
                                    <th>إجراءات</th>
                                </tr>
                            </thead>
                            <tbody id="sortable-list" class="draggable-content-lists">
                                @foreach ($verifiedStudents as $index => $verifiedStudent)
                                    <tr id="verifiedStudent-{{ $verifiedStudent->id }}" data-id="{{ $verifiedStudent->id }}">
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $verifiedStudent->student->name_ar }}</td>
                                        <td>{{ $verifiedStudent->is_confirmed ? 'مؤكد' : 'غير مؤكد' }}</td>
                                        <td>{{ $verifiedStudent->status->value }}</td>
                                        <td>
                                            <button class="btn btn-primary editButton" data-id="{{ $verifiedStudent->id }}"
                                                data-student="{{ $verifiedStudent->student->id }}"
                                                data-isconfirmed="{{ $verifiedStudent->is_confirmed }}"
                                                data-status="{{ $verifiedStudent->status->value }}">تعديل</button>
                                            <button class="btn btn-danger deleteButton" data-id="{{ $verifiedStudent->id }}">حذف</button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $verifiedStudents->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>
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

                    fetch("{{ route('verified-students.update_order', ['section' => $section->id]) }}", {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                            },
                            body: JSON.stringify({ order: order })
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

            document.getElementById('addVerifiedStudent').addEventListener('click', function() {
                Swal.fire({
                    title: 'إضافة طالب مؤكد جديد',
                    html: `
                        <form id="create-form">
                            @csrf
                            <input type="hidden" name="section_id" value="{{ $section->id }}">
                            <div class="mb-3">
                                <label for="student_id" class="form-label">اسم الطالب</label>
                                <select name="student_id" id="student_id" class="form-select">
                                    <option value="">اختر الطالب</option>
                                    @foreach ($students as $student)
                                        <option value="{{ $student->id }}">{{ $student->name_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="is_confirmed" class="form-label">تأكيد التسجيل</label>
                                <select name="is_confirmed" id="is_confirmed" class="form-select">
                                    <option value="0">غير مؤكد</option>
                                    <option value="1">مؤكد</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label">الحالة</label>
                                <select name="status" id="status" class="form-select">
                                    @foreach (App\Enums\VerifiedStudentStatus::cases() as $status)
                                        <option value="{{ $status->value }}">{{ $status->value }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <button type="submit" class="btn btn-success">إضافة</button>
                        </form>
                    `,
                    showConfirmButton: false
                });

                document.getElementById('create-form').addEventListener('submit', function(event) {
                    event.preventDefault();

                    let form = event.target;
                    let formData = new FormData(form);

                    fetch("{{ route('verified-students.store') }}", {
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

            document.querySelectorAll('.editButton').forEach(button => {
                button.addEventListener('click', function() {
                    let id = this.getAttribute('data-id');
                    let studentId = this.getAttribute('data-student');
                    let isConfirmed = this.getAttribute('data-isconfirmed');
                    let status = this.getAttribute('data-status');

                    Swal.fire({
                        title: 'تعديل طالب مؤكد',
                        html: `
                            <form id="edit-form">
                                @csrf
                                @method('PUT')
                                <input type="hidden" name="section_id" value="{{ $section->id }}">
                                <div class="mb-3">
                                    <label for="student_id" class="form-label">اسم الطالب</label>
                                    <select name="student_id" id="student_id" class="form-select">
                                        <option value="">اختر الطالب</option>
                                        @foreach ($students as $student)
                                            <option value="{{ $student->id }}" ${studentId == {{ $student->id }} ? 'selected' : ''}>
                                                {{ $student->name_ar }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="is_confirmed" class="form-label">تأكيد التسجيل</label>
                                    <select name="is_confirmed" id="is_confirmed" class="form-select">
                                        <option value="0" ${isConfirmed == 0 ? 'selected' : ''}>غير مؤكد</option>
                                        <option value="1" ${isConfirmed == 1 ? 'selected' : ''}>مؤكد</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="status" class="form-label">الحالة</label>
                                    <select name="status" id="status" class="form-select">
                                        @foreach (App\Enums\VerifiedStudentStatus::cases() as $statusOption)
                                            <option value="{{ $statusOption->value }}" ${statusOption->value == status ? 'selected' : ''}>{{ $statusOption->value }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-success">تحديث</button>
                            </form>
                        `,
                        showConfirmButton: false
                    });

                    document.getElementById('edit-form').addEventListener('submit', function(event) {
                        event.preventDefault();

                        let form = event.target;
                        let formData = new FormData(form);

                        fetch(`{{ url('verified-students') }}/${id}`, {
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

            document.querySelectorAll('.deleteButton').forEach(button => {
                button.addEventListener('click', function() {
                    let id = this.getAttribute('data-id');

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
                            fetch(`{{ url('verified-students') }}/${id}`, {
                                    method: 'DELETE',
                                    headers: {
                                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                                    }
                                })
                                .then(response => response.json())
                                .then(data => {
                                    if (data.success) {
                                        Swal.fire('تم الحذف!', 'تم حذف الطالب بنجاح.', 'success').then(() => {
                                            location.reload();
                                        });
                                    }
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                });
                        }
                    });
                });
            });
        });
    </script>
@endsection
