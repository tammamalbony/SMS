@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">المراحل التعليمية</h1>

    <button type="button" class="btn btn-primary mb-3" onclick="showStageModal()">
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
            @foreach($stages as $stage)
            <tr>
                <td>{{ $stage->id }}</td>
                <td>{{ $stage->name }}</td>
                <td>{{ $stage->note }}</td>
                <td>
                    <button class="btn btn-info btn-sm" onclick="showStageModal({{ $stage->id }}, '{{ $stage->name }}', '{{ $stage->note }}')">
                        <i class="fa fa-edit"></i>
                    </button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete({{ $stage->id }})">
                        <i class="fa fa-trash"></i>
                    </button>
                    <form id="delete-form-{{ $stage->id }}" action="{{ route('stages.destroy', $stage->id) }}" method="POST" style="display:none;">
                        @csrf
                        @method('DELETE')
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    {{ $stages->links() }}
</div>

<script>
    function showStageModal(id = null, name = '', note = '') {
        Swal.fire({
            title: id != null ? 'تعديل مرحلة' : 'إضافة مرحلة',
            html: `
                <input type="hidden" id="stage_id" value="${id}">
                <div class="mb-3">
                    <label for="stage_name" class="form-label">اسم المرحلة:</label>
                    <input type="text" class="form-control" id="stage_name" value="${name}">
                </div>
                <div class="mb-3">
                    <label for="stage_note" class="form-label">ملاحظات:</label>
                    <textarea class="form-control" id="stage_note" rows="3">${note}</textarea>
                </div>
            `,
            showCancelButton: true,
            confirmButtonText: 'حفظ البيانات',
            preConfirm: () => {
                const name = Swal.getPopup().querySelector('#stage_name').value;
                const note = Swal.getPopup().querySelector('#stage_note').value;
                const stage_id = Swal.getPopup().querySelector('#stage_id').value;

                if (!name) {
                    Swal.showValidationMessage(`Please enter the stage name`);
                }

                return { stage_id, name, note };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const { stage_id, name, note } = result.value;
                saveStage(stage_id, name, note);
            }
        });
    }

    function saveGrade(grade_id, stage_id, parent_id, grade_name_ar, grade_name_en, grade_notes) {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const url = grade_id != null ? `/grades/${grade_id}/update` : '/grades/store';
    const method = grade_id  != null ? 'PUT' : 'POST'; 

    fetch(url, {
        method: 'POST', 
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': token
        },
        body: JSON.stringify({
            grade_name_ar, grade_name_en, grade_notes, stage_id, parent_id, _method: method
        })
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
            fetch(`/stages/${id}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': token
                }
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
