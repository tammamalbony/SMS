@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>SVG Files</h1>
        <button id="upload-btn" class="btn btn-primary mb-3">Upload SVG File</button>
        <table class="table">
            <thead>
                <tr>
                    <th>Preview</th>
                    <th>File Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($files as $file)
                    <tr>
                        <td>
                            <a href="{{ asset('storage/store/grade/' . $file) }}" data-lightbox="svg-files" data-title="{{ $file }}">
                                <img src="{{ asset('storage/store/grade/' . $file) }}" alt="{{ $file }}" class="svg-thumbnail" style="width: 100px;">
                            </a>
                        </td>
                        <td>
                            <a href="{{ route('svg.ids', ['filename' => $file]) }}">{{ $file }}</a>
                        </td>
                        <td>
                            <form action="{{ route('svg.delete', ['filename' => $file]) }}" method="POST" class="d-inline">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            $('#upload-btn').click(function() {
                Swal.fire({
                    title: 'Upload SVG File',
                    html: `
                        <form id="upload-form" method="POST" enctype="multipart/form-data" action="{{ route('svg.upload') }}">
                            @csrf
                            <div class="form-group">
                                <label for="svgFile">Choose SVG File</label>
                                <input type="file" class="form-control-file" id="svgFile" name="svgFile" accept=".svg" required>
                            </div>
                            <div class="form-group">
                                <img id="preview" src="" alt="Preview" style="display: none; max-width: 100%; height: auto; margin-top: 10px;">
                            </div>
                            <button type="submit" class="btn btn-primary mt-3">Upload</button>
                        </form>
                    `,
                    showConfirmButton: false,
                    didOpen: () => {
                        const input = document.getElementById('svgFile');
                        const preview = document.getElementById('preview');
                        input.addEventListener('change', function() {
                            const file = this.files[0];
                            if (file) {
                                const reader = new FileReader();
                                reader.onload = function(e) {
                                    preview.src = e.target.result;
                                    preview.style.display = 'block';
                                };
                                reader.readAsDataURL(file);
                            }
                        });

                        $('#upload-form').on('submit', function(e) {
                            e.preventDefault();
                            const formData = new FormData(this);
                            $.ajax({
                                url: $(this).attr('action'),
                                type: $(this).attr('method'),
                                data: formData,
                                processData: false,
                                contentType: false,
                                success: function(response) {
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Upload successful',
                                        text: 'The SVG file has been uploaded.',
                                        showConfirmButton: true,
                                        onClose: () => {
                                            location.reload();
                                        }
                                    });
                                },
                                error: function(response) {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Upload failed',
                                        text: 'There was an error uploading the SVG file.',
                                        showConfirmButton: true
                                    });
                                }
                            });
                        });
                    }
                });
            });
        });
    </script>
@endsection
