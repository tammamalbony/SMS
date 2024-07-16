<?php

namespace Database\Seeders;

use DB;
use Hash;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TeachersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('teachers')->insert([
            'id' => 1,
            'email' => 't.amal@chamivs.com',
            'password' => Hash::make('t.amal@chamivs.com'), 
            'name_ar' => 'أمل نجم',
            'name_en' => 'Amal Najm',
            'mother' => 'سلمى عريج',
            'specialization_id' => 10,
            'gender_id' => 6,
            'marital_status' => 1,
            'birthdate' => '2024-07-01',
            'address_birth' => 'التياس',
            'add_num' => '13120005125',
            'tel' => '319173',
            'mobile' => '0988072815',
            'gern' => 'السورية',
            'religion' => 'اسلامية',
            'work_type' => 'أمانة السر',
            'joining_date' => '2023-08-01',
            'address' => 'السويداء-حي النهضة',
            'address_fixed' => 'السويداء-حي النهضة',
            'state' => 'السويداء',
            'certificates' => 'أهلية تعليم إعدادي/قسم اللغة الأنكليزية',
            'highest_cert' => 'أهلية تعليم إعدادي/قسم اللغة الأنكليزية',
            'date_obtained' => '1993-01-01',
            'salary' => 251564.00,
            'type_job' => 'type job',
            'type_dis' => 'dis jb',
            'type_of_job' => 2,
            'cityI' => 'state pos',
            'date_admin_work' => '2023-08-01',
            'belongs_him' => 'malak',
            'subjet' => 'انكليزي',
            'quorum_hours' => 20,
            'e_quorum_hours' => 1,
            'created_at' => '2024-07-16 10:24:28',
            'updated_at' => '2024-07-16 10:28:55'
        ]);
    }
}
