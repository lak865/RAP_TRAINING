//@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view of Truch Driver'
//@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_LP_TRUCKDRIVER as select from zlp_truckderiver
{
    key truckregnum as Truckregnum,
    key driverid as Driverid,
    driverfirstname as Driverfirstname,
    driverlastname as Driverlastname,
    driverslicence as Driverslicence
}
