<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Event as Event;
class WeekCalendar extends Controller
{
    public function deleteEvent($id) {
      $event = Event::find($id);
      $result = '';
      if ($event) {
        $result = ['delete' => $event->delete()];
      }
      $result = ['delete' => false];
      return back()->withInput();
    }
    public function event($id, $id_spec, Request $request){

      $user = \Auth::user();

      if ($user->HasRole('admin')) {
        $start = Carbon::createFromTimestamp($request->input('start'));
        $end = Carbon::createFromTimestamp($request->input('end'));
        $event = Event::
        where('user_id',$id)
        ->whereBetween('start', array($start, $end))
        ->with('client')
        ->with('status')->with('users')->get();
        return $event;
      }
      if($user->HasRole('medic')){
        $start = Carbon::createFromTimestamp($request->input('start'));
        $end = Carbon::createFromTimestamp($request->input('end'));
        $event = Event::
        where('user_id',$id)
        //->where('status_id',2)
        ->whereBetween('start', array($start, $end))
        //->with('client')
        //->whereNotNull('client_id')
        ->with('status')->with('users')->get();
        return $event;
      }

      if($user->HasRole('client')){
        $start = Carbon::createFromTimestamp($request->input('start'));
        $end = Carbon::createFromTimestamp($request->input('end'));
        $event = Event::
        where('user_id',$id)
        ->where('medspec_id',$id_spec)
        ->where('status_id',1)
        ->whereBetween('start', array($start, $end))
        ->with('status')
        ->whereNull('client_id')
        ->with('users')->get();
        return $event;
      }

      return '[]';
      // if ($user->isRole('client') && !$user->isRole('admin') && !$user->isRole('medic')) {
      //   $start = Carbon::createFromTimestamp($request->input('start'));
      //   $end = Carbon::createFromTimestamp($request->input('end'));
      //   $event = Event::
      //   where('user_id',$id)
      //   ->where('status_id',1)
      //   ->whereBetween('start', array($start, $end))->with('status')->with('users')->get();
      //   return $event;
      // }
      // $start = Carbon::createFromTimestamp($request->input('start'));
      // $end = Carbon::createFromTimestamp($request->input('end'));
      // $event = Event::
      // where('user_id',$id)
      // //   ->where('status','active')
      // ->whereBetween('start', array($start, $end))->with('status')->with('users')->get();
      //
      // return $event;
    }
    public function save(Request $request){
      $event = Event::find($request->input('id'));
      if (!$event) {
        $event = new Event;
        $event->title = $request->input('title');
        $event->user_id = $request->input('user_id');
        $event->status_id = $request->input('status_id');
        $event->medspec_id = $request->input('medspec_id');
        $event->is_active = $request->input('is_active');
        $event->description = $request->input('description');
        $event->start = Carbon::createFromFormat('d/m/Y H:i:s', $request->input('start'));
        $event->end = Carbon::createFromFormat('d/m/Y H:i:s', $request->input('end'));
        $event->save();
        return Event::find($event->id);
      }else{
        $event->title = $request->input('title');
        $event->medspec_id = $request->input('medspec_id');
        $event->description = $request->input('description');
        $event->start = Carbon::createFromFormat('d/m/Y H:i:s', $request->input('start'));
        $event->end = Carbon::createFromFormat('d/m/Y H:i:s', $request->input('end'));
        $result = $event->save();
        return Event::find($event->id);
      }
    }
}
