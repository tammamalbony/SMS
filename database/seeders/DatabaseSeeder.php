<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(RolesAndPermissionsSeeder::class);
        $this->call(SettingsTableSeeder::class);
        $this->call(GradesTableSeeder::class);
        $this->call(ClassesTableSeeder::class);
        $this->call(SchoolYearTableSeeder::class);
        $this->call(TeachersTableSeeder::class);
        $this->call(BloodTypeSeeder::class);
        $this->call(ReligionSeeder::class);
        $this->call(NationalitySeeder::class);
        $this->call(SubjectSeeder::class);
        $this->call(SubjectDetailSeeder::class);
        $this->call(ClasssSchoolYearSeeder::class);
        $this->call(CSYSDetailSeeder::class);
    }
}
