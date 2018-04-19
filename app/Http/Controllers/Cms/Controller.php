<?php

namespace App\Http\Controllers\Cms;

use App\Model\Article;
use App\Model\Category;
use Illuminate\Support\Facades\View;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function __construct()
    {
        // Cms部件所有识图共享变量
        View::share([
            'categories' => Category::getAll(),
            'hot_articles' => Article::getHotList()
        ]);
    }

}
