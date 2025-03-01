@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Conjuction View'
@Metadata.allowExtensions: true
//@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_LP_TRUCK as projection on ZR_LP_TRUCK
{
    key Truckregnum,
    Truckmake,
    Truckpuc,
    Lastchanged,
    Createdby,
    Changedby,
    _Driver : redirected to composition child ZC_LP_TRUCKDRIVER
}
