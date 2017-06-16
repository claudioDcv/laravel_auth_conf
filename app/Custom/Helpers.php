<?php
namespace App\Custom;

use Carbon\Carbon;

class Helpers
{

  static function formatDateRequestStart($date){
    $year = $date['year'];
    $month = $date['month'];
    $day = $date['day'];
    return $year . '-' . $month . '-' . $day . ' 00:00:00';
  }
  static function formatDateRequestEnd($date){
    $year = $date['year'];
    $month = $date['month'];
    $day = $date['day'];
    return $year . '-' . $month . '-' . $day . ' 23:59:00';
  }
  static function formatYearMonth($date){
    return $date['year'] . '-' . $date['month'];
  }

  static function message($key){
    $arrText = [
      'create-nok' => ['text' => 'No se puede crear', 'status' => '-1'],
      'create-ok' => ['text' => 'Creado con exito', 'status' => '1'],
      'delete-nok' => ['text' => 'No se puede eliminar', 'status' => '-1'],
      'date-nok' => ['text' => 'Fechas erroneas', 'status' => '-1'],
      'delete-ok' => ['text' => 'Eliminado con exito', 'status' => '1'],
      'find-nok' => ['text' => 'No se encontro el elemento', 'status' => '-1'],
      'update-ok' => ['text' => 'Actualizado con exito', 'status' => '1'],
      'updatend-nok' => ['text' => 'No se puedo actualizar', 'status' => '-1'],
    ];
    return $arrText[$key];
  }


  static function createMonth($date){
    $date = $date . '00:00:00';
    // return dd($date);
    $monthStart = Carbon::createFromFormat('d/m/Y H:i:s', $date)->startOfMonth();
    $monthEnd = Carbon::createFromFormat('d/m/Y H:i:s', $date)->endOfMonth();

    $days = [];
    $weeks = [];

    $daysStr = ['Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado'];
    $weekN = 0;
    for ($i=1; $i <= $monthEnd->day ; $i++) {
      $week = Carbon::createFromFormat('Y-m-d H:i:s', $monthStart->toDateTimeString())->startOfWeek();
      $d = $monthStart->toDateTimeString();
      $dayOfWeek = Carbon::createFromFormat('Y-m-d H:i:s', $monthStart->toDateTimeString())->dayOfWeek;
      $dStr = $daysStr[$dayOfWeek];
      if (!isset($days[$week->day])) {
        $days[$week->day] = [];
      }
      // array_push($days[$week->day], [
      //   'day' => $d,
      //   'name' => $dStr,
      //   'day_week' => $week->day,
      //   'day_month' => $monthStart->day,
      //   'n_of_week' => $dayOfWeek,
      // ]);

      array_push($weeks, [
        'day' => $d,
        'name' => $dStr,
        'day_week' => $week->day,
        'day_month' => $monthStart->day,
        'n_of_week' => $dayOfWeek,
      ]);
      $monthStart->addDay(1);
    }
    $weekOrder = [];
    $m = 0;
    for ($m = $m;$m < $weeks[0]['n_of_week']; $m++) {
      $weekOrder[$m] = [];
    }
    foreach ($weeks as $day) {
      array_push($weekOrder, $day);
    }
    for ($i=count($weekOrder); $i < 42; $i++) {
      array_push($weekOrder, []);
    }


    // 6 week add
    $daysInWeek = [];
    $dw= 0;
    for ($i=0; $i < 7; $i++) {
      for ($j=0; $j < 6; $j++) {
        $daysInWeek[$i][$j] = $weekOrder[$dw];
        $dw++;
      }
    }

    return [
      'week' => $daysInWeek,
      'start' => Carbon::createFromFormat('d/m/Y H:i:s', $date)->startOfMonth(),
      'end' => Carbon::createFromFormat('d/m/Y H:i:s', $date)->endOfMonth(),
    ];
  }
}
