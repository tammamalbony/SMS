<!-- resources/views/Tables/tableheaders.blade.php -->

@extends('layouts.app')

@section('content')
    <div class="container">
        <button class="btn btn-primary" onclick="showCreateModal()">إضافة رأس جدول</button>
        <table class="table">
            <thead>
                <tr>
                    <th>الاسم</th>
                    <th>الفصل</th>
                    <th>أقل ارتفاع</th>
                    <th>أقصى عرض</th>
                    <th>الهامش الأيسر</th>
                    <th>الإجراءات</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($tableheaders as $tableheader)
                    <tr>
                        {{-- @foreach ($tableheader->class->schoolYears as $schoolYear)
                            @foreach ($schoolYear->classsSchoolYears->where('classs_id', $tableheader->class->id) as $classsSchoolYear)
                                @dd($classsSchoolYear->parts)
                            @endforeach
                        @endforeach --}}

                        <td>{{ $tableheader->name }}</td>
                        <td>{{ $tableheader->class->class_name_ar }}</td>
                        <td>{{ $tableheader->min_height }}</td>
                        <td>{{ $tableheader->max_width }}</td>
                        <td>{{ $tableheader->left_margin }}</td>
                        <td>
                            <button class="btn btn-warning" onclick="showEditModal({{ $tableheader->id }})">تعديل</button>
                            <button class="btn btn-danger" onclick="deleteTableheader({{ $tableheader->id }})">حذف</button>
                            <a href="{{ route('columns.index', ['tableheader_id' => $tableheader->id]) }}"
                                class="btn btn-success">إضافة عمود</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        {{ $tableheaders->links() }}
    </div>

    <script>
        function showCreateModal() {
            Swal.fire({
                title: 'إضافة رأس جدول',
                html: `
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <label for="name">الاسم</label>
                        <input type="text" id="name" class="form-control" placeholder="الاسم">
                    </div>
                    <div class="col-md-6">
                        <label for="class_id">الفصل</label>
                        <select id="class_id" class="form-control">
                            @foreach ($classes as $class)
                                <option value="{{ $class->id }}">{{ $class->class_name_ar }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="min_height">أقل ارتفاع</label>
                        <input type="number" id="min_height" class="form-control" placeholder="أقل ارتفاع">
                    </div>
                    <div class="col-md-6">
                        <label for="max_width">أقصى عرض</label>
                        <input type="number" id="max_width" class="form-control" placeholder="أقصى عرض">
                    </div>
                    <div class="col-md-6">
                        <label for="left_margin">الهامش الأيسر</label>
                        <input type="number" id="left_margin" class="form-control" placeholder="الهامش الأيسر">
                    </div>
                </div>
            </div>
        `,
                focusConfirm: false,
                preConfirm: () => {
                    return {
                        name: document.getElementById('name').value,
                        class_id: document.getElementById('class_id').value,
                        min_height: document.getElementById('min_height').value,
                        max_width: document.getElementById('max_width').value,
                        left_margin: document.getElementById('left_margin').value
                    }
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '{{ route('tableheaders.store') }}',
                        type: 'POST',
                        data: {
                            _token: '{{ csrf_token() }}',
                            ...result.value
                        },
                        success: (response) => {
                            if (response.success) {
                                Swal.fire('نجاح', 'تم إنشاء رأس الجدول بنجاح', 'success').then(() => {
                                    location.reload();
                                });
                            }
                        },
                        error: (response) => {
                            Swal.fire('خطأ', 'حدث خطأ أثناء إنشاء رأس الجدول', 'error');
                        }
                    });
                }
            });
        }

        function showEditModal(id) {
            $.get('{{ url('tableheaders') }}/' + id + '/edit', (data) => {
                Swal.fire({
                    title: 'تعديل رأس الجدول',
                    html: `
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="name">الاسم</label>
                            <input type="text" id="name" class="form-control" value="${data.name}">
                        </div>
                        <div class="col-md-6">
                            <label for="class_id">الفصل</label>
                            <select id="class_id" class="form-control">
                                @foreach ($classes as $class)
                                    <option value="{{ $class->id }}" ${data.class_id == {{ $class->id }} ? 'selected' : ''}>{{ $class->class_name_ar }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="min_height">أقل ارتفاع</label>
                            <input type="number" id="min_height" class="form-control" value="${data.min_height}">
                        </div>
                        <div class="col-md-6">
                            <label for="max_width">أقصى عرض</label>
                            <input type="number" id="max_width" class="form-control" value="${data.max_width}">
                        </div>
                        <div class="col-md-6">
                            <label for="left_margin">الهامش الأيسر</label>
                            <input type="number" id="left_margin" class="form-control" value="${data.left_margin}">
                        </div>
                    </div>
                </div>
            `,
                    focusConfirm: false,
                    preConfirm: () => {
                        return {
                            name: document.getElementById('name').value,
                            class_id: document.getElementById('class_id').value,
                            min_height: document.getElementById('min_height').value,
                            max_width: document.getElementById('max_width').value,
                            left_margin: document.getElementById('left_margin').value
                        }
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ url('tableheaders') }}/' + id,
                            type: 'PUT',
                            data: {
                                _token: '{{ csrf_token() }}',
                                ...result.value
                            },
                            success: (response) => {
                                if (response.success) {
                                    Swal.fire('نجاح', 'تم تعديل رأس الجدول بنجاح', 'success')
                                        .then(() => {
                                            location.reload();
                                        });
                                }
                            },
                            error: (response) => {
                                Swal.fire('خطأ', 'حدث خطأ أثناء تعديل رأس الجدول', 'error');
                            }
                        });
                    }
                });
            });
        }

        function deleteTableheader(id) {
            Swal.fire({
                title: 'هل أنت متأكد؟',
                text: "لن تتمكن من التراجع عن هذا!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'نعم، احذفه!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '{{ url('tableheaders') }}/' + id,
                        type: 'DELETE',
                        data: {
                            _token: '{{ csrf_token() }}'
                        },
                        success: (response) => {
                            if (response.success) {
                                Swal.fire('تم الحذف!', 'تم حذف رأس الجدول بنجاح.', 'success').then(
                            () => {
                                    location.reload();
                                });
                            }
                        },
                        error: (response) => {
                            Swal.fire('خطأ', 'حدث خطأ أثناء حذف رأس الجدول', 'error');
                        }
                    });
                }
            });
        }
    </script>
@endsection
