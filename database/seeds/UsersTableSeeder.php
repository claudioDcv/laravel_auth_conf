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
        //
        // 1. query the Roles by the slug
        $adminRole = \HttpOz\Roles\Models\Role::whereSlug('admin')->first();
        $moderatorRole = \HttpOz\Roles\Models\Role::whereSlug('forum.moderator')->first();

        // 2a. Create admin
        $admin = \App\User::create([
            'name' => 'Oscar Mwanandimai',
            'email' => 'oscar@github.com',
            'password' => bcrypt('password')
        ]);

        // 2b. Create forum moderator
        $moderator = \App\User::create([
            'name' => 'John Doe',
            'email' => 'john@github.com',
            'password' => bcrypt('password')
        ]);

        // 3. Attach a role to the user object / assign a role to a user
        $admin->attachRole($adminRole);
        $moderator->attachRole($moderatorRole);
    }
}
