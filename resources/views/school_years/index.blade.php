@extends('layouts.app')

@section('content')
    <div class="container">
        <h1 class="mb-4">السنوات الدراسية</h1>

        <button type="button" class="btn btn-primary mb-3" onclick="showSchoolYearModal()">
            إضافة سنة دراسية
        </button>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>اسم السنة الدراسية</th>
                    <th>سنة البداية</th>
                    <th>سنة النهاية</th>
                    <th>نشطة</th>
                    <th>العمليات</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($schoolYears as $schoolYear)
                    <tr>
                        <td>{{ $schoolYear->id }}</td>
                        <td>{{ $schoolYear->name }}</td>
                        <td>{{ $schoolYear->start_year }}</td>
                        <td>{{ $schoolYear->end_year }}</td>
                        <td>{{ $schoolYear->is_active ? 'نعم' : 'لا' }}</td>
                        <td>
                            <button class="btn btn-info btn-sm"
                                onclick="showSchoolYearModal({{ $schoolYear->id }}, '{{ $schoolYear->name }}', {{ $schoolYear->start_year }}, {{ $schoolYear->end_year }}, {{ $schoolYear->is_active ? 1 : 0 }})">
                                <i class="fa fa-edit"></i>
                            </button>
                            <button class="btn btn-danger btn-sm" onclick="confirmDelete({{ $schoolYear->id }})">
                                <i class="fa fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        {{ $schoolYears->links() }}
    </div>

    <script>
        function showSchoolYearModal(id = null, name = '', start_year = '', end_year = '', is_active = 0) {
            Swal.fire({
                title: id ? 'تعديل سنة دراسية' : 'إضافة سنة دراسية',
                html: `
                <input type="hidden" id="school_year_id" value="${id}">
                <div class="mb-3">
                    <label for="name" class="form-label">اسم السنة الدراسية:</label>
                    <input type="text" class="form-control" id="name" value="${name}">
                </div>
                <div class="mb-3">
                    <label for="start_year" class="form-label">{{ trans('public.start_date') }}</label>
                    <div class="form-group">
                        <div class="input-group date" id="datetimepicker11" data-target-input="nearest">
                            <input type="text" id="start_year" class="form-control datetimepicker-input" name="start_year" data-target="#datetimepicker11">
                            <div class="input-group-append" data-target="#datetimepicker11" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="end_year" class="form-label">{{ trans('public.end_date') }}</label>
                    <div class="input-group">
                         <div class="input-group date" id="datetimepicker12" data-target-input="nearest">
                            <input type="text" id="end_year" class="form-control datetimepicker-input" name="end_year" data-target="#datetimepicker12">
                            <div class="input-group-append" data-target="#datetimepicker12" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-0 mt-1 custom-switches-stacked">
                    <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                        <input type="hidden" id="is_active_hidden" value="0">
                        <input type="checkbox" id="is_active" value="1" class="custom-switch-input" ${is_active == 1 ? 'checked' : ''}/>
                        <span class="custom-switch-indicator"></span>
                        <label class="custom-switch-description mb-0 cursor-pointer" for="is_active">{{ trans('public.active') }}</label>
                    </label>
                </div>
            `,
                showCancelButton: true,
                confirmButtonText: 'حفظ البيانات',
                preConfirm: () => {
                    const name = Swal.getPopup().querySelector('#name').value;
                    const start_year = Swal.getPopup().querySelector('#start_year').value;
                    const end_year = Swal.getPopup().querySelector('#end_year').value;
                    const is_active = Swal.getPopup().querySelector('#is_active').checked ? 1 : 0;
                    const school_year_id = Swal.getPopup().querySelector('#school_year_id').value;

                    if (!name || !start_year || !end_year) {
                        Swal.showValidationMessage(`Please fill all fields`);
                    }

                    return {
                        school_year_id,
                        name,
                        start_year,
                        end_year,
                        is_active
                    };
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    const {
                        school_year_id,
                        name,
                        start_year,
                        end_year,
                        is_active
                    } = result.value;
                    saveSchoolYear(school_year_id, name, start_year, end_year, is_active);
                }
            });
            // Initialize datetimepicker
            $('#datetimepicker11').datetimepicker({
                viewMode: 'years',
                autoclose: false,
                format: 'MM/YYYY'
            });
            $('#datetimepicker12').datetimepicker({
                viewMode: 'years',
                autoclose: false,
                format: 'MM/YYYY'
            });
        }

        function saveSchoolYear(school_year_id, name, start_year, end_year, is_active) {
            const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            const url = school_year_id != "null" ? `/school_years/${school_year_id}/update` : '/school_years/store';
            const method = 'POST';

            fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': token
                    },
                    body: JSON.stringify({
                        name,
                        start_year,
                        end_year,
                        is_active,
                        _method: method
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
                    const url = `/school_years/${id}/delete`;

                    fetch(url, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': token
                            },
                            body: JSON.stringify({
                                _method: 'POST'
                            })
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
