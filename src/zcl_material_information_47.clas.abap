CLASS zcl_material_information_47 DEFINITION
PUBLIC
FINAL
CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        matnr               TYPE matnr
      RETURNING
        VALUE(material_art) TYPE i_product-ProductType.
ENDCLASS.



CLASS zcl_material_information_47 IMPLEMENTATION.

  METHOD get_material_art.
    DATA material TYPE i_product.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE boole_d.
    production_date = sy-datum.
    SELECT SINGLE             FROM I_PRODUCT fields PRODUCTTYPE
                        WHERE PRODUCT = @MATNR INTO CORRESPONDING
    FIELDS OF @MATERIAL.
    MATERIAL_ART = MATERIAL-PRODUCTTYPE.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_information_47.
    material_info = NEW zcl_material_information_47( ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.
