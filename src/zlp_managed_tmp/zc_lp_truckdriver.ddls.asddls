@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption of Truck driver'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_LP_TRUCKDRIVER as projection on ZR_LP_TRUCKDRIVER
{
    key Truckregnum,
    key Driverid,
    Driverfirstname,
    Driverlastname,
    Driverslicence,
    
    _truck : redirected to parent ZC_LP_TRUCK
}
