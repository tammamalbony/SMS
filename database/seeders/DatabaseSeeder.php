<?php

namespace Database\Seeders;

use App\Models\Father;
use App\Models\Section;
use App\Models\Student;
use App\Models\Teacher;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\VerifiedStudent;
use App\Models\Wife;
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
        // $this->call(CSYSDetailSeeder::class);
        $this->call(LanguageSeeder::class);
        $this->call(SectionTypeSeeder::class);
        $this->call(TermsTableSeeder::class);

        // Father::factory()
        // ->count(10) // Adjust the count as needed
        // ->has(Wife::factory()->count(1)) // Each father has one wife
        // ->create();
        // Student::factory()->count(10)->create();
        // Teacher::factory()->count(10)->create();
        // Section::factory()->count(40)->create();
        // VerifiedStudent::factory()->count(40)->create();
    }
}
