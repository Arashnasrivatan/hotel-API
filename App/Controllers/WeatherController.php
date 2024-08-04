<?php

namespace App\Controllers;

use App\Controllers\Controller;
use App\Middlewares\CheckAccessMiddleware;

class WeatherController extends Controller
{
    private $roles;

    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
        $weathers = $this->queryBuilder->table('weathers')->getAll()->execute();

        return $this->sendResponse(data: $weathers, message: "لیست آب و هوا ها با موفقیت گرفته شد");
    }

    public function get($id){
        $weather = $this->queryBuilder->table('weathers')
            ->where(value: $id)->get()->execute();

        if(!$weather) return $this->sendResponse(data: $weather, message: " آب و هوا پیدا نشد", error: true, status: HTTP_BadREQUEST);
        return $this->sendResponse(data: $weather, message: " آب و هوا ها با موفقیت گرفته شد");
    }

    public function store($request){
        $this->validate([
            'title||required|min:3|max:50'
        ], $request);

        $newWeathers = $this->queryBuilder->table('weathers')
            ->insert([
                'title' => $request->title,
                'created_at' => time(),
                'updated_at' => time()
            ])->execute();

        return $this->sendResponse(data:$newWeathers , message: "آب و هوای جدید با موفقیت افزوده شد");
    }

    public function update($id, $request){
        $this->validate([
            'title||required|min:3|max:50'
        ], $request);

        $updatedWeather = $this->queryBuilder->table('weathers')
            ->update([
                'title' => $request->title,
                'updated_at' => time()
            ])->where(value: $id)->execute();

        return $this->sendResponse(data:$updatedWeather , message: "آب و هوا  با موفقیت ویرایش شد");
    }

    public function destroy($id){
        $deletedWeather = $this->queryBuilder->table('weathers')
            ->update([
                'deleted_at' => time()
            ])->where(value: $id)->execute();

        return $this->sendResponse(data: $deletedWeather , message: "آب و هوا  با موفقیت حذف شد");
    }
}