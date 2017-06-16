<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Medicalspecialty extends Model
{
    //

    // protected $fillable = [
    //     ,
    // ];

    protected $fillable = [
      'id',
    ];

    public function meduser()
    {
        return $this->belongsToMany('App\User', 'medicalspecialty_user',
          'medicalspecialty_id', 'user_id');
    }

}
