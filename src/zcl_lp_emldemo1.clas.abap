CLASS zcl_lp_emldemo1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lp_emldemo1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*   Read ENTITIES OF ZR_MY_TRUCKTRACK
*    ENTITY ZR_MY_TRUCKTRACK
*    FROM  VALUE   #( ( Truckregnum = 'TRUCK003' ) )
*     RESULT DATA(lt_truck).
*     out->write( lt_truck ).

*  READ ENTITIES OF zr_my_trucktrack
*  ENTITY zr_my_trucktrack
*  ALL FIELDS WITH
*  VALUE   #( ( Truckregnum = 'TRUCK003' ) )
*   RESULT DATA(lt_truck).
*    out->write( lt_truck ).

*    READ ENTITIES OF zr_my_trucktrack
*    ENTITY zr_my_trucktrack
*    FIELDS  ( Truckregnum Truckmake )
*       WITH VALUE   #( ( Truckregnum = 'TRUCK002' ) )
*       RESULT DATA(lt_truck).
*    out->write( lt_truck ).

*  READ ENTITIES OF zr_my_trucktrack
*  ENTITY zr_my_trucktrack BY \_driver
*  ALL FIELDS WITH
*  VALUE   #( ( Truckregnum = 'TRUCK003' ) )
*   RESULT DATA(lt_truck).
*    out->write( lt_truck ).

*    READ ENTITIES OF zr_my_trucktrack
*     ENTITY zr_my_trucktrack BY \_driver
*     ALL FIELDS WITH
*     VALUE   #( ( Truckregnum = 'TRUCK0020000000000001' ) )
*         RESULT DATA(it_drivers)
*         FAILED    DATA(it_failed)
*         REPORTED  DATA(it_reported).
*
*    out->write( it_drivers ).
*
*    out->write( it_failed ).
*
*    out->write( it_reported ).

    MODIFY  ENTITIES OF zr_my_trucktrack
         ENTITY zr_my_trucktrack
         UPDATE
        SET FIELDS WITH VALUE
        #( (  Truckregnum = 'TRUCK002'
              Truckmake = 'TTTTT' ) )
          FAILED    DATA(it_failed)
          REPORTED  DATA(it_reported).

    COMMIT ENTITIES
    RESPONSE OF zr_my_trucktrack
    FAILED  it_failed
    REPORTED    it_reported.

* MODIFY  ENTITIES OF zr_my_trucktrack
*         ENTITY zr_my_trucktrack
*         CREATE
*        SET FIELDS WITH VALUE
*        #( (  %cid = 'MyUniqueContentID_1'
*          Truckregnum = 'TRUCK005'
*          Truckmake = 'TATA'
*          Truckpuc = 'PUC1234' ) )
*      MAPPED    DATA(it_mapped)
*      FAILED    DATA(it_failed)
*      REPORTED  DATA(it_reported).
*
*    COMMIT ENTITIES
*    RESPONSE OF zr_my_trucktrack
*    FAILED  it_failed
*    REPORTED    it_reported.

*    MODIFY  ENTITIES OF zr_my_trucktrack
*             ENTITY zr_my_trucktrack
*             DELETE FROM
*             VALUE
*            #( (
*              Truckregnum = 'TRUCK005'
*              ) )
*          FAILED    DATA(it_failed)
*          REPORTED  DATA(it_reported).
*
*    COMMIT ENTITIES
*    RESPONSE OF zr_my_trucktrack
*    FAILED  it_failed
*    REPORTED    it_reported.

  ENDMETHOD.
ENDCLASS.
