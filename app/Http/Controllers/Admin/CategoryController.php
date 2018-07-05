<?php

namespace App\Http\Controllers\Admin;

use App\Model\Category;
use Illuminate\Http\Request;


class CategoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:category-list');
        $this->middleware('can:category-create')->only(['create', 'store']);
        $this->middleware('can:category-edit')->only(['edit', 'update']);
        $this->middleware('can:category-destroy')->only('destroy');
    }

    public function index()
    {
        return view('admin.category.index', [
            'categories' => Category::all(),
            'title' => '分类管理'
        ]);
    }

    public function create()
    {
        return view('admin.category.create', [
            'title' => '添加分类'
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'slug' => 'required|alpha_num',
            'is_nav' => 'required|between:0, 1|integer'
        ]);

        Category::create([
            'name' => $request->name,
            'slug' => $request->slug,
            'is_nav' => $request->is_nav ? '' : null,
            'desc' => $request->desc
        ]);

        return redirect(route('category.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $category = Category::find($id);

        if (!$category) {
            return redirect()->back()->withErrors('分类不存在，请重试。');
        }

        return view('admin.category.edit', [
            'title' => '编辑分类',
            'category' => $category,
            'id' => $id
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'slug' => 'nullable|alpha_num',
            'is_nav' => 'nullable|between:0, 1|integer'
        ]);

        $data = array_filter([
            'name' => $request->name,
            'slug' => $request->slug,
            'desc' => $request->desc
        ]);
        $data['is_nav'] = $request->is_nav == 1 ? '' : null;
        $result = Category::where('id', $id)->update($data);

        if ($result) {
            return redirect(route('category.index'));
        } else {
            return redirect()->back()->withErrors('更新失败，该分类标识可能与其它分类重复。');
        }
    }

    public function destroy($id)
    {
        $result = Category::where('id', (int)$id)->delete();

        if ($result) {
            return redirect()->back();
        } else {
            return redirect()->back()->withErrors('操作失败，请重试。');
        }

    }
}
