<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Blade;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */

    private function stringToArray($string)
    {
      // dd($string);
      // $elm = str_replace($string, '[', '');
      $arrResult = [];
      $search = ['[',']','\''];
      $elm = str_replace($search, '', $string);
      $elm = explode(',',$elm);
      foreach ($elm as $e) {
        $arrE = explode(':',$e);
        $arrResult[trim($arrE[0])] = trim($arrE[1]);
      }
      return $arrResult;
    }
    public function boot()
    {
        //
        Schema::defaultStringLength(191);
        \Carbon\Carbon::setLocale(config('app.locale'));

      //   \Blade::directive('join',function($arguments) {
      //      list($locations, $field) = explode(',',str_replace(['(',')',' '], '', $arguments));
       //
      //      return '<?php '
      //          .'$values = [];'
      //          .' foreach(' . $locations . ' as $value) {'
      //                  .'$values[] = $value->'.$field.';'
      //              .'}'
      //          .'echo join("/", $values)'
      //          . '?\>';
       //
      //  });



        Blade::directive('input', function ($attr) {
            $attr = $this->stringToArray($attr);
            $max = isset($attr['max']) ? ' maxlength="' . $attr['max'] . '"' : '';
            $min = isset($attr['min']) ? ' minlength="' . $attr['min'] . '"' : '';
            $placeholder = isset($attr['placeholder']) ? ' placeholder="' . $attr['placeholder'] . '"' : '';
            $iconGroupOpen = isset($attr['icon']) ? '<div class="input-group">' : '';
            $iconGroupClose = isset($attr['icon']) ? '</div>' : '';
            $readonly = isset($attr['readonly']) ? ' readonly="' . $attr['readonly'] . '"' : '';
            $icon = isset($attr['icon']) ? '<span class="input-group-addon"><span class="' . $attr['icon'] . '"></span></span>' : '';

            return '<div class="col-md-' . $attr['col'] . '">
                      <div class="form-group">
                        <label for="' . $attr['name'] .'">' . $attr['title'] .'</label>
                          ' .$iconGroupOpen .'
                          <input type="' . $attr['type'] . '" class="form-control" id="' . $attr['name'] . '" name="' . $attr['name'] .'"' . $max . $min . $placeholder . $readonly .' />
                          ' . $icon .'
                        ' .$iconGroupClose .'
                      </div>
                    </div>';
        });

        Blade::directive('textarea', function ($attr) {
            $attr = $this->stringToArray($attr);
            $readonly = isset($attr['readonly']) ? ' readonly="' . $attr['readonly'] . '"' : '';

            return '<div class="col-md-' . $attr['col'] . '">
                      <div class="form-group">
                        <label for="' . $attr['name'] .'">' . $attr['title'] .'</label>
                        <textarea type="' . $attr['type'] . '" class="form-control" id="' . $attr['name'] . '" name="' . $attr['name'] .'" maxlength="' . $attr['max'] . '" row="' . $attr['row'] . '"' . $readonly . '></textarea>
                      </div>
                    </div>';
        });

        // [
        //   'col' => 12,
        //   'name' => 'title',
        //   'title' => 'Titulo',
        //   'max' => 100,
        //   'min' =>  2,
        //   'row' => 3,
        // ]
        //
        // <div class="col-md-12">
        //   <div class="form-group">
        //     <label for="exampleTextarea">Titulo</label>
        //     <textarea class="form-control" name="title" maxlength="100" rows="3"></textarea>
        //   </div>
        // </div>
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
