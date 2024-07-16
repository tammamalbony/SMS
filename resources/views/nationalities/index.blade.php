@extends('layouts.app')

@section('content')
<div class="container">
    <h1>الجنسيات</h1>
    <button onclick="createNationality()" class="btn btn-primary">إضافة جنسية جديدة</button>
    <table class="table table-bordered table-striped mt-4">
        <thead>
            <tr>
                <th>الرقم</th>
                <th>الاسم</th>
                <th>الإجراءات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($nationalities as $nationality)
            <tr>
                <td>{{ $nationality->id }}</td>
                <td>{{ $nationality->name }}</td>
                <td>
                    <button onclick="editNationality({{ $nationality->id }})" class="btn btn-warning">تعديل</button>
                    <button onclick="deleteNationality({{ $nationality->id }})" class="btn btn-danger">حذف</button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
function createNationality() {
    Swal.fire({
        title: 'إضافة جنسية جديدة',
        html: `<input type="text" id="nationality_name" class="swal2-input" placeholder="اسم الجنسية">`,
        confirmButtonText: 'حفظ',
        focusConfirm: false,
        preConfirm: () => {
            const name = Swal.getPopup().querySelector('#nationality_name').value;
            if (!name) {
                Swal.showValidationMessage(`Please enter the nationality name`);
            }
            return { name: name };
        }
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "{{ route('nationalities.store') }}",
                type: "POST",
                data: {
                    "_token": "{{ csrf_token() }}",
                    "name": result.value.name,
                },
                success: function(response) {
                    window.location.reload();
                },
                error: function(xhr) {
                    let message = xhr.responseJSON.message;
                    let errors = xhr.responseJSON.errors;
                    let errorMessages = [];
                    for (let key in errors) {
                        errorMessages.push(errors[key][0]);
                    }
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        html: `<strong>${message}</strong><br>${errorMessages.join('<br>')}`
                    });
                }
            });
        }
    });
}

function editNationality(id) {
    $.ajax({
        url: `nationalities/${id}/edit`,
        type: "POST", 
        success: function(data) {
            Swal.fire({
                title: 'تعديل الجنسية',
                html: `<input type="text" id="nationality_name" class="swal2-input" value="${data.name}" placeholder="اسم الجنسية">`,
                confirmButtonText: 'تحديث',
                focusConfirm: false,
                preConfirm: () => {
                    const name = Swal.getPopup().querySelector('#nationality_name').value;
                    if (!name) {
                        Swal.showValidationMessage(`Please enter the nationality name`);
                    }
                    return { name: name };
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: `nationalities/${id}`,
                        type: "POST",
                        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        data: {
                            "name": result.value.name,
                        },
                        success: function(response) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: 'Nationality updated successfully!',
                                timer: 1500
                            }).then(function() {
                                window.location.reload();
                            });
                        },
                        error: function(xhr) {
                            let message = xhr.responseJSON.message;
                            let errors = xhr.responseJSON.errors;
                            let errorMessages = [];
                            for (let key in errors) {
                                errorMessages.push(errors[key][0]);
                            }
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                html: `<strong>${message}</strong><br>${errorMessages.join('<br>')}`
                            });
                        }
                    });
                }
            });
        }
    });
}

function deleteNationality(id) {
    Swal.fire({
        title: 'هل أنت متأكد؟',
        text: "لا يمكن التراجع عن هذا الإجراء!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'نعم، احذفها!',
        cancelButtonText: 'إلغاء'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: `nationalities/${id}`,
                type: "DELETE",
                data: {
                    "_token": "{{ csrf_token() }}"
                },
                success: function(response) {
                    window.location.reload();
                }
            });
        }
    });
}
</script>
@endsection
