@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>إدارة الأجزاء</h1>
        @if (isset($yearClassSubjectId))
            <h3>الأجزاء لموضوع العام الدراسي ID: {{ $yearClassSubjectId }}</h3>
        @endif

        <button class="btn btn-primary" onclick="openCreateModal()">إضافة جزء جديد</button>

        <table class="table mt-3">
            <thead>
                <tr>
                    <th>المعرف</th>
                    <th>الاسم</th>
                    <th>القيمة</th>
                    <th>الإجراءات</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($parts as $part)
                    <tr>
                        <td>{{ $part->id }}</td>
                        <td>{{ $part->name }}</td>
                        <td>{{ $part->value }}</td>
                        <td>
                            <button class="btn btn-sm btn-warning" onclick="openEditModal({{ $part }})">تعديل</button>
                            <button class="btn btn-sm btn-danger" onclick="confirmDelete({{ $part->id }})">حذف</button>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <script>
        let operationIndex = 1;
        let yearClassSubjectId = '{{ $yearClassSubjectId }}';

        function openCreateModal() {
            Swal.fire({
                title: 'إضافة جزء جديد',
                html: getModalContent(),
                focusConfirm: false,
                showCancelButton: true,
                confirmButtonText: 'حفظ',
                cancelButtonText: 'إلغاء',
                preConfirm: () => {
                    savePart('POST', '{{ route('parts.store') }}');
                }
            });
        }

        function openEditModal(part) {
            Swal.fire({
                title: 'تعديل جزء',
                html: getModalContent(part),
                focusConfirm: false,
                showCancelButton: true,
                confirmButtonText: 'حفظ',
                cancelButtonText: 'إلغاء',
                preConfirm: () => {
                    savePart('PUT', '/parts/' + part.id);
                },
                didOpen: () => {
                    const mustBeCalculatedCheckbox = document.getElementById('must_be_calculated');
                    if (mustBeCalculatedCheckbox) {
                        toggleOperationsContainer(mustBeCalculatedCheckbox);
                    }
                },

            });

        }

        function getModalContent(part = {}) {
            let operationsHtml = `<h5>العمليات</h5>`;
            let operationsStyle = part.operations && part.operations.length > 0 ? '' : 'style="display:none;"';

            if (part.operations) {
                part.operations.forEach((operation, index) => {
                    operationsHtml += getOperationHtml(index, operation);
                });
                operationIndex = part.operations.length;
            } else {
                operationsHtml += getOperationHtml(0);
                operationIndex = 1;
            }

            return `
        <form id="partForm">
            @csrf
            ${part.id ? `<input type="hidden" name="_method" value="PUT">` : ''}
            <input type="hidden" name="year_class_subject_id" value="${part.year_class_subject_id || yearClassSubjectId}">
            <div class="form-group">
                <label for="name">الاسم</label>
                <input type="text" class="form-control" id="name" name="name" value="${part.name || ''}" required>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="value">القيمة</label>
                        <input type="number" step="0.01" class="form-control" id="value" name="value" value="${part.value || ''}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="max_per_cent">النسبة المئوية القصوى</label>
                        <input type="number" step="0.01" class="form-control" id="max_per_cent" name="max_per_cent" value="${part.max_per_cent || ''}">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="operation">عملية</label>
                <select class="form-control" id="operation" name="operation">
                    <option value="">اختر عملية</option>
                    <option value="add" ${part.operation === 'add' ? 'selected' : ''}>إضافة</option>
                    <option value="subtract" ${part.operation === 'subtract' ? 'selected' : ''}>طرح</option>
                    <option value="multiply" ${part.operation === 'multiply' ? 'selected' : ''}>ضرب</option>
                    <option value="divide" ${part.operation === 'divide' ? 'selected' : ''}>قسمة</option>
                </select>
            </div>
           <div class="row">
                <div class="col-md-6">
                    <div class="form-group mb-0 mt-1 custom-switches-stacked">
                        <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                            <input type="hidden" id="is_visible_hidden" name="is_visible" value="0">
                            <input type="checkbox" id="is_visible" name="is_visible" value="1" class="custom-switch-input" ${part.is_visible ? 'checked' : ''}/>
                            <span class="custom-switch-indicator"></span>
                            <label class="custom-switch-description mb-0 cursor-pointer" for="is_visible">مرئي</label>
                        </label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group mb-0 mt-1 custom-switches-stacked">
                        <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                            <input type="hidden" id="is_active_hidden" name="is_active" value="0">
                            <input type="checkbox" id="is_active" name="is_active" value="1" class="custom-switch-input" ${part.is_active ? 'checked' : ''}/>
                            <span class="custom-switch-indicator"></span>
                            <label class="custom-switch-description mb-0 cursor-pointer" for="is_active">نشط</label>
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group mb-0 mt-1 custom-switches-stacked">
                        <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                            <input type="hidden" id="must_be_calculated_hidden" name="must_be_calculated" value="0">
                            <input type="checkbox" id="must_be_calculated" name="must_be_calculated" value="1" class="custom-switch-input" ${part.must_be_calculated ? 'checked' : ''} onclick="toggleOperationsContainer(this)"/>
                            <span class="custom-switch-indicator"></span>
                            <label class="custom-switch-description mb-0 cursor-pointer" for="must_be_calculated">يجب حسابه</label>
                        </label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group mb-0 mt-1 custom-switches-stacked">
                        <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                            <input type="hidden" id="must_be_ceiled_hidden" name="must_be_ceiled" value="0">
                            <input type="checkbox" id="must_be_ceiled" name="must_be_ceiled" value="1" class="custom-switch-input" ${part.must_be_ceiled ? 'checked' : ''}/>
                            <span class="custom-switch-indicator"></span>
                            <label class="custom-switch-description mb-0 cursor-pointer" for="must_be_ceiled">يجب تقريبه للأعلى</label>
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group mb-0 mt-1 custom-switches-stacked">
                        <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                            <input type="hidden" id="is_final_result_hidden" name="is_final_result" value="0">
                            <input type="checkbox" id="is_final_result" name="is_final_result" value="1" class="custom-switch-input" ${part.is_final_result ? 'checked' : ''}/>
                            <span class="custom-switch-indicator"></span>
                            <label class="custom-switch-description mb-0 cursor-pointer" for="is_final_result">نتيجة نهائية</label>
                        </label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group mb-0 mt-1 custom-switches-stacked">
                        <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                            <input type="hidden" id="is_semi_final_result_hidden" name="is_semi_final_result" value="0">
                            <input type="checkbox" id="is_semi_final_result" name="is_semi_final_result" value="1" class="custom-switch-input" ${part.is_semi_final_result ? 'checked' : ''}/>
                            <span class="custom-switch-indicator"></span>
                            <label class="custom-switch-description mb-0 cursor-pointer" for="is_semi_final_result">نتيجة نصف نهائية</label>
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group mb-0 mt-1 custom-switches-stacked">
                        <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                            <input type="hidden" id="has_mark_review_hidden" name="has_mark_review" value="0">
                            <input type="checkbox" id="has_mark_review" name="has_mark_review" value="1" class="custom-switch-input" ${part.has_mark_review ? 'checked' : ''}/>
                            <span class="custom-switch-indicator"></span>
                            <label class="custom-switch-description mb-0 cursor-pointer" for="has_mark_review">تقديرات للعلامات</label>
                        </label>
                    </div>
                </div>
            </div>

            <div id="operationsContainer" ${operationsStyle}>${operationsHtml}</div>
            <button type="button" class="btn btn-secondary" onclick="addOperation()">إضافة عملية أخرى</button>
        </form>
    `;
        }


        function getOperationHtml(index, operation = {}) {
            let operationStyle = operation.operand_part_id ? '' : 'style="display:none;"';
            return `
                <div class="form-group">
                    <label for="operand_part_id_${index}">جزء مشغل</label>
                    <select class="form-control" id="operand_part_id_${index}" name="operations[${index}][operand_part_id]" onchange="toggleOperation(${index})">
                        <option value="">اختر جزء مشغل</option>
                        @foreach ($allParts as $part)
                            <option value="{{ $part->id }}" ${operation.operand_part_id == {{ $part->id }} ? 'selected' : ''}>{{ $part->name }}</option>
                        @endforeach
                    </select>
                    <div class="form-group" id="operation_${index}" ${operationStyle}>
                        <label>عملية</label>
                        <div class="d-flex">
                            <label class="radio-inline mr-3">
                                <input type="radio" name="operations[${index}][operation]" value="add" ${operation.operation === 'add' ? 'checked' : ''}> إضافة
                            </label>
                            <label class="radio-inline mr-3">
                                <input type="radio" name="operations[${index}][operation]" value="subtract" ${operation.operation === 'subtract' ? 'checked' : ''}> طرح
                            </label>
                            <label class="radio-inline mr-3">
                                <input type="radio" name="operations[${index}][operation]" value="multiply" ${operation.operation === 'multiply' ? 'checked' : ''}> ضرب
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="operations[${index}][operation]" value="divide" ${operation.operation === 'divide' ? 'checked' : ''}> قسمة
                            </label>
                        </div>
                    </div>
                </div>
            `;
        }

        function toggleOperationsContainer(checkbox) {
            const operationsContainer = document.getElementById('operationsContainer');
            if (checkbox.checked) {
                operationsContainer.style.display = 'block';
            } else {
                operationsContainer.style.display = 'none';
            }
        }

        function toggleOperation(index) {
            const operandPartId = document.getElementById(`operand_part_id_${index}`).value;
            const operationContainer = document.getElementById(`operation_${index}`);
            if (operandPartId) {
                operationContainer.style.display = 'block';
            } else {
                operationContainer.style.display = 'none';
            }
        }

        function addOperation() {
            $('#operationsContainer').append(getOperationHtml(operationIndex));
            operationIndex++;
        }

        function savePart(method, url) {
            let formData = $('#partForm').serialize();
            $.ajax({
                url: url,
                type: method,
                data: formData,
                success: function(response) {
                    Swal.fire('نجاح', 'تم حفظ الجزء بنجاح', 'success').then(() => {
                        location.reload();
                    });
                },
                error: function(response) {
                    Swal.fire('خطأ', 'حدث خطأ أثناء حفظ الجزء', 'error');
                }
            });
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
                        url: '/parts/' + id,
                        type: 'DELETE',
                        data: {
                            _token: '{{ csrf_token() }}',
                        },
                        success: function() {
                            Swal.fire('تم الحذف!', 'تم حذف الجزء بنجاح.', 'success').then(() => {
                                location.reload();
                            });
                        }
                    });
                }
            });
        }
    </script>
@endsection
