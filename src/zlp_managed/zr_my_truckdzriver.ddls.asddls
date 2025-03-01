@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root view for Truck Driver'
//@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_MY_TRUCKDZRIVER as select from ZI_MY_TRUCKDRIVER
association to parent ZR_MY_TRUCKTRACK as _truck on $projection.Truckregnum = _truck.Truckregnum
{
    key Truckregnum,
    key Driverid,
    Driverfirstname,
    Driverlastname,
    Driverslicence,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    locallastchanged,
    _truck
}
