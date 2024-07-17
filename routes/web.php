<?php
use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\AttendanceRatioController;
use App\Http\Controllers\BloodTypeController;
use App\Http\Controllers\ClassroomController;
use App\Http\Controllers\ClasssSchoolYearController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\FatherController;
use App\Http\Controllers\GeneralSettingsController;
use App\Http\Controllers\GradeController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\JobSequenceController;
use App\Http\Controllers\MarkReviewController;
use App\Http\Controllers\MGradeController;
use App\Http\Controllers\NationalityController;
use App\Http\Controllers\ParentController;
use App\Http\Controllers\PartController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\PreviousYearController;
use App\Http\Controllers\ProcessingFeeController;
use App\Http\Controllers\PromotionController;
use App\Http\Controllers\ReceiptController;
use App\Http\Controllers\ReligionController;
use App\Http\Controllers\RewardPunishmentController;
use App\Http\Controllers\SchoolYearController;
use App\Http\Controllers\SectionController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\SubjectController;
use App\Http\Controllers\SubjectDetailController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\WifeController;
use App\Http\Controllers\YearClassSubjectController;
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
    Route::get('/{id}/edit', [SettingsController::class, 'update'])->name('settings.edit');
    Route::post('/create', [SettingsController::class, 'create'])->name('settings.create');
    Route::post('/store', [SettingsController::class, 'store'])->name('settings.store');
    Route::post('/{id}/update', [SettingsController::class, 'update'])->name('settings.update');
});


// Grades
Route::prefix('grades')->group(function () {
    Route::get('/', [GradeController::class, 'index'])->name('grades.index');
    Route::get('/{id}/edit', [GradeController::class, 'update'])->name('grades.edit');
    Route::post('/create', [GradeController::class, 'create'])->name('grades.create');
    Route::post('/store', [GradeController::class, 'store'])->name('grades.store');
    Route::post('/{id}/update', [GradeController::class, 'update'])->name('grades.update');
    Route::post('/{id}/delete', [GradeController::class, 'destroy'])->name('grades.destroy');
});



// Classrooms
Route::prefix('classes')->group(function () {
    Route::get('/', [ClassroomController::class, 'index'])->name('classes.index');
    Route::get('/{id}/edit', [ClassroomController::class, 'update'])->name('classes.edit');
    Route::post('/create', [ClassroomController::class, 'create'])->name('classes.create');
    Route::post('/store', [ClassroomController::class, 'store'])->name('classes.store');
    Route::post('/{id}/update', [ClassroomController::class, 'update'])->name('classes.update');
    Route::post('/{id}/delete', [ClassroomController::class, 'destroy'])->name('classes.destroy');
});

// SchoolYear 
Route::prefix('school_years')->group(function () {
    Route::get('/', [SchoolYearController::class, 'index'])->name('school_years.index');
    Route::get('/{id}/edit', [SchoolYearController::class, 'update'])->name('school_years.edit');
    Route::post('/create', [SchoolYearController::class, 'create'])->name('school_years.create');
    Route::post('/store', [SchoolYearController::class, 'store'])->name('school_years.store');
    Route::post('/{id}/update', [SchoolYearController::class, 'update'])->name('school_years.update');
    Route::post('/{id}/delete', [SchoolYearController::class, 'destroy'])->name('school_years.destroy');
});


// Teachers
Route::prefix('teachers')->group(function () {
    Route::get('/', [TeacherController::class, 'index'])->name('teachers.index');
    Route::get('/{id}/edit', [TeacherController::class, 'edit'])->name('teachers.edit');
    Route::get('/create', [TeacherController::class, 'create'])->name('teachers.create');
    Route::post('/store', [TeacherController::class, 'store'])->name('teachers.store');
    Route::post('/{id}/update', [TeacherController::class, 'update'])->name('teachers.update');
    Route::post('/{id}/delete', [TeacherController::class, 'destroy'])->name('teachers.destroy');
});

// job_sequences
Route::prefix('job_sequences')->group(function () {
    Route::get('/{id}', [JobSequenceController::class, 'index'])->name('job_sequences.index');
    Route::post('/{id}/edit', [JobSequenceController::class, 'edit'])->name('job_sequences.edit');
    Route::get('/create', [JobSequenceController::class, 'create'])->name('job_sequences.create');
    Route::post('/store', [JobSequenceController::class, 'store'])->name('job_sequences.store');
    Route::post('/{id}/update', [JobSequenceController::class, 'update'])->name('job_sequences.update');
    Route::post('/{id}/delete', [JobSequenceController::class, 'destroy'])->name('job_sequences.destroy');
});

// rewards_punishments
Route::prefix('rewards_punishments')->group(function () {
    Route::get('/{id}', [RewardPunishmentController::class, 'index'])->name('rewards_punishments.index');
    Route::post('/{id}/edit', [RewardPunishmentController::class, 'edit'])->name('rewards_punishments.edit');
    Route::get('/create', [RewardPunishmentController::class, 'create'])->name('rewards_punishments.create');
    Route::post('/store', [RewardPunishmentController::class, 'store'])->name('rewards_punishments.store');
    Route::post('/{id}/update', [RewardPunishmentController::class, 'update'])->name('rewards_punishments.update');
    Route::post('/{id}/delete', [RewardPunishmentController::class, 'destroy'])->name('rewards_punishments.destroy');
});

// courses
Route::prefix('courses')->group(function () {
    Route::get('/{id}', [CourseController::class, 'index'])->name('courses.index');
    Route::post('/{id}/edit', [CourseController::class, 'edit'])->name('courses.edit');
    Route::get('/create', [CourseController::class, 'create'])->name('courses.create');
    Route::post('/store', [CourseController::class, 'store'])->name('courses.store');
    Route::post('/{id}/update', [CourseController::class, 'update'])->name('courses.update');
    Route::post('/{id}/delete', [CourseController::class, 'destroy'])->name('courses.destroy');
});



// subjects
Route::prefix('subjects')->group(function () {
    Route::get('/{id}', [SubjectController::class, 'index'])->name('subjects.index');
    Route::post('/{id}/edit', [SubjectController::class, 'edit'])->name('subjects.edit');
    Route::get('/create', [SubjectController::class, 'create'])->name('subjects.create');
    Route::post('/store', [SubjectController::class, 'store'])->name('subjects.store');
    Route::post('/{id}/update', [SubjectController::class, 'update'])->name('subjects.update');
    Route::post('/{id}/delete', [SubjectController::class, 'destroy'])->name('subjects.destroy');
});

// subject_details
Route::prefix('subject_details')->group(function () {
    Route::get('/', [SubjectDetailController::class, 'index'])->name('subject_details.index');
    Route::get('/create', [SubjectDetailController::class, 'create'])->name('subject_details.create');
    Route::post('/store', [SubjectDetailController::class, 'store'])->name('subject_details.store');
    Route::prefix('{id}')->group(function () {
        Route::post('/edit', [SubjectDetailController::class, 'edit'])->name('subject_details.edit');
        Route::post('/update', [SubjectDetailController::class, 'update'])->name('subject_details.update');
        Route::post('/delete', [SubjectDetailController::class, 'destroy'])->name('subject_details.destroy');
    });
});


//Blood Types
Route::prefix('blood-types')->group(function () {
    Route::get('/', [BloodTypeController::class, 'index'])->name('blood_types.index');
    Route::get('/create', [BloodTypeController::class, 'create'])->name('blood_types.create');
    Route::post('/', [BloodTypeController::class, 'store'])->name('blood_types.store');
    Route::get('/{bloodType}', [BloodTypeController::class, 'show'])->name('blood_types.show');
    Route::post('/{bloodType}/edit', [BloodTypeController::class, 'edit'])->name('blood_types.edit');
    Route::post('/{bloodType}', [BloodTypeController::class, 'update'])->name('blood_types.update');
    Route::delete('/{bloodType}', [BloodTypeController::class, 'destroy'])->name('blood_types.destroy');
});

//Religions
Route::prefix('religions')->group(function () {
    Route::get('/', [ReligionController::class, 'index'])->name('religions.index');
    Route::get('/create', [ReligionController::class, 'create'])->name('religions.create');
    Route::post('/', [ReligionController::class, 'store'])->name('religions.store');
    Route::get('/{religion}', [ReligionController::class, 'show'])->name('religions.show');
    Route::post('/{religion}/edit', [ReligionController::class, 'edit'])->name('religions.edit');
    Route::post('/{religion}', [ReligionController::class, 'update'])->name('religions.update');
    Route::delete('/{religion}', [ReligionController::class, 'destroy'])->name('religions.destroy');
});

//Nationalities
Route::prefix('nationalities')->group(function () {
    Route::get('/', [NationalityController ::class, 'index'])->name('nationalities.index');
    Route::get('/create', [NationalityController ::class, 'create'])->name('nationalities.create');
    Route::post('/', [NationalityController ::class, 'store'])->name('nationalities.store');
    Route::get('/{nationality}', [NationalityController ::class, 'show'])->name('nationalities.show');
    Route::post('/{nationality}/edit', [NationalityController ::class, 'edit'])->name('nationalities.edit');
    Route::post('/{nationality}', [NationalityController ::class, 'update'])->name('nationalities.update');
    Route::delete('/{nationality}', [NationalityController ::class, 'destroy'])->name('nationalities.destroy');
});

Route::resource('fathers', FatherController::class);
Route::resource('fathers.wives', WifeController::class);
Route::resource('students', StudentController::class);
Route::post('/students/get-mothers', [StudentController::class, 'getMothers'])->name('students.getMothers');

Route::prefix('school-years/{schoolYear}')->group(function () {
    Route::get('classs-school-years', [ClasssSchoolYearController::class, 'index'])->name('classs_school_year.index');
    Route::get('classs-school-years/create', [ClasssSchoolYearController::class, 'create'])->name('classs_school_year.create');
    Route::post('classs-school-years', [ClasssSchoolYearController::class, 'store'])->name('classs_school_year.store');
});
Route::post('classs_school_year/{id}/delete', [ClasssSchoolYearController::class, 'destroy'])->name('classs_school_year.store');
Route::get('classs_school_year/{id}/edit', [ClasssSchoolYearController::class, 'edit'])->name('classs_school_year.store');
Route::get('classs_school_year/{id}/update', [ClasssSchoolYearController::class, 'update'])->name('classs_school_year.store');

Route::resource('classs-school-years', ClasssSchoolYearController::class)->except(['index', 'create', 'store']);
Route::post('school-years/{schoolYear}/add-all-classes', [ClasssSchoolYearController::class, 'addAllClasses'])->name('classs_school_year.add_all_classes');

Route::resource('year_class_subject', YearClassSubjectController::class);


Route::prefix('school-years/{classsSchoolYear}/year_class_subjects')->group(function () {
    Route::get('/', [YearClassSubjectController::class, 'index'])->name('year_class_subject.index');
    Route::get('/create', [YearClassSubjectController::class, 'create'])->name('year_class_subject.create');
    Route::post('/', [YearClassSubjectController::class, 'store'])->name('year_class_subject.store');
    Route::get('/{yearClassSubject}/edit', [YearClassSubjectController::class, 'edit'])->name('year_class_subject.edit');
    Route::put('/{yearClassSubject}/update', [YearClassSubjectController::class, 'update'])->name('year_class_subject.update');
    Route::post('/{yearClassSubject}/delete', [YearClassSubjectController::class, 'destroy'])->name('year_class_subject.destroy');
    
});
Route::post('/year_class_subjects/{classsSchoolYear}/update_order', [YearClassSubjectController::class, 'updateOrder'])->name('year_class_subject.update_order');

Route::resource('mark_reviews', MarkReviewController::class)->except(['show', 'edit']);

Route::resource('parts', PartController::class)->except(['show', 'edit']);


// Sections
Route::resource('sections', SectionController::class);

// Parents
Route::resource('parents', ParentController::class);


// Promotions
Route::resource('promotions', PromotionController::class)->except(['edit']); // create provided in original list


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
