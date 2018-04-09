@include('Cms.layouts.header')
<div class="container main border">
    <div class="row">
        <div class="col-md-8">
@section('content')
            This is the left box!
@show
        </div>
        <div class="col-md-4 sidebar">
            @include('Cms.layouts.sidebar')
        </div>
    </div>
</div>
@include('Cms.layouts.footer')


