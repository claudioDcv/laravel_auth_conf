<?php
namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\User;

class Event extends Model
{

  use SoftDeletes;

  protected $table = 'events';
  protected $fillable = [
    'title',
    'description',
    'is_active',
    'start',
    'end',
    'status_id',
    'user_id',
  ];
  protected $guarded = ['id'];
  protected $dates = ['deleted_at'];

  public function status() {
      return $this->belongsTo('App\Status');
  }
  public function medic() {
      return $this->belongsTo('App\User');
  }
  public function users() {
      return $this->belongsTo('App\User', 'user_id');
  }
  public function client() {
      return $this->belongsTo('App\User', 'client_id');
  }

}
