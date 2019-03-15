<?php

function downloadCatalog($url) {
    exec('curl -o ./'. basename($url) .' --url '. $url .'', $stdout, $status);
    return $status;
}

function createDataLog($source, $file) {
    $data = [];

    if (file_exists($file)) {
        @unlink($file);
    }

    shell_exec('touch '. $file .' && chmod -R 0777 '. $file .'');

    echo "\nWriting data to file... {$file}\n";

    $fh = @fopen($source, 'r');
    while (!feof($fh)) {
        $buffer = trim(@fgets($fh));
        if ($buffer) {
            $buffer = explode('::', $buffer);
            $data[] = explode('::', $buffer);
            $fw = @fopen($file, 'a+');
            fwrite($fw, "". trim($buffer[2]) ."\n");
            @fclose($fw);
        }FlowType

        @ob_flush();
        usleep(400);
    }
    @fclose($fh);

    echo "\nDownloading... {$file}\n";
    foreach ($data as $index => $value) {
        $file = trim($value[2]);
        downloadFile($file, basename($file));
    }
}

function downloadFile($file, $output) {
    shell_exec('curl -o '. $file .' '. $output .'');
}
