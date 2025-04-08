CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS test FOR TESTING RAISING cx_static_check.
    METHODS check_postgres RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD test.
    zcl_application=>run( 'http://localhost:8080' ).

    check_postgres( ).
  ENDMETHOD.

  METHOD check_postgres.

    DATA lo_stmt   TYPE REF TO cl_sql_statement.
    DATA lv_sql    TYPE string.
    DATA lo_result TYPE REF TO cl_sql_result_set.
    DATA lv_rows   TYPE i.

    lo_stmt = cl_sql_connection=>get_abap_connection( 'PG' )->create_statement( ).

    lv_sql = |select * from values|.
    lo_result = lo_stmt->execute_query( lv_sql ).

    lv_rows = lo_result->next( ).

    cl_abap_unit_assert=>assert_number_between(
      lower  = 1
      upper  = 1000
      number = lv_rows ).

  ENDMETHOD.

ENDCLASS.
