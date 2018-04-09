<?php

namespace App\Http\Controllers\Cms;

use App\Model\Cms\Article;
use App\Model\Cms\Category;
use Illuminate\Http\Request;

class ContentsController extends Controller
{
    /**
     * 列表页
     * @param Request $request
     * @param $category
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|\think\response\View
     */
    public function index(Request $request, $category = 'home')
    {
        // 读取文章信息
        if ($category == 'home') {
            $categoryInfo = (object)['id' => 0, 'name' => 'home'];
        } else {
            $categoryInfo = Category::getInfoByAbbreviation($category, ['id', 'name']);
        }

        $contents = Article::getListByCategory($categoryInfo->id, 10);

        return view('Cms.contents', [
            'current_controller' => 'contents',
            'active_nav_item' => $category,
            'active_nav_name' => $categoryInfo->name,
            'contents' => $contents
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
