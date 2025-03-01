@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ROOT VIEW OF TRUCK'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_LP_TRUCK as select from ZI_LP_TRUCK
composition [0..*] of ZR_LP_TRUCKDRIVER as _Driver
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
    _Driver
}
