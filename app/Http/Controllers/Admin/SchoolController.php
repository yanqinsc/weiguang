<?php

namespace App\Http\Controllers\Admin;

use App\Model\School;
use Illuminate\Http\Request;

class SchoolController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:school-list');
        $this->middleware('can:school-create')->only(['create', 'store']);
        $this->middleware('can:school-edit')->only(['edit', 'update']);
    }

    public function index()
    {
        $schools = School::paginate(10);

        return view('admin.school.index', [
            'schools' => $schools,
            'title' => '学校列表'
        ]);
    }

    public function create()
    {
        return view('admin.school.create', [
            'title' => '添加学校'
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:150',
            'short_name' => 'required|max:50',
            'address' => 'required',
        ]);

        School::insert([
            'name' => $request->name,
            'short_name' => $request->short_name,
            'address' => $request->address
        ]);

        return redirect(route('school.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $school = School::find($id);
        if (!$school) {
            return redirect()->back()->withErrors('用户不存在，请重试。');
        }

        return view('admin.school.edit', [
            'title' => '编辑学校信息',
            'school' => $school,
            'id' => $id
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'nullable|max:150',
            'short_name' => 'nullable|max:50',
            'address' => 'nullable',
        ]);

        $data = array_filter([
            'name' => $request->name,
            'short_name' => $request->short_name,
            'address' => $request->address
        ]);

        if (empty($data)) {
            return redirect()->back()->withErrors('请填写更改信息。');
        }

        $result = School::where(['id' => (int)$id])->update($data);

        if ($result) {
            return redirect(route('school.index'));
        } else {
            return redirect()->back()->withErrors('更新失败，请重试。');
        }
    }

    public function destroy($id)
    {
        //
    }
}
