<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    //
    protected $table = 'status';
    protected $fillable = [
      'name',
      'code',
    ];
    protected $guarded = ['id'];

    public function Event() {
        return $this->hasMany('App\Event');
    }
}
