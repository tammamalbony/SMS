@extends('layouts.app')

@section('content')
    <div class="content-wrapper">
        <div class="page-title">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="mb-0 d-inline-block">المكافآت والعقوبات</h4>
                    <button class="btn btn-primary d-inline-block" id="addRewardPunishment" data-id="{{$id }}">إضافة</button>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                        <li class="breadcrumb-item active">المكافآت والعقوبات</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mb-30">
                <div class="card card-statistics h-100">
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>الاسم</th>
                                    <th>اسم المكافأة أو العقوبة</th>
                                    <th>السبب</th>
                                    <th>السنة</th>
                                    <th>العمليات</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($rewardsPunishments as $index => $rewardPunishment)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $rewardPunishment->teacher->name_ar }}</td>
                                        <td>{{ $rewardPunishment->reward_punishment_name }}</td>
                                        <td>{{ $rewardPunishment->reason }}</td>
                                        <td>{{ $rewardPunishment->year }}</td>
                                        <td>
                                            <button class="btn btn-primary edit-button"
                                                data-id="{{ $rewardPunishment->id }}"><i class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger delete-button"
                                                data-id="{{ $rewardPunishment->id }}"><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center">
                            {!! $rewardsPunishments->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        $(document).ready(function() {
            $('#addRewardPunishment').on('click', function() {
                var teacher_id =  $(this).data('id')
                Swal.fire({
                    title: 'إضافة مكافأة أو عقوبة',
                    html: `
                <label for="teacher_id">المعلم:</label>
                <select id="teacher_id" class="swal2-input">
                    <option value="">اختر المعلم</option>
                    @foreach ($teachers as $teacher)
                        <option value="{{ $teacher->id }}" ${teacher_id == {{ $teacher->id }} ? 'selected' : '' }>{{ $teacher->name_ar }}</option>
                    @endforeach
                </select>
                <label for="reward_punishment_name">اسم المكافأة/العقوبة:</label>
                <input type="text" id="reward_punishment_name" class="swal2-input" placeholder="اسم المكافأة أو العقوبة">
                <label for="reason">السبب:</label>
                <input type="text" id="reason" class="swal2-input" placeholder="السبب">
                <label for="year">السنة:</label>

                <input type="date" id="year" class="swal2-input" placeholder="السنة">
                <div class="form-group mb-0 mt-1 custom-switches-stacked">
                    <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                        <input type="checkbox" id="is_punishment" value="1" class="custom-switch-input"/>
                        <span class="custom-switch-indicator"></span>
                        <label class="custom-switch-description mb-0 cursor-pointer" for="is_punishment">عقوبة</label>
                    </label>
                </div>
            `,
                    confirmButtonText: 'حفظ البيانات',
                    showCancelButton: true,
                    cancelButtonText: 'إلغاء',
                    preConfirm: () => {
                        const teacher_id = Swal.getPopup().querySelector('#teacher_id').value
                        const reward_punishment_name = Swal.getPopup().querySelector(
                            '#reward_punishment_name').value
                        const reason = Swal.getPopup().querySelector('#reason').value
                        const year = Swal.getPopup().querySelector('#year').value
                        const is_punishment = Swal.getPopup().querySelector('#is_punishment')
                            .checked ? 1 : 0
                        if (!teacher_id || !reward_punishment_name || !reason || !year) {
                            Swal.showValidationMessage(`الرجاء إدخال جميع الحقول`)
                        }
                        return {
                            teacher_id: teacher_id,
                            reward_punishment_name: reward_punishment_name,
                            reason: reason,
                            year: year,
                            is_punishment: is_punishment
                        }
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ route('rewards_punishments.store') }}',
                            method: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}',
                                teacher_id: result.value.teacher_id,
                                reward_punishment_name: result.value.reward_punishment_name,
                                reason: result.value.reason,
                                year: result.value.year,
                                is_punishment: result.value.is_punishment
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire('تم الإضافة!',
                                        'تم إضافة المكافأة أو العقوبة بنجاح.',
                                        'success').then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire('خطأ!',
                                        'حدث خطأ أثناء إضافة المكافأة أو العقوبة.',
                                        'error');
                                }
                            }
                        });
                    }
                });
            });

            $('.edit-button').on('click', function() {
                var rewardPunishmentId = $(this).data('id');
                $.ajax({
                    url: '/rewards_punishments/' + rewardPunishmentId + '/edit',
                    method: 'POST',
                    success: function(data) {
                        Swal.fire({
                            title: 'تعديل مكافأة أو عقوبة',
                            html: `
                        <label for="teacher_id">المعلم:</label>
                        <select id="teacher_id" class="swal2-input">
                            <option value="">اختر المعلم</option>
                            @foreach ($teachers as $teacher)
                                <option value="{{ $teacher->id }}" ${data.rewards_punishments.teacher_id == {{ $teacher->id }} ? 'selected' : '' }>{{ $teacher->name_ar }}</option>
                            @endforeach
                        </select>
                        <label for="reward_punishment_name">اسم المكافأة/العقوبة:</label>
                        <input type="text" id="reward_punishment_name" class="swal2-input" value="${data.rewards_punishments.reward_punishment_name}">
                        <label for="reason">السبب:</label>
                        <input type="text" id="reason" class="swal2-input" value="${data.rewards_punishments.reason}">
                        <label for="year">السنة:</label>
                        <input type="date" id="year" class="swal2-input" value="${data.rewards_punishments.year}">
                        <div class="form-group mb-0 mt-1 custom-switches-stacked">
                            <label class="custom-switch pl-0 d-flex align-items-center mb-0">
                                <input type="checkbox" id="is_punishment" value="1" class="custom-switch-input" ${data.rewards_punishments.is_punishment == 1 ? 'checked' : ''}/>
                                <span class="custom-switch-indicator"></span>
                                <label class="custom-switch-description mb-0 cursor-pointer" for="is_punishment">عقوبة</label>
                            </label>
                        </div>
                    `,
                            confirmButtonText: 'حفظ البيانات',
                            showCancelButton: true,
                            cancelButtonText: 'إلغاء',
                            preConfirm: () => {
                                const teacher_id = Swal.getPopup().querySelector(
                                    '#teacher_id').value
                                const reward_punishment_name = Swal.getPopup()
                                    .querySelector('#reward_punishment_name').value
                                const reason = Swal.getPopup().querySelector(
                                    '#reason').value
                                const year = Swal.getPopup().querySelector('#year')
                                    .value
                                const is_punishment = Swal.getPopup().querySelector(
                                    '#is_punishment').checked ? 1 : 0
                                if (!teacher_id || !reward_punishment_name || !
                                    reason || !year) {
                                    Swal.showValidationMessage(
                                        `الرجاء إدخال جميع الحقول`)
                                }
                                return {
                                    teacher_id: teacher_id,
                                    reward_punishment_name: reward_punishment_name,
                                    reason: reason,
                                    year: year,
                                    is_punishment: is_punishment
                                }
                            }
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/rewards_punishments/' +
                                        rewardPunishmentId + "/update",
                                    method: 'POST',
                                    data: {
                                        _token: '{{ csrf_token() }}',
                                        teacher_id: result.value.teacher_id,
                                        reward_punishment_name: result.value
                                            .reward_punishment_name,
                                        reason: result.value.reason,
                                        year: result.value.year,
                                        is_punishment: result.value
                                            .is_punishment
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            Swal.fire('تم التعديل!',
                                                'تم تعديل المكافأة أو العقوبة بنجاح.',
                                                'success').then(() => {
                                                location.reload();
                                            });
                                        } else {
                                            Swal.fire('خطأ!',
                                                'حدث خطأ أثناء تعديل المكافأة أو العقوبة.',
                                                'error');
                                        }
                                    }
                                });
                            }
                        });
                    }
                });
            });

            $('.delete-button').on('click', function() {
                var rewardPunishmentId = $(this).data('id');
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
                            url: '/rewards_punishments/' + rewardPunishmentId + "/delete",
                            type: 'POST',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    Swal.fire(
                                        'تم الحذف!',
                                        'تم حذف المكافأة أو العقوبة بنجاح.',
                                        'success'
                                    ).then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire(
                                        'خطأ!',
                                        'حدث خطأ أثناء حذف المكافأة أو العقوبة.',
                                        'error'
                                    );
                                }
                            },
                            error: function(response) {
                                Swal.fire(
                                    'خطأ!',
                                    'حدث خطأ أثناء حذف المكافأة أو العقوبة.',
                                    'error'
                                );
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection
