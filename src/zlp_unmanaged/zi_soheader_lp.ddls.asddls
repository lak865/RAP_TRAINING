@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header'
//@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SOHeader_LP as select from zvbak_lp
{
    key vbeln as Vbeln,
    erdat as Erdat,
    ernam as Ernam,
    vkorg as Vkorg,
    vtweg as Vtweg,
    spart as Spart,
    @Semantics.amount.currencyCode : 'waerk'
    netwr as Netwr,
    waerk as Waerk,
    lifsk as Lifsk,
    status as status
}
