<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class BusinessColumn extends Model
{
	// protected $dateFormat ="U";
	/**
	 * The attributes that should be cast.
	 *
	 * @var array
	 */
	protected $casts = [
	    'created_at' => 'datetime:Y-m-d H:i:s',
	    'updated_at' => 'datetime:Y-m-d H:i:s',
	];
	/**
     * 企业栏目
     */
    public function enterprises()
    {
        return $this->belongsToMany(Enterprise::class);
    }
}
