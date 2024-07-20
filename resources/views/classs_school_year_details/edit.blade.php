@extends('layouts.app')

@section('content')
<div class="content-wrapper">
    <div class="page-title">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h4 class="mb-0 d-inline-block">تعديل تفاصيل العام الدراسي للفصل: {{ $classsSchoolYear->id }}</h4>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('/dashboard') }}">الرئيسية</a></li>
                    <li class="breadcrumb-item active">تعديل تفاصيل العام الدراسي للفصل</li>
                </ol>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 mb-30">
            <div class="card card-statistics h-100">
                <div class="card-body">
                    <form action="{{ route('classs_school_year_details.update', $classsSchoolYear->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label for="first_term_days">أيام دوام الفصل الأول</label>
                            <input type="number" class="form-control" id="first_term_days" name="first_term_days" value="{{ $details->first_term_days }}">
                        </div>
                        <div class="form-group">
                            <label for="second_term_days">أيام دوام الفصل الثاني</label>
                            <input type="number" class="form-control" id="second_term_days" name="second_term_days" value="{{ $details->second_term_days }}">
                        </div>
                        <div class="form-group">
                            <label for="note">ملاحظة</label>
                            <textarea class="form-control" id="note" name="note">{{ $details->note }}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="max_students">عدد أعظمي للطلاب</label>
                            <input type="number" class="form-control" id="max_students" name="max_students" value="{{ $details->max_students }}">
                        </div>
                        <div class="form-group">
                            <label for="status">الحالة</label>
                            <select class="form-control" id="status" name="status">
                                <option value="1" {{ $details->status ? 'selected' : '' }}>نشط</option>
                                <option value="0" {{ !$details->status ? 'selected' : '' }}>غير نشط</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">تحديث البيانات</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
