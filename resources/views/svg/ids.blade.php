<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>SVG Interaction</title>
    <script src="{{ asset('/assets/admin/vendor/jquery/jquery-3.3.1.min.js') }}"></script>
    <script src="{{ asset('/assets/admin/js/numbers.js') }}"></script>
    <style>
        svg {
            width: 100%;
            /* Adjust as necessary */
            height: auto;
        }

        text {
            cursor: pointer; // Visual cue that text is clickable
        }
    </style>
    <script>
        $(document).ready(function() {
            var textElements = document.querySelectorAll('svg text tspan');

            textElements.forEach(function(element) {
                var originalText = element.textContent;
                var convertedText = replaceEnglishWithArabic(originalText);
                element.textContent = convertedText;
            });
            $('svg text').click(function() {
                var id = $(this).attr('id');
                if (id) {
                    console.log('Clicked SVG text element ID:', id);
                    alert(`Clicked on text element with ID: ${id}`);
                } else {
                    console.log('Clicked on a text element without an ID');
                }
            });
        });
    </script>
</head>

<body>
    <h1>SVG Interactive Viewer</h1>
    <div id="svg-container">
        {{-- Directly embedding SVG here, ensure it is not escaped --}}
        {!! $svgContent !!}
    </div>
</body>

</html>
