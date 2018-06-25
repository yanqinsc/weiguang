<?php

namespace App\Http\Controllers\Admin;

use App\Model\Classes;
use App\Model\School;
use Illuminate\Http\Request;
use App\Traits\Common;

class ClassController extends Controller
{
    use Common;

    public function __construct()
    {
        $this->middleware('can:class-list');
        $this->middleware('can:class-create')->only(['create', 'store']);
        $this->middleware('can:class-edit')->only(['edit', 'update']);
    }

    public function index()
    {
        $classes = Classes::select('classes.id', 'grade', 'short_name', 'class', 'type')
            ->join('schools', 'schools.id', '=', 'classes.school_id')
            ->paginate(10);
        $getGradeName =  $this->getGradeNameFunction();

        return view('admin.class.index', [
            'classes' => $classes,
            'title' => '班级列表',
            'getGradeName' => $getGradeName
        ]);
    }

    public function create()
    {
        $schools = School::select('id', 'short_name')->get();

        return view('admin.class.create', [
            'title' => '添加班级',
            'schools' => $schools
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'school' => 'required|exists:schools,id',
            'grade' => 'required|integer|between:2000,' . config('app.grade_max'),
            'class' => 'required|integer|between:1,50',
            'type' => 'required|integer|between:1,2'
        ]);

        Classes::insert([
            'school_id' => $request->school,
            'grade' => $request->grade,
            'class' => $request->class,
            'type' => $request->type
        ]);

        return redirect(route('class.index'));
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $class = Classes::select('classes.id', 'grade', 'short_name', 'class', 'type')
            ->join('schools', 'schools.id', '=', 'classes.school_id')
            ->where('classes.id', (int)$id)
            ->first();

        if (!$class) {
            return redirect()->back()->withErrors('用户不存在，请重试。');
        }

        return view('admin.class.edit', [
            'title' => '编辑班级信息',
            'class' => $class,
            'id' => $id
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'grade' => 'nullable|integer|between:2000,' . config('app.grade_max'),
            'class' => 'nullable|integer|between:1,50',
            'type' => 'nullable|integer|between:1,2'
        ]);

        $data = array_filter([
            'grade' => $request->grade,
            'class' => $request->class,
            'type' => $request->type
        ]);

        if (empty($data)) {
            return redirect()->back()->withErrors('请填写更改信息。');
        }

        $result = Classes::where(['id' => (int)$id])->update($data);

        if ($result) {
            return redirect(route('class.index'));
        } else {
            return redirect()->back()->withErrors('更新失败，请重试。');
        }
    }

    public function destroy($id)
    {
        //
    }
}
