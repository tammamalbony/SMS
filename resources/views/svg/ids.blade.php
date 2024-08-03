@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>SVG IDs in {{ $filename }}</h1>

        @dd($svgIds)
        <form action="{{ route('svg.ids.store') }}" method="POST">
            @csrf
            <input type="hidden" name="filename" value="{{ $filename }}">
            <div class="form-group">
                <label for="exam_id">Exam ID</label>
                <input type="number" class="form-control" id="exam_id" name="exam_id" required>
            </div>
            <div class="form-group">
                <label for="classs_school_years_id">Class School Years ID</label>
                <input type="number" class="form-control" id="classs_school_years_id" name="classs_school_years_id" required>
            </div>
            <div class="form-group">
                <label for="subject_detail_id">Subject Detail ID</label>
                <input type="number" class="form-control" id="subject_detail_id" name="subject_detail_id" required>
            </div>
            <div class="form-group">
                <label for="svg_id">SVG ID</label>
                <select class="form-control" id="svg_id" name="svg_id" required>
                    @foreach ($svgIds as $id)
                        <option value="{{ $id }}">{{ $id }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="note">Note</label>
                <textarea class="form-control" id="note" name="note"></textarea>
            </div>
            <div class="form-group">
                <label for="max_width">Max Width</label>
                <input type="number" class="form-control" id="max_width" name="max_width">
            </div>
            <div class="form-group">
                <label for="max_height">Max Height</label>
                <input type="number" class="form-control" id="max_height" name="max_height">
            </div>
            <div class="form-group">
                <label for="font_size">Font Size</label>
                <input type="text" class="form-control" id="font_size" name="font_size">
            </div>
            <div class="form-group">
                <label for="fill_color">Fill Color</label>
                <input type="text" class="form-control" id="fill_color" name="fill_color">
            </div>
            <div class="form-group">
                <label for="anchortext">Anchor Text</label>
                <input type="text" class="form-control" id="anchortext" name="anchortext">
            </div>
            <div class="form-group">
                <label for="transform">Transform</label>
                <input type="text" class="form-control" id="transform" name="transform">
            </div>
            <button type="submit" class="btn btn-primary mt-3">Save</button>
        </form>
    </div>
@endsection
