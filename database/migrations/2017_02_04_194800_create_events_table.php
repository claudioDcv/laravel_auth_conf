<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('status_id')->nullable()->unsigned();
            $table->integer('user_id')->unsigned();
            $table->integer('client_id')->nullable()->unsigned();
            $table->string('title',100);
            $table->string('description',255);
            $table->boolean('is_active');
            $table->dateTime('start');
            $table->dateTime('end');
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::table('events', function($table) {
           $table->foreign('status_id')->references('id')->on('status');
           $table->foreign('user_id')->references('id')->on('users');
           $table->foreign('client_id')->references('id')->on('users');
       });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('events');
    }
}
