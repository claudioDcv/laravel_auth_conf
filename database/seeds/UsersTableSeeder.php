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
            'password' => bcrypt('1234')
        ]);

        $uReservation = \App\User::create([
            'name' => 'Juan',
            'email' => 'john@github.com',
            'password' => bcrypt('1234')
        ]);

        $uReception = \App\User::create([
            'name' => 'Alicia',
            'email' => 'alicia@business.com',
            'password' => bcrypt('1234')
        ]);

        $uClient1 = \App\User::create([
          'name' => 'Sofia',
          'email' => 'sofi@gmail.com',
          'password' => bcrypt('1234')
        ]);

        $uClient2 = \App\User::create([
            'name' => 'Pedro',
            'email' => 'pedro@gmail.com',
            'password' => bcrypt('1234')
        ]);

        $uClient3 = \App\User::create([
            'name' => 'Pablo Jara',
            'email' => 'p.jara@gmail.com',
            'password' => bcrypt('1234')
        ]);

        $uClient4 = \App\User::create([
            'name' => 'Alejandro',
            'email' => 'alejo@gmail.com',
            'password' => bcrypt('1234')
        ]);

        $uClient5 = \App\User::create([
            'name' => 'Jorge',
            'email' => 'jru@gmail.com',
            'password' => bcrypt('1234')
        ]);

        $uClient6 = \App\User::create([
            'name' => 'Maria',
            'email' => 'm.riquelme@gmail.com',
            'password' => bcrypt('1234')
        ]);

        $uClient7 = \App\User::create([
            'name' => 'Sara',
            'email' => 's.alvarado@gmail.com',
            'password' => bcrypt('1234')
        ]);

        $uClient8 = \App\User::create([
            'name' => 'Veronica Arancibia',
            'email' => 'vero@gmail.com',
            'password' => bcrypt('1234')
        ]);

        $uMedic = \App\User::create([
            'name' => 'Jaime Saavedra',
            'email' => 'j.saavedra@gmail.com',
            'password' => bcrypt('1234')
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
