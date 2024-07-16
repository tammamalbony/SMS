@extends('layouts.app')

@section('content')
<div class="container">
    <h1>الديانات</h1>
    <button onclick="createReligion()" class="btn btn-primary">إضافة ديانة جديدة</button>
    <table class="table table-bordered table-striped mt-4">
        <thead>
            <tr>
                <th>الرقم</th>
                <th>الاسم</th>
                <th>الإجراءات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($religions as $religion)
            <tr>
                <td>{{ $religion->id }}</td>
                <td>{{ $religion->name }}</td>
                <td>
                    <button onclick="editReligion({{ $religion->id }})" class="btn btn-warning">تعديل</button>
                    <button onclick="deleteReligion({{ $religion->id }})" class="btn btn-danger">حذف</button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
function createReligion() {
    Swal.fire({
        title: 'إضافة ديانة جديدة',
        html: `<input type="text" id="religion_name" class="swal2-input" placeholder="اسم الديانة">`,
        confirmButtonText: 'حفظ',
        focusConfirm: false,
        preConfirm: () => {
            const name = Swal.getPopup().querySelector('#religion_name').value;
            if (!name) {
                Swal.showValidationMessage(`Please enter the religion name`);
            }
            return { name: name };
        }
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "{{ route('religions.store') }}",
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

function editReligion(id) {
    $.ajax({
        url: `religions/${id}/edit`,
        type: "POST",
        success: function(data) {
            Swal.fire({
                title: 'تعديل الديانة',
                html: `<input type="text" id="religion_name" class="swal2-input" value="${data.name}" placeholder="اسم الديانة">`,
                confirmButtonText: 'تحديث',
                focusConfirm: false,
                preConfirm: () => {
                    const name = Swal.getPopup().querySelector('#religion_name').value;
                    if (!name) {
                        Swal.showValidationMessage(`Please enter the religion name`);
                    }
                    return { name: name };
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: `religions/${id}`,
                        type: "POST",
                        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        data: {
                            "name": result.value.name,
                        },
                        success: function(response) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: 'Religion updated successfully!',
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

function deleteReligion(id) {
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
                url: `religions/${id}`,
                type: "POST",
                data: {
                    "_token": "{{ csrf_token() }}",
                      "_method": "DELETE"
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
