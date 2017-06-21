# Instruction

## Mysql
- Start `brew services start mysql56`
- DIR `/usr/local/Cellar/mysql@5.6/5.6.36_1`
- PASS `./mysqladmin -u root password 1234`
- DB `scheduler`
- Import `dhtmlx_samples.sql` to Database `scheduler`


|                  |                                     |
|------------------|-------------------------------------|
| Nombre           | Claudio Rojas                       |
| Asignatura       | Diseño de Aplicaciones par Internet |
| Nombre Proyecto  | Sistema de Consulta Medica          |
| Fecha            | 21 de Junio de 2017                 |


# Instrucciones
1. crear base de datos y cargar el sqlfile `sheduler_2017-06-21.sql`
2. en `rolesheduler/config/database` en la linea `42` agregar las credenciales de la base de datos
3. en `rolesheduler` iniciar servidor de desarrollo `php artisan serve`
4. el administrador de sistema se ingresa desde `host/admin`
  - `user: admin`
  - `pass: admin`
5. el sistema medico, los usuarios para test son:
  - `admin`
    - user: claudio@github.com
    - pass: 1234
  - `cliente`
    - user: sofi@gmail.com
    - pass: 1234
  - `medico`
    - user: alicia@business.com
    - pass: 1234



---


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
