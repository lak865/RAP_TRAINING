CLASS lhc_ZR_MY_TRUCKTRACK DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zr_my_trucktrack RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zr_my_trucktrack RESULT result.

    METHODS setintialstatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zr_my_trucktrack~setintialstatus.

    METHODS validatedriverid FOR VALIDATE ON SAVE
      IMPORTING keys FOR zr_my_trucktrack~validatedriverid.

ENDCLASS.

CLASS lhc_ZR_MY_TRUCKTRACK IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD setintialstatus.
  ENDMETHOD.

  METHOD validateDriverID.
  ENDMETHOD.

ENDCLASS.
