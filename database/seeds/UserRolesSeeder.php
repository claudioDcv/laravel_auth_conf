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
            'name' => 'Admin',
            'slug' => 'admin',
            'description' => 'Custodians of the system.', // optional
            'group' => 'default' // optional, set as 'default' by default
        ]);

        \HttpOz\Roles\Models\Role::create([
            'name' => 'Forum Moderator',
            'slug' => 'forum.moderator',
        ]);
    }
}
