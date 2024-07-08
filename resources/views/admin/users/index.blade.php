@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Users</h1>

    @can('create users')
        <a href="{{ route('admin.users.create') }}" class="btn btn-primary">Add New User</a>
    @endcan

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($users as $user)
                <tr>
                    <td>{{ $user->name }}</td>
                    <td>{{ $user->email }}</td>
                    <td>{{ $user->roles->pluck('name')->first() }}</td>
                    <td>
                        @can('view users')
                            <a href="{{ route('admin.users.show', $user) }}" class="btn btn-info">View</a>
                        @endcan

                        @can('edit users')
                            <a href="{{ route('admin.users.edit', $user) }}" class="btn btn-warning">Edit</a>
                        @endcan

                        @can('delete users')
                            <form action="{{ route('admin.users.destroy', $user) }}" method="POST" style="display:inline-block;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</button>
                            </form>
                        @endcan
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
    {{ $users->links() }}
</div>
@endsection
