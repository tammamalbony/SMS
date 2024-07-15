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

// Settings School
Route::prefix('settings')->group(function () {
    Route::get('/', [SettingsController::class, 'index'])->name('settings.index');
    Route::get('/{id}/edit', [SettingsController::class, 'update'])->name('settings.update');
    Route::post('/create', [SettingsController::class, 'create'])->name('settings.create');
    Route::post('/store', [SettingsController::class, 'store'])->name('settings.create');
    Route::post('/{id}/update', [SettingsController::class, 'update'])->name('settings.update');
});


// Grades
Route::prefix('grades')->group(function () {
    Route::get('/', [GradeController::class, 'index'])->name('grades.index');
    Route::get('/{id}/edit', [GradeController::class, 'update'])->name('grades.update');
    Route::post('/create', [GradeController::class, 'create'])->name('grades.create');
    Route::post('/store', [GradeController::class, 'store'])->name('grades.create');
    Route::post('/{id}/update', [GradeController::class, 'update'])->name('grades.update');
    Route::post('/{id}/delete', [GradeController::class, 'destroy'])->name('grades.destroy');
});



// Classrooms
Route::prefix('classes')->group(function () {
    Route::get('/', [ClassroomController::class, 'index'])->name('classes.index');
    Route::get('/{id}/edit', [ClassroomController::class, 'update'])->name('classes.update');
    Route::post('/create', [ClassroomController::class, 'create'])->name('classes.create');
    Route::post('/store', [ClassroomController::class, 'store'])->name('classes.create');
    Route::post('/{id}/update', [ClassroomController::class, 'update'])->name('classes.update');
    Route::post('/{id}/delete', [ClassroomController::class, 'destroy'])->name('classes.destroy');
});


// Sections
Route::resource('sections', SectionController::class);

// Parents
Route::resource('parents', ParentController::class);

// Students
Route::resource('students', StudentController::class)->except(['edit']); // create provided in original list

// Promotions
Route::resource('promotions', PromotionController::class)->except(['edit']); // create provided in original list

// Teachers
Route::resource('teachers', TeacherController::class);

// Subjects
Route::resource('subjects', SubjectController::class);

// Accounting - Invoices, Receipts, Processing Fees, and Payments
Route::resource('invoices', InvoiceController::class);
Route::resource('receipts', ReceiptController::class);
Route::resource('processingfees', ProcessingFeeController::class);
Route::resource('payments', PaymentController::class);

// Attendance and Attendance Ratios
Route::resource('attendance', AttendanceController::class);
Route::resource('attendanceratios', AttendanceRatioController::class);

// Exams and Grades
Route::resource('exams', ExamController::class);
Route::resource('mgrades', MGradeController::class);

// Users
Route::get('/users', [UserController::class, 'index'])->name('users.index');
Route::get('/users/create', [UserController::class, 'create'])->name('users.create');
Route::post('/users', [UserController::class, 'store'])->name('users.store');
Route::get('/users/{user}', [UserController::class, 'show'])->name('users.show');
Route::get('/users/{user}/edit', [UserController::class, 'edit'])->name('users.edit');
Route::put('/users/{user}', [UserController::class, 'update'])->name('users.update');
Route::delete('/users/{user}', [UserController::class, 'destroy'])->name('users.destroy');

// Previous Years Management
Route::resource('previous-years', PreviousYearController::class);

// General Settings
Route::resource('general-settings', GeneralSettingsController::class);
});
