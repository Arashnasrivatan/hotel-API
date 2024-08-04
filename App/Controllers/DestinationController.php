<?php

namespace App\Controllers;

use App\Controllers\Controller;

class DestinationController extends Controller
{
    protected $roles;
    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
        $destinations = $this->queryBuilder->table('destinations')->getAll()->execute();

        return $this->sendResponse(data: $destinations, message: "لیست مقصد ها با موفقیت گرفته شد");
    }

    public function get($id){
        $destination = $this->queryBuilder->table('destinations')->where(value: $id)->get()->execute();

        if(!$destination) return $this->sendResponse(message: "مقصد شما پیدا مشد", error: true, status: HTTP_BadREQUEST);
        return $this->sendResponse(data: $destination, message: "مقصد شما با موفقیت دریافت شد");
    }

    public function store($request){
        $this->validate([
            'title||required|min:3|max:50',
            'weather_id||required|number'
        ], $request);

        $weather = $this->queryBuilder->table('weathers')->where(value: $request->weather_id)->get()->execute();
        if(!$weather) return $this->sendResponse( message: "آب و هوای وارد شده نامعتبر است", error: true, status: HTTP_BadREQUEST);

        $newDestination = $this->queryBuilder->table('destinations')
            ->insert([
                'title' => $request->title,
                'weather_id' => $request->weather_id,
                'created_at' => time(),
                'updated_at' => time()
            ])->execute();

        return $this->sendResponse(data: $newDestination, message: "مقصد جدید با موفقیت اضافه شد");
    }

    public function update($id, $request){
        $this->validate([
            'title||required|min:3|max:50',
            'weather_id||required|number'
        ], $request);

        $weather = $this->queryBuilder->table('weathers')->where(value: $request->weather_id)->get()->execute();
        if(!$weather) return $this->sendResponse( message: "آب و هوای وارد شده نامعتبر است", error: true, status: HTTP_BadREQUEST);

        $updatedDestination = $this->queryBuilder->table('destinations')
            ->update([
                'title' => $request->title,
                'weather_id' => $request->weather_id,
                'updated_at' => time()
            ])->where(value: $id)->execute();

        return $this->sendResponse(data:$updatedDestination , message: "مقصد  با موفقیت ویرایش شد");
    }

    public function destroy($id){
        $deletedDestination = $this->queryBuilder->table('destinations')
            ->update([
                'deleted_at' => time()
            ])->where(value: $id)->execute();

        return $this->sendResponse(data: $deletedDestination , message: "مقصد  با موفقیت حذف شد");
    }
}