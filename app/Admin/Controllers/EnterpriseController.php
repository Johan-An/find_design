<?php

namespace App\Admin\Controllers;

use App\Model\Enterprise;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Admin;
use App\Model\BusinessColumn;


class EnterpriseController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '企业管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        Admin::css('css/admin/enterprise-list.css');
        $grid = new Grid(new Enterprise());
        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('logo', __('Logo'))->display(function($logo) {
            return "<img class='logo' src=http://finddesign:8083/uploads/$logo />";
        });
        $grid->column('head_image', __('Head image'))->display(function($head_image) {
            return "<img class='head_image' src=http://finddesign:8083/uploads/$head_image />";
        });
        $grid->column('province', __('Province'));
        $grid->column('city', __('City'));
        $grid->column('web_url', __('Web url'));
        $grid->column('status', __('Status'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Enterprise::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('logo', __('Logo'));
        $show->field('head_image', __('Head image'));
        $show->field('province', __('Province'));
        $show->field('city', __('City'));
        $show->field('introduction', __('Introduction'));
        $show->field('web_url', __('Web url'));
        $show->field('status', __('Status'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('deleted_at', __('Deleted at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Enterprise());
        // 企业业务栏目
        $columns = BusinessColumn::select('id', 'name')->pluck('name', 'id')->toArray();
        $form->checkboxCard('column', '业务栏目')->options($columns);

        $form->text('name', __('名称'));
        $form->image('logo', __('Logo'));
        // $form->image('head_image', __('头图'));
        $form->text('province', __('省份'));
        $form->text('city', __('城市'));
        $form->textarea('introduction', __('简介'));
        $form->text('web_url', __('官网地址'));
        $form->switch('status', __('是否上架'))->default(1);
        // 多图上传
        //$form->multipleImage('images', '详情图片')->sortable()->pathColumn('image_url')->removable();

        return $form;
    }
}
