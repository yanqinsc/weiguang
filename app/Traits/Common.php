<?php
/**
 * Created by PhpStorm.
 * User: YamTsin
 * Date: 2018/6/24
 * Time: 11:34
 */

namespace App\Traits;


trait Common
{
    /**
     * 获取班级名称的匿名函数变量
     * @return \Closure
     */
    private function getGradeNameFunction()
    {
        return function ($year, $type) {
            if (date('Y') > $year) {
                return $year . '届';
            }

            $gradeName = config('app.grade_name');
            $code = $year - date('Y');

            if ($type == 1) {
                $code += 3;
            }

            if ((int)date('m') < 8) {
                return $gradeName[$code];
            } else {
                return $gradeName[$code - 1];
            }
        };
    }
}