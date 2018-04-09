<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatCategoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->tinyIncrements('id');
            $table->string('name', 30)->default('')->comment('分类名称');
            $table->string('abbreviation', 15)->default('')->comment('简称');
            $table->char('is_nav', 1)->default('0')->comment('是否作为导航栏频道');
            $table->string('desc')->default('')->comment('分类详情');
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
        Schema::dropIfExists('categories');
    }
}
