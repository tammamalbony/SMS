@extends('layouts.app')

@section('content')
<div class="container">
    <h2>الأعمدة لرأس الجدول: {{ $tableheader->name }}</h2>
    <button class="btn btn-primary" onclick="showCreateModal()">إضافة عمود</button>
    <h3>الأعمدة الابتدائية</h3>
    <table class="table">
        <thead>
            <tr>
                <th>الاسم</th>
                <th>اتجاه النص</th>
                <th>أقل عرض</th>
                <th>أقصى عرض للنص</th>
                <th>حجم الخط</th>
                <th>العمود الأب</th>
                <th>الفصل</th>
                <th>النهائي</th>
                <th>الإجراءات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($columns->where('is_primer', true) as $column)
            <tr>
                <td>{{ $column->name }}</td>
                <td>{{ $column->text_direction }}</td>
                <td>{{ $column->min_width }}</td>
                <td>{{ $column->max_text_width }}</td>
                <td>{{ $column->font_size }}</td>
                <td>{{ $column->parent ? $column->parent->name : 'لا يوجد' }}</td>
                <td>{{ $column->term ? $column->term->name : 'لا يوجد' }}</td>
                <td>{{ $column->is_final ? 'نعم' : 'لا' }}</td>
                <td>
                    <button class="btn btn-warning" onclick="showEditModal({{ $column->id }})">تعديل</button>
                    <button class="btn btn-danger" onclick="deleteColumn({{ $column->id }})">حذف</button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <h3>الأعمدة النهائية</h3>
    <table class="table">
        <thead>
            <tr>
                <th>الاسم</th>
                <th>اتجاه النص</th>
                <th>أقل عرض</th>
                <th>أقصى عرض للنص</th>
                <th>حجم الخط</th>
                <th>العمود الأب</th>
                <th>الفصل</th>
                <th>ابتدائي</th>
                <th>الإجراءات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($columns->where('is_active_for_finals', true) as $column)
            <tr>
                <td>{{ $column->name }}</td>
                <td>{{ $column->text_direction }}</td>
                <td>{{ $column->min_width }}</td>
                <td>{{ $column->max_text_width }}</td>
                <td>{{ $column->font_size }}</td>
                <td>{{ $column->parent ? $column->parent->name : 'لا يوجد' }}</td>
                <td>{{ $column->term ? $column->term->name : 'لا يوجد' }}</td>
                <td>{{ $column->is_primer ? 'نعم' : 'لا' }}</td>
                <td>
                    <button class="btn btn-warning" onclick="showEditModal({{ $column->id }})">تعديل</button>
                    <button class="btn btn-danger" onclick="deleteColumn({{ $column->id }})">حذف</button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <h3>باقي الأعمدة</h3>
    <table class="table">
        <thead>
            <tr>
                <th>الاسم</th>
                <th>اتجاه النص</th>
                <th>أقل عرض</th>
                <th>أقصى عرض للنص</th>
                <th>حجم الخط</th>
                <th>مفعل للنهائيات</th>
                <th>العمود الأب</th>
                <th>الفصل</th>
                <th>النهائي</th>
                <th>ابتدائي</th>
                <th>الإجراءات</th>
            </tr>
        </thead>
        <tbody>
            @foreach($columns->where('is_primer', false)->where('is_active_for_finals', false) as $column)
            <tr>
                <td>{{ $column->name }}</td>
                <td>{{ $column->text_direction }}</td>
                <td>{{ $column->min_width }}</td>
                <td>{{ $column->max_text_width }}</td>
                <td>{{ $column->font_size }}</td>
                <td>{{ $column->is_active_for_finals ? 'نعم' : 'لا' }}</td>
                <td>{{ $column->parent ? $column->parent->name : 'لا يوجد' }}</td>
                <td>{{ $column->term ? $column->term->name : 'لا يوجد' }}</td>
                <td>{{ $column->is_final ? 'نعم' : 'لا' }}</td>
                <td>{{ $column->is_primer ? 'نعم' : 'لا' }}</td>
                <td>
                    <button class="btn btn-warning" onclick="showEditModal({{ $column->id }})">تعديل</button>
                    <button class="btn btn-danger" onclick="deleteColumn({{ $column->id }})">حذف</button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
    {{ $columns->links() }}
</div>

<script>
function showCreateModal() {
    Swal.fire({
        title: 'إضافة عمود',
        html: `
            <div class="container">
                <div class="row">
                    <input type="hidden" id="tableheader_id" value="{{ $tableheader->id }}">
                    <div class="col-md-6">
                        <label for="name">الاسم</label>
                        <input type="text" id="name" class="form-control" placeholder="الاسم">
                    </div>
                    <div class="col-md-6">
                        <label for="text_direction">اتجاه النص</label>
                        <select id="text_direction" class="form-control">
                            <option value="vertical">رأسي</option>
                            <option value="horizontal">أفقي</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="min_width">أقل عرض</label>
                        <input type="number" id="min_width" class="form-control" placeholder="أقل عرض">
                    </div>
                    <div class="col-md-6">
                        <label for="max_text_width">أقصى عرض للنص</label>
                        <input type="number" id="max_text_width" class="form-control" placeholder="أقصى عرض للنص">
                    </div>
                    <div class="col-md-6">
                        <label for="font_size">حجم الخط</label>
                        <input type="number" id="font_size" class="form-control" placeholder="حجم الخط">
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mb-0 mt-1 custom-switches-stacked">
                            <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                <input type="hidden" id="is_active_for_finals_hidden" name="is_active_for_finals" value="0">
                                <input type="checkbox" id="is_active_for_finals" name="is_active_for_finals" value="1" class="custom-switch-input"/>
                                <span class="custom-switch-indicator"></span>
                                <label class="custom-switch-description mb-0 cursor-pointer" for="is_active_for_finals">مفعل للنهائيات</label>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label for="parent_id">العمود الأب</label>
                        <select id="parent_id" class="form-control">
                            <option value="">لا يوجد</option>
                            @foreach($columns as $column)
                                <option value="{{ $column->id }}">{{ $column->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label for="term_id">الفصل</label>
                        <select id="term_id" class="form-control">
                            <option value="">اختر الفصل</option>
                            @foreach ($terms as $term)
                                <option value="{{ $term->id }}">{{ $term->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mb-0 mt-1 custom-switches-stacked">
                            <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                <input type="hidden" id="is_final_hidden" name="is_final" value="0">
                                <input type="checkbox" id="is_final" name="is_final" value="1" class="custom-switch-input"/>
                                <span class="custom-switch-indicator"></span>
                                <label class="custom-switch-description mb-0 cursor-pointer" for="is_final">النهائي</label>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mb-0 mt-1 custom-switches-stacked">
                            <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                <input type="hidden" id="is_primer_hidden" name="is_primer" value="0">
                                <input type="checkbox" id="is_primer" name="is_primer" value="1" class="custom-switch-input"/>
                                <span class="custom-switch-indicator"></span>
                                <label class="custom-switch-description mb-0 cursor-pointer" for="is_primer">ابتدائي</label>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        `,
        focusConfirm: false,
        preConfirm: () => {
            return {
                name: document.getElementById('name').value,
                text_direction: document.getElementById('text_direction').value,
                min_width: document.getElementById('min_width').value,
                max_text_width: document.getElementById('max_text_width').value,
                font_size: document.getElementById('font_size').value,
                is_active_for_finals: document.getElementById('is_active_for_finals').checked ? 1 : 0,
                tableheader_id: document.getElementById('tableheader_id').value,
                parent_id: document.getElementById('parent_id').value,
                term_id: document.getElementById('term_id').value,
                is_final: document.getElementById('is_final').checked ? 1 : 0,
                is_primer: document.getElementById('is_primer').checked ? 1 : 0
            }
        }
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '{{ route('columns.store') }}',
                type: 'POST',
                data: {
                    _token: '{{ csrf_token() }}',
                    ...result.value
                },
                success: (response) => {
                    if (response.success) {
                        Swal.fire('نجاح', 'تم إنشاء العمود بنجاح', 'success').then(() => {
                            location.reload();
                        });
                    }
                },
                error: (response) => {
                    Swal.fire('خطأ', 'حدث خطأ أثناء إنشاء العمود', 'error');
                }
            });
        }
    });
}

function showEditModal(id) {
    $.get('{{ url('columns') }}/' + id + '/edit', (data) => {
        Swal.fire({
            title: 'تعديل عمود',
            html: `
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="name">الاسم</label>
                            <input type="text" id="name" class="form-control" value="${data.name}">
                        </div>
                        <div class="col-md-6">
                            <label for="text_direction">اتجاه النص</label>
                            <select id="text_direction" class="form-control">
                                <option value="vertical" ${data.text_direction == 'vertical' ? 'selected' : ''}>رأسي</option>
                                <option value="horizontal" ${data.text_direction == 'horizontal' ? 'selected' : ''}>أفقي</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="min_width">أقل عرض</label>
                            <input type="number" id="min_width" class="form-control" value="${data.min_width}">
                        </div>
                        <div class="col-md-6">
                            <label for="max_text_width">أقصى عرض للنص</label>
                            <input type="number" id="max_text_width" class="form-control" value="${data.max_text_width}">
                        </div>
                        <div class="col-md-6">
                            <label for="font_size">حجم الخط</label>
                            <input type="number" id="font_size" class="form-control" value="${data.font_size}">
                        </div>
                        <div class="col-md-6 d-flex justify-content-center align-items-center">
                            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                    <input type="hidden" id="is_active_for_finals_hidden" name="is_active_for_finals" value="0">
                                    <input type="checkbox" id="is_active_for_finals" name="is_active_for_finals" value="1" class="custom-switch-input" ${data.is_active_for_finals ? 'checked' : ''}/>
                                    <span class="custom-switch-indicator"></span>
                                    <label class="custom-switch-description mb-0 cursor-pointer" for="is_active_for_finals">مفعل للنهائيات</label>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="parent_id">العمود الأب</label>
                            <select id="parent_id" class="form-control">
                                <option value="">لا يوجد</option>
                                @foreach($columns as $column)
                                    <option value="{{ $column->id }}" ${data.parent_id == {{ $column->id }} ? 'selected' : ''}>{{ $column->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-12">
                            <label for="term_id">الفصل</label>
                            <select id="term_id" class="form-control">
                                <option value="">اختر الفصل</option>
                                @foreach ($terms as $term)
                                    <option value="{{ $term->id }}" ${data.term_id == {{ $term->id }} ? 'selected' : ''}>{{ $term->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6 d-flex justify-content-center align-items-center">
                            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                    <input type="hidden" id="is_final_hidden" name="is_final" value="0">
                                    <input type="checkbox" id="is_final" name="is_final" value="1" class="custom-switch-input" ${data.is_final ? 'checked' : ''}/>
                                    <span class="custom-switch-indicator"></span>
                                    <label class="custom-switch-description mb-0 cursor-pointer" for="is_final">النهائي</label>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex justify-content-center align-items-center">
                            <div class="form-group mb-0 mt-1 custom-switches-stacked">
                                <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                    <input type="hidden" id="is_primer_hidden" name="is_primer" value="0">
                                    <input type="checkbox" id="is_primer" name="is_primer" value="1" class="custom-switch-input" ${data.is_primer ? 'checked' : ''}/>
                                    <span class="custom-switch-indicator"></span>
                                    <label class="custom-switch-description mb-0 cursor-pointer" for="is_primer">ابتدائي</label>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            `,
            focusConfirm: false,
            preConfirm: () => {
                return {
                    name: document.getElementById('name').value,
                    text_direction: document.getElementById('text_direction').value,
                    min_width: document.getElementById('min_width').value,
                    max_text_width: document.getElementById('max_text_width').value,
                    font_size: document.getElementById('font_size').value,
                    is_active_for_finals: document.getElementById('is_active_for_finals').checked ? 1 : 0,
                    tableheader_id: '{{ $tableheader->id }}',
                    parent_id: document.getElementById('parent_id').value,
                    term_id: document.getElementById('term_id').value,
                    is_final: document.getElementById('is_final').checked ? 1 : 0,
                    is_primer: document.getElementById('is_primer').checked ? 1 : 0
                }
            }
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '{{ url('columns') }}/' + id,
                    type: 'PUT',
                    data: {
                        _token: '{{ csrf_token() }}',
                        ...result.value
                    },
                    success: (response) => {
                        if (response.success) {
                            Swal.fire('نجاح', 'تم تعديل العمود بنجاح', 'success').then(() => {
                                location.reload();
                            });
                        }
                    },
                    error: (response) => {
                        Swal.fire('خطأ', 'حدث خطأ أثناء تعديل العمود', 'error');
                    }
                });
            }
        });
    });
}

function deleteColumn(id) {
    Swal.fire({
        title: 'هل أنت متأكد؟',
        text: "لن تتمكن من التراجع عن هذا!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'نعم، احذفه!'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '{{ url('columns') }}/' + id,
                type: 'DELETE',
                data: {
                    _token: '{{ csrf_token() }}'
                },
                success: (response) => {
                    if (response.success) {
                        Swal.fire('تم الحذف!', 'تم حذف العمود بنجاح.', 'success').then(() => {
                            location.reload();
                        });
                    }
                },
                error: (response) => {
                    Swal.fire('خطأ', 'حدث خطأ أثناء حذف العمود', 'error');
                }
            });
        }
    });
}
</script>
@endsection
