CLASS zcl_application DEFINITION PUBLIC.
  PUBLIC SECTION.
    CLASS-METHODS run
      IMPORTING
        iv_url TYPE string
      RAISING
        cx_static_check.
ENDCLASS.

CLASS zcl_application IMPLEMENTATION.
  METHOD run.

    DATA li_rest TYPE REF TO zif_rest.
    DATA li_http TYPE REF TO if_http_client.
    DATA ls_body TYPE zif_rest=>input.

    cl_http_client=>create_by_url(
      EXPORTING
        url    = iv_url
      IMPORTING
        client = li_http ).

    CREATE OBJECT li_rest TYPE zcl_rest
      EXPORTING
        ii_client = li_http.

    ls_body-key = 'hello'.
    ls_body-name = 'world'.
    li_rest->_post( ls_body ).

  ENDMETHOD.
ENDCLASS.
