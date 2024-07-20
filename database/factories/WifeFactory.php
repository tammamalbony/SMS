<?php

namespace Database\Factories;

use App\Models\Father;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Wife>
 */
class WifeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'father_id' => Father::factory(), // Creates a new Father for each Wife
            'name' => $this->faker->name,
            'name_en' => $this->faker->name,
            'job' => $this->faker->jobTitle,
            'job_en' => $this->faker->jobTitle,
            'national_id' => $this->faker->numerify('#########'),
            'passport_id' => $this->faker->bothify('??########'),
            'phone' => $this->faker->phoneNumber,
            'nationality_id' => $this->faker->numberBetween(1, 48),
            'blood_type_id' => $this->faker->numberBetween(1, 8),
            'religion_id' => $this->faker->numberBetween(1, 3),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
