@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View to Truck Driver'
@Metadata.allowExtensions: true
//@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_MY_TRUCKDRIVER as projection on ZR_MY_TRUCKDZRIVER
{
    key Truckregnum,
    key Driverid,
    Driverfirstname,
    Driverlastname,
    Driverslicence,
    locallastchanged,
    /* Associations */
    _truck : redirected to parent ZC_MY_TRUCKTRACK
}
