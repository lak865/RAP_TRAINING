@AbapCatalog.sqlViewName: 'ZLP_TRUCK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View'
//@Metadata.ignorePropagatedAnnotations: true
define view ZI_LP_TRUCK as select from zlp_triuck
{
    key truckregnum as Truckregnum,
    truckmake as Truckmake,
    truckpuc as Truckpuc,
    lastchanged as Lastchanged,
    createdby as Createdby,
    changedby as Changedby
}
