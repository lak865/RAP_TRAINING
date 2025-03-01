@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for Truck Driver'
//@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_MY_TRUCKDRIVER as select from zmy_truckdriver
{
    key truckregnum as Truckregnum,
    key driverid as Driverid,
    driverfirstname as Driverfirstname,
    driverlastname as Driverlastname,
    driverslicence as Driverslicence,
    locallastchanged as locallastchanged
}
