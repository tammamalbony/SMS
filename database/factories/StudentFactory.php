<?php

namespace Database\Factories;

use App\Models\Father;
use App\Models\Wife;
use Hash;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Student>
 */
class StudentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        
        $father = Father::factory()->create();
        $mother = Wife::factory()->create(['father_id' => $father->id]);

        return [
            'first_name' => $this->faker->firstName,
            'last_name' => $this->faker->lastName,
            'name_ar' => $this->faker->name,
            'name_en' => $this->faker->name,
            'email' => $this->faker->unique()->safeEmail,
            'password' => Hash::make('password'), // You can use a static password for all or use $this->faker->password
            'birthdate' => $this->faker->date,
            'gender' => $this->faker->randomElement(['male', 'female']),
            'nationality_id' => $this->faker->numberBetween(1, 48),
            'blood_type_id' => $this->faker->numberBetween(1, 8),
            'religion_id' => $this->faker->numberBetween(1, 3),
            'national_id' => $this->faker->unique()->numerify('#########'),
            'passport_id' => $this->faker->unique()->bothify('??########'),
            'phone' => $this->faker->phoneNumber,
            'mobile' => $this->faker->phoneNumber,
            'father_id' => $father->id,
            'mother_id' => $mother->id,
            'record_place' => $this->faker->city,
            'record_id' => $this->faker->numerify('#########'),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
