<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use ReflectionClass;

class EnumValue implements Rule
{
    private string $enumClass;

    public function __construct(string $enumClass)
    {
        $this->enumClass = $enumClass;
    }

    public function passes($attribute, $value)
    {
        $enumValues = array_map(fn($case) => $case->value, (new ReflectionClass($this->enumClass))->getConstants());

        return in_array($value, $enumValues, true);
    }

    public function message()
    {
        return 'The selected :attribute is invalid.';
    }
}
