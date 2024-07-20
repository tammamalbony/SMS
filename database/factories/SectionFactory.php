<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Section>
 */
class SectionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'classs_school_year_id' => $this->faker->numberBetween(1, 18),
            'section_type_id' => $this->faker->numberBetween(1, 3),
            'teacher_id' => \App\Models\Teacher::factory(), // Ensure a teacher is created and linked
            'name' => $this->faker->word,
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
