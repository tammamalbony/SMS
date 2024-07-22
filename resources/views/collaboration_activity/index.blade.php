@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">تعاون و نشاط الطالب: {{ $verifiedStudent->student->first_name }} {{ $verifiedStudent->student->last_name }}</h1>
    <h2 class="mb-4">الصف: {{ $verifiedStudent->section->classsSchoolYear->classs->class_name_ar }}</h2>

    <div class="row justify-content-between">
        <button type="button" class="btn btn-primary mb-3" onclick="showActivityModal()">
            إضافة تعاون و نشاط
        </button>
    </div>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>قيمة التعاون و النشاط</th>
                <th>ملاحظات</th>
                <th>العمليات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($activities as $activity)
            <tr>
                <td>{{ $activity->id }}</td>
                <td>{{ $activity->value }}</td>
                <td>{{ $activity->note }}</td>
                <td>
                    <button class="btn btn-primary btn-sm" title="تعديل " onclick="showActivityModal({{ $activity->id }} , {{ $activity->value }} , {{ $activity->note }})">
                        <i class="fa fa-edit"></i>
                    </button>
                    <button class="btn btn-danger btn-sm" title="حذف " onclick="confirmDelete({{ $activity->id }})">
                        <i class="fa fa-trash"></i>
                    </button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    {{ $activities->links() }}
</div>

<script>
    function showActivityModal(id = null, value = '', note = '') {
        Swal.fire({
            title: id ? 'تعديل التعاون و النشاط' : 'إضافة تعاون و نشاط',
            html: `
                <input type="hidden" id="activity_id" value="${id}">
                <div class="mb-3">
                    <label for="activity_value" class="form-label">قيمة النشاط:</label>
                    <input type="text" id="activity_value" class="form-control" value="${value}">
                </div>
                <div class="mb-3">
                    <label for="activity_note" class="form-label">ملاحظات:</label>
                    <textarea id="activity_note" class="form-control">${note}</textarea>
                </div>
            `,
            showCancelButton: true,
            confirmButtonText: 'حفظ البيانات',
            preConfirm: () => {
                const activity_value = Swal.getPopup().querySelector('#activity_value').value;
                const activity_note = Swal.getPopup().querySelector('#activity_note').value;
                const activity_id = Swal.getPopup().querySelector('#activity_id').value;

                if (!activity_value) {
                    Swal.showValidationMessage(`يرجى إدخال قيمة النشاط`);
                }

                return { activity_id, activity_value, activity_note };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const { activity_id, activity_value, activity_note } = result.value;
                saveActivity(activity_id, activity_value, activity_note);
            }
        });
    }

    function saveActivity(activity_id, activity_value, activity_note) {
        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const verifiedStudentId = '{{ $verifiedStudent->id }}';
        const url = activity_id != 'null' ? `/verified-students/${verifiedStudentId}/collaboration_activity/${activity_id}/update` : `/verified-students/${verifiedStudentId}/collaboration_activity/store`;
        const method = 'POST';

        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': token
            },
            body: JSON.stringify({ value: activity_value, note: activity_note, _method: method })
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
            Swal.fire('Error', 'حدث خطأ ما!', 'error');
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
                const verifiedStudentId = '{{ $verifiedStudent->id }}';
                const url = `/verified-students/${verifiedStudentId}/collaboration_activity/${id}/delete`;
                
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
                    Swal.fire('Error', 'حدث خطأ ما!', 'error');
                });
            }
        });
    }
</script>
@endsection
