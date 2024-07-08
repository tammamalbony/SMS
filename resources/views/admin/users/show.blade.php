@extends('layouts.app')

@section('content')
<div class="container">
    <h1>View User</h1>
    <div class="card">
        <div class="card-header">
            User Details
        </div>
        <div class="card-body">
            <h5 class="card-title">{{ $user->name }}</h5>
            <p class="card-text"><strong>Email:</strong> {{ $user->email }}</p>
            <p class="card-text"><strong>Role:</strong> {{ $user->roles->pluck('name')->first() }}</p>
            <a href="{{ route('admin.users.index') }}" class="btn btn-primary">Back to Users</a>
        </div>
    </div>
</div>
@endsection
