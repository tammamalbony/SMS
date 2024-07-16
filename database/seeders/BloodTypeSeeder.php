<?php

namespace Database\Seeders;

use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BloodTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $bloodTypes = [
            ['type' => 'O-'],
            ['type' => 'O+'],
            ['type' => 'A+'],
            ['type' => 'A-'],
            ['type' => 'B+'],
            ['type' => 'B-'],
            ['type' => 'AB+'],
            ['type' => 'AB-'],
        ];

        DB::table('blood_types')->insert($bloodTypes);
    }
}
