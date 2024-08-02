@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">المسميات الوظيفية لـ {{ $kindOfEmployment->name }}</h1>
    <button type="button" class="btn btn-primary mb-3" onclick="showJobTitleModal()">
        إضافة مسمى وظيفي
    </button>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>اسم المسمى الوظيفي</th>
                <th>العمليات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($jobTitles as $jobTitle)
            <tr>
                <td>{{ $jobTitle->id }}</td>
                <td>{{ $jobTitle->name }}</td>
                <td>
                    <button class="btn btn-info btn-sm" onclick="showJobTitleModal({{ $jobTitle->id }}, '{{ $jobTitle->name }}')" title="تعديل">
                        <i class="fa fa-edit"></i>
                    </button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete({{ $jobTitle->id }})" title="حذف">
                        <i class="fa fa-trash"></i>
                    </button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<script>
    async function showJobTitleModal(id = null, name = '') {
        const title = id ? 'تعديل مسمى وظيفي' : 'إضافة مسمى وظيفي';
        const buttonText = id ? 'حفظ التعديلات' : 'إضافة';
        
        Swal.fire({
            title: title,
            html: `
                <input type="hidden" id="job_title_id" value="${id ? id : ''}">
                <input type="hidden" id="kind_of_employment_id" value="{{ $kindOfEmployment->id }}">
                <div class="mb-3">
                    <label for="name" class="form-label">اسم المسمى الوظيفي:</label>
                    <input type="text" class="form-control" id="name" value="${name}">
                </div>
            `,
            showCancelButton: true,
            confirmButtonText: buttonText,
            preConfirm: () => {
                const job_title_id = Swal.getPopup().querySelector('#job_title_id').value;
                const kind_of_employment_id = Swal.getPopup().querySelector('#kind_of_employment_id').value;
                const name = Swal.getPopup().querySelector('#name').value;

                if (!name) {
                    Swal.showValidationMessage(`الرجاء إدخال اسم المسمى الوظيفي`);
                }

                return { job_title_id, kind_of_employment_id, name };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const { job_title_id, kind_of_employment_id, name } = result.value;
                saveJobTitle(job_title_id, kind_of_employment_id, name);
            }
        });
    }

    function saveJobTitle(id, kind_of_employment_id, name) {
        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const url = id ? `/kinds-of-employment/${kind_of_employment_id}/job-titles/${id}` : `/kinds-of-employment/${kind_of_employment_id}/job-titles`;
        const method = id ? 'PUT' : 'POST';

        fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': token
            },
            body: JSON.stringify({ name })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                Swal.fire('تم الحفظ', data.message, 'success').then(() => {
                    window.location.reload();
                });
            } else {
                Swal.fire('خطأ', data.message, 'error');
            }
        })
        .catch(error => {
            Swal.fire('خطأ', 'حدث خطأ ما!', 'error');
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
                const url = `/kinds-of-employment/{{ $kindOfEmployment->id }}/job-titles/${id}`;

                fetch(url, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': token
                    }
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        Swal.fire('تم الحذف!', data.message, 'success').then(() => {
                            window.location.reload();
                        });
                    } else {
                        Swal.fire('خطأ', data.message, 'error');
                    }
                })
                .catch(error => {
                    Swal.fire('خطأ', 'حدث خطأ ما!', 'error');
                });
            }
        });
    }
</script>
@endsection
