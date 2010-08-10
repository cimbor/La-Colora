<?php


class EmpleadoTable extends Doctrine_Table
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('Empleado');
    }
}