<?php
namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use HttpOz\Roles\Traits\HasRole;
use HttpOz\Roles\Contracts\HasRole as HasRoleContract;
use Collective\Html\Eloquent\FormAccessible;
use App\Traits\DateTraslator;
class User extends Authenticatable implements HasRoleContract
{
    use Notifiable, HasRole, FormAccessible, DateTraslator;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function medicalspecialties(){
        return $this->belongsToMany('\App\Medicalspecialty','medicalspecialty_user');
            //->withPivot();
    }
    // public function roles(){
    //     return $this->belongsToMany('\App\Task','menu_task_user')
    //         ->withPivot('menu_id','status');
    // }
}
