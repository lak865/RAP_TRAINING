@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view to Truck Track'
@Metadata.allowExtensions: true
//@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_MY_TRUCKTRACK as projection on ZR_MY_TRUCKTRACK
{
    key Truckregnum,
    Truckmake,
    Truckpuc,
    Lastchanged,
    Createdby,
    Changedby,
    locallastchanged,
    /* Associations */
    _driver : redirected to composition child ZC_MY_TRUCKDRIVER
}
