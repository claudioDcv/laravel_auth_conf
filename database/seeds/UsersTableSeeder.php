<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        // 2a. Create admin
        $uAdmin = \App\User::create([
            'name' => 'Claudio Rojas',
            'email' => 'claudio@github.com',
            'password' => bcrypt('1234'),
            'rut' => '16751256-9',
            'hh_value' => 1233
        ]);

        $uReservation = \App\User::create([
            'name' => 'Juan',
            'email' => 'john@github.com',
            'password' => bcrypt('1234'),
            'rut' => '116354756-1',
            'hh_value' => 20000
        ]);

        $uReception = \App\User::create([
            'name' => 'Alicia',
            'email' => 'alicia@business.com',
            'password' => bcrypt('1234'),
            'rut' => '9442167-5',
            'hh_value' => 1233
        ]);

        $uClient1 = \App\User::create([
          'name' => 'Sofia',
          'email' => 'sofi@gmail.com',
          'password' => bcrypt('1234'),
          'rut' => '11111111-1',
          'hh_value' => 1233
        ]);

        $uClient2 = \App\User::create([
            'name' => 'Pedro',
            'email' => 'pedro@gmail.com',
            'password' => bcrypt('1234'),
            'rut' => '12345678-9',
            'hh_value' => 1233
        ]);

        $uClient3 = \App\User::create([
            'name' => 'Pablo Jara',
            'email' => 'p.jara@gmail.com',
            'password' => bcrypt('1234'),
            'rut' => '98765432-5',
            'hh_value' => 24000
        ]);

        $uClient4 = \App\User::create([
            'name' => 'Alejandro',
            'email' => 'alejo@gmail.com',
            'password' => bcrypt('1234'),
            'rut' => '14566421-7',
            'hh_value' => 24000
        ]);

        $uClient5 = \App\User::create([
            'name' => 'Jorge',
            'email' => 'jru@gmail.com',
            'password' => bcrypt('1234'),
            'rut' => '98765422-5',
            'hh_value' => 24000
        ]);

        $uClient6 = \App\User::create([
            'name' => 'Maria',
            'email' => 'm.riquelme@gmail.com',
            'password' => bcrypt('1234'),
            'rut' => '97765432-5',
            'hh_value' => 24000
        ]);

        $uClient7 = \App\User::create([
            'name' => 'Sara',
            'email' => 's.alvarado@gmail.com',
            'password' => bcrypt('1234'),
            'rut' => '96765432-5',
            'hh_value' => 24000
        ]);

        $uClient8 = \App\User::create([
            'name' => 'Veronica Arancibia',
            'email' => 'vero@gmail.com',
            'password' => bcrypt('1234'),
            'rut' => '95765432-5',
            'hh_value' => 24000
        ]);

        $uMedic = \App\User::create([
            'name' => 'Jaime Saavedra',
            'email' => 'j.saavedra@gmail.com',
            'password' => bcrypt('1234'),
            'rut' => '94765432-5',
            'hh_value' => 24000
        ]);

        $admin = \HttpOz\Roles\Models\Role::whereSlug('admin')->first();
        $reservation = \HttpOz\Roles\Models\Role::whereSlug('reservation')->first();
        $reception = \HttpOz\Roles\Models\Role::whereSlug('reception')->first();
        $client = \HttpOz\Roles\Models\Role::whereSlug('client')->first();
        $medic = \HttpOz\Roles\Models\Role::whereSlug('medic')->first();

        $uAdmin->attachRole($admin);
        $uReservation->attachRole($reservation);
        $uReception->attachRole($reception);
        $uClient1->attachRole($client);
        $uClient2->attachRole($client);
        $uClient3->attachRole($client);
        $uClient4->attachRole($client);
        $uClient5->attachRole($client);
        $uClient6->attachRole($client);
        $uClient7->attachRole($client);
        $uClient8->attachRole($client);
        $uMedic->attachRole($medic);
        $uMedic->attachRole($admin);
    }
}
