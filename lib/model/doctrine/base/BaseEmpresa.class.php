<?php

/**
 * BaseEmpresa
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $idEmpresa
 * @property string $razonSocial
 * @property varchar $cif_nif
 * @property string $dirección
 * @property string $telefono
 * @property string $email
 * @property string $gerente
 * @property Doctrine_Collection $Alojamiento
 * @property Doctrine_Collection $Factura
 * 
 * @method integer             getIdEmpresa()   Returns the current record's "idEmpresa" value
 * @method string              getRazonSocial() Returns the current record's "razonSocial" value
 * @method varchar             getCifNif()      Returns the current record's "cif_nif" value
 * @method string              getDirecci()     Returns the current record's "direcci" value
 * @method string              getTelefono()    Returns the current record's "telefono" value
 * @method string              getEmail()       Returns the current record's "email" value
 * @method string              getGerente()     Returns the current record's "gerente" value
 * @method Doctrine_Collection getAlojamiento() Returns the current record's "Alojamiento" collection
 * @method Doctrine_Collection getFactura()     Returns the current record's "Factura" collection
 * @method Empresa             setIdEmpresa()   Sets the current record's "idEmpresa" value
 * @method Empresa             setRazonSocial() Sets the current record's "razonSocial" value
 * @method Empresa             setCifNif()      Sets the current record's "cif_nif" value
 * @method Empresa             setDirecci()     Sets the current record's "direcci" value
 * @method Empresa             setTelefono()    Sets the current record's "telefono" value
 * @method Empresa             setEmail()       Sets the current record's "email" value
 * @method Empresa             setGerente()     Sets the current record's "gerente" value
 * @method Empresa             setAlojamiento() Sets the current record's "Alojamiento" collection
 * @method Empresa             setFactura()     Sets the current record's "Factura" collection
 * 
 * @package    LaColora
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseEmpresa extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('colora_empresa');
        $this->hasColumn('idEmpresa', 'integer', null, array(
             'type' => 'integer',
             'primary' => true,
             ));
        $this->hasColumn('razonSocial', 'string', 255, array(
             'type' => 'string',
             'notblank' => true,
             'length' => 255,
             ));
        $this->hasColumn('cif_nif', 'varchar', 9, array(
             'type' => 'varchar',
             'notblank' => true,
             'nospace' => true,
             'length' => 9,
             ));
        $this->hasColumn('dirección', 'string', 100, array(
             'type' => 'string',
             'notblank' => true,
             'length' => 100,
             ));
        $this->hasColumn('telefono', 'string', 12, array(
             'type' => 'string',
             'minlength' => 9,
             'length' => 12,
             ));
        $this->hasColumn('email', 'string', 255, array(
             'type' => 'string',
             'email' => true,
             'length' => 255,
             ));
        $this->hasColumn('gerente', 'string', 100, array(
             'type' => 'string',
             'length' => 100,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasMany('Alojamiento', array(
             'local' => 'idEmpresa',
             'foreign' => 'idEmpresa'));

        $this->hasMany('Factura', array(
             'local' => 'idEmpresa',
             'foreign' => 'idEmpresa'));
    }
}