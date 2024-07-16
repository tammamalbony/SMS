<?php

namespace Database\Seeders;

use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class NationalitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $nationalities = [
            ['name' => 'سوري'],
            ['name' => 'أرجنتيني'],
            ['name' => 'أرميني'],
            ['name' => 'أسترالي'],
            ['name' => 'نمساوي'],
            ['name' => 'بحريني'],
            ['name' => 'روسي'],
            ['name' => 'كندي'],
            ['name' => 'صيني'],
            ['name' => 'مصري'],
            ['name' => 'فرنسي'],
            ['name' => 'يوناني'],
            ['name' => 'هندي'],
            ['name' => 'إيراني'],
            ['name' => 'عراقي'],
            ['name' => 'إيرلندي'],
            ['name' => 'إيطالي'],
            ['name' => 'ياباني'],
            ['name' => 'أردني'],
            ['name' => 'كوري'],
            // Note that "كوري" appears twice, you might need to adjust this if it's not intentional.
            ['name' => 'كويتي'],
            ['name' => 'لبناني'],
            ['name' => 'ليبي'],
            ['name' => 'ماليزي'],
            ['name' => 'مالديفي'],
            ['name' => 'موريتانيي'],
            ['name' => 'مكسيكي'],
            ['name' => 'هولندي'],
            ['name' => 'عماني'],
            ['name' => 'فلسطيني'],
            ['name' => 'برتغالي'],
            ['name' => 'قطري'],
            ['name' => 'روماني'],
            ['name' => 'روسي'],
            ['name' => 'سعودي'],
            ['name' => 'سوادني جنوبي'],
            ['name' => 'إسباني'],
            ['name' => 'سوداني'],
            ['name' => 'سويدي'],
            ['name' => 'سويسري'],
            ['name' => 'تونسي'],
            ['name' => 'تركي'],
            ['name' => 'أوكراني'],
            ['name' => 'إماراتي'],
            ['name' => 'بريطاني'],
            ['name' => 'أمريكي'],
            ['name' => 'فنزويلي'],
            ['name' => 'يمني'],
        ];

        DB::table('nationalities')->insert($nationalities);
    }
}
