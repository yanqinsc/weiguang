<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArticleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('article', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title', 100);
            $table->string('author', 20);
            $table->string('thumb')->default('')->comment('文章缩略图');
            $table->text('summary')->default('')->comment('文章摘要');
            $table->integer('views')->unsigned()->default(0)->comment('浏览量');
            $table->integer('comments')->unsigned()->default(0)->comment('评论数量');
            $table->char('is_top', 1)->default('0');
            $table->char('is_hot', 1)->default('0');
            $table->char('is_new', 1)->default('0');
            $table->tinyInteger('category_id')->unsigned();
            $table->integer('comment_id')->unsigned();
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
        Schema::dropIfExists('article');
    }
}
