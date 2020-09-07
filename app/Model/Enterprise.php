<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Enterprise extends Model
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
    //
    /**
     *  获取用户的姓名.
     *
     * @param  string  $value
     * @return string
     */
    public function getStatusAttribute($value)
    {
    	if ($value == 1) {
    		return "上架";
    	}
    	return "下架";
    }
    /**
     * 企业详情图
     */
    public function images()
    {
        return $this->hasMany(EnterprisesImage::class, 'enterprise_id');
    }
    /**
     * 企业栏目
     */
    public function columns()
    {
        return $this->belongsToMany(BusinessColumn::class);
    }
}
