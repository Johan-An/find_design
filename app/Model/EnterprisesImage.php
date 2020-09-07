<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class EnterprisesImage extends Model
{
    //
    public function enterprise()
    {
        return $this->belongsTo(Painter::class, 'enterprise_id');
    }
}
