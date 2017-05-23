<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\SchedulerEvent;
use App\User;
use \HttpOz\Roles\Models\Role;
use \Collective\Html;

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
        $users = User::where('name', 'LIKE', "%$query%")->paginate(8);

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
}
