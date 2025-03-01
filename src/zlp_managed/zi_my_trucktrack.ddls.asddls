@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for Truck Track'
//@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_MY_TRUCKTRACK as select from zmy_trucktrack
{
    key truckregnum as Truckregnum,
    truckmake as Truckmake,
    truckpuc as Truckpuc,
    lastchanged as Lastchanged,
    createdby as Createdby,
    changedby as Changedby,
    locallastchanged as locallastchanged
  
}
