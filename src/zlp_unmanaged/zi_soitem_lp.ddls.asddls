@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item'
//@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SOITEM_LP as select from ZVBAP_LP
{
    key vbeln as Vbeln,
    key posnr as Posnr,
    matnr as Matnr,
    @Semantics.quantity.unitOfMeasure : 'vrkme'
    kwmeng as Kwmeng,
    vrkme as Vrkme
}
