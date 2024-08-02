@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">أنواع التوظيف لـ {{ $kindOfEmployment->name }}</h1>
    <button type="button" class="btn btn-primary mb-3" onclick="showSortModal()">
        إضافة نوع توظيف
    </button>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>اسم النوع</th>
                <th>العمليات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($sortsOfEmployment as $sort)
            <tr>
                <td>{{ $sort->id }}</td>
                <td>{{ $sort->name }}</td>
                <td>
                    <button class="btn btn-info btn-sm" onclick="showSortModal({{ $sort->id }}, '{{ $sort->name }}')" title="تعديل">
                        <i class="fa fa-edit"></i>
                    </button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete({{ $sort->id }})" title="حذف">
                        <i class="fa fa-trash"></i>
                    </button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<script>
    async function showSortModal(id = null, name = '') {
        Swal.fire({
            title: id != null ? 'تعديل نوع توظيف' : 'إضافة نوع توظيف',
            html: `
                <input type="hidden" id="sort_id" value="${id}">
                <input type="hidden" id="kind_of_employment_id" value="{{ $kindOfEmployment->id }}">
                <div class="mb-3">
                    <label for="name" class="form-label">اسم النوع:</label>
                    <input type="text" class="form-control" id="name" value="${name}">
                </div>
            `,
            showCancelButton: true,
            confirmButtonText: 'حفظ البيانات',
            preConfirm: () => {
                const sort_id = Swal.getPopup().querySelector('#sort_id').value;
                const kind_of_employment_id = Swal.getPopup().querySelector('#kind_of_employment_id').value;
                const name = Swal.getPopup().querySelector('#name').value;
                if (!name) {
                    Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`);
                }
                return { sort_id, kind_of_employment_id, name };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const { sort_id, kind_of_employment_id, name } = result.value;
                saveSort(sort_id, kind_of_employment_id, name);
            }
        });
    }

    function saveSort(id, kind_of_employment_id, name) {
        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const url = id != 'null' ? `/kinds-of-employment/${kind_of_employment_id}/sorts-of-employment/${id}/update` : `/kinds-of-employment/${kind_of_employment_id}/sorts-of-employment`;
        const method = 'POST';

        fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': token
            },
            body: JSON.stringify({ name, kind_of_employment_id })
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
                const url = `/kinds-of-employment/{{ $kindOfEmployment->id }}/sorts-of-employment/${id}/delete`;
                fetch(url, {
                    method: 'POST',
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
