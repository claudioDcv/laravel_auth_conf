<?php
namespace App\Traits;

use Jenssegers\Date\Date;

trait DateTraslator {

    public function getCreatedAtAttribute($create_at) {
        return new Date($create_at);
    }
    public function getUpdatedAtAttribute($update_at) {
        return new Date($update_at);
    }
    public function getDeletedAtAttribute($delete_at) {
        return new Date($delete_at);
    }
}
