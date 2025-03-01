CLASS zcl_lp_emldemo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lp_emldemo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*  Read ENTITIES OF ZR_LP_TRUCK
*      ENTITY  ZR_LP_TRUCK
*      FROM  VALUE   #( ( Truckregnum = 'TRUCK003' ) )
*      RESULT DATA(lt_truck).

*    READ ENTITIES OF zr_lp_truck
*          ENTITY  zr_lp_truck
*          ALL FIELDS WITH
*          VALUE   #( ( Truckregnum = 'TRUCK003' ) )
*          RESULT DATA(lt_truck).

* READ ENTITIES OF zr_lp_truck
*          ENTITY  zr_lp_truck
*          FIELDS ( Truckregnum Truckmake )
*          WITH  VALUE   #( ( Truckregnum = 'TRUCK003' ) )
*          RESULT DATA(lt_truck).
*    out->write( lt_truck ).

*    READ ENTITIES OF zr_lp_truck
*              ENTITY  zr_lp_truck BY  \_driver
*              ALL FIELDS WITH
*                VALUE   #( ( Truckregnum = 'TRUCK0031111' ) )
*              RESULT DATA(lt_driver)
*              FAILED    DATA(lt_failed)
*              REPORTED  DATA(lt_reported).
*    out->write( lt_driver ).
*    out->write( lt_failed ).
*    out->write( lt_reported ).

    MODIFY ENTITIES OF zr_lp_truck
                  ENTITY  zr_lp_truck
                  UPDATE
                  SET FIELDS WITH VALUE
                  #( ( Truckregnum = 'TRUCK002'
                       Truckmake   = 'TESLA' ) )
                  FAILED    DATA(lt_failed)
                  REPORTED  DATA(lt_reported).
    COMMIT ENTITIES
    RESPONSE OF zr_lp_truck
    FAILED lt_failed
    REPORTED  lt_reported.

*    MODIFY ENTITIES OF zr_lp_truck
*                  ENTITY  zr_lp_truck
*                  Create
*                  SET FIELDS WITH VALUE
*                  #( ( %cid = 'MyUniqueContentID_1'
*                       Truckregnum = 'TRUCK004'
*                       Truckmake   = 'TATA'
*                       Truckpuc    = 'PUC1234' ) )
*                  MAPPED    DATA(lt_mapped)
*                  FAILED    DATA(lt_failed)
*                  REPORTED  DATA(lt_reported).
*    COMMIT ENTITIES
*    RESPONSE OF zr_lp_truck
*    FAILED lt_failed
*    REPORTED  lt_reported.
*    out->write( lt_mapped ).
*    out->write( lt_failed ).
*    out->write( lt_reported ).
*    MODIFY ENTITIES OF zr_lp_truck
*                     ENTITY  zr_lp_truck
*                     DELETE FROM
*                     VALUE
*                     #( (  Truckregnum = 'TRUCK004'
*                           ) )
*                     FAILED    DATA(lt_failed)
*                     REPORTED  DATA(lt_reported).
*    COMMIT ENTITIES
*    RESPONSE OF zr_lp_truck
*    FAILED lt_failed
*    REPORTED  lt_reported.
*
*    out->write( lt_failed ).
*    out->write( lt_reported ).
  ENDMETHOD.
ENDCLASS.
