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
        DB::table('users')->insert([
        	'role_id'=>'1',
        	'name'=>'Ahmad Ul Hoq Nadim',
        	'email'=>'nadim@gmail.com',
        	'password'=>bcrypt('123456'),
        ]);

        DB::table('users')->insert([
        	'role_id'=>'2',
        	'name'=>'Md. Author',
        	'email'=>'author@gmail.com',
        	'password'=>bcrypt('123456'),
        ]);
    }
}
