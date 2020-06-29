<?php
const DB_USER = 'root';
const DB_NAME = 'db_mvc';
const DB_HOST = '127.0.0.1';
const DB_PASSWORD = 'root';

const ADMIN_IDS = [1];

function d(...$args)
{
    var_dump($args);
    die;
}