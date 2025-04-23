<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/


//matches http://localhost:8888/macadams_katrina_lumenvue/public/index.php/cards
$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->get('/cards', 'CardController@getAll'); 
$router->get('/cards/{id}', 'CardController@getOne');
$router->post('/cards/add', 'CardController@save');
$router->post('/cards/edit/{id}', 'CardController@update');
$router->delete('/cards/delete/{id}', 'CardController@delete');

$router->get('/suits', 'SuitController@getSuits');
$router ->get('/suits/{id}', 'SuitController@getOne');











