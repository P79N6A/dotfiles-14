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

    protected $usage;

    function __construct()
    {
        # code...
        $this->usage = (object) array(
            'cmd' => '',
            'content' => '',
            'opts' => array(),
        );
    }

    private function registerUsage($cmd, $content = '', $argv = array()) {
        echo '<pre>'; print_r($this->usage); echo '</pre>';
    }

    public function getArgv() {
        return parent::getArgv();
    }

    public function getCommand() {
        return parent::getCommand();
    }

    public function argv() {
        return parent::getArgv();
    }

    public function cmd() {
        return parent::getCommand();
    }
}


$cmd = App::getCommand();
$argv = App::getArgv();
$argc = count($argv);

$usage = App::registerUsage($cmd);
