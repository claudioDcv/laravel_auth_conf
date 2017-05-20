<?php
namespace App\Http\Controllers;
use App\SchedulerEvent;
use Dhtmlx\Connector\SchedulerConnector;
use Illuminate\Http\Request;

class SchedulerController extends Controller
{
    public function data(Request $request) {

        // dd($request->input());
        $connector = new SchedulerConnector(null, "PHPLaravel");
        $connector->configure(new SchedulerEvent(), "event_id", "start_date, end_date, event_name");
        $connector->render();
    }
    // function get($request){
    //     return array_of_data();
    // }
    // function editing($action){
    //     dd(123);
    //     //call $action->success(); or $action->invalid();
    //     //to mark operation as completed or invalid
    // }
    // function insert($action){
    //     //call $action->success(); or $action->invalid();
    //     //to mark operation as completed or invalid
    // }
    // function delete($action){
    //     //call $action->success(); or $action->invalid();
    //     //to mark operation as completed or invalid
    // }

}
