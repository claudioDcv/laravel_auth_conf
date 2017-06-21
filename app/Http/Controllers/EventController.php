<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Event as Event;
use App\Status as Status;
use Illuminate\Support\Facades\Input;
use App\Custom\Helpers as Helpers;
use \HttpOz\Roles\Models\Role;
use App\User;
use App\Medicalspecialty;
use Carbon\Carbon;

class EventController extends Controller
{
  public function store(Request $request){

    $eventData = [];
    $isUpdate = false;
    // return dd($request);

    if ($request->input('user_is') == 'client') {
      $eventData['id'] = $request->input('id');
      $event = Event::find($eventData['id']);
      $event->user_id = $request->input('medic');
      $event->status_id = '2';
      $event->client_id = $request->input('client');
      $event = $event->save();
      $d = Carbon::instance(new \DateTime($request->input('date_start')));

      $dd = $d->day < 10 ? '0'. $d->day : $d->day;
      $dm = $d->month < 10 ? '0'. $d->month : $d->month;

      $dFormat = $dd.'-'.$dm.'-'.$d->year;
      return redirect()->route('medic-event-list', [
        'user' => $request->input('medic'),
        'spec' => $request->input('spec'),
        'date' => $dFormat,
      ]);
    }

    if ($request->input('user_is') == 'medic') {
      $eventData['id'] = $request->input('id');
      $event = Event::find($eventData['id']);
      $event->title = $request->input('title');
      $event->description = $request->input('description');
      $event->status_id = $request->input('status');
      $event = $event->save();
      $d = Carbon::instance(new \DateTime($request->input('date_start')));

      $dd = $d->day < 10 ? '0'. $d->day : $d->day;
      $dm = $d->month < 10 ? '0'. $d->month : $d->month;

      $dFormat = $dd.'-'.$dm.'-'.$d->year;
      return redirect()->route('medic-event-list', [
        'user' => $request->input('medic'),
        'spec' => $request->input('spec'),
        'date' => $dFormat,
      ]);
    }


    if ($request->input('user_is') == 'admin') {


      $eventData['id'] = $request->input('id');
      $event = Event::find($eventData['id']);
      $event->title = $request->input('title');
      $event->description = $request->input('description');
      // $event->user_id = $request->input('medic');
      $event->status_id = $request->input('status');

      if($event->status_id == 1)
      {
        $event->client_id = null;
      }
      $event->title = $request->input('title');
      $event->description = $request->input('description');
      // $event->is_active = $request->input('is_active') === 'on' ? true : false;

      $originalStart = clone new \DateTime($event->start);
      $event->start = new \DateTime($request->input('date_start'));
      $outStart = clone new \DateTime($request->input('date_start'));

        $originalEnd = clone new \DateTime($event->end);
        $diff = $originalStart->diff($originalEnd);
        //return dd($diff,$outStart->add($diff));

        //$end->modify('+15 minutes');
        $event->end = $outStart->add($diff);
        //$event->end = date('Y-m-d H:i',strtotime('+1 minutes',strtotime($event->start)));

      //new \DateTime($request->input('date_end'));
      $event = $event->save();
      $d = Carbon::instance(new \DateTime($request->input('date_start')));

      $dd = $d->day < 10 ? '0'. $d->day : $d->day;
      $dm = $d->month < 10 ? '0'. $d->month : $d->month;

      $dFormat = $dd.'-'.$dm.'-'.$d->year;
      return redirect()->route('medic-event-list', [
        'user' => $request->input('medic'),
        'spec' => $request->input('spec'),
        'date' => $dFormat,
      ]);
    }

    if ($request->input('id')) {
      $eventData['id'] = $request->input('id');
      $event = Event::find($eventData['id']);
      $event->user_id = $request->input('medic');
      $event->status_id = $request->input('status');
      $event->title = $request->input('title');
      $event->description = $request->input('description');
      $event->is_active = $request->input('is_active') === 'on' ? true : false;
      $event->start = new \DateTime($request->input('date_start'));
      $event->end = new \DateTime($request->input('date_end'));
      $isUpdate = true;
    }
    $eventData['user_id'] = $request->input('medic');
    $eventData['status_id'] = $request->input('status');
    $eventData['title'] = $request->input('title');
    $eventData['description'] = $request->input('description');
    $eventData['is_active'] = $request->input('is_active') === 'on' ? true : false;
    $eventData['start'] = new \DateTime($request->input('date_start'));
    $eventData['end'] = new \DateTime($request->input('date_end'));
    //
    // return dd($eventData);
    if ($isUpdate) {
      $event = $event->save();
      $d = Carbon::instance(new \DateTime($request->input('date_start')));

      $dFormat = $d->day.'/'.$d->month.'/'.$d->year;
      return redirect('medic-event?id='.$eventData['user_id'].'&date='.$dFormat);
    }
    $event = Event::create($eventData);
    // dd($event);
    return redirect('event');
  }
  public function show($id){
    $model = Event::findOrFail($id);
    if ($model) {
      return response()->json($model);
    }
      return response()->json(Helpers::message('find-nok'),404);
  }
  public function index(){
    $userMedic = Role::with('users')->find(Role::where('slug','medic')->get());
    return \View::make('event/index', ['medics' => $userMedic[0]->users]);
  }
  public function create(){

    $userMedic = Role::with('users')->find(Role::where('slug','medic')->get());

    return \View::make('event/new', ['status' => Status::get(), 'medics' => $userMedic[0]->users]);
  }
  public function medicEventList($user, $spec, $date){
    // {user}/{spec}/{date}
    $date = $date . '00:00:00';
    $date = Carbon::createFromFormat('d-m-Y H:i:s', $date);

    // $id = $request->input('id');
    // $medSpec = $request->input('medicalspecialty');
    // $date = $request->input('date');
    // $user = User::find($id);
    //
    // if ((!$id) || (!$medSpec) || (!$date) || (!$user)) {
    //   return redirect('home');
    // }
    // $date = $date . '00:00:00';
    // $date = Carbon::createFromFormat('d/m/Y H:i:s', $date);
    //
    $_user = User::select('name','id')->whereHas('medicalspecialties', function($query) use ($spec) {
      $query->where('medicalspecialty_id', $spec);
    })->get();
    $_spec = Medicalspecialty::select('name','id')->whereHas('meduser', function($query) use ($user) {
      $query->where('user_id', $user);
    })->get();

    if (!(count($_user) && count($_spec))) {
      return redirect('home');
    }

    $userSelect = \Auth::user();
    if ($userSelect->HasRole('admin')) {
      return view('event/calendar/admin', [
        'status' => Status::get(),
        'user' => $userSelect,
        'date'=> $date,
        'spec'=> Medicalspecialty::find($spec),
        'medicId' => $user,
        'medic' => User::find($user),
      ]);
    }
    if ($userSelect->HasRole('medic')) {
      return view('event/calendar/medic', [
        'status' => Status::get(),
        'user' => $userSelect,
        'date'=> $date,
        'spec'=> Medicalspecialty::find($spec),
        'medicId' => $user,
        'medic' => User::find($user),
      ]);
    }
    if ($userSelect->HasRole('client')) {
      return view('event/calendar/client', [
        'status' => Status::get(),
        'user' => $userSelect,
        'date'=> $date,
        'spec'=> Medicalspecialty::find($spec),
        'medicId' => $user,
        'medic' => User::find($user),
      ]);
    }


  }

  public function json_update(Request $request,$id){
    if (!(preg_match('/^[0-9]{4}\-[0-9]{2}\-[0-9]{2}\s[0-9]{2}:[0-9]{2}:[0]{2}$/',$request->input('start')) &&
        preg_match('/^[0-9]{4}\-[0-9]{2}\-[0-9]{2}\s[0-9]{2}:[0-9]{2}:[0]{2}$/',$request->input('end'))
    )) {
      return response()->json(Helpers::message('date-nok'),500);
    }
    // TODO agregar verificacion de existencia de evento en este horario
    // omitiendo el evento actual
    if (Event::find($id)) {
      $event = Event::find($id);
      $event->start = $request->input('start');
      $event->end = $request->input('end');
      $event->title = $request->input('title');
      $event->description = $request->input('description');

      if ($event->save()) {
        return response()->json(Helpers::message('update-ok'),200);
      }
      return response()->json(Helpers::message('update-nok'),200);
    }
    return response()->json(Helpers::message('update-nok'),200);
  }
  public function json_list(Request $request){

    $models = Event::with('status')
              ->where('start','>=', Helpers::formatDateRequestStart($request->input()))
              ->where('end','<=', Helpers::formatDateRequestEnd($request->input()));
    //$models = Event::with('status');
    $models2 = $models->get();

    // foreach ($models as $model) {
    //   $model->status;
    //   array_push($out,$model->get());
    // }
    //
    // dd($out);

    return response()->json($models2);
  }
  public function json_create(Request $request){
    if (!(preg_match('/^[0-9]{4}\-[0-9]{2}\-[0-9]{2}\s[0-9]{2}:[0-9]{2}:[0]{2}$/',$request->input('start')) &&
        preg_match('/^[0-9]{4}\-[0-9]{2}\-[0-9]{2}\s[0-9]{2}:[0-9]{2}:[0]{2}$/',$request->input('end'))
    )) {
      return response()->json(Helpers::message('date-nok'),500);
    }
    $model = Event::where('start','>=', $request->input('start'))
    ->where('start','<=',$request->input('end'))
    ->count();
    if($model != 0){
      return response()->json(Helpers::message('create-nok'),500);
    }
    $model = Event::where('end','>=', $request->input('start'))
    ->where('end','<=',$request->input('end'))
    ->count();
    if($model != 0){
      return response()->json(Helpers::message('create-nok'),500);
    }
    //Posibilidades a evaluar
    // 1 2 3 5
    //   --
    // 1 2 5 6
    //   -----
    // 0 1 3 5
    // -----
    // 0 1 5 6
    // -------

    $event = new Event;
    $event->create($request->input());
    return response()->json(Helpers::message('create-ok'),201);
  }
  public function json_delete(Request $request){
    $event = Event::find($request->input('id'))->forceDelete();
    if ($event) {
      return response()->json(Helpers::message('delete-ok'));
    }
    return response()->json(Helpers::message('delete-nok'));
  }
  public function json_by_filter(Request $request){
    $event = '';
    // http://localhost:8000/json/event/filter?year_start=2017&year_end=2019
    if($request->input('year_start') && $request->input('year_end')){
      $event = Event::select(DB::raw(' COUNT(*) total, YEAR(start) year'))
               ->whereBetween('start',array($request->input('year_start').'-00-00',$request->input('year_end').'-12-31'))
               ->groupby('year')
               ->get();
    }
    // http://localhost:8000/json/event/filter?year=2017&month=2
    else if ($request->input('year') && $request->input('month')) {
      $event = Event::select(DB::raw('count(id) as `total`'),DB::raw('YEAR(start) year, MONTH(start) month, DAY(start) day'))
               ->whereYear('start','=', $request->input('year'))
               ->whereMonth('start','=', $request->input('month'))
               ->groupby('year','month','day')
               ->orderBy('day')
               ->get();
    //http://localhost:8000/json/event/filter?year=2017
    }else if($request->input('year')){
      $event = Event::select(DB::raw('count(id) as `total`'),DB::raw('YEAR(start) year, MONTH(start) month, DAY(start) day'))
               ->whereYear('start','=', $request->input('year'))
               ->groupby('year','month','day')
               ->orderBy('day')
               ->get();
    }
    return response()->json(array($event));
  }
}
