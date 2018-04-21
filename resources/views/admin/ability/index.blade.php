@extends('admin.layouts.base')

@section('content')
    <div class="box list">
        <div class="box-body">
            <div class="button-bar">
                <a class="btn btn-app bg-olive" href="{{ route('ability.create') }}">
                    <i class="fa fa-plus"></i> 添加权限
                </a>
            </div>
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <div class="row">
                    <div class="col-sm-6">
                        <form class="dataTables_length" id="show-number-form">
                            <label>显示
                                <select name="showNumber" id="show-number" aria-controls="paginate" class="form-control input-sm">
                                    <option value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select> 条
                            </label>
                        </form>
                    </div>
                    <div class="col-sm-6">
                        <form id="filter" class="dataTables_filter float-right">
                            <label>
                                <input name="condition" type="search" class="form-control input-sm" placeholder="请输入权限名称"
                                       aria-controls="abilities" value="{{ $condition }}">
                                <button type="submit" class="btn btn-primary btn-sm">搜索</button>
                            </label>

                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <table id="example1" class="table table-bordered table-striped dataTable" role="grid"
                               aria-describedby="abilities">
                            <thead>
                            <tr role="row">
                                <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                    aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending"
                                    style="width: 197px;">ID
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                    aria-label="Browser: activate to sort column ascending" style="width: 242px;">名称
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                    aria-label="Platform(s): activate to sort column ascending" style="width: 216px;">备注
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                                    aria-label="Engine version: activate to sort column ascending" style="width: 169px;">管理
                                </th>
                            </thead>
                            <tbody>
                            @foreach($abilities as $ability)
                                <tr role="row" class="{{ $ability->id % 2 != 0 ? "odd" : "even"}}">
                                    <td class="sorting_1">{{ $ability->id }}</td>
                                    <td>{{ $ability->name }}</td>
                                    <td>{{ $ability->title }}</td>
                                    <td><a href="{{ route('ability.edit', ['id' => $ability->id]) }}" title="编辑"><i class="fa fa-edit"></i></a></td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <div class="row list">
                            <div class="col-sm-5">
                                <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">
                                    第 {{ $abilities->firstItem() }} 到 {{ $abilities->lastItem() }} 条
                                    &nbsp;&nbsp;共 {{ $abilities->total() }} 条
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <div class="dataTables_paginate paging_simple_numbers" id="list_paginate">
                                    {{ $abilities->links() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" name="paginateNumber" value="{{ $paginateNumber }}">
@endsection