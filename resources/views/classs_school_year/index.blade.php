@extends('layouts.app')

@section('content')
<div class="container">
    <h1>العلاقات بين الصفوف والسنوات الدراسية - السنة الدراسية: {{ $schoolYear->name }}</h1>
    <button class="btn btn-primary" id="addNew">إضافة علاقة جديدة</button>
    <button class="btn btn-success" id="addAllClasses">إضافة جميع الصفوف للسنة الدراسية</button>
    <table class="table table-bordered mt-3">
        <thead>
            <tr>
                <th>المعرف</th>
                <th>اسم الصف</th>
                <th>السنة الدراسية</th>
                <th>الإجراءات</th>
            </tr>
        </thead>
        <tbody id="relationshipsTable">
            @foreach($classsSchoolYears as $relation)
            <tr id="relation-{{ $relation->id }}">
                <td>{{ $relation->id }}</td>
                <td>{{ $relation->classs->class_name_ar }}</td>
                <td>{{ $relation->schoolYear->name }}</td>
                <td>
                    <button class="btn btn-warning editButton" data-id="{{ $relation->id }}">تعديل</button>
                    <button class="btn btn-danger deleteButton" data-id="{{ $relation->id }}">حذف</button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<script>
$(document).ready(function() {
    $('#addNew').click(function() {
        showFormModal('إضافة علاقة جديدة', null);
    });

    $('.editButton').click(function() {
        var id = $(this).data('id');
        $.get('/classs_school_year/' + id + '/edit', function(data) {
            showFormModal('تعديل العلاقة', data);
        });
    });
    $('#addAllClasses').click(function() {
        Swal.fire({
            title: 'هل أنت متأكد؟',
            text: "سيتم إضافة جميع الصفوف إلى هذه السنة الدراسية.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'نعم، أضفهم!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '{{ route('classs_school_year.add_all_classes', $schoolYear->id) }}',
                    type: 'POST',
                    data: {
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        Swal.fire(
                            'تم بنجاح!',
                            'تمت إضافة جميع الصفوف للسنة الدراسية بنجاح.',
                            'success'
                        ).then(() => {
                            location.reload();
                        });
                    },
                    error: function(response) {
                        Swal.fire(
                            'خطأ!',
                            'حدث خطأ أثناء إضافة جميع الصفوف للسنة الدراسية.',
                            'error'
                        );
                    }
                });
            }
        });
    });
    $('.deleteButton').click(function() {
        var id = $(this).data('id');
        Swal.fire({
            title: 'هل أنت متأكد؟',
            text: "لن تتمكن من التراجع عن هذا!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'نعم، احذفه!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '/classs_school_year/' + id,
                    type: 'DELETE',
                    data: {
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        $('#relation-' + id).remove();
                        Swal.fire(
                            'تم الحذف!',
                            'تم حذف العلاقة بنجاح.',
                            'success'
                        );
                    },
                    error: function(response) {
                        Swal.fire(
                            'خطأ!',
                            'حدث خطأ أثناء حذف العلاقة.',
                            'error'
                        );
                    }
                });
            }
        });
    });

    function showFormModal(title, data) {
        Swal.fire({
            title: title,
            html: `
                <form id="relationshipForm">
                    @csrf
                    <input type="hidden" id="relationshipId" name="relationshipId" value="${data ? data.id : ''}">
                    <div class="form-group">
                        <label for="classs_id">الصف</label>
                        <select name="classs_id" id="classs_id" class="form-control">
                            @foreach($classes as $classs)
                                <option value="{{ $classs->id }}" ${data && data.classs_id == {{ $classs->id }} ? 'selected' : ''}>{{ $classs->class_name_en }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="school_year_id">السنة الدراسية</label>
                        <select name="school_year_id" id="school_year_id" class="form-control" disabled>
                            <option value="{{ $schoolYear->id }}" selected>{{ $schoolYear->name }}</option>
                        </select>
                    </div>
                </form>
            `,
            showCancelButton: true,
            confirmButtonText: 'حفظ التغييرات',
            cancelButtonText: 'إغلاق',
            preConfirm: () => {
                var id = $('#relationshipId').val();
                var method = id ? 'PUT' : 'POST';
                var url = id ? '/classs_school_year/' + id : '/school-years/{{ $schoolYear->id }}/classs-school-years';
                return $.ajax({
                    url: url,
                    type: method,
                    data: $('#relationshipForm').serialize(),
                    success: function(response) {
                        Swal.fire(
                            'تم بنجاح!',
                            'تم حفظ العلاقة بنجاح.',
                            'success'
                        ).then(() => {
                            location.reload();
                        });
                    },
                    error: function(response) {
                        Swal.fire(
                            'خطأ!',
                            'حدث خطأ أثناء حفظ العلاقة.',
                            'error'
                        );
                    }
                });
            }
        });
    }
});
</script>
@endsection
