@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">كتب الطالب: {{ $verifiedStudent->student->first_name }} {{ $verifiedStudent->student->last_name }}</h1>
    <h2 class="mb-4">الصف: {{ $verifiedStudent->section->classsSchoolYear->classs->class_name_ar  }}</h2>

    <div class="row justify-content-between">
        <button type="button" class="btn btn-primary mb-3" onclick="showBookModal()">
            إضافة كتاب
        </button>
        <div class="alert alert-info">
            حالة الكتب: {{ $booksStatus }}
        </div>
    </div>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>عنوان الكتاب</th>
                <th>الصف الدراسي</th>
                <th>العمليات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($books as $book)
            <tr>
                <td>{{ $book->id }}</td>
                <td>{{ $book->title }}</td>
                <td>{{ $book->class->class_name_ar }}</td>
                <td>
                    {{-- <button class="btn btn-info btn-sm" title="تعديل الكتاب" onclick="showBookModal({{ $book->id }}, '{{ $book->title }}')">
                        <i class="fa fa-edit"></i>
                    </button> --}}
                    <button class="btn btn-danger btn-sm" title="حذف الكتاب" onclick="confirmDelete({{ $book->id }})">
                        <i class="fa fa-trash"></i>
                    </button>
                    @if($book->url1)
                    <a  class="btn btn-dark" href="{{ $book->url1 }}" target="_blank">رابط الأول</a>
                    @endif
                    @if($book->url2)
                    <a  class="btn btn-dark" href="{{ $book->url2 }}" target="_blank">رابط الثاني</a>
                    @endif
                    @if($book->url3)
                    <a class="btn btn-dark" href="{{ $book->url3 }}" target="_blank"><i class="fa fa-download"></i></a>
                    @endif
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    {{ $books->links() }}
</div>

<script>
    function showBookModal(id = null, title = '') {
        const sectionBooks = @json($sectionBooks);

        let options = '<option value="">اختر كتاب</option>';
        sectionBooks.forEach(book => {
            options += `<option value="${book.id}" ${id == book.id ? 'selected' : ''}>${book.title}</option>`;
        });

        Swal.fire({
            title: id ? 'تعديل كتاب' : 'إضافة كتاب',
            html: `
                <input type="hidden" id="book_id" value="${id}">
                <div class="mb-3">
                    <label for="book_select" class="form-label">اختر كتاب:</label>
                    <select id="book_select" class="form-select">${options}</select>
                </div>
            `,
            showCancelButton: true,
            confirmButtonText: 'حفظ البيانات',
            preConfirm: () => {
                const book_id = Swal.getPopup().querySelector('#book_select').value;
                const current_book_id = Swal.getPopup().querySelector('#book_id').value;

                if (!book_id) {
                    Swal.showValidationMessage(`يرجى اختيار كتاب`);
                }

                return { current_book_id, book_id };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const { current_book_id, book_id } = result.value;
                saveBook(current_book_id, book_id);
            }
        });
    }

    function saveBook(current_book_id, book_id) {
        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const verifiedStudentId = '{{ $verifiedStudent->id }}';
        const url = current_book_id !== "null" ? `/verified-students/${verifiedStudentId}/books/${current_book_id}/update` : `/verified-students/${verifiedStudentId}/books/store`;
        const method = 'POST';

        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': token
            },
            body: JSON.stringify({ book_id, _method: method })
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
                const url = `/verified-students/${verifiedStudentId}/books/${id}/delete`;
                
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
