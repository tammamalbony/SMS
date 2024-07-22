@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">كتب الصف: {{ $class->class_name_ar }}</h1>

    <button type="button" class="btn btn-primary mb-3" onclick="showBookModal()">
        إضافة كتاب
    </button>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>عنوان الكتاب</th>
                <th>الصف الدراسي</th>
                <th>رابط الكتاب الأول</th>
                <th>رابط الكتاب الثاني</th>
                <th>العمليات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($books as $book)
            <tr>
                <td>{{ $book->id }}</td>
                <td>{{ $book->title }}</td>
                <td>{{ $book->class->class_name_ar }}</td>
                <td><a href="{{ $book->url1 }}" target="_blank">رابط الكتاب الأول</a></td>
                <td><a href="{{ $book->url2 }}" target="_blank">رابط الكتاب الثاني</a></td>
                <td>
                    @if($book->url3)
                        <a class="btn btn-dark" href="{{ asset('storage/' . $book->url3) }}" target="_blank" title="تحميل الملف"><i class="fa fa-download"></i></a>
                    @endif
                    <button class="btn btn-info btn-sm" title="تعديل الكتاب" onclick="showBookModal({{ $book->id }}, '{{ $book->title }}', '{{ $book->url1 }}', '{{ $book->url2 }}')">
                        <i class="fa fa-edit"></i>
                    </button>
                    <button class="btn btn-danger btn-sm" title="حذف الكتاب" onclick="confirmDelete({{ $book->id }})">
                        <i class="fa fa-trash"></i>
                    </button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    {{ $books->links() }}
</div>

<script>
    function showBookModal(id = null, title = '', url1 = '', url2 = '') {
        Swal.fire({
            title: id ? 'تعديل كتاب' : 'إضافة كتاب',
            html: `
                <input type="hidden" id="book_id" value="${id}">
                <div class="mb-3">
                    <label for="title" class="form-label">عنوان الكتاب:</label>
                    <input type="text" class="form-control" id="title" value="${title}">
                </div>
                <div class="mb-3">
                    <label for="url1" class="form-label">رابط الكتاب الأول:</label>
                    <input type="text" class="form-control" id="url1" value="${url1}">
                </div>
                <div class="mb-3">
                    <label for="url2" class="form-label">رابط الكتاب الثاني:</label>
                    <input type="text" class="form-control" id="url2" value="${url2}">
                </div>
                <div class="mb-3">
                    <label for="url3" class="form-label">رفع الكتاب الثالث:</label>
                    <input type="file" class="form-control" id="url3">
                </div>
            `,
            showCancelButton: true,
            confirmButtonText: 'حفظ البيانات',
            preConfirm: () => {
                const title = Swal.getPopup().querySelector('#title').value;
                const url1 = Swal.getPopup().querySelector('#url1').value;
                const url2 = Swal.getPopup().querySelector('#url2').value;
                const url3 = Swal.getPopup().querySelector('#url3').files[0];
                const book_id = Swal.getPopup().querySelector('#book_id').value;

                if (!title) {
                    Swal.showValidationMessage(`يرجى تعبئة عنوان الكتاب`);
                }

                return { book_id, title, url1, url2, url3 };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const { book_id, title, url1, url2, url3 } = result.value;
                saveBook(book_id, title, url1, url2, url3);
            }
        });
    }

    function saveBook(book_id, title, url1, url2, url3) {
        const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const classId = '{{ $class->id }}';
        // alert(book_id);
        const url = book_id != "null" ? `/classes/${classId}/books/${book_id}/update` : `/classes/${classId}/books/store`;
        const method = 'POST';

        const formData = new FormData();
        formData.append('title', title);
        formData.append('url1', url1);
        formData.append('url2', url2);
        if (url3) {
            formData.append('url3', url3);
        }
        formData.append('_method', method);
        formData.append('_token', token);

        fetch(url, {
            method: 'POST',
            body: formData,
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
                const classId = '{{ $class->id }}';
                const url = `/classes/${classId}/books/${id}/delete`;
                
                fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': token
                    },
                    body: JSON.stringify({ _method: 'DELETE' })
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
