<?php

namespace Database\Factories;

use Hash;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Father>
 */
class FatherFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
       
        return [
            'email' => $this->faker->unique()->safeEmail,
            'password' => Hash::make('password'), // You can use a static password for all or use $this->faker->password
            'name' => $this->faker->name,
            'name_en' => $this->faker->name,
            'last_name' => $this->faker->lastName,
            'job' => $this->faker->jobTitle,
            'job_en' => $this->faker->jobTitle,
            'national_id' => $this->faker->numerify('#########'),
            'passport_id' => $this->faker->bothify('??########'),
            'phone' => $this->faker->phoneNumber,
            'nationality_id' => $this->faker->numberBetween(1, 48),
            'blood_type_id' => $this->faker->numberBetween(1, 8),
            'religion_id' => $this->faker->numberBetween(1, 3),
            'address' => $this->faker->address,
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
