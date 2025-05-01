

<?php
$path = isset($_GET['path']) ? $_GET['path'] : '';
$base = realpath(__DIR__);
$full = realpath($base . '/' . $path);

if (!$full || strpos($full, $base) !== 0 || !is_dir($full)) {
 http_response_code(403);
  echo json_encode([]);
  exit;
  }

  $hidden = [
   realpath($base . '/index.html'),
    realpath($base . '/list.php'),
    realpath($base . '/favicon.png'),
     ];

     $result = [];

     foreach (scandir($full) as $item) {
      if ($item === '.' || $item === '..') continue;

      $itemPath = realpath($full . '/' . $item);
       if (in_array($itemPath, $hidden)) continue;

        $result[] = [
         'name' => $item,
          'type' => is_dir($itemPath) ? 'folder' : 'file'
           ];
           }

           header('Content-Type: application/json');
           echo json_encode($result);
           