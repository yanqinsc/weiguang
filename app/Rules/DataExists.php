<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class DataExists implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    private $conditions;
    private $model;
    public function __construct($model, $conditions)
    {
        $this->conditions = $conditions;
        $this->model = $model;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        return $this->model->where($this->conditions)->first();
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return '没找到数据！';
    }
}
