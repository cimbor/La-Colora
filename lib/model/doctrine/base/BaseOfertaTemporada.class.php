<?php

/**
 * BaseOfertaTemporada
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $idOfertaTemporada
 * @property timestamp $fechaInicio
 * @property timestamp $fechaFin
 * @property integer $codGerente
 * @property decimal $dtoPorcentual
 * @property decimal $dtoFijo
 * @property string $descripcion
 * @property boolean $noCobrarExtra1
 * @property boolean $noCobrarExtra2
 * @property decimal $techoDto
 * @property Empleado $Empleado
 * @property Doctrine_Collection $Reserva
 * 
 * @method integer             getIdOfertaTemporada() Returns the current record's "idOfertaTemporada" value
 * @method timestamp           getFechaInicio()       Returns the current record's "fechaInicio" value
 * @method timestamp           getFechaFin()          Returns the current record's "fechaFin" value
 * @method integer             getCodGerente()        Returns the current record's "codGerente" value
 * @method decimal             getDtoPorcentual()     Returns the current record's "dtoPorcentual" value
 * @method decimal             getDtoFijo()           Returns the current record's "dtoFijo" value
 * @method string              getDescripcion()       Returns the current record's "descripcion" value
 * @method boolean             getNoCobrarExtra1()    Returns the current record's "noCobrarExtra1" value
 * @method boolean             getNoCobrarExtra2()    Returns the current record's "noCobrarExtra2" value
 * @method decimal             getTechoDto()          Returns the current record's "techoDto" value
 * @method Empleado            getEmpleado()          Returns the current record's "Empleado" value
 * @method Doctrine_Collection getReserva()           Returns the current record's "Reserva" collection
 * @method OfertaTemporada     setIdOfertaTemporada() Sets the current record's "idOfertaTemporada" value
 * @method OfertaTemporada     setFechaInicio()       Sets the current record's "fechaInicio" value
 * @method OfertaTemporada     setFechaFin()          Sets the current record's "fechaFin" value
 * @method OfertaTemporada     setCodGerente()        Sets the current record's "codGerente" value
 * @method OfertaTemporada     setDtoPorcentual()     Sets the current record's "dtoPorcentual" value
 * @method OfertaTemporada     setDtoFijo()           Sets the current record's "dtoFijo" value
 * @method OfertaTemporada     setDescripcion()       Sets the current record's "descripcion" value
 * @method OfertaTemporada     setNoCobrarExtra1()    Sets the current record's "noCobrarExtra1" value
 * @method OfertaTemporada     setNoCobrarExtra2()    Sets the current record's "noCobrarExtra2" value
 * @method OfertaTemporada     setTechoDto()          Sets the current record's "techoDto" value
 * @method OfertaTemporada     setEmpleado()          Sets the current record's "Empleado" value
 * @method OfertaTemporada     setReserva()           Sets the current record's "Reserva" collection
 * 
 * @package    LaColora
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseOfertaTemporada extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('colora_ofertatemporada');
        $this->hasColumn('idOfertaTemporada', 'integer', null, array(
             'type' => 'integer',
             'primary' => true,
             ));
        $this->hasColumn('fechaInicio', 'timestamp', null, array(
             'type' => 'timestamp',
             'notnull' => true,
             ));
        $this->hasColumn('fechaFin', 'timestamp', null, array(
             'type' => 'timestamp',
             'notnull' => true,
             ));
        $this->hasColumn('codGerente', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
        $this->hasColumn('dtoPorcentual', 'decimal', 5, array(
             'type' => 'decimal',
             'scale' => 2,
             'default' => 0,
             'length' => 5,
             ));
        $this->hasColumn('dtoFijo', 'decimal', 5, array(
             'type' => 'decimal',
             'scale' => 2,
             'default' => 0,
             'length' => 5,
             ));
        $this->hasColumn('descripcion', 'string', 255, array(
             'type' => 'string',
             'default' => 'sin descripcion',
             'length' => 255,
             ));
        $this->hasColumn('noCobrarExtra1', 'boolean', null, array(
             'type' => 'boolean',
             'notnull' => true,
             ));
        $this->hasColumn('noCobrarExtra2', 'boolean', null, array(
             'type' => 'boolean',
             'notnull' => true,
             ));
        $this->hasColumn('techoDto', 'decimal', 5, array(
             'type' => 'decimal',
             'scale' => 2,
             'default' => 0,
             'length' => 5,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Empleado', array(
             'local' => 'codGerente',
             'foreign' => 'idEmpleado',
             'onDelete' => 'CASCADE'));

        $this->hasMany('Reserva', array(
             'local' => 'idOfertaTemporada',
             'foreign' => 'codOfertaTemporada'));

        $timestampable0 = new Doctrine_Template_Timestampable(array(
             ));
        $this->actAs($timestampable0);
    }
}