@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root View for Truck track'
//@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_MY_TRUCKTRACK as select from ZI_MY_TRUCKTRACK
composition [0..*] of ZR_MY_TRUCKDZRIVER as _driver
{
    key Truckregnum,
    Truckmake,
    Truckpuc,
    @Semantics.systemDateTime.lastChangedAt: true
    Lastchanged,
    @Semantics.user.createdBy: true
    Createdby,
    @Semantics.user.lastChangedBy: true
    Changedby,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    locallastchanged,
    _driver
}
