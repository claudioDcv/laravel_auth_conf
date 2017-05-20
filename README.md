

## PHP

```php

@group('application.managers') // @if(Auth::check() && Auth::user()->group() == 'application.managers')
    // user belongs to 'application.managers' group
@endgroup

@role('admin|moderator', 'all') // @if(Auth::check() && Auth::user()->isRole('admin|moderator', 'all'))
    // user is admin and also moderator
@else
    // something else
@endrole

```
