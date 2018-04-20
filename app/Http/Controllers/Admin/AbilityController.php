<?php

namespace App\Http\Controllers\Admin;

use App\Model\WgAbility;
use Bouncer;
use Illuminate\Http\Request;

class AbilityController extends Controller
{
    /**
     * Display all abilities.
     *
     * @param WgAbility $ability
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(WgAbility $ability)
    {
        $abilities = $ability->getAbilities();
        return view('admin.ability.index', [
            'abilities' => $abilities,
            'title' => '权限管理'
        ]);
    }

    /**
     * Show the form for creating a new ability.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.ability.create', [
            'title' => '添加权限'
        ]);
    }

    /**
     * Store a newly created ability in storage.
     * @param Request $request
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'bail|required|unique:abilities|max:150',
            'title' => 'max:255',
        ]);

        Bouncer::ability()->create([
            'name' => $request->name,
            'title' => $request->title
        ]);

        return redirect(route('ability.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
