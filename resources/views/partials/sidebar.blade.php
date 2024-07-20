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
        'name' => 'بيانات المدرسة',
        'icon' => 'fa fa-cogs',
        'link' => '/settings/',
        'roles' => ['admin'],
        'permission' => 'manage-school',
    ],
    [
        'name' => 'السنوات الدراسية',
        'icon' => 'fa fa-calendar',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-classes',
        'subMenu' => [
            [
                'name' => 'قائمة السنوات الدراسية',
                'link' => '/school_years',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-class-list',
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
        ],
    ],
   
    [
        'name' => 'الشعب',
        'icon' => 'fa fa-object-group',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'view-sections',
        'subMenu' => [
            [
                'name' => 'قائمة الشعب الدراسية',
                'link' => '/sections',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-section-list',
            ],
            [
                'name' => 'اللغات',
                'link' => '/languages',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-section-list',
            ],
            [
                'name' => 'الانواع',
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
            [
                'name' => 'العلامات',
                'link' => '/marks',
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
        'name' => 'الحضور والغياب',
        'icon' => 'fa fa-calendar-check',
        'link' => '#',
        'roles' => ['admin', 'teacher'],
        'permission' => 'manage-attendance',
        'subMenu' => [
            [
                'name' => 'قائمة الطلاب',
                'link' => '/Attendance',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-attendance',
            ],
            [
                'name' => 'الدوام المدرسي',
                'link' => '/attenderatios',
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
            [
                'name' => 'الامتحانات',
                'link' => '/Exams',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-exams',
            ],
            [
                'name' => 'التقديرات',
                'link' => '/mark_reviews',
                'roles' => ['admin', 'teacher'],
                'permission' => 'view-grades',
            ],
        ],
    ],
    [
        'name' => 'الاعدادات',
        'icon' => 'fa fa-cog',
        'link' => '#',
        'roles' => ['admin'],
        'permission' => 'manage-settings',
        'subMenu' => [
            [
                'name' => 'المستخدمون',
                'link' => '/users',
                'roles' => ['admin'],
                'permission' => 'view-users',
            ],
            [
                'name' => 'ادارة الاعوام السابقة',
                'link' => '/previous-years',
                'roles' => ['admin'],
                'permission' => 'manage-previous-years',
            ],
            [
                'name' => 'الاعدادات العامة',
                'link' => '/settings',
                'roles' => ['admin'],
                'permission' => 'update-settings',
            ],
        ],
    ],
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
