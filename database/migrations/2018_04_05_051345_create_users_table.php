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
            $table->string('username', 30)->unique('u_username');
            $table->char('password', 32);
            $table->char('sex', 1)->default('2')->comment('性别 0|男 1|女 2|未知');
            $table->char('phone', 15)->defualt('');
            $table->string('email', 50);
            $table->string('qq', 11)->defualt('');
            $table->Integer('class_id')->unsigned();
            $table->smallInteger('school_id')->unsigned();
            $table->string('address')->defualt('');
            $table->timestamps();
            $table->engine = 'MyISAM';
            $table->charset = 'utf8mb4';
            $table->collation = 'utf8mb4_unicode_ci';

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
