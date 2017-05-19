<?php
function imp($argv) {
  echo implode(" ", $argv);
}

function pp($argv) {
  if (is_bool($argv)) {
    if ($argv === true) {
      print_r(1);
    } else {
      print_r(0);
    }
  } elseif (is_null($argv) || !$argv || $argv == '') {
    print_r('NULL');
  } else {
    print_r($argv);
  }
}

function file_not_found($file) {
  return 'File '. $file .' not found.';
}
