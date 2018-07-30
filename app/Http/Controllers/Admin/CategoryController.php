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
        $tops= Category::getTops();
        return view('admin.category.create', [
            'title' => '添加分类',
            'tops' => $tops
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'slug' => 'required|alpha_num',
            'is_nav' => 'required|between:0, 1|integer',
            'pid' => 'required|integer'
        ]);

        $data = array_filter([
            'name' => $request->name,
            'slug' => $request->slug,
            'desc' => $request->desc,
            'pid' => $request->pid
        ]);
        $data['is_nav'] = $request->is_nav == 1 ? '' : null;
        $data['allow_post'] = $request->allow_post == 1 ? '' : null;

        Category::create($data);

        return redirect(route('category.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $category = Category::find($id);
        $tops= Category::getTops();
        if (!$category) {
            return redirect()->back()->withErrors('分类不存在，请重试。');
        }

        return view('admin.category.edit', [
            'title' => '编辑分类',
            'category' => $category,
            'id' => $id,
            'tops' => $tops
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'slug' => 'nullable|alpha_num',
            'is_nav' => 'nullable|between:0, 1|integer',
            'pid' => 'nullable|integer',

        ]);

        $data = array_filter([
            'name' => $request->name,
            'slug' => $request->slug,
            'desc' => $request->desc,
            'pid' => $request->pid
        ]);
        $data['is_nav'] = $request->is_nav == 1 ? '' : null;
        $data['allow_post'] = $request->allow_post == 1 ? '' : null;
        $result = Category::where('id', $id)->update($data);

        if ($result) {
            return redirect(route('category.index'));
        } else {
            return redirect()->back()->withErrors('更新失败，该分类标识可能与其它分类重复。');
        }
    }

    public function destroy($id)
    {
        // 检查该分类下是否有文章
        $category = Category::find($id);
        if ($category) {
            if ($category->hasArticles()->count()) {
                return redirect()->back()->withErrors('该分类下存在文章，请先将文章分配到其它分类下再进行删除分类的操作。');
            }

            if (Category::where('id', $id)->delete()) {
                return redirect()->back();
            } else {
                return redirect()->back()->withErrors('操作失败，请重试。');
            }
        } else {
            return redirect()->back()->withErrors('分类不存。');
        }
    }
}
