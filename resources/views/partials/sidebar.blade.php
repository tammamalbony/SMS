<div class="sidebar">
    <ul class="nav">
        @role('admin')
            <li class="nav-item">
                <a class="nav-link" href="{{ route('admin.dashboard') }}">Admin Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('admin.users.index') }}">Manage Users</a>
            </li>
        @endrole

        @role('teacher')
            <li class="nav-item">
                <a class="nav-link" href="{{ route('teacher.dashboard') }}">Teacher Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('teacher.grades.index') }}">Manage Grades</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('teacher.attendance.index') }}">Manage Attendance</a>
            </li>
        @endrole

        @role('student')
            <li class="nav-item">
                <a class="nav-link" href="{{ route('student.dashboard') }}">Student Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('student.grades.index') }}">View Grades</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('student.attendance.index') }}">View Attendance</a>
            </li>
        @endrole
    </ul>
</div>
