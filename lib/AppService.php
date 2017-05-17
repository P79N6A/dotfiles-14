<?php
// // Autoload functions.
// extract(get_args());
//
// function get_args() {
//   $argv = $_SERVER['argv'];
//   extract($argv);
//
//   $cmd = basename($argv[0]);
//   array_shift($argv);
//
//   return array(
//     'cmd' => $cmd,
//     'argv' => $argv,
//   );
// }

/**
 * Base class of the software.
 */
class App extends BaseController
{

  function __construct()
  {
    # code...
  }

  public function getArgv() {
    return parent::getArgv();
  }

  public function getCommand() {
    return parent::getCommand();
  }
}


$cmd = App::getCommand();
$argv = App::getArgv();
