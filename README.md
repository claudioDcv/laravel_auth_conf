# Instruction

## Mysql
- Start `brew services start mysql56`
- DIR `/usr/local/Cellar/mysql@5.6/5.6.36_1`
- PASS `./mysqladmin -u root password 1234`
- DB `sheduler`


## Create User

- `php artisan make:migration users`

## Dependencie

- `"composer require httpoz/roles"`


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
