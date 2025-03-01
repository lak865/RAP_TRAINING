@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root view of Truck driver'
//@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_LP_TRUCKDRIVER as select from ZI_LP_TRUCKDRIVER
association to parent ZR_LP_TRUCK as _truck on $projection.Truckregnum = _truck.Truckregnum
{
    key Truckregnum,
    key Driverid,
    Driverfirstname,
    Driverlastname,
    Driverslicence,
    
    _truck
}
