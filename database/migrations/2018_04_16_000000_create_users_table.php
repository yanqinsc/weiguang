<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->unique();
            $table->string('email')->unique();
            $table->string('password');
            $table->string('true_name')->default('')
                ->comment('真实姓名');
            $table->char('sex', 1)
                ->default('2')
                ->comment('性别 0|男 1|女 2|未知');
            $table->char('phone', 15)->default('');
            $table->string('qq')->default('');
            $table->integer('class_id')->default(0);
            $table->smallInteger('school_id')->default(0);
            $table->string('address')->default('');
            $table->integer('score')->default(0);
            $table->char('type', 1)->default('1')
                ->comment('类型 0|管理员 1|学生 2|教师');
            $table->rememberToken();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
