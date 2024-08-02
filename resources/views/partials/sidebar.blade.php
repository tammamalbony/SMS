<?php
$menuItems = [
    [
        'name' => 'الرئيسية',
        'icon' => 'fa fa-home',
        'link' => '/dashboard',
        'roles' => ['admin', 'teacher', 'student', 'student parent'],
        'permission' => 'view-dashboard',
    ],
    [
        'name' => 'بيانات البطاقة',
        'icon' => 'fa fa-th-large',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-classes',
        'subMenu' => [
            [
                'name' => 'قائمة الدول و المحافظات',
                'link' => '/countries',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'قائمة المدارس',
                'link' => '/institutions',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'الأمراض',
                'link' => '/diseases',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'أنواع الأمراض',
                'link' => '/disease_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'الصفات الاجتماعية',
                'link' => '/social_traits',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'الحالات الصحية',
                'link' => '/health_conditions',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'الحالات الطبية',
                'link' => '/medical_conditions',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'أنواع الأنشطة الشبيبية ',
                'link' => '/youth_activity_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'أنواع الأنشطة الشبيبية ',
                'link' => '/youth_activity_locations',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'معايير الأنشطة الشبيبية ',
                'link' => '/youth_standards',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'تقييمات الأنشطة الشبيبية ',
                'link' => '/youth_standard_ratings',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'الأنشطة الشبيبية ',
                'link' => '/youth_activities',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],

            [
                'name' => 'أنواع المعسكرات',
                'link' => '/camp_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'أماكن المعسكرات',
                'link' => '/camp_locations',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'المعسكرات',
                'link' => '/camps',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],

            [
                'name' => 'أنواع الدورات الطلابية',
                'link' => '/student_course_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'أماكن الدورات الطلابية',
                'link' => '/student_course_locations',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'الدورات الطلابية',
                'link' => '/student_courses',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],

            [
                'name' => 'أنواع المكافآت',
                'link' => '/rewards',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'أنواع العقوبات',
                'link' => '/penalties',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'أنواع الأوسمة',
                'link' => '/medals',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
        ],
    ],
    [
        'name' => 'بيانات العائلة',
        'icon' => 'fa fa-th-large',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-classes',
        'subMenu' => [
            [
                'name' => 'تغييرات أفراد العائلة',
                'link' => '/family_members_changes',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'الحالات الأجتماعية',
                'link' => '/social_situations',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],

        ],
    ],
    [
        'name' => 'بيانات الطالب',
        'icon' => 'fa fa-th-large',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-classes',
        'subMenu' => [
            [
                'name' => 'أنواع التسجيل',
                'link' => '/registration-types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أنواع الخروج',
                'link' => '/leave_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'الاحتياجات الخاصة',
                'link' => '/special_needs_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
        ],
    ],
    [
        'name' => 'بيانات الموظفين',
        'icon' => 'fa fa-th-large',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-classes',
        'subMenu' => [
            [
                'name' => 'أنواع الموظفين',
                'link' => '/employee_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            
            [
                'name' => 'أنواع الهيئات الوظيفية',
                'link' => '/types_of_employment',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أنواع التعينات',
                'link' => '/types_of_appointments',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أنواع التعليم',
                'link' => '/education_levels',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أنواع العمل الوظيفي',
                'link' => '/kinds_of_employment',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
        ],
    ],
   
    [
        'name' => 'بيانات المدرسة',
       'icon' => 'fa fa-cogs',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-classes',
        'subMenu' => [
            [
                'name' => 'بيانات عامة',
                'link' => '/settings/',
                'roles' => ['admin'],
                'permission' => 'manage-school',
            ],
            [
                'name' => 'قائمة السنوات الدراسية',
                'link' => '/school_years',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'أنواع التعليم',
                'link' => '/education_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أنواع المدارس',
                'link' => '/school_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ], [
                'name' => 'أنواع الأبنية',
                'link' => '/school_building_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'حالات الأبنية',
                'link' => '/building_statuses',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أجناس المدارس',
                'link' => '/school_genders',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أنواع الأرضيات',
                'link' => '/ground_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'الأقسام الإدارية',
                'link' => '/local_sections',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أنواع الدوام',
                'link' => '/types_of_permanence',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أنواع المعدات',
                'link' => '/equipment_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'حالات المعدات و المرافق',
                'link' => '/equipment_statuses',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أنواع الملكية',
                'link' => '/ownership-types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أنواع الغرف',
                'link' => '/school-room-types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أنواع المرافق الصحية',
                'link' => '/public-utilities',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'الحقول الشائعة',
                'link' => '/common-fields',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
            [
                'name' => 'أسئلة عامة',
                'link' => '/school-questions',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
        ],
    ],
    [
        'name' => 'المراحل الدراسية',
        'icon' => 'fa fa-building',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-grades',
        'subMenu' => [
            [
                'name' => 'قائمة المراحل التعليمية',
                'link' => '/stages',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-grade-list',
            ],
            [
                'name' => 'قائمة المراحل الدراسية',
                'link' => '/grades',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-grade-list',
            ],
        ],
    ],
    [
        'name' => 'الصفوف',
        'icon' => 'fa fa-th-large',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-classes',
        'subMenu' => [
            [
                'name' => 'قائمة الصفوف الدراسية',
                'link' => '/classes',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'قائمة الفصول الدراسية',
                'link' => '/terms',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
            [
                'name' => 'قائمة الفئات العمرية',
                'link' => '/age_groups',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
            ],
        ],
    ],

    [
        'name' => 'الشعب',
        'icon' => 'fa fa-object-group',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-sections',
        'subMenu' => [
            // [
            //     'name' => 'قائمة الشعب الدراسية',
            //     'link' => '/sections',
            //     'roles' => ['admin', 'teacher'],
            //     'permission' => 'view-section-list',
            // ],
            [
                'name' => 'اللغات',
                'link' => '/languages',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-section-list',
            ],
            [
                'name' => 'الاجناس',
                'link' => '/section_types',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-section-list',
            ],
        ],
    ],
    [
        'name' => 'اولياء الامور',
        'icon' => 'fa fa-users',
        'link' => '#',
        'roles' => ['admin', 'student parent'],
        'permission' => 'view-parents',
        'subMenu' => [
            [
                'name' => 'قائمة اولياء الامور',
                'link' => '/fathers',
                'roles' => ['admin'],
                'permission' => 'view-parent-list',
            ],
            [
                'name' => 'زمر الدم',
                'link' => '/blood-types',
                'roles' => ['admin'],
                'permission' => 'view-parent-list',
            ],
            [
                'name' => 'الأديان',
                'link' => '/religions',
                'roles' => ['admin'],
                'permission' => 'view-parent-list',
            ],
            [
                'name' => 'الجنسيات',
                'link' => '/nationalities',
                'roles' => ['admin'],
                'permission' => 'view-parent-list',
            ],
        ],
    ],
    [
        'name' => 'الطلاب',
        'icon' => 'fa fa-user-friends',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-students',
        'subMenu' => [
            [
                'name' => 'اضافة طالب جديد',
                'link' => '/students/create',
                'roles' => ['admin'],
                'permission' => 'add-student',
            ],
            [
                'name' => 'قائمة الطلاب',
                'link' => '/students',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-student-list',
            ],
        ],
    ],
    [
        'name' => 'ترقية الطلاب',
        'link' => '#',
        'icon' => 'fa fa-graduation-cap',
        'roles' => ['admin'],
        'permission' => 'manage-student-promotions',
        'subMenu' => [
            [
                'name' => 'اضافة ترقية جديدة',
                'link' => '/Promotion',
                'roles' => ['admin'],
                'permission' => 'add-promotion',
            ],
            [
                'name' => 'قائمة الترقيات',
                'link' => '/Promotion/create',
                'roles' => ['admin'],
                'permission' => 'view-promotion-list',
            ],
        ],
    ],
    [
        'name' => 'المعلمين',
        'icon' => 'fa fa-id-badge',
        'link' => '#',
        'roles' => ['admin'],
        'permission' => 'view-teachers',
        'subMenu' => [
            [
                'name' => 'قائمة المعلمين',
                'link' => '/teachers',
                'roles' => ['admin'],
                'permission' => 'view-teacher-list',
            ],
        ],
    ],
    [
        'name' => 'المواد',
        'icon' => 'fa fa-book',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-subjects',
        'subMenu' => [
            [
                'name' => 'قائمة المواد',
                'link' => '/subjects',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-subject-list',
            ],
            [
                'name' => 'تفاصيل المواد',
                'link' => '/subject_details',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-subject-list',
            ],
        ],
    ],
    // [
    //     'name' => 'المحاسبة',
    //     'icon' => 'fa fa-dollar-sign',
    //     'link' => '#',
    //     'roles' => ['admin'],
    //     'permission' => 'manage-accounts',
    //     'subMenu' => [
    //         [
    //             'name' => 'الفواتير',
    //             'link' => '/Fees_Invoices',
    //             'roles' => ['admin'],
    //             'permission' => 'view-invoices',
    //         ],
    //         [
    //             'name' => 'سندات القبض',
    //             'link' => '/receipt_students',
    //             'roles' => ['admin'],
    //             'permission' => 'view-receipts',
    //         ],
    //         [
    //             'name' => 'استبعاد رسوم',
    //             'link' => '/ProcessingFee',
    //             'roles' => ['admin'],
    //             'permission' => 'manage-processing-fee',
    //         ],
    //         [
    //             'name' => 'سندت الصرف',
    //             'link' => '/Payment_students',
    //             'roles' => ['admin'],
    //             'permission' => 'manage-payments',
    //         ],
    //     ],
    // ],
    [
        'name' => 'إدارة SVG',
        'icon' => 'fa fa-file-code',
        'link' => '#',
        'roles' => ['admin'],
        'permission' => 'manage-attendance',
        'subMenu' => [
            // [
            //     'name' => 'رفع SVG',
            //     'link' => '/svg-upload',
            //     'roles' => ['admin'],
            //     'permission' => 'manage-attendance',
            // ],
            [
                'name' => 'قائمة SVG',
                'link' => '/svg-files',
                'roles' => ['admin'],
                'permission' => 'manage-attendance',
            ],
        ],
    ],
    [
        'name' => 'الحضور والغياب',
        'icon' => 'fa fa-calendar-check',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'manage-attendance',
        'subMenu' => [
            [
                'name' => 'تسجيل الغياب',
                'link' => '/attendances',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-attendance',
            ],
            [
                'name' => 'الدوام المدرسي',
                'link' => '/attenderatios',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-attendance-ratios',
            ],
            [
                'name' => 'اسباب الغياب',
                'link' => '/absences',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-attendance-ratios',
            ],
        ],
    ],
    [
        'name' => 'الامتحانات',
        'icon' => 'fa fa-pencil-alt',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'manage-exams',
        'subMenu' => [
            // [
            //     'name' => 'الامتحانات',
            //     'link' => '/Exams',
            //     'roles' => ['admin', 'teacher'],
            //     'permission' => 'view-exams',
            // ],
            [
                'name' => 'التقديرات',
                'link' => '/mark_reviews',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-grades',
            ],
            [
                'name' => 'العلامات',
                'link' => '/marks',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-subject-list',
            ],
        ],
    ],
    // [
    //     'name' => 'الاعدادات',
    //     'icon' => 'fa fa-cog',
    //     'link' => '#',
    //     'roles' => ['admin'],
    //     'permission' => 'manage-settings',
    //     'subMenu' => [
    //         [
    //             'name' => 'المستخدمون',
    //             'link' => '/users',
    //             'roles' => ['admin'],
    //             'permission' => 'view-users',
    //         ],
    //         [
    //             'name' => 'ادارة الاعوام السابقة',
    //             'link' => '/previous-years',
    //             'roles' => ['admin'],
    //             'permission' => 'manage-previous-years',
    //         ],
    //         [
    //             'name' => 'الاعدادات العامة',
    //             'link' => '/settings',
    //             'roles' => ['admin'],
    //             'permission' => 'update-settings',
    //         ],
    //     ],
    // ],
];

?>
<div class="main-sidebar">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="/">
                @if (!empty($generalSettings['site_name']))
                    {{ strtoupper($generalSettings['site_name']) }}
                @else
                    Platform Title
                @endif
            </a>
        </div>
        <div class="sidebar-brand sidebar-brand-sm">
            <a href="/">
                @if (!empty($generalSettings['site_name']))
                    {{ strtoupper(substr($generalSettings['site_name'], 0, 2)) }}
                @endif
            </a>
        </div>

        <ul class="sidebar-menu">
            @foreach ($menuItems as $item)
                @role($item['roles'])
                    @can($item['permission'])
                        <li class="nav-item dropdown {{ request()->is(ltrim($item['link'], '/')) ? 'active' : '' }}">
                            <a href="{{ $item['link'] }}" class="nav-link {{ !empty($item['subMenu']) ? 'has-dropdown' : '' }}"
                                {{ !empty($item['subMenu']) ? 'data-toggle=dropdown' : '' }}>
                                <i class="fa {{ $item['icon'] }}"></i>
                                <span>{{ $item['name'] }}</span>
                            </a>
                            @if (!empty($item['subMenu']))
                                <ul class="dropdown-menu">
                                    @foreach ($item['subMenu'] as $sub)
                                        @role($sub['roles'])
                                            @can($sub['permission'])
                                                <li
                                                    class="nav-item dropdown {{ request()->is(ltrim($sub['link'], '/')) ? 'active' : '' }}">
                                                    <a href="{{ $sub['link'] }}"
                                                        class="nav-link {{ !empty($sub['subMenu']) ? 'has-dropdown' : '' }}"
                                                        {{ !empty($sub['subMenu']) ? 'data-toggle=dropdown' : '' }}>
                                                        {{ $sub['name'] }}
                                                    </a>
                                                    @if (!empty($sub['subMenu']))
                                                        <ul class="dropdown-menu">
                                                            @foreach ($sub['subMenu'] as $subSub)
                                                                @role($subSub['roles'])
                                                                    @can($subSub['permission'])
                                                                        <li
                                                                            class="nav-item {{ request()->is(ltrim($subSub['link'], '/')) ? 'active' : '' }}">
                                                                            <a href="{{ $subSub['link'] }}" class="nav-link">
                                                                                {{ $subSub['name'] }}
                                                                            </a>
                                                                        </li>
                                                                    @endcan
                                                                @endrole
                                                            @endforeach
                                                        </ul>
                                                    @endif
                                                </li>
                                            @endcan
                                        @endrole
                                    @endforeach
                                </ul>
                            @endif
                        </li>
                    @endcan
                @endrole
            @endforeach
        </ul>
    </aside>
</div>
