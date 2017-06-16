<?php
namespace App\Http\Controllers;
use App\SchedulerEvent;
use Dhtmlx\Connector\SchedulerConnector;
use Illuminate\Http\Request;

class SchedulerController extends Controller
{
    public function data(Request $request) {



      //  function explodeIds($id)
      //   {
      //     return explode(',', $id);
      //   }
       //
      //   if ($request->input('editing')) {
      //     $ids = explodeIds($request->input('ids'));
          // $model = [
          //   'start_date' => $request->input($id . '_start_date'),
          //   'start_date' => $request->input($id . '_start_date'),
          //   'start_date' => $request->input($id . '_start_date'),
          //   'start_date' => $request->input($id . '_start_date'),
          //   'start_date' => $request->input($id . '_start_date'),
          //   'start_date' => $request->input($id . '_start_date'),
          //   'start_date' => $request->input($id . '_start_date'),
          // ];

        //   $modelToSave = [];
        //   $cont = 0;
        //   foreach ($ids as $id) {
        //     $modelToSave[$cont]['start_date'] = $request->input($id . '_start_date');
        //     $modelToSave[$cont]['end_date'] = $request->input($id . '_end_date');
        //     $modelToSave[$cont]['text'] = $request->input($id . '_text');
        //     $modelToSave[$cont]['id'] = $request->input($id . '_id');
        //     $modelToSave[$cont]['details'] = $request->input($id . '_details');
        //     $modelToSave[$cont]['!nativeeditor_status'] = $request->input($id . '_!nativeeditor_status');
        //     $cont++;
        //   }
        //
        //
        // }
        /*
        array:8 [
          "1495302131242_start_date" => "2010-08-04 04:00"
          "1495302131242_end_date" => "2010-08-04 04:05"
          "1495302131242_text" => "New event"
          "1495302131242_id" => "1495302131242"
          "1495302131242_details" => null
          "1495302131242_!nativeeditor_status" => "inserted"
          "ids" => "1495302131242"
          "editing" => "true"
        ]
        */

        $connector = new SchedulerConnector(null, "PHPLaravel");
        $connector->configure(new SchedulerEvent(), "event_id", "start_date, end_date, event_name");
        $connector->render();

        // dd($request->input(), $ids,$modelToSave, $connector);

        //dd($connector);

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
