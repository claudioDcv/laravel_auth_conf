<?php

use Illuminate\Database\Seeder;

class UserRolesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        \HttpOz\Roles\Models\Role::create([
            'name' => 'Administrador',
            'slug' => 'admin',
            'description' => 'tiene acceso a todas las opciones.', // optional
            'group' => 'business' // optional, set as 'default' by default
        ]);

        \HttpOz\Roles\Models\Role::create([
            'name' => 'Reservación',
            'slug' => 'reservation',
            'description' => 'sólo puede tomar reservas y actualizar datos de clientes.', // optional
            'group' => 'business' // optional, set as 'default' by default
        ]);

        \HttpOz\Roles\Models\Role::create([
            'name' => 'Recepción',
            'slug' => 'reception',
            'description' => 'sólo puede tomar reservas y actualizar datos de clientes, pero además puede anular reservas, bloquear algunas horas de atención, etc.', // optional
            'group' => 'business' // optional, set as 'default' by default
        ]);

        \HttpOz\Roles\Models\Role::create([
            'name' => 'Cliente',
            'slug' => 'client',
            'description' => 'puede solicitar horas', // optional
            'group' => 'public' // optional, set as 'default' by default
        ]);

        \HttpOz\Roles\Models\Role::create([
            'name' => 'Medico',
            'slug' => 'medic',
            'description' => 'se asignar hora, sol puede ver sus hora asignadas', // optional
            'group' => 'public' // optional, set as 'default' by default
        ]);
    }
}
