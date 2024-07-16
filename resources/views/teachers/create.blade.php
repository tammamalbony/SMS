@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <div class="page-title">
        <div class="row">
            <div class="col-sm-6">
                <h4 class="mb-0">{{ isset($teacher) ? 'تعديل معلم' : 'إضافة معلم' }}</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                    <li class="breadcrumb-item active">{{ isset($teacher) ? 'تعديل معلم' : 'إضافة معلم' }}</li>
                </ol>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 mb-30">
            <div class="card card-statistics h-100">
                <div class="card-body">
                    <form action="{{ isset($teacher) ? route('teachers.update', $teacher->id) : route('teachers.store') }}" method="POST">
                        @csrf
                        <div class="form-row">
                            <div class="col">
                                <label for="email">البريد الإلكتروني</label>
                                <input type="email" name="email" class="form-control" value="{{ old('email', $teacher->email ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="password">كلمة المرور</label>
                                <input type="password" name="password" class="form-control" {{ isset($teacher) ? '' : 'required' }}>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="col">
                                <label for="name_ar">اسم المعلم باللغة العربية</label>
                                <input type="text" name="name_ar" class="form-control" value="{{ old('name_ar', $teacher->name_ar ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="name_en">اسم المعلم باللغة الإنجليزية</label>
                                <input type="text" name="name_en" class="form-control" value="{{ old('name_en', $teacher->name_en ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="mother">اسم الأم</label>
                                <input type="text" name="mother" class="form-control" value="{{ old('mother', $teacher->mother ?? '') }}" required>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="form-group col">
                                <label for="specialization_id">العمل الوظيفي</label>
                                <select class="custom-select my-1 mr-sm-2" name="specialization_id" required>
                                    <option selected="" disabled="">اختر...</option>
                                    <option value="10" {{ old('specialization_id', $teacher->specialization_id ?? '') == 10 ? 'selected' : '' }}>إدارة</option>
                                    <option value="11" {{ old('specialization_id', $teacher->specialization_id ?? '') == 11 ? 'selected' : '' }}>تدريس</option>
                                    <option value="12" {{ old('specialization_id', $teacher->specialization_id ?? '') == 12 ? 'selected' : '' }}>خدمات</option>
                                </select>
                            </div>
                            <div class="form-group col">
                                <label for="gender_id">الجنس</label>
                                <select class="custom-select my-1 mr-sm-2" name="gender_id" required>
                                    <option selected="" disabled="">اختر...</option>
                                    <option value="5" {{ old('gender_id', $teacher->gender_id ?? '') == 5 ? 'selected' : '' }}>ذكر</option>
                                    <option value="6" {{ old('gender_id', $teacher->gender_id ?? '') == 6 ? 'selected' : '' }}>أنثى</option>
                                </select>
                            </div>
                            <div class="form-group col">
                                <label for="marital_status">الحالة الاجتماعية</label>
                                <select class="custom-select my-1 mr-sm-2" name="marital_status" required>
                                    <option selected="" disabled="">اختر...</option>
                                    <option value="1" {{ old('marital_status', $teacher->marital_status ?? '') == 1 ? 'selected' : '' }}>أعزب</option>
                                    <option value="2" {{ old('marital_status', $teacher->marital_status ?? '') == 2 ? 'selected' : '' }}>متزوج</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="col">
                                <label for="birthdate">تاريخ الميلاد</label>
                                <div class="input-group date">
                                    <input class="form-control" type="date" id="datepicker-action2" name="birthdate" data-date-format="yyyy-mm-dd" value="{{ old('birthdate', $teacher->birthdate ?? '') }}" required>
                                </div>
                            </div>
                            <div class="col">
                                <label for="address_birth">مكان الولادة</label>
                                <input type="text" name="address_birth" class="form-control" value="{{ old('address_birth', $teacher->address_birth ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="add_num">الرقم الوطني</label>
                                <input type="text" name="add_num" class="form-control" value="{{ old('add_num', $teacher->add_num ?? '') }}" required>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="col">
                                <label for="tel">الهاتف</label>
                                <input type="text" name="tel" class="form-control" value="{{ old('tel', $teacher->tel ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="mobile">الجوال</label>
                                <input type="text" name="mobile" class="form-control" value="{{ old('mobile', $teacher->mobile ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="gern">الجنسية</label>
                                <input type="text" name="gern" class="form-control" value="{{ old('gern', $teacher->gern ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="religion">الديانة</label>
                                <input type="text" name="religion" class="form-control" value="{{ old('religion', $teacher->religion ?? '') }}" required>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="col">
                                <label for="work_type">الفئة الوظيفية</label>
                                <input type="text" name="work_type" class="form-control" value="{{ old('work_type', $teacher->work_type ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="joining_date">تاريخ التعين</label>
                                <div class="input-group date">
                                    <input class="form-control" type="date" id="datepicker-action" name="joining_date" data-date-format="yyyy-mm-dd" value="{{ old('joining_date', $teacher->joining_date ?? '') }}" required>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="form-group col">
                                <label for="address">العنوان</label>
                                <textarea class="form-control" name="address" id="address" rows="1" required>{{ old('address', $teacher->address ?? '') }}</textarea>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="col">
                                <label for="address_fixed">العنوان الدائم</label>
                                <input type="text" name="address_fixed" class="form-control" value="{{ old('address_fixed', $teacher->address_fixed ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="state">المحافظة الاصلية</label>
                                <input type="text" name="state" class="form-control" value="{{ old('state', $teacher->state ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="certificates">الاختصاص / الشهادات</label>
                                <input type="text" name="certificates" class="form-control" value="{{ old('certificates', $teacher->certificates ?? '') }}" required>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="col">
                                <label for="highest_cert">اعلى شهادة حصل عليها</label>
                                <input type="text" name="highest_cert" class="form-control" value="{{ old('highest_cert', $teacher->highest_cert ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="date_obtained">تاريخ الحصول عليها</label>
                                <div class="input-group date">
                                    <input class="form-control" type="date" id="datepicker-action1" name="date_obtained" data-date-format="yyyy-mm-dd" value="{{ old('date_obtained', $teacher->date_obtained ?? '') }}" required>
                                </div>
                            </div>
                            <div class="col">
                                <label for="salary">الراتب المقطوع</label>
                                <input type="text" name="salary" class="form-control" value="{{ old('salary', $teacher->salary ?? '') }}" required>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="col">
                                <label for="type_job">نوع العمل الوظيفي</label>
                                <input type="text" name="type_job" class="form-control" value="{{ old('type_job', $teacher->type_job ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="type_dis">الصفة الوظيفية</label>
                                <input type="text" name="type_dis" class="form-control" value="{{ old('type_dis', $teacher->type_dis ?? '') }}" required>
                            </div>
                            <div class="form-group col">
                                <label for="type_of_job">نوع الهيئة الوظيفية</label>
                                <select class="custom-select my-1 mr-sm-2" name="type_of_job" required>
                                    <option selected="" disabled="">اختر...</option>
                                    <option value="1" {{ old('type_of_job', $teacher->type_of_job ?? '') == 1 ? 'selected' : '' }}>داخل الملاك</option>
                                    <option value="2" {{ old('type_of_job', $teacher->type_of_job ?? '') == 2 ? 'selected' : '' }}>خارج الملاك</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="col">
                                <label for="cityI">محافظة التعيين</label>
                                <input type="text" name="cityI" class="form-control" value="{{ old('cityI', $teacher->cityI ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="date_admin_work">تاريخ مباشرة العمل</label>
                                <div class="input-group date">
                                    <input class="form-control" type="date" id="datepicker-action3" name="date_admin_work" data-date-format="yyyy-mm-dd" value="{{ old('date_admin_work', $teacher->date_admin_work ?? '') }}" required>
                                </div>
                            </div>
                            <div class="col">
                                <label for="belongs_him">الملاك الذي ينتمي الية</label>
                                <input type="text" name="belongs_him" class="form-control" value="{{ old('belongs_him', $teacher->belongs_him ?? '') }}" required>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="col">
                                <label for="subjet">المادة التي يدرسها</label>
                                <input type="text" name="subjet" class="form-control" value="{{ old('subjet', $teacher->subjet ?? '') }}" required>
                            </div>
                            <div class="col">
                                <label for="quorum_hours">ساعات نصاب التدريس</label>
                                <input type="number" name="quorum_hours" class="form-control" value="{{ old('quorum_hours', $teacher->quorum_hours ?? 0) }}" required>
                            </div>
                            <div class="col">
                                <label for="e_quorum_hours">ساعات النصاب الإضافية</label>
                                <input type="number" name="e_quorum_hours" class="form-control" value="{{ old('e_quorum_hours', $teacher->e_quorum_hours ?? 0) }}" required>
                            </div>
                        </div>
                        <br>
                        <button class="btn btn-success btn-sm nextBtn btn-lg pull-right" type="submit">{{ isset($teacher) ? 'تحديث' : 'إنشاء' }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
