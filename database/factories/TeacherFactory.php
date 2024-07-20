<?php

namespace Database\Factories;

use Hash;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Teacher>
 */
class TeacherFactory extends Factory
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
            'name_ar' => $this->faker->name,
            'name_en' => $this->faker->name,
            'mother' => $this->faker->name,
            'specialization_id' => $this->faker->numberBetween(1, 10), // Ensure these IDs exist
            'gender_id' => $this->faker->numberBetween(1, 2), // Ensure these IDs exist
            'marital_status' => $this->faker->numberBetween(0, 1), // Example values: 0 = Single, 1 = Married
            'birthdate' => $this->faker->date,
            'address_birth' => $this->faker->address,
            'add_num' => $this->faker->unique()->numerify('#########'),
            'tel' => $this->faker->phoneNumber,
            'mobile' => $this->faker->phoneNumber,
            'gern' => $this->faker->word,
            'religion' => $this->faker->word,
            'work_type' => $this->faker->word,
            'joining_date' => $this->faker->date,
            'address' => $this->faker->address,
            'address_fixed' => $this->faker->address,
            'state' => $this->faker->state,
            'certificates' => $this->faker->word,
            'highest_cert' => $this->faker->word,
            'date_obtained' => $this->faker->date,
            'salary' => $this->faker->randomFloat(2, 3000, 10000),
            'type_job' => $this->faker->word,
            'type_dis' => $this->faker->word,
            'type_of_job' => $this->faker->numberBetween(0, 1), // Example values: 0 = Full-time, 1 = Part-time
            'cityI' => $this->faker->city,
            'date_admin_work' => $this->faker->date,
            'belongs_him' => $this->faker->word,
            'subjet' => $this->faker->word,
            'quorum_hours' => $this->faker->numberBetween(0, 40),
            'e_quorum_hours' => $this->faker->numberBetween(0, 40),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
