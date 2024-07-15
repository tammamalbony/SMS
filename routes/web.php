<?php
use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\AttendanceRatioController;
use App\Http\Controllers\ClassroomController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\GeneralSettingsController;
use App\Http\Controllers\GradeController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\MGradeController;
use App\Http\Controllers\ParentController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\PreviousYearController;
use App\Http\Controllers\ProcessingFeeController;
use App\Http\Controllers\PromotionController;
use App\Http\Controllers\ReceiptController;
use App\Http\Controllers\SectionController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\SubjectController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\StudentController;
use Illuminate\Support\Facades\Route;

// Public routes
Route::get('/', function () {
    if (Auth::check()) {
        return redirect('/dashboard');
    } else {
        return redirect('/login');
    }
});
// Route::get('/home', [HomeController::class, 'index'])->name('home.index');

// Admin routes
Route::get('/dashboard', [AdminController::class, 'index'])->name('admin.dashboard');

Route::middleware(['auth', 'role:admin'])->group(function () {
    Route::resource('admin/users', UserController::class, [
        'names' => [
            'index' => 'admin.users.index',
            'create' => 'admin.users.create',
            'store' => 'admin.users.store',
            'show' => 'admin.users.show',
            'edit' => 'admin.users.edit',
            'update' => 'admin.users.update',
            'destroy' => 'admin.users.destroy',
        ]
    ]);
});

// Teacher routes
Route::middleware(['auth', 'role:teacher'])->group(function () {
    Route::get('/teacher/dashboard', [TeacherController::class, 'index'])->name('teacher.dashboard');
    Route::get('/teacher/grades', [TeacherController::class, 'manageGrades'])->name('teacher.grades.index');
    Route::get('/teacher/attendance', [TeacherController::class, 'manageAttendance'])->name('teacher.attendance.index');
});

// Student routes
Route::middleware(['auth', 'role:student'])->group(function () {
    Route::get('/student/dashboard', [StudentController::class, 'index'])->name('student.dashboard');
    Route::get('/student/grades', [StudentController::class, 'viewGrades'])->name('student.grades.index');
    Route::get('/student/attendance', [StudentController::class, 'viewAttendance'])->name('student.attendance.index');
});
// Dashboard
Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard.index');

// Settings
Route::get('/settings/{id}', [SettingsController::class, 'show'])->name('settings.show');
Route::get('/settings', [SettingsController::class, 'index'])->name('settings.index');
Route::get('/settings/create', [SettingsController::class, 'create'])->name('settings.create');
Route::post('/settings', [SettingsController::class, 'store'])->name('settings.store');
Route::get('/settings/{id}/edit', [SettingsController::class, 'edit'])->name('settings.edit');
Route::put('/settings/{id}', [SettingsController::class, 'update'])->name('settings.update');
Route::delete('/settings/{id}', [SettingsController::class, 'destroy'])->name('settings.destroy');

// Grades
Route::resource('grades', GradeController::class)->except(['create', 'edit']);

// Classrooms
Route::resource('classrooms', ClassroomController::class)->except(['create', 'edit']);

// Sections
Route::resource('sections', SectionController::class)->except(['create', 'edit']);

// Parents
Route::resource('parents', ParentController::class)->except(['create', 'edit']);

// Students
Route::resource('students', StudentController::class)->except(['edit']); // create provided in original list

// Promotions
Route::resource('promotions', PromotionController::class)->except(['edit']); // create provided in original list

// Teachers
Route::resource('teachers', TeacherController::class)->except(['create', 'edit']);

// Subjects
Route::resource('subjects', SubjectController::class)->except(['create', 'edit']);

// Accounting - Invoices, Receipts, Processing Fees, and Payments
Route::resource('invoices', InvoiceController::class)->except(['create', 'edit']);
Route::resource('receipts', ReceiptController::class)->except(['create', 'edit']);
Route::resource('processingfees', ProcessingFeeController::class)->except(['create', 'edit']);
Route::resource('payments', PaymentController::class)->except(['create', 'edit']);

// Attendance and Attendance Ratios
Route::resource('attendance', AttendanceController::class)->except(['create', 'edit']);
Route::resource('attendanceratios', AttendanceRatioController::class)->except(['create', 'edit']);

// Exams and Grades
Route::resource('exams', ExamController::class)->except(['create', 'edit']);
Route::resource('mgrades', MGradeController::class)->except(['create', 'edit']);

// Users
Route::get('/users', [UserController::class, 'index'])->name('users.index');
Route::get('/users/create', [UserController::class, 'create'])->name('users.create');
Route::post('/users', [UserController::class, 'store'])->name('users.store');
Route::get('/users/{user}', [UserController::class, 'show'])->name('users.show');
Route::get('/users/{user}/edit', [UserController::class, 'edit'])->name('users.edit');
Route::put('/users/{user}', [UserController::class, 'update'])->name('users.update');
Route::delete('/users/{user}', [UserController::class, 'destroy'])->name('users.destroy');

// Previous Years Management
Route::resource('previous-years', PreviousYearController::class)->except(['create', 'edit']);

// General Settings
Route::resource('general-settings', GeneralSettingsController::class)->except(['create', 'edit']);
