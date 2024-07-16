@extends('layouts.app')

@section('content')
<div class="container">
    <h1>أنواع الدم</h1>
    <button onclick="createBloodType()" class="btn btn-primary">إضافة نوع دم جديد</button>
    <table class="table table-bordered table-striped mt-4">
        <thead>
            <tr>
                <th>الرقم</th>
                <th>النوع</th>
                <th>الإجراءات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($bloodTypes as $bloodType)
            <tr>
                <td>{{ $bloodType->id }}</td>
                <td>{{ $bloodType->type }}</td>
                <td>
                    <button onclick="editBloodType({{ $bloodType->id }})" class="btn btn-warning">تعديل</button>
                    <button onclick="deleteBloodType({{ $bloodType->id }})" class="btn btn-danger">حذف</button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>


<script>
function createBloodType() {
    Swal.fire({
        title: 'إضافة نوع دم جديد',
        html: `<input type="text" id="blood_type" class="swal2-input" placeholder="Type">`,
        confirmButtonText: 'حفظ',
        focusConfirm: false,
        preConfirm: () => {
            const type = Swal.getPopup().querySelector('#blood_type').value;
            if (!type) {
                Swal.showValidationMessage(`Please enter blood type`);
            }
            return { type: type };
        }
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "{{ route('blood_types.store') }}",
                type: "POST",
                data: {
                    "_token": "{{ csrf_token() }}",
                    "type": result.value.type,
                },
                success: function(response) {
                    window.location.reload();
                },
                error: function(xhr) {
                            let message = xhr.responseJSON.message;
                            let errors = xhr.responseJSON.errors;
                            let errorMessages = [];
                            for (let key in errors) {
                                errorMessages.push(errors[key]);
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

function editBloodType(id) {
    $.ajax({
        url: "blood-types/" + id + "/edit",
        type: "POST",
        success: function(data) {
            Swal.fire({
                title: 'تعديل نوع الدم',
                html: `<input type="text" id="blood_type" class="swal2-input" value="${data.type}" placeholder="Type">`,
                confirmButtonText: 'تحديث',
                focusConfirm: false,
                preConfirm: () => {
                    const type = Swal.getPopup().querySelector('#blood_type').value;
                    if (!type) {
                        Swal.showValidationMessage(`Please enter blood type`);
                    }
                    return { type: type };
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: "blood-types/" + id,
                        type: "POST",
                        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        data: {
                            type: result.value.type,
                        },
                        success: function(response) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: 'Blood type updated successfully!',
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
                                errorMessages.push(errors[key]);
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


function deleteBloodType(id) {
    Swal.fire({
        title: 'هل أنت متأكد؟',
        text: "لا يمكن التراجع عن هذا الإجراء!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'نعم، احذفه!',
        cancelButtonText: 'إلغاء'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "blood-types/" + id,
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
