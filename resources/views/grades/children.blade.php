@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4"> اختصاصات المرحلة الدراسية  :  {{ $grade->stage->name }} --> {{ $grade->grade_name_ar }}</h1>
    <button type="button" class="btn btn-primary mb-3" onclick="showGradeModal()">
        إضافة مرحلة
    </button>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>اسم المرحلة</th>
                <th>ملاحظات</th>
                <th>المرحلة التعليمية</th>
                <th>العمليات</th>
            </tr>
        </thead>
        <tbody>
            
            @foreach($grade->children as $childe)
            <tr>
                <td>{{ $childe->id }}</td>
                <td>{{ $childe->grade_name_ar }}</td>
                <td>{{ $childe->grade_notes }}</td>
                <td>{{ $childe->stage->name }}</td>
                <td>
                    <button class="btn btn-info btn-sm" onclick="showGradeModal({{ $childe->id }}, '{{ $childe->grade_name_ar }}', '{{ $childe->grade_name_en }}', '{{ $childe->grade_notes }}', '{{ $childe->stage_id }}', '{{ $childe->parent_id ?? 'null' }}')"  title="تعديل">
                        <i class="fa fa-edit"></i>
                    </button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete({{ $childe->id }})" title="حذف">
                        <i class="fa fa-trash"></i>
                    </button>
                    @if ($childe->hasNoChildren() )
                    <a href="{{ route('grades.classes', $childe->id) }}" class="btn btn-success btn-sm" title="عرض الصفوف الدراسية">
                        <i class="fa fa-object-group"></i>{{ $childe->classesCount() }}
                    </a>
                @endif
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<script>
    async function fetchData() {
        const response = await fetch('/get-stages-grades');
        return await response.json();
    }

    async function fetchGradesByStage(stageId) {
        const response = await fetch(`/grades-by-stage/${stageId}`);
        return await response.json();
    }

    async function showGradeModal(id = null, grade_name_ar = '', grade_name_en = '', grade_notes = '', stage_id = '', parent_id = '') {
        Swal.fire({
            title: id != null ? 'تعديل مرحلة' : 'إضافة مرحلة',
            html: `
                <input type="hidden" id="grade_id" value="${id}">
                <div class="mb-3">
                    <label for="stage_id" class="form-label">المرحلة التعليمية:</label>
                    <select class="form-control" id="stage_id" >
                        <option value="{{  $grade->stage->id }}" selected>{{  $grade->stage->name }}</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="parent_id" class="form-label">المرحلة الأم:</label>
                    <select class="form-control" id="parent_id">
                        <option value="{{  $grade->id }}" selected>{{  $grade->grade_name_ar }}</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="grade_name_ar" class="form-label">اسم المرحلة بالعربية:</label>
                    <input type="text" class="form-control" id="grade_name_ar" value="${grade_name_ar}">
                </div>
                <div class="mb-3">
                    <label for="grade_name_en" class="form-label">اسم المرحلة بالإنجليزية:</label>
                    <input type="text" class="form-control" id="grade_name_en" value="${grade_name_en}">
                </div>
                <div class="mb-3">
                    <label for="grade_notes" class="form-label">ملاحظات:</label>
                    <textarea class="form-control" id="grade_notes" rows="3">${grade_notes}</textarea>
                </div>
            `,
            showCancelButton: true,
            confirmButtonText: 'حفظ البيانات',
            preConfirm: () => {
                const grade_id = Swal.getPopup().querySelector('#grade_id').value;
                const stage_id = Swal.getPopup().querySelector('#stage_id').value;
                const parent_id = Swal.getPopup().querySelector('#parent_id').value;
                const grade_name_ar = Swal.getPopup().querySelector('#grade_name_ar').value;
                const grade_name_en = Swal.getPopup().querySelector('#grade_name_en').value;
                const grade_notes = Swal.getPopup().querySelector('#grade_notes').value;
                return { grade_id, stage_id, parent_id, grade_name_ar, grade_name_en, grade_notes };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const { grade_id, stage_id, parent_id, grade_name_ar, grade_name_en, grade_notes } = result.value;
                saveGrade(grade_id, stage_id, parent_id, grade_name_ar, grade_name_en, grade_notes);
            }
        });
    }

 

    function saveGrade(id, stage_id, parent_id, grade_name_ar, grade_name_en, grade_notes) {

        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const url = id != "null" ? `/grades/${id}/update` : '/grades/store';

        const method =  'POST';

        fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': token
            },
            body: JSON.stringify({ stage_id, parent_id, grade_name_ar, grade_name_en, grade_notes })
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
                fetch(`/grades/${id}/delete`, {
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
