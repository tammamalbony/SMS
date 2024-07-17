@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>تقديرات العلامات</h1>
        
        <button class="btn btn-primary" onclick="openCreateModal()">إضافة تقدير علامة</button>
        
        <table class="table mt-3">
            <thead>
                <tr>
                    <th>المعرف</th>
                    <th>العلامة الدنيا</th>
                    <th>العلامة العليا</th>
                    <th>النتيجة</th>
                    <th>اللون</th>
                    <th>الإجراءات</th>
                </tr>
            </thead>
            <tbody>
                @foreach($markReviews as $review)
                    <tr style="background-color: {{ $review->color }}">
                        <td>{{ $review->id }}</td>
                        <td>{{ $review->min_mark }}</td>
                        <td>{{ $review->max_mark }}</td>
                        <td>{{ $review->result }}</td>
                        <td>{{ $review->color }}</td>
                        <td>
                            <button class="btn btn-sm btn-warning" onclick="openEditModal({{ $review }})">تعديل</button>
                            <button class="btn btn-sm btn-danger" onclick="confirmDelete({{ $review->id }})">حذف</button>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <!-- إنشاء/تعديل نافذة -->
    <div class="modal" id="markReviewModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="markReviewForm" method="POST">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitle">إضافة تقدير علامة</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="_method" id="formMethod" value="POST">
                        <div class="form-group">
                            <label for="min_mark">العلامة الدنيا</label>
                            <input type="number" step="0.01" class="form-control" id="min_mark" name="min_mark" required>
                        </div>
                        <div class="form-group">
                            <label for="max_mark">العلامة العليا</label>
                            <input type="number" step="0.01" class="form-control" id="max_mark" name="max_mark" required>
                        </div>
                        <div class="form-group">
                            <label for="result">النتيجة</label>
                            <input type="text" class="form-control" id="result" name="result" required>
                        </div>
                        <div class="form-group">
                            <label for="color">اللون</label>
                            <input type="color" class="form-control" id="color" name="color" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">إغلاق</button>
                        <button type="submit" class="btn btn-primary" id="saveButton">حفظ التغييرات</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
        function openCreateModal() {
            $('#markReviewForm').attr('action', '{{ route('mark_reviews.store') }}');
            $('#formMethod').val('POST');
            $('#modalTitle').text('إضافة مراجعة علامة');
            $('#markReviewForm')[0].reset();
            $('#markReviewModal').modal('show');
        }

        function openEditModal(review) {
            $('#markReviewForm').attr('action', '/mark_reviews/' + review.id);
            $('#formMethod').val('PUT');
            $('#modalTitle').text('تعديل مراجعة علامة');
            $('#min_mark').val(review.min_mark);
            $('#max_mark').val(review.max_mark);
            $('#result').val(review.result);
            $('#color').val(review.color);
            $('#markReviewModal').modal('show');
        }

        function confirmDelete(id) {
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
                        url: '/mark_reviews/' + id,
                        type: 'DELETE',
                        data: {
                            _token: '{{ csrf_token() }}',
                        },
                        success: function() {
                            Swal.fire(
                                'تم الحذف!',
                                'تم حذف مراجعة العلامة بنجاح.',
                                'success'
                            ).then(() => {
                                location.reload();
                            });
                        }
                    });
                }
            });
        }
    </script>
@endsection
