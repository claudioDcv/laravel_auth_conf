# Instruction

## Mysql
- Start `brew services start mysql56`
- DIR `/usr/local/Cellar/mysql@5.6/5.6.36_1`
- PASS `./mysqladmin -u root password 1234`
- DB `scheduler`
- Import `dhtmlx_samples.sql` to Database `scheduler`

## Create User

- `php artisan make:migration users`

## Dependencie

- `"composer require httpoz/roles"`




##Library

- https://httpoz.github.io/roles/ [Role & Group]
- https://github.com/Jenssegers/Date [Date multilangue]
- https://laravelcollective.com/docs/5.4/html#installation [Helper Form]

## PHP

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
