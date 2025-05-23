INTERFACE zif_rest PUBLIC.
* Auto generated by https://github.com/abap-openapi/abap-openapi
* Title: post
* Version: 1

  CONSTANTS base_path TYPE string VALUE ''.

* Input
  TYPES: BEGIN OF input,
           key  TYPE string,
           name TYPE string,
         END OF input.

  TYPES: BEGIN OF r__post,
           code   TYPE i,
           reason TYPE string,
         END OF r__post.
  METHODS _post
    IMPORTING
      body          TYPE input
    RETURNING
      VALUE(return) TYPE r__post
    RAISING
      cx_static_check.
ENDINTERFACE.
