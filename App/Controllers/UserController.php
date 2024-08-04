<?php

namespace App\Controllers;
use App\Controllers\Controller;

class UserController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index($request){
        $users = $this->queryBuilder->table('users')->getAll()->execute();

        return $this->sendResponse(data: $users, message: "لیست کاربران با موفقیت دریافت شد");
    }

    public function get($id, $request){
        $users = $this->queryBuilder->table('users')->where(column: 'users.id' ,value: $id)->get()->execute();

        return $this->sendResponse(data: $users, message: "کاربر شما با موفقیت دریافت شد");
    }

    public function store($request){
        $this->validate([
            'username||required|min:3|max:25|string',
            'display_name||min:2|max:40|string',
            'mobile_number||required|length:11|string',
            'role||enum:admin,support,guest,host',
            'status||enum:pending,reject,accept'
        ], $request);

        $this->checkUnique(table: 'users' ,array: [['username', $request->username], ['mobile_number', $request->mobile_number]]);

        // check profile image
        if($request->profile_image){
            $request->profile_image = uploadBase64($request->profile_image, 'uploads/profile_image');
        }

        $newUser = $this->queryBuilder->table('users')
            ->insert([
                'username' => $request->username,
                'display_name' => $request->display_name ?? NULL,
                'mobile_number' => $request->mobile_number,
                'profile_image' => $request->profile_image ?? NULL,
                'role' => $request->role ?? 'guest',
                'status' => $request->status ?? 'pending',
                'created_at' => time(),
                'updated_at' => time()
            ])->execute();

        return $this->sendResponse(data: $newUser, message: "  کاربر جدید با موفقیت ایجاد شد!");
    }

    public function update($id, $request)
    {
        $this->validate([
            'display_name||min:2|max:40|string',
        ], $request);

        $newRoom = $this->queryBuilder->table('rooms')
            ->update([
                'display_name' => $request->display_name ?? NULL,
                'profile_image' => $request->profile_image ?? NULL,
                'updated_at' => time()
            ])->where(value: $id)->execute();

        return $this->sendResponse(data: $newRoom, message: "کاربر با موفقیت ویرایش شد");
    }
    public function destroy($id){
        $deletedRoom = $this->queryBuilder->table('users')
            ->update([
                'deleted_at' => time()
            ])->where(value: $id)->execute();

        return $this->sendResponse(data: $deletedRoom , message: "اتاق  با موفقیت حذف شد");
    }
}