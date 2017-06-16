<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\SchedulerEvent;
use App\User;
use App\Medicalspecialty;
use \HttpOz\Roles\Models\Role;
use \Collective\Html;
use App\Event as Event;

class HomeController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home');
    }

    public function scheduler()
    {
        return view('scheduler');
    }

    public function myHH() {
      $user = \Auth::user();
      $events = Event::where('client_id', $user->id)->get();
      // return dd($events);
      return view('my-hh', [
        'events' => $events,
      ]);
    }

    public function eventCalendar()
    {
        return view('event-caledar');
    }

    public function register()
    {
        return view('auth.register');
    }

    public function usersView($id)
    {
        $user = User::findOrFail($id);
        return view('user-view',['user' => $user]);
    }

    //Service
    public function users(Request $request)
    {

        // ->orderBy('created_date', 'desc')
        $query = $request->get('q');
        // $ordering = $request->get('ordering');
        // $orderingMode = $ordering[0] == '-' ? 'desc' : 'asc' ;
        // $orderingLabel = $ordering;
        // ->orderBy($orderingLabel,$orderingMode)
        $users = User::where('name', 'LIKE', "%$query%")->paginate(10);
        return view('user', ['users' => $users, 'user'=> new User]);
    }

    public function event(Request $request)
    {
      $from_from = $request->query('start');
      $to_from = $request->query('end');
      $from_to = $request->query('start');
      $to_to = $request->query('end');

      return SchedulerEvent::whereBetween('start_date', [$from_from, $to_from])
                ->orWhereBetween('end_date', [$from_to, $to_to])
                ->get();
    }
    public function userViewAsignsSpecialities($id)
    {
      $medicalspecialty = Medicalspecialty::get();
      $user = User::findOrFail($id);
      //is not medic role
      if(!$user->hasRole('medic')){
        return redirect()->route('home');
      }

      $to = [];
      $from = [];

      foreach ($medicalspecialty as $medspec) {
        if ($user->medicalspecialties->contains($medspec->id)) {
          array_push($from, $medspec);
        }else{
          array_push($to, $medspec);
        }
      }

      return view('user-view-asigns-specialities',[
        'user' => $user,
        'to' => $to,
        'from' => $from,
      ]);
    }


    public function saveAsignsSpecialities(Request $request){
      $input = $request->input();
      // dd($input);
      $user = User::findOrFail($request->input('user_id'));
      //is not medic role
      if(!$user->hasRole('medic')){
        return redirect()->route('home');
      }
      //delete al relationship
      foreach ($user->medicalspecialties as $medSpec){
        $user->medicalspecialties()->detach($medSpec->id);
      }
      //add new relationship
      if ($request->input('to')) {
        foreach ($request->input('to') as $specId) {
          $user->medicalspecialties()->attach($specId);
        }
      }
      return redirect()->route('user-view', $user->id);
    }


    public function userViewAsignsRole($id)
    {

      $roles = Role::get();
      $user = User::findOrFail($id);

      $to = [];
      $from = [];

      foreach ($roles as $rol) {
        if ($user->roles->contains($rol->id)) {
          array_push($from, $rol);
        }else{
          array_push($to, $rol);
        }
      }
      return view('user-view-asigns-role',[
        'user' => $user,
        'to' => $to,
        'from' => $from,
      ]);
    }

    public function saveAsignsRole(Request $request){
      $input = $request->input();
      // dd($input);
      $user = User::findOrFail($request->input('user_id'));

      $isMedic = false;
      //delete al relationship
      $user->detachAllRoles();
      //add new relationship
      if ($request->input('to')) {
        foreach ($request->input('to') as $specId) {
          if (Role::find($specId)) {
            $isMedic = true;
          }
          $user->attachRole($specId);
        }
      }

      if(!$isMedic){
        $user->medicalspecialties()->detach();
      }

      return redirect()->route('user-view', $user->id);
    }

/*
$role->perms->contains(function($value) use($permission) { return $value->id == $permission->id; })
*/

    //users medicalspecialty_user
    public function medicBySpecialities($id){
      return User::select('name','id')->whereHas('medicalspecialties', function($query) use ($id) {
        $query->where('medicalspecialty_id', $id);
      })->get();
    }
    public function specialities( Request $request){
      return Medicalspecialty::select('name','id')->has('meduser')->get();
    }
}

//Tiene una relacion con existencia de elementos dependientes
// -> return Medicalspecialty::has('meduser')->get();
//TLo mismo pero agregar en la salida los elementos relacionados
// -> return Medicalspecialty::with('meduser')->has('meduser')->get();
//Listado de usuarios que esten presentes en una especialidad determinada por $id
/*
foreach (Medicalspecialty::with('meduser')->where('id', $id)->get() as $book)
{
    foreach ($book->meduser as $user) {
      array_push($userWithMedicalSpeciality,$user);
    }
}
*/
