<?php
session_start();
require __DIR__ . '/../vendor/autoload.php';

use Dotenv\Dotenv;
use App\Core\Controller\FastRouteCore;

// Gestion des fichiers environnement
$dotenv = Dotenv::createImmutable(__DIR__ . "/../");
$dotenv->load();

// Couche Controller
$dispatcher = FastRoute\simpleDispatcher(function(FastRoute\RouteCollector $route) {
    $route->addRoute('GET', '/', 'App\Controller\HomeController');
    $route->addRoute(['GET','POST'], '/login', 'App\Controller\LoginController');
    $route->addRoute(['GET','POST'], '/logout', 'App\Controller\LogoutController');
    $route->addRoute(['GET','POST'], '/users', 'App\Controller\UsersController');
    $route->addRoute(['GET','POST'], '/restore-db', 'App\Controller\RestoreDbController');
    //$route->addRoute('GET', '/lister', 'Quizz\Controller\Questionnaire\ListController');
    //$route->addRoute('GET', '/detail/{id:\d+}', 'Quizz\Controller\Questionnaire\ViewController');
});
// Dispatcher -> Couche view
echo FastRouteCore::getDispatcher($dispatcher);

