@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">المراحل الدراسية</h1>

    <!-- Button to trigger the modal -->
    <button type="button" class="btn btn-primary mb-3" onclick="showGradeModal()">
        إضافة مرحلة
    </button>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>اسم المرحلة</th>
                <th>ملاحظات</th>
                <th>العمليات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($grades as $grade)
            <tr>
                <td>{{ $grade->id }}</td>
                <td>{{ $grade->grade_name_ar }}</td>
                <td>{{ $grade->grade_notes }}</td>
                <td>
                    <button class="btn btn-info btn-sm" onclick="showGradeModal({{ $grade->id }}, '{{ $grade->grade_name_ar }}', '{{ $grade->grade_name_en }}', '{{ $grade->grade_notes }}')">
                        <i class="fa fa-edit"></i>
                    </button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete({{ $grade->id }})">
                        <i class="fa fa-trash"></i>
                    </button>
                    <form id="delete-form-{{ $grade->id }}" action="{{ route('grades.destroy', $grade->id) }}" method="POST" style="display:none;">
                        @csrf
                        @method('post')
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    {{ $grades->links() }}
</div>

<script>
    function showGradeModal(id = null, grade_name_ar = '', grade_name_en = '', grade_notes = '') {
        Swal.fire({
            title: id ? 'تعديل مرحلة' : 'إضافة مرحلة',
            html: `
                <input type="hidden" id="grade_id" value="${id}">
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
                const grade_name_ar = Swal.getPopup().querySelector('#grade_name_ar').value;
                const grade_name_en = Swal.getPopup().querySelector('#grade_name_en').value;
                const grade_notes = Swal.getPopup().querySelector('#grade_notes').value;
                const grade_id = Swal.getPopup().querySelector('#grade_id').value;

                if (!grade_name_ar || !grade_name_en) {
                    Swal.showValidationMessage(`Please enter both Arabic and English names`);
                }

                return { grade_id, grade_name_ar, grade_name_en, grade_notes };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const { grade_id, grade_name_ar, grade_name_en, grade_notes } = result.value;
                saveGrade(grade_id, grade_name_ar, grade_name_en, grade_notes);
            }
        });
    }

    function saveGrade(grade_id, grade_name_ar, grade_name_en, grade_notes) {
        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const url = grade_id !=="null" ? `/grades/${grade_id}/update` : '/grades/store';
        const method ='POST';

        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': token
            },
            body: JSON.stringify({ grade_name_ar, grade_name_en, grade_notes, _method: method })
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
                const url = `/grades/${id}/delete`;
                
                fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': token
                    },
                    body: JSON.stringify({ _method: 'post' })
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
