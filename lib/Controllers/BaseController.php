<?php
/**
 * BaseController
 */
class BaseController
{

  protected static $cmd;
  protected static $argv = array();

  function init()
  {
    self::$argv = $_SERVER['argv'];
    self::$cmd = basename(self::$argv[0]);
    array_shift(self::$argv);
  }

  function getCommand() {
    self::init();

    return self::$cmd;
  }

  function getArgv() {
    self::init();

    return self::$argv;
  }
}
