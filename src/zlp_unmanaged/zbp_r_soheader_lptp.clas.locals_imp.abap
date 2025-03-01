CLASS lhc_ZR_SOHeader_LPTP DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZR_SOHeader_LPTP RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE ZR_SOHeader_LPTP.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ZR_SOHeader_LPTP.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ZR_SOHeader_LPTP.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZR_SOHeader_LPTP RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK ZR_SOHeader_LPTP.

    METHODS rba_Soitem FOR READ
      IMPORTING keys_rba FOR READ ZR_SOHeader_LPTP\_Soitem FULL result_requested RESULT result LINK association_links.

    METHODS cba_Soitem FOR MODIFY
      IMPORTING entities_cba FOR CREATE ZR_SOHeader_LPTP\_Soitem.

ENDCLASS.

CLASS lhc_ZR_SOHeader_LPTP IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  data : lT_MESSAGES TYPE /DMO/T_MESSAGE,
       ls_vbak type zvbak_lp.


  loop at entities Assigning field-symbol(<entity>).
  ls_vbak = CORRESPONDING #( <entity> ).
    .
  call function 'ZFM_MODIFY_SO_LP'
  EXPORTING
  vbap = <entity>
  create = abap_true
  IMPORTING
     et_messages = lt_messages.
   LOOP AT lt_messages into data(ls_msg).
    if ls_msg-msgty = 'S'.
    mapped-zr_soheader_lptp = VALUE #( BASE mapped-zr_soheader_lptp
    (  %cid =  <entity>-%cid
       Vbeln = <entity>-Vbeln )
    ).
    else.
    append VALUE #( %cid =  <entity>-%cid
       Vbeln = <entity>-Vbeln ) to failed-zr_soheader_lptp.

        APPEND VALUE #( %msg  = new_message( id = ls_msg-msgid
                                           number = ls_msg-msgno
                                           v1 = ls_msg-msgv1
                                           severity = if_abap_behv_message=>severity-error )
                     %key-Vbeln = <entity>-Vbeln
                     %cid =  <entity>-%cid
                     %create = abap_true ) to reported-zr_soheader_lptp.
    endif.
   ENDLOOP.

  ENDLOOP..
  ENDMETHOD.

  METHOD update.
  DATA : lT_MESSAGES TYPE /dmo/t_message,
           ls_vbak     TYPE zvbak_lp.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<entity>).

      ls_vbak = CORRESPONDING #( <entity> ).

      CALL FUNCTION 'ZFM_MODIFY_SO_LP'
        EXPORTING
          vbak        = <entity>
          update      = abap_true
        IMPORTING
          et_messages = lt_messages.
      LOOP AT lt_messages INTO DATA(ls_msg).
        IF ls_msg-msgty = 'S'.

          APPEND VALUE #( Vbeln = <entity>-Vbeln ) TO mapped-zr_soheader_lptp.
        ELSE.
          APPEND VALUE #( Vbeln = <entity>-Vbeln ) TO failed-zr_soheader_lptp.


          APPEND VALUE #( %msg  = new_message( id = ls_msg-msgid
                                              number = ls_msg-msgno
                                              v1 = ls_msg-msgv1
                                              severity = if_abap_behv_message=>severity-error )
                                              ) TO reported-zr_soheader_lptp.
        ENDIF.
      ENDLOOP.


    ENDLOOP.
  ENDMETHOD.

  METHOD delete.
  DATA : lT_MESSAGES TYPE /dmo/t_message,
           ls_vbak     TYPE zvbak_lp.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).

      READ ENTITIES OF zr_soheader_lptp
       ENTITY zr_soheader_lptp
       FROM  VALUE   #( ( %key = <key>-Vbeln ) )
       RESULT DATA(ls_salesOrders).
      IF  sy-subrc = 0.
        CALL FUNCTION 'ZFM_MODIFY_SO_LP'
          EXPORTING
            vbak        = ls_salesOrders
            delete      = abap_true
          IMPORTING
            et_messages = lt_messages.
        LOOP AT lt_messages INTO DATA(ls_msg).
          IF ls_msg-msgty = 'S'.

            APPEND VALUE #( Vbeln = <key>-Vbeln ) TO mapped-zr_soheader_lptp.
          ELSE.
            APPEND VALUE #( Vbeln = <key>-Vbeln ) TO failed-zr_soheader_lptp.

            APPEND VALUE #( %msg  = new_message( id = ls_msg-msgid
                                                 number = ls_msg-msgno
                                                 v1 = ls_msg-msgv1
                                                 severity = if_abap_behv_message=>severity-error )
                                                 ) TO reported-zr_soheader_lptp.
          ENDIF.
        ENDLOOP.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD read.
  DATA : vbak        TYPE zvbak_lp,
           vbap        TYPE zvbap_lp,
           lt_messages TYPE /dmo/t_message.


    LOOP AT keys INTO DATA(key).
      CALL FUNCTION 'ZFM_MODIFY_SO_LP'
        EXPORTING
          vbeln       = key-Vbeln
          vbak        = vbak
          vbap        = vbap
          read        = abap_true
        IMPORTING
          et_messages = lt_messages.
      LOOP AT lt_messages INTO DATA(ls_msg).
        IF ls_msg-msgty = 'S'.
          INSERT CORRESPONDING #( vbak ) INTO TABLE result.
        ELSE.

          APPEND VALUE #(   vbeln = key-Vbeln
                            %msg  = new_message( id = ls_msg-msgid
                                              number = ls_msg-msgno
                                              v1 = ls_msg-msgv1
                                              severity = if_abap_behv_message=>severity-error
                                             ) ) TO reported-zr_soheader_lptp.
        ENDIF.

      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD lock.
  DATA(lock) = cl_abap_lock_object_factory=>get_instance( iv_name = 'ZVBAK_LP' ).

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).
      TRY.

          lock->enqueue(
            it_parameter  = VALUE #( ( name = 'VBELN' value = REF #( <key>-Vbeln ) ) )
          ).
        CATCH cx_root INTO DATA(lo_root).
          APPEND VALUE #( Vbeln = <key>-Vbeln ) TO failed-zr_soheader_lptp.

          APPEND VALUE #( %msg  = new_message( id = 'LOCK_FAILED'
                                               number = '007'
                                               v1 = lo_root->get_text( )
                                               severity = if_abap_behv_message=>severity-error )
                                               ) TO reported-zr_soheader_lptp.



      ENDTRY.

    ENDLOOP.
  ENDMETHOD.

  METHOD rba_Soitem.
  DATA : vbak        TYPE zvbak_lp,
           vbap        TYPE zvbap_lp,
           lt_messages TYPE /dmo/t_message.

  LOOP AT keys_rba ASSIGNING FIELD-SYMBOL(<keys_rbs>).
   CALL FUNCTION 'ZFM_MODIFY_SO_LP'
        EXPORTING
          vbeln       = <keys_rbs>-vbeln
          vbak        = vbak
          vbap        = vbap
          read        = abap_true
        IMPORTING
          et_messages = lt_messages.
     IF lt_messages IS INITIAL.
       INSERT VALUE #(
          source-%key = <keys_rbs>-%key
          target-%key = value #(
          vbeln = vbap-vbeln
          posnr = vbap-posnr
          )
       ) INTO TABLE association_links.
     ENDIF.
  ENDLOOP.

  ENDMETHOD.

  METHOD cba_Soitem.
  DATA: vbak TYPE ZVBAK_LP,
        vbap TYPE ZVBAP_LP,
        lt_messages TYPE /dmo/t_message.
  LOOP AT entities_cba ASSIGNING FIELD-SYMBOL(<entity_cba>).
     call FUNCTION 'ZFM_READ_SO_LP'
       EXPORTING
         vbeln       = <entity_cba>-vbeln
       IMPORTING
         vbak        = vbak
         vbap        = vbap
         et_messages = lt_messages.
      IF lt_messages is  INITIAL.
        LOOP AT <entity_cba>-%target ASSIGNING FIELD-SYMBOL(<entity>).
          CALL FUNCTION 'ZFM_MODIFY_SO_LP'
      EXPORTING
        vbeln       = <entity_cba>-vbeln
        vbak        = vbak
        vbap        = vbap
        create      = abap_true

      IMPORTING
        et_messages = lt_messages.
       IF lt_messages is INITIAL.
         INSERT VALUE #(
           %cid = <entity>-%cid
           vbeln = <entity>-vbeln
           posnr = <entity>-posnr
            ) INTO TABLE mapped-zr_soitem_lptp.
       ELSE.
        loop AT lt_messages into DATA(ls_msg).

          INSERT VALUE #( %cid = <entity>-%cid vbeln = <entity_cba>-vbeln ) INTO TABLE failed-zr_soitem_lptp.
          APPEND VALUE #(   %cid = <entity>-%cid
                            vbeln = <entity_cba>-vbeln
                            %msg  = new_message( id = ls_msg-msgid
                                              number = ls_msg-msgno
                                              v1 = ls_msg-msgv1
                                              severity = if_abap_behv_message=>severity-error
                                             ) ) TO reported-zr_soitem_lptp.
        .
        ENDLOOP.
       endif.
        ENDLOOP.
      ENDIF.
  ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZR_SOITEM_LPTP DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zr_soitem_lptp.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zr_soitem_lptp.

    METHODS read FOR READ
      IMPORTING keys FOR READ zr_soitem_lptp RESULT result.

    METHODS rba_Soheader FOR READ
      IMPORTING keys_rba FOR READ zr_soitem_lptp\_Soheader FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZR_SOITEM_LPTP IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Soheader.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZR_SOHEADER_LPTP DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZR_SOHEADER_LPTP IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
