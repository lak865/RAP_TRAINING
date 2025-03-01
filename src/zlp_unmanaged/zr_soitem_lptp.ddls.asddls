@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SO ITem root view'
//@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_SOITEM_LPTP as select from ZI_SOITEM_LP
association to parent ZR_SOHeader_LPTP as _soheader on $projection.Vbeln = _soheader.Vbeln
{
    key Vbeln,
    key Posnr,
    Matnr,
    Kwmeng,
    Vrkme,
    
    _soheader
}
