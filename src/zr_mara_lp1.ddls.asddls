@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_MARA_LP1
  as select from ZMARA_LP1 as MARA
{
  key matnr as Matnr,
  mtart as Mtart,
  matkl as Matkl,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  meins as Meins,
  ersda as Ersda,
  ernam as Ernam,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchanged as Lastchanged,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.user.lastChangedBy: true
  changedby as Changedby
  
}
