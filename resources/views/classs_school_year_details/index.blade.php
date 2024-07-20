@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <div class="page-title">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4 class="mb-0 d-inline-block">تفاصيل العام الدراسي للفصل: {{ $classsSchoolYear->id }}</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                    <li class="breadcrumb-item active">تفاصيل العام الدراسي للفصل</li>
                </ol>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 mb-30">
            <div class="card card-statistics h-100">
                <div class="card-body">
                    @if ($details)
                        <a href="{{ route('classs_school_year_details.edit', $classsSchoolYear->id) }}" class="btn btn-primary">تعديل</a>
                        <ul>
                            <li>أيام دوام الفصل الأول: {{ $details->first_term_days }}</li>
                            <li>أيام دوام الفصل الثاني: {{ $details->second_term_days }}</li>
                            <li>ملاحظة: {{ $details->note }}</li>
                            <li>عدد أعظمي للطلاب: {{ $details->max_students }}</li>
                            <li>الحالة: {{ $details->status ? 'نشط' : 'غير نشط' }}</li>
                        </ul>
                    @else
                        <form action="{{ route('classs_school_year_details.store', $classsSchoolYear->id) }}" method="POST">
                            @csrf
                            <div class="form-group">
                                <label for="first_term_days">أيام دوام الفصل الأول</label>
                                <input type="number" class="form-control" id="first_term_days" name="first_term_days">
                            </div>
                            <div class="form-group">
                                <label for="second_term_days">أيام دوام الفصل الثاني</label>
                                <input type="number" class="form-control" id="second_term_days" name="second_term_days">
                            </div>
                            <div class="form-group">
                                <label for="note">ملاحظة</label>
                                <textarea class="form-control" id="note" name="note"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="max_students">عدد أعظمي للطلاب</label>
                                <input type="number" class="form-control" id="max_students" name="max_students">
                            </div>
                            <div class="form-group">
                                <label for="status">الحالة</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="1">نشط</option>
                                    <option value="0">غير نشط</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">حفظ البيانات</button>
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
