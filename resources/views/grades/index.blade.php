@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">المراحل الدراسية</h1>
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
            @foreach($grades as $grade)
            <tr>
                <td>{{ $grade->id }}</td>
                <td>{{ $grade->grade_name_ar }}</td>
                <td>{{ $grade->grade_notes }}</td>
                <td>{{ $grade->stage->name }}</td>
                <td>
                    <button class="btn btn-info btn-sm" onclick="showGradeModal({{ $grade->id }}, `{{ $grade->grade_name_ar }}`, `{{ $grade->grade_name_en }}`, `{{ $grade->grade_notes }}`, `{{ $grade->stage_id }}`, `{{ $grade->parent_id ?? `null` }}`)"  title="تعديل">
                        <i class="fa fa-edit"></i>
                    </button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete({{ $grade->id }})" title="حذف">
                        <i class="fa fa-trash"></i>
                    </button>
                    
                    @if($grade->hasNoChildren() && $grade->hasNoClasses())
                        <a href="{{ route('grades.classes', $grade->id) }}" class="btn btn-success btn-sm" title="عرض الفصول الدراسية">
                            <i class="fa fa-object-group"></i>
                        </a>
                        <a href="{{ route('grades.children', $grade->id) }}" class="btn btn-secondary btn-sm" title="عرض المراحل الفرعية">
                            <i class="fa fa-eye"></i> 
                        </a>
                    @else
                        @if ($grade->hasNoClasses())
                            <a href="{{ route('grades.children', $grade->id) }}" class="btn btn-secondary btn-sm" title="عرض المراحل الفرعية">
                                <i class="fa fa-eye"></i> 
                            </a>
                        @endif
                        @if ($grade->hasNoChildren() )
                            <a href="{{ route('grades.classes', $grade->id) }}" class="btn btn-success btn-sm" title="عرض الصفوف الدراسية">
                                <i class="fa fa-object-group"></i>{{ $grade->classesCount() }}
                            </a>
                        @endif
                    @endif
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
    {{ $grades->links() }}
</div>

<script>
    async function fetchData() {
        const stagesResponse = await fetch('/get-stages-grades');
        const stagesData = await stagesResponse.json();
        return stagesData;
    }

    async function fetchGradesByStage(stageId) {
        const response = await fetch(`/grades-by-stage/${stageId}`);
        const grades = await response.json();
        return grades;
    }

    async function showGradeModal(id = null, grade_name_ar = '', grade_name_en = '', grade_notes = '', stage_id = '', parent_id = '') {
        const { stages } = await fetchData();
        let stageOptions = stages.map(s => `<option value="${s.id}" ${s.id == stage_id ? 'selected' : ''}>${s.name}</option>`).join('');

        let gradeOptions = '';
        if (stage_id) {
            const grades = await fetchGradesByStage(stage_id);
            gradeOptions = grades.map(g => `<option value="${g.id}" ${g.id == parent_id ? 'selected' : ''}>${g.grade_name_ar}</option>`).join('');
        }

        Swal.fire({
            title: id != null ? 'تعديل مرحلة' : 'إضافة مرحلة',
            html: `
                <input type="hidden" id="grade_id" value="${id}">
                <div class="mb-3">
                    <label for="stage_id" class="form-label">المرحلة التعليمية:</label>
                    <select class="form-control" id="stage_id" onchange="updateGradeOptions(this.value)">${stageOptions}</select>
                </div>
                <div class="mb-3">
                    <label for="parent_id" class="form-label">المرحلة الأم:</label>
                    <select class="form-control" id="parent_id">
                        <option value="">None</option>
                        ${gradeOptions}
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

    async function updateGradeOptions(stageId) {
        const grades = await fetchGradesByStage(stageId);
        let gradeOptions = grades.map(g => `<option value="${g.id}">${g.grade_name_ar}</option>`).join('');
        document.getElementById('parent_id').innerHTML = `<option value="">None</option>${gradeOptions}`;
    }

    function saveGrade(id, stage_id, parent_id, grade_name_ar, grade_name_en, grade_notes) {
        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const url = id != "null" ? `/grades/${id}/update` : '/grades/store';
        const method =   'POST';

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
