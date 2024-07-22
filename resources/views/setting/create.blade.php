<!-- resources/views/school/create-edit.blade.php -->

@extends('layouts.app')
{{-- @dd($school) --}}

@section('content')
    <div class="content-wrapper">

        <!-- breadcrumb -->
        <div class="page-title">
            <div class="row">
                <div class="col-sm-6">
                    <h4 class="mb-0" style="font-family: 'Cairo', sans-serif">بيانات المدرسة</h4>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-left float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}" class="default-color">الرئيسية</a></li>
                        <li class="breadcrumb-item active">بيانات المدرسة</li>
                    </ol>
                </div>
            </div>
        </div>

        <!-- row -->
        <div class="row">
            <div class="col-md-12 mb-30">
                <div class="card card-statistics h-100">
                    <div class="card-body">
                        <form enctype="multipart/form-data" method="post"
                            action="{{ isset($school) ? url('/settings/' . $school->id . '/update') : url('/settings/store') }}">
                            @csrf
                            <div class="row">
                                <div class="col">
                                    <label class="mr-sm-2">الرقم الاحصائي</label>
                                    <input name="statistical_number" value="{{ $school->statistical_number ?? '' }}"
                                        type="number" class="form-control" placeholder="الرقم الاحصائي">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">اسم المدرسة</label>
                                    <input name="school_name" value="{{ $school->school_name ?? '' }}" type="text"
                                        class="form-control" placeholder="اسم المدرسة">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">نوع التعليم</label>
                                    <select class="custom-select my-1 mr-sm-2" name="type_of_education">
                                        <option disabled>اختيار من القائمة...</option>
                                        <option value="1"
                                            {{ isset($school) && $school->type_of_education == 1 ? 'selected' : '' }}>رسمي
                                        </option>
                                        <option value="2"
                                            {{ isset($school) && $school->type_of_education == 2 ? 'selected' : '' }}>خاص
                                        </option>
                                        <option value="3"
                                            {{ isset($school) && $school->type_of_education == 3 ? 'selected' : '' }}>
                                            وكالة</option>
                                        <option value="4"
                                            {{ isset($school) && $school->type_of_education == 4 ? 'selected' : '' }}>
                                            نقابة</option>
                                        <option value="5"
                                            {{ isset($school) && $school->type_of_education == 5 ? 'selected' : '' }}>
                                            افتراضي</option>
                                    </select>
                                </div>
                                <hr>
                                <div class="col-12">
                                    <label class="mr-sm-2">مرحلة التعليم:</label>
                                </div>

                                <div class="form-group">
                                    <label class="form-check-label">فئة ب :</label>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="typeB" value="1"
                                            {{ isset($school) && $school->typeB == 1 ? 'checked' : '' }}>
                                        <label class="form-check-label">نعم</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="typeB" value="0"
                                            {{ isset($school) && $school->typeB == 0 ? 'checked' : '' }}>
                                        <label class="form-check-label">لا</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-check-label">رياض اطفال:</label>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="kindergarten" value="1"
                                            {{ isset($school) && $school->kindergarten == 1 ? 'checked' : '' }}>
                                        <label class="form-check-label">نعم</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="kindergarten" value="0"
                                            {{ isset($school) && $school->kindergarten == 0 ? 'checked' : '' }}>
                                        <label class="form-check-label">لا</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-check-label">التعليم الاساسي حلقة 1:</label>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="education_p" value="1"
                                            {{ isset($school) && $school->education_p == 1 ? 'checked' : '' }}>
                                        <label class="form-check-label">نعم</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="education_p" value="0"
                                            {{ isset($school) && $school->education_p == 0 ? 'checked' : '' }}>
                                        <label class="form-check-label">لا</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-check-label">التعليم الاساسي حلقة 2:</label>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="education_p1" value="1"
                                            {{ isset($school) && $school->education_p1 == 1 ? 'checked' : '' }}>
                                        <label class="form-check-label">نعم</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="education_p1" value="0"
                                            {{ isset($school) && $school->education_p1 == 0 ? 'checked' : '' }}>
                                        <label class="form-check-label">لا</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-check-label">التعليم الثانوي:</label>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="education_s" value="1"
                                            {{ isset($school) && $school->education_s == 1 ? 'checked' : '' }}>
                                        <label class="form-check-label">نعم</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="education_s" value="0"
                                            {{ isset($school) && $school->education_s == 0 ? 'checked' : '' }}>
                                        <label class="form-check-label">لا</label>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col">
                                    <label class="mr-sm-2">المحافظة</label>
                                    <input name="school_state" value="{{ $school->school_state ?? '' }}" type="text"
                                        class="form-control" placeholder="المحافظة">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">المدينة</label>
                                    <input name="school_city" value="{{ $school->school_city ?? '' }}" type="text"
                                        class="form-control" placeholder="المدينة">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">المنطقة</label>
                                    <input name="school_region" value="{{ $school->school_region ?? '' }}"
                                        type="text" class="form-control" placeholder="المنطقة">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">القرية</label>
                                    <input name="school_village" value="{{ $school->school_village ?? '' }}"
                                        type="text" class="form-control" placeholder="القرية">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">الحي</label>
                                    <input name="school_Neigh" value="{{ $school->school_Neigh ?? '' }}" type="text"
                                        class="form-control" placeholder="الحي">
                                </div>
                            </div>
                            <hr><br>
                            <div class="row">
                                <div class="col">
                                    <label class="form-check-label">التقسيم الاداري:</label>
                                    <div class="form-group">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="Admin_division"
                                                value="1"
                                                {{ isset($school) && $school->Admin_division == 1 ? 'checked' : '' }}>
                                            <label class="form-check-label">مركز</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="Admin_division"
                                                value="2"
                                                {{ isset($school) && $school->Admin_division == 2 ? 'checked' : '' }}>
                                            <label class="form-check-label">مدن</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="Admin_division"
                                                value="3"
                                                {{ isset($school) && $school->Admin_division == 3 ? 'checked' : '' }}>
                                            <label class="form-check-label">ريف</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <label class="form-check-label">جنس المدرسة:</label>
                                    <div class="form-group">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="School_gender"
                                                value="1"
                                                {{ isset($school) && $school->School_gender == 1 ? 'checked' : '' }}>
                                            <label class="form-check-label">بنين</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="School_gender"
                                                value="2"
                                                {{ isset($school) && $school->School_gender == 2 ? 'checked' : '' }}>
                                            <label class="form-check-label">بنات</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="School_gender"
                                                value="3"
                                                {{ isset($school) && $school->School_gender == 3 ? 'checked' : '' }}>
                                            <label class="form-check-label">مختلط</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <label class="form-check-label">المدرسة في بنائها الاصلي:</label>
                                    <div class="form-group">

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="School_build"
                                                value="1"
                                                {{ isset($school) && $school->School_build == 1 ? 'checked' : '' }}>
                                            <label class="form-check-label">نعم</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="School_build"
                                                value="2"
                                                {{ isset($school) && $school->School_build == 2 ? 'checked' : '' }}>
                                            <label class="form-check-label">لا</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br><br>
                            <div class="row">
                                <div class="col">

                                    <label class="form-check-label">الوصول الى البناء الاصلي:</label>
                                    <div class="form-group">

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="School_access"
                                                value="1"
                                                {{ isset($school) && $school->School_access == 1 ? 'checked' : '' }}>
                                            <label class="form-check-label">صعب</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="School_access"
                                                value="2"
                                                {{ isset($school) && $school->School_access == 2 ? 'checked' : '' }}>
                                            <label class="form-check-label">ممكن</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <label class="form-check-label">البناء مشترك:</label>
                                    <div class="form-group">

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="Shared_construction"
                                                value="1"
                                                {{ isset($school) && $school->Shared_construction == 1 ? 'checked' : '' }}>
                                            <label class="form-check-label">نعم</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="Shared_construction"
                                                value="2"
                                                {{ isset($school) && $school->Shared_construction == 2 ? 'checked' : '' }}>
                                            <label class="form-check-label">لا</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <label class="form-check-label">نوع المدرسة:</label>
                                    <div class="form-group">

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="School_type"
                                                value="1"
                                                {{ isset($school) && $school->School_type == 1 ? 'checked' : '' }}>
                                            <label class="form-check-label">نمطية</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="School_type"
                                                value="2"
                                                {{ isset($school) && $school->School_type == 2 ? 'checked' : '' }}>
                                            <label class="form-check-label">مجمعة</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col">
                                    <label class="mr-sm-2">نوع الدوام</label>
                                    <select class="custom-select my-1 mr-sm-2" name="type_of_attend">
                                        <option disabled>اختيار من القائمة...</option>
                                        <option value="1"
                                            {{ isset($school) && $school->type_of_attend == 1 ? 'selected' : '' }}>
                                            كامل</option>
                                        <option value="2"
                                            {{ isset($school) && $school->type_of_attend == 2 ? 'selected' : '' }}>
                                            نصفي مع نفسها</option>
                                        <option value="3"
                                            {{ isset($school) && $school->type_of_attend == 3 ? 'selected' : '' }}>
                                            نصفي مع الغير</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">ملكية البناء</label>
                                    <select class="custom-select my-1 mr-sm-2" name="build_m">
                                        <option disabled>اختيار من القائمة...</option>
                                        <option value="1"
                                            {{ isset($school) && $school->build_m == 1 ? 'selected' : '' }}>ملك
                                        </option>
                                        <option value="2"
                                            {{ isset($school) && $school->build_m == 2 ? 'selected' : '' }}>
                                            مستأجر
                                        </option>
                                        <option value="3"
                                            {{ isset($school) && $school->build_m == 3 ? 'selected' : '' }}>جزء
                                            ملك\
                                            مستأجر</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">نوع البناء</label>
                                    <select class="custom-select my-1 mr-sm-2" name="build_t">
                                        <option disabled>اختيار من القائمة...</option>
                                        <option value="1"
                                            {{ isset($school) && $school->build_t == 1 ? 'selected' : '' }}>
                                            اسمنت
                                        </option>
                                        <option value="2"
                                            {{ isset($school) && $school->build_t == 2 ? 'selected' : '' }}>
                                            مسبق
                                            الصنع</option>
                                        <option value="3"
                                            {{ isset($school) && $school->build_t == 3 ? 'selected' : '' }}>حجر
                                        </option>
                                        <option value="4"
                                            {{ isset($school) && $school->build_t == 4 ? 'selected' : '' }}>
                                            كرفان
                                        </option>
                                        <option value="5"
                                            {{ isset($school) && $school->build_t == 5 ? 'selected' : '' }}>طين
                                        </option>
                                        <option value="6"
                                            {{ isset($school) && $school->build_t == 6 ? 'selected' : '' }}>
                                            اسمنت+حجر
                                        </option>
                                        <option value="7"
                                            {{ isset($school) && $school->build_t == 7 ? 'selected' : '' }}>
                                            اسمنت+مسبق</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col">
                                    <label class="mr-sm-2">عدد الغرف المستأجرة</label>
                                    <input name="build_class" value="{{ $school->build_class ?? '' }}" type="text"
                                        class="form-control">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">مساحة البناء المدرسي</label>
                                    <input name="build_area" value="{{ $school->build_area ?? '' }}" type="text"
                                        class="form-control">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">عدد الطوابق</label>
                                    <input name="count_floor" value="{{ $school->count_floor ?? '' }}" type="text"
                                        class="form-control">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">عدد كتل البناء</label>
                                    <input name="count_build" value="{{ $school->count_build ?? '' }}" type="text"
                                        class="form-control">
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col">
                                    <label class="mr-sm-2">مدير المدرسة</label>
                                    <input name="manager_name" value="{{ $school->manager_name ?? '' }}" type="text"
                                        class="form-control" placeholder="مدير المدرسة">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">رقم الجوال</label>
                                    <input name="mobile" value="{{ $school->mobile ?? '' }}" type="text"
                                        class="form-control" placeholder="رقم الجوال">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">رقم الهاتف</label>
                                    <input name="telephone" value="{{ $school->telephone ?? '' }}" type="text"
                                        class="form-control" placeholder="رقم الهاتف">
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col">
                                    <label class="mr-sm-2">عدد خزانات المازوت</label>
                                    <input name="petrol_count" value="{{ $school->petrol_count ?? '' }}" type="number"
                                        class="form-control">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">سعة خزانات المازوت</label>
                                    <input name="petrol_cap" value="{{ $school->petrol_cap ?? '' }}" type="text"
                                        class="form-control">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">عدد خطوط الانترنت</label>
                                    <input name="internet_coount" value="{{ $school->internet_coount ?? '' }}"
                                        type="number" class="form-control">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">نوع الخطوط</label>
                                    <input name="internet_type" value="{{ $school->internet_type ?? '' }}"
                                        type="text" class="form-control">
                                </div>
                                <div class="col">
                                    <label class="mr-sm-2">مصادر الكهرباء</label>
                                    <select class="custom-select my-1 mr-sm-2" name="electric_type">
                                        <option disabled>اختيار من القائمة...</option>
                                        <option value="1"
                                            {{ isset($school) && $school->electric_type == 1 ? 'selected' : '' }}>
                                            شبكة عامة</option>
                                        <option value="2"
                                            {{ isset($school) && $school->electric_type == 2 ? 'selected' : '' }}>
                                            مولدة</option>
                                        <option value="3"
                                            {{ isset($school) && $school->electric_type == 3 ? 'selected' : '' }}>
                                            طاقة شمسية</option>
                                        <option value="4"
                                            {{ isset($school) && $school->electric_type == 4 ? 'selected' : '' }}>
                                            الكل</option>
                                    </select>
                                </div>
                            </div>
                            <hr>
                            <button class="btn btn-success btn-sm nextBtn btn-lg pull-right" type="submit">تاكيد</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
