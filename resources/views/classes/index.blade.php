@extends('layouts.app')


@endphp
@section('content')
<div class="container">
    <h1 class="mb-4">الصفوف الدراسية</h1>

    <button type="button" class="btn btn-primary mb-3" onclick="showClassModal()">
        إضافة صف
    </button>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>اسم الصف بالعربية</th>
                <th>اسم الصف بالإنجليزية</th>
                <th>اسم المرحلة</th>
                <th>العمليات</th>
            </tr>
        </thead>
        <tbody>
            @if(isset($targetgrade))
                @foreach($targetgrade->classes as $class)
                <tr>
                    <td>{{ $class->id }}</td>
                    <td>{{ $class->class_name_ar }}</td>
                    <td>{{ $class->class_name_en }}</td>
                    <td>{{ $class->grade->grade_name_ar }}</td>
                    <td>
                        <button class="btn btn-info btn-sm" title="تعديل الصف" onclick="showClassModal({{ $class->id }}, {{ $class->grade_id }}, '{{ $class->class_name_ar }}', '{{ $class->class_name_en }}')">
                            <i class="fa fa-edit"></i>
                        </button>
                        <button class="btn btn-danger btn-sm" title="حذف الصف" onclick="confirmDelete({{ $class->id }})">
                            <i class="fa fa-trash"></i>
                        </button>
                        <a href="{{ route('books.index', ['classId' => $class->id]) }}" class="btn btn-primary btn-sm" title="عرض الكتب">
                            <i class="fa fa-book"></i> 
                        </a>
                        <a href="{{ route('age_groups.index', ['classs_id' => $class->id]) }}" class="btn btn-secondary btn-sm" title="عرض الفئات العمرية">
                            <i class="fa fa-users"></i>
                        </a>
                    </td>
                </tr>
                @endforeach
            @else
                @foreach($classes as $class)
                <tr>
                    <td>{{ $class->id }}</td>
                    <td>{{ $class->class_name_ar }}</td>
                    <td>{{ $class->class_name_en }}</td>
                    <td>{{ $class->grade->grade_name_ar }}</td>
                    <td>
                        <button class="btn btn-info btn-sm" title="تعديل الصف" onclick="showClassModal({{ $class->id }}, {{ $class->grade_id }}, '{{ $class->class_name_ar }}', '{{ $class->class_name_en }}')">
                            <i class="fa fa-edit"></i>
                        </button>
                        <button class="btn btn-danger btn-sm" title="حذف الصف" onclick="confirmDelete({{ $class->id }})">
                            <i class="fa fa-trash"></i>
                        </button>
                        <a href="{{ route('books.index', ['classId' => $class->id]) }}" class="btn btn-primary btn-sm" title="عرض الكتب">
                            <i class="fa fa-book"></i> 
                        </a>
                        <a href="{{ route('age_groups.index', ['classs_id' => $class->id]) }}" class="btn btn-secondary btn-sm" title="عرض الفئات العمرية">
                            <i class="fa fa-users"></i>
                        </a>
                    </td>
                </tr>
                @endforeach
            @endif
        </tbody>
    </table>
    @if(!isset($targetgrade))
    {{ $classes->links() }}
    @endif
</div>

<script>
    function showClassModal(id = null, grade_id = null, class_name_ar = '', class_name_en = '') {
        Swal.fire({
            title: id ? 'تعديل صف' : 'إضافة صف',
            html: `
                <input type="hidden" id="class_id" value="${id}">
                <div class="mb-3">
                    <label for="grade_id" class="form-label">اسم المرحلة:</label>
                    <select id="grade_id" class="form-select">
                        @if(isset($targetgrade))
                                <option value="{{ $targetgrade->id }}" selected}>{{ $targetgrade->grade_name_ar }}</option>
                        @else
                            @foreach($grades as $grade)
                                <option value="{{ $grade->id }}" ${grade_id == {{ $grade->id }} ? 'selected' : ''}>{{ $grade->grade_name_ar }}</option>
                            @endforeach
                        @endif
                    </select>
                </div>
                <div class="mb-3">
                    <label for="class_name_ar" class="form-label">اسم الصف بالعربية:</label>
                    <input type="text" class="form-control" id="class_name_ar" value="${class_name_ar}">
                </div>
                <div class="mb-3">
                    <label for="class_name_en" class="form-label">اسم الصف بالإنجليزية:</label>
                    <input type="text" class="form-control" id="class_name_en" value="${class_name_en}">
                </div>
            `,
            showCancelButton: true,
            confirmButtonText: 'حفظ البيانات',
            preConfirm: () => {
                const grade_id = Swal.getPopup().querySelector('#grade_id').value;
                const class_name_ar = Swal.getPopup().querySelector('#class_name_ar').value;
                const class_name_en = Swal.getPopup().querySelector('#class_name_en').value;
                const class_id = Swal.getPopup().querySelector('#class_id').value;

                if (!grade_id || !class_name_ar || !class_name_en) {
                    Swal.showValidationMessage(`Please fill all fields`);
                }

                return { class_id, grade_id, class_name_ar, class_name_en };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const { class_id, grade_id, class_name_ar, class_name_en } = result.value;
                saveClass(class_id, grade_id, class_name_ar, class_name_en);
            }
        });
    }

    function saveClass(class_id, grade_id, class_name_ar, class_name_en) {
        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const url = class_id !== "null" ? `/classes/${class_id}/update` : '/classes/store';
        const method = 'POST';

        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': token
            },
            body: JSON.stringify({ grade_id, class_name_ar, class_name_en, _method: method })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                Swal.fire('Success', data.message, 'success').then(() => {
                    window.location.reload();
                });
            } else {
                Swal.fire('Error', data.message, 'error');
            }
        })
        .catch(error => {
            Swal.fire('Error', 'Something went wrong!', 'error');
        });
    }

    function confirmDelete(id) {
        Swal.fire({
            title: 'هل أنت متأكد?',
            text: "لن تتمكن من التراجع عن هذا!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'نعم، احذفه!',
            cancelButtonText: 'إلغاء'
        }).then((result) => {
            if (result.isConfirmed) {
                const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
                const url = `/classes/${id}/delete`;
                
                fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': token
                    },
                    body: JSON.stringify({ _method: 'POST' })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        Swal.fire('Deleted!', data.message, 'success').then(() => {
                            window.location.reload();
                        });
                    } else {
                        Swal.fire('Error', data.message, 'error');
                    }
                })
                .catch(error => {
                    Swal.fire('Error', 'Something went wrong!', 'error');
                });
            }
        });
    }
</script>
@endsection
