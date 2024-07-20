<?php

namespace Database\Factories;

use App\Enums\VerifiedStudentStatus;
use App\Models\Section;
use App\Models\Student;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\VerifiedStudent>
 */
class VerifiedStudentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $sectionIds = Section::pluck('id')->toArray();
        return [
            'student_id' => Student::factory(), // Ensure a student is created and linked
            'section_id' => $this->faker->randomElement($sectionIds), // Ensure a section is created and linked
            'is_confirmed' => $this->faker->boolean,
            'order' => $this->faker->optional()->randomDigitNotNull,
            'status' => $this->faker->randomElement(VerifiedStudentStatus::cases())->value,
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
