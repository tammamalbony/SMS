@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">المدارس</h1>
    <button class="btn btn-primary mb-3" id="addInstitution">إضافة مدرسة</button>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>الاسم</th>
                <th>العنوان</th>
                <th>رقم الجوال</th>
                <th>رقم الهاتف</th>
                <th>ملاحظة</th>
                <th>الدولة</th>
                <th>المحافظة</th>
                <th>العمليات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($institutions as $institution)
            <tr>
                <td>{{ $institution->id }}</td>
                <td>{{ $institution->name }}</td>
                <td>{{ $institution->address }}</td>
                <td>{{ $institution->mobile }}</td>
                <td>{{ $institution->telephone }}</td>
                <td>{{ $institution->note }}</td>
                <td>{{ $institution->governate->country->name }}</td>
                <td>{{ $institution->governate->name }}</td>
                <td>
                    <button class="btn btn-info btn-sm edit-button" data-id="{{ $institution->id }}">تعديل</button>
                    <button class="btn btn-danger btn-sm delete-button" data-id="{{ $institution->id }}">حذف</button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
    {{ $institutions->links() }}
</div>

<script>
    $(document).ready(function() {
        $('#addInstitution').on('click', function() {
            Swal.fire({
                title: 'إضافة مدرسة',
                html: `
                    <div class="container">
                        <div class="row mb-3">
                            <div class="col">
                                <label for="name">اسم المدرسة:</label>
                                <input type="text" id="name" class="form-control" placeholder="اسم المدرسة">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="address">العنوان:</label>
                                <input type="text" id="address" class="form-control" placeholder="العنوان">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="mobile">رقم الجوال:</label>
                                <input type="text" id="mobile" class="form-control" placeholder="رقم الجوال">
                            </div>
                            <div class="col">
                                <label for="telephone">رقم الهاتف:</label>
                                <input type="text" id="telephone" class="form-control" placeholder="رقم الهاتف">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="note">ملاحظة:</label>
                                <textarea id="note" class="form-control" placeholder="ملاحظة"></textarea>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="country_id">الدولة:</label>
                                <select id="country_id" class="form-control">
                                    <option value="">اختر الدولة</option>
                                    @foreach(\App\Models\Country::all() as $country)
                                        <option value="{{ $country->id }}">{{ $country->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="governate_id">المحافظة:</label>
                                <select id="governate_id" class="form-control" disabled>
                                    <option value="">اختر المحافظة</option>
                                </select>
                            </div>
                        </div>
                    </div>
                `,
                confirmButtonText: 'حفظ البيانات',
                showCancelButton: true,
                cancelButtonText: 'إلغاء',
                preConfirm: () => {
                    const name = Swal.getPopup().querySelector('#name').value;
                    const address = Swal.getPopup().querySelector('#address').value;
                    const mobile = Swal.getPopup().querySelector('#mobile').value;
                    const telephone = Swal.getPopup().querySelector('#telephone').value;
                    const note = Swal.getPopup().querySelector('#note').value;
                    const country_id = Swal.getPopup().querySelector('#country_id').value;
                    const governate_id = Swal.getPopup().querySelector('#governate_id').value;
                    if (!name || !address || !mobile || !country_id || !governate_id) {
                        Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                    }
                    return { name, address, mobile, telephone, note, country_id, governate_id };
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '{{ route('institutions.store') }}',
                        method: 'POST',
                        data: {
                            _token: '{{ csrf_token() }}',
                            name: result.value.name,
                            address: result.value.address,
                            mobile: result.value.mobile,
                            telephone: result.value.telephone,
                            note: result.value.note,
                            governate_id: result.value.governate_id,
                        },
                        success: function(response) {
                            if (response.success) {
                                Swal.fire('تم الإضافة!', 'تم إضافة المدرسة بنجاح.', 'success').then(() => {
                                    location.reload();
                                });
                            } else {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء إضافة المدرسة.', 'error');
                            }
                        }
                    });
                }
            });

            $('#country_id').on('change', function() {
                var countryId = $(this).val();
                if (countryId) {
                    $.ajax({
                        url: '/countries/' + countryId + '/governatesGetjson',
                        method: 'GET',
                        success: function(data) {
                            var governateSelect = $('#governate_id');
                            governateSelect.empty().append('<option value="">اختر المحافظة</option>');
                            data.forEach(function(governate) {
                                governateSelect.append('<option value="' + governate.id + '">' + governate.name + '</option>');
                            });
                            governateSelect.prop('disabled', false);
                        }
                    });
                } else {
                    $('#governate_id').empty().append('<option value="">اختر المحافظة</option>').prop('disabled', true);
                }
            });
        });

        $('.edit-button').on('click', function() {
            var institutionId = $(this).data('id');
            var governateID ;
            $.ajax({
                url: '/institutions/' + institutionId + '/edit',
                method: 'GET',
                success: function(data) {
                    governateID = data.governate_id;
                    Swal.fire({
                        title: 'تعديل مدرسة',
                        html: `
                            <div class="container">
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="name">اسم المدرسة:</label>
                                        <input type="text" id="name" class="form-control" value="${data.name}">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="address">العنوان:</label>
                                        <input type="text" id="address" class="form-control" value="${data.address}">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="mobile">رقم الجوال:</label>
                                        <input type="text" id="mobile" class="form-control" value="${data.mobile}">
                                    </div>
                                    <div class="col">
                                        <label for="telephone">رقم الهاتف:</label>
                                        <input type="text" id="telephone" class="form-control" value="${data.telephone}">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="note">ملاحظة:</label>
                                        <textarea id="note" class="form-control">${data.note}</textarea>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="country_id">الدولة:</label>
                                        <select id="country_id" class="form-control">
                                            <option value="">اختر الدولة</option>
                                            @foreach(\App\Models\Country::all() as $country)
                                                <option value="{{ $country->id }}" ${data.governate.country_id == {{ $country->id }} ? 'selected' : ''}>{{ $country->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="governate_id">المحافظة:</label>
                                        <select id="governate_id" class="form-control">
                                            <option value="">اختر المحافظة</option>
                                            <option value="${data.governate_id}" selected >${data.governate.name}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        `,
                        confirmButtonText: 'حفظ البيانات',
                        showCancelButton: true,
                        cancelButtonText: 'إلغاء',
                        preConfirm: () => {
                            const name = Swal.getPopup().querySelector('#name').value;
                            const address = Swal.getPopup().querySelector('#address').value;
                            const mobile = Swal.getPopup().querySelector('#mobile').value;
                            const telephone = Swal.getPopup().querySelector('#telephone').value;
                            const note = Swal.getPopup().querySelector('#note').value;
                            const country_id = Swal.getPopup().querySelector('#country_id').value;
                            const governate_id = Swal.getPopup().querySelector('#governate_id').value;
                            if (!name || !address || !mobile || !country_id || !governate_id) {
                                Swal.showValidationMessage(`الرجاء إدخال جميع الحقول المطلوبة`);
                            }
                            return { name, address, mobile, telephone, note, country_id, governate_id };
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url: '/institutions/' + institutionId,
                                method: 'PUT',
                                data: {
                                    _token: '{{ csrf_token() }}',
                                    name: result.value.name,
                                    address: result.value.address,
                                    mobile: result.value.mobile,
                                    telephone: result.value.telephone,
                                    note: result.value.note,
                                    governate_id: result.value.governate_id,
                                },
                                success: function(response) {
                                    if (response.success) {
                                        Swal.fire('تم التعديل!', 'تم تعديل المدرسة بنجاح.', 'success').then(() => {
                                            location.reload();
                                        });
                                    } else {
                                        Swal.fire('خطأ!', 'حدث خطأ أثناء تعديل المدرسة.', 'error');
                                    }
                                }
                            });
                        }
                    });

                    $('#country_id').on('change', function() {
                        var countryId = $(this).val();
                        if (countryId) {
                            $.ajax({
                                url: '/countries/' + countryId + '/governatesGetjson',
                                method: 'GET',
                                success: function(data) {
                                    var governateSelect = $('#governate_id');
                                    governateSelect.empty().append('<option value="">اختر المحافظة</option>');
                                    data.forEach(function(governate) {
                                        var htmlsub = `<option value="${ governate.id }" ${governateID == governate.id   && governateID > 0 ? 'selected' : ''}>${ governate.name }</option>`
                                        governateSelect.append(htmlsub);
                                    });
                                    governateSelect.prop('disabled', false);
                                }
                            });
                        } else {
                            $('#governate_id').empty().append('<option value="">اختر المحافظة</option>').prop('disabled', true);
                        }
                    });

                    $('#country_id').trigger('change');
                }
            });
        });

        $('.delete-button').on('click', function() {
            var institutionId = $(this).data('id');
            Swal.fire({
                title: 'هل أنت متأكد?',
                text: "لن تتمكن من التراجع عن هذا!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'نعم, احذفه!',
                cancelButtonText: 'إلغاء'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '/institutions/' + institutionId,
                        type: 'DELETE',
                        data: {
                            _token: '{{ csrf_token() }}'
                        },
                        success: function(response) {
                            if (response.success) {
                                Swal.fire('تم الحذف!', 'تم حذف المدرسة بنجاح.', 'success').then(() => {
                                    location.reload();
                                });
                            } else {
                                Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المدرسة.', 'error');
                            }
                        },
                        error: function(response) {
                            Swal.fire('خطأ!', 'حدث خطأ أثناء حذف المدرسة.', 'error');
                        }
                    });
                }
            });
        });
    });
</script>
@endsection
