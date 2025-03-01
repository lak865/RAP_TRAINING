@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SO Header root view'
//@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SOHeader_LPTP as select from ZI_SOHeader_LP
composition [1..*] of ZR_SOITEM_LPTP as _soitem
{
    key Vbeln,
    Erdat,
    Ernam,
    Vkorg,
    Vtweg,
    Spart,
    Netwr,
    Waerk,
    Lifsk,
    status,
    _soitem
}
