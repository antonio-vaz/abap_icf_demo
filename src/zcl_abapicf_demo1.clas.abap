class ZCL_ABAPICF_DEMO1 definition
  public
  inheriting from CL_REST_HTTP_HANDLER
  final
  create public .

public section.

  methods IF_REST_APPLICATION~GET_ROOT_HANDLER
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ABAPICF_DEMO1 IMPLEMENTATION.


  method IF_REST_APPLICATION~GET_ROOT_HANDLER.
    DATA(handler) = new cl_rest_router( ).

    handler->attach( iv_template = ''  iv_handler_class = 'ZCL_ABAPICF_RESOURCE_ROOT' ).
    handler->attach( iv_template = '/'  iv_handler_class = 'ZCL_ABAPICF_RESOURCE_ROOT' ).

    ro_root_handler = handler.
  endmethod.
ENDCLASS.
