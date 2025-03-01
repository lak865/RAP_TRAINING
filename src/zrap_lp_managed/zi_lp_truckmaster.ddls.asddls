@AbapCatalog.sqlViewName: 'ZLP_TRUCKMASTER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TRuck Master Data'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_LP_TRUCKMASTER as select from zlp_truck_track
{
    key truckregnum as Truckregnum,
    truckmake as Truckmake,
    truckpuc as Truckpuc,
    lastchanged as Lastchanged,
    createdby as Createdby,
    changedby as Changedby
}
