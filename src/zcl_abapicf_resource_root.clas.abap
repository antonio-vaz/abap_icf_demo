class ZCL_ABAPICF_RESOURCE_ROOT definition
  public
  inheriting from CL_REST_RESOURCE
  final
  create public .

public section.

  methods IF_REST_RESOURCE~GET
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ABAPICF_RESOURCE_ROOT IMPLEMENTATION.


  METHOD if_rest_resource~get.

    TYPES:
      BEGIN OF payload,
        user TYPE string,
        LocAl_abap_day type string,
        LocAl_abap_time type string,
      END OF payload.

    " **********************************************************************
    " fetch data
    DATA payload TYPE payload.
    payload-user = sy-uname.
    payload-local_abap_day = sy-datum.
    payload-local_abap_time = sy-uzeit.

    " **********************************************************************
    " build body payload json string
    DATA(json_output) = /ui2/cl_json=>serialize( EXPORTING data = payload pretty_name = /ui2/cl_json=>pretty_mode-low_case ).

    " **********************************************************************
    " build body payload
    DATA(entity) = mo_response->create_entity( ).
    entity->set_content_type( iv_media_type = if_rest_media_type=>gc_appl_json ).
    entity->set_string_data( json_output ).

    " **********************************************************************
    " Custom headers
    " entity->set_header_field( exporting iv_name = 'ThisIsMyHeader' iv_value = 'This is a dummy value' ).


    " **********************************************************************
    " return http status code 200
    mo_response->set_status( cl_rest_status_code=>gc_success_ok ).
  ENDMETHOD.
ENDCLASS.
