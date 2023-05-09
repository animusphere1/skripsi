<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    @include('utils.maincss')
    <title>Document</title>    

    <style>
        body h1{
            background-color: yellow;
            width: 20px;
            border-radius: 20px;
        }
    </style>
</head>
<body>
    <h1>
        text 1
    </h1>

    @include('utils.mainjs')
    @yield('header')
</body>
</html>