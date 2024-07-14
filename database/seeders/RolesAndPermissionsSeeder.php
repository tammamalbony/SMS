<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;

class RolesAndPermissionsSeeder extends Seeder
{
    public function run()
    {
        // Reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // Define permissions based on the menu items provided
        $permissions = [
            'view-dashboard',
            'manage-school',
            'view-grades',
            'view-grade-list',
            'view-classes',
            'view-class-list',
            'view-sections',
            'view-section-list',
            'view-parents',
            'view-parent-list',
            'view-students',
            'view-student-info',
            'add-student',
            'view-student-list',
            'manage-student-promotions',
            'add-promotion',
            'view-promotion-list',
            'view-teachers',
            'view-teacher-list',
            'view-subjects',
            'view-subject-list',
            'manage-accounts',
            'view-invoices',
            'view-receipts',
            'manage-processing-fee',
            'manage-payments',
            'manage-attendance',
            'view-attendance',
            'view-attendance-ratios',
            'manage-exams',
            'view-exams',
            'manage-settings',
            'view-users',
            'manage-previous-years',
            'update-settings',
        ];

        // Create permissions
        foreach ($permissions as $permission) {
            Permission::create(['name' => $permission]);
        }

        // Define roles and their specific permissions
        $roles = [
            'admin' => $permissions,
            'teacher' => [
                'view-dashboard',
                'view-grades',
                'view-grade-list',
                'view-classes',
                'view-class-list',
                'view-sections',
                'view-section-list',
                'view-students',
                'view-student-info',
                'view-student-list',
                'view-teachers',
                'view-teacher-list',
                'view-subjects',
                'view-subject-list',
                'manage-attendance',
                'view-attendance',
                'view-attendance-ratios',
                'manage-exams',
                'view-exams',
            ],
            'student' => [
                'view-dashboard',
                'view-grades',
                'view-classes',
                'view-sections',
                'view-students',
            ],
            'student parent' => [
                'view-grades',
                'view-attendance',
                'view-student-info',
            ],
        ];

        // Create roles and assign permissions
        foreach ($roles as $roleName => $rolePermissions) {
            $role = Role::create(['name' => $roleName]);
            $role->givePermissionTo($rolePermissions);
        }

        // Create default users and assign roles
        $users = [
            [
                'name' => 'Admin User',
                'email' => 'admin@example.com',
                'password' => bcrypt('password'),
                'role' => 'admin'
            ],
            [
                'name' => 'Teacher User',
                'email' => 'teacher@example.com',
                'password' => bcrypt('password'),
                'role' => 'teacher'
            ],
            [
                'name' => 'Student User',
                'email' => 'student@example.com',
                'password' => bcrypt('password'),
                'role' => 'student'
            ],
            [
                'name' => 'Parent User',
                'email' => 'parent@example.com',
                'password' => bcrypt('password'),
                'role' => 'student parent'
            ],
        ];

        foreach ($users as $userData) {
            $user = User::create([
                'name' => $userData['name'],
                'email' => $userData['email'],
                'password' => $userData['password'],
            ]);
            $user->assignRole($userData['role']);
        }
    }
}
