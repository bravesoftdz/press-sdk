(*
  PressObjects, Consts unit
  Copyright (C) 2006-2007 Laserpress Ltda.

  http://www.pressobjects.org

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit PressConsts;

{$I Press.inc}

interface

const
  SPressMaxItemCount = 100;
  SPressBrackets = '()';
  SPressAttributePrefix = '_';
  SPressAttributeSeparator = '.';
  SPressIdentifierSeparator = '_';
  SPressDataSeparator = ':';
  SPressFieldDelimiter = ';';
  SPressLineBreak = #10;
  SPressTrueString = 'True';
  SPressFalseString = 'False';
  SPressNilString = 'nil';
  SPressIdString = 'Id';
  SPressClassIdString = 'ClassId';
  SPressLinkIdString = 'Id';
  SPressParentString = 'Parent';
  SPressChildString = 'Child';
  SPressUpdateCountString = 'UpdateCount';
  SPressPrimaryKeyNamePrefix = 'PK_';
  SPressForeignKeyNamePrefix = 'FK_';
  SPressUniqueKeyNamePrefix = 'UK_';
  SPressIndexNamePrefix = 'IDX_';
  SPressTableAliasPrefix = 't_';
  SPressPersistentIdParamString = 'PressPersistId';
  SPressCalcString = 'Calc';
  SPressQueryItemsString = 'QueryItems';
  SPressReportNativeValueSuffix = 'Value';
  SPressReportDisplayTextSuffix = 'DisplayText';

resourcestring
  SAmbiguousClass = 'Ambiguidade entre as classes ''%s'' e ''%s''';
  SAttributeAccessError = 'N�o � poss�vel acessar o atributo %s(''%s'') como %s';
  SAttributeConversionError = 'Erro ao converter valor para o atributo %s(''%s''):' + #10 + '%s';
  SAttributeIsNotItem = 'O atributo %s(''%s'') n�o � Part ou Reference';
  SAttributeIsNotValue = 'O atributo %s(''%s'') n�o � Value';
  SAttributeNotFound = 'O atributo %s(''%s'') n�o foi encontrado';
  SAttributeTypeNotFound = 'O atributo %s n�o foi encontrado';
  SCannotChangeOPFBroker = 'N�o � poss�vel alterar o Broker de acesso a dados';
  SClassIsNotPersistent = 'Classe ''%s'' n�o � persistente';
  SClassNotFound = 'Classe %s n�o encontrada';
  SColumnDataParseError = 'Erro ao interpretar dados da coluna %s(''%s''): "%s"';
  SComponentIsNotAControl = 'O componente %s(''%s'') n�o � um controle';
  SComponentNotFound = 'O componente %s(''%s'') n�o foi encontrado';
  SDialogClassIsAssigned = 'Classe do objeto de di�logo j� est� associado';
  SDisplayNamesAlreadyAssigned = 'DisplayNames j� foi associado';
  SEnumItemNotFound = 'Enumeration ''%s'' n�o encontrado';
  SEnumMetadataNotFound = 'Enumeration metadata %s n�o encontrado';
  SEnumOutOfBounds = 'Enumeration ''%s'' fora do limite (%d)';
  SFieldNotFound = 'Campo ''%s'' n�o foi encontrado';
  SInstanceNotFound = 'Instance not found: %s(%s)';
  SInvalidAttributeClass = 'O atributo %s(''%s'') requer objetos da classe %s';
  SInvalidAttributeValue = 'Valor ''%s'' inv�lido para %s(''%s'')';
  SInvalidClassInheritance = 'Classe ''%s'' n�o � decendente de ''%s''';
  SMaxItemCountReached = 'A consulta retornou %d itens, o limite � %d';
  SMetadataNotFound = 'Metadata ''%s'' n�o encontrado';
  SMetadataParseError = 'Erro ao interpretar metadata: "(%d,%d) %s"' + SPressLineBreak + '"%s"';
  SNoLoggedUser = 'N�o existe usu�rio logado';
  SNoReferenceOrDataAccess = 'N�o existe refer�ncia ou DAO';
  SPathReferencesNil = 'O caminho %s(''%s'') possui atributo(s) Reference apontando para nil';
  SPersistentClassNotFound = 'Classe persistente %s n�o encontrada';
  SSingletonClassNotFound = 'Classe Singleton %s n�o encontrada';
  SStringLengthOutOfBounds = 'String muito grande';
  SStringOverflow = 'String overflow: %s(%s)';
  STokenExpected = '''%s'' esperado, mas ''%s'' foi encontrado';
  STokenLengthOutOfBounds = 'Token muito grande';
  SUnassignedAttributeType = 'Tipo de atributo n�o associado para %s(''%s'')';
  SUnassignedDatabase = 'Conector do banco de dados n�o foi associado';
  SUnassignedItemObjectClass = 'Classe de neg�cio dos itens da Query ''%s'' n�o est� associado';
  SUnassignedMainForm = 'Formul�rio principal n�o est� associado';
  SUnassignedMainPresenter = 'Presenter principal n�o est� associado';
  SUnassignedModel = 'Model n�o est� associado';
  SUnassignedPersistenceConnector = 'Conector de persist�ncia n�o foi associado';
  SUnassignedPersistenceService = 'Servi�o de persist�ncia n�o foi associado ou n�o � do PressObjects';
  SUnassignedServiceType = 'Nenhum servi�o %s foi associado ou registrado';
  SUnassignedSubject = 'Subject n�o foi associado';
  SUnexpectedEof = 'Final de arquivo inesperado';
  SUnexpectedMVPClassParam = 'Classe MVP %s inicializada com par�metros inesperados';
  SUnsupportedAttribute = 'O atributo %s(''%s'') n�o � suportado';
  SUnsupportedAttributeType = 'O tipo de atributo %s n�o � suportado';
  SUnsupportedComponent = 'O componente %s n�o � suportado';
  SUnsupportedControl = 'O controle %s(''%s'') n�o � suportado';
  SUnsupportedDisplayNames = 'DisplayNames n�o � suportado para o atributo %s(''%s.%s'')';
  SUnsupportedFeature = 'Feature %s n�o � suportada';
  SUnsupportedFieldType = 'O tipo de campo ''%s'' n�o � suportado';
  SUnsupportedModel = 'Model %s n�o � suportado por %s';
  SUnsupportedObject = 'Nenhuma classe %s suporta objetos %s';
  SViewAccessError = 'N�o � poss�vel acessar a view %s(''%s'') como %s';

  SConnectionManagerCaption = 'Conector';

  SPressTodayCommand = 'Hoje';
  SPressLoadPictureCommand = 'Adicionar figura';
  SPressRemovePictureCommand = 'Remover figura';
  SPressIncludeObjectCommand = 'Cadastrar novo item';
  SPressAddItemCommand = 'Adicionar item';
  SPressSelectItemCommand = 'Selecionar itens';
  SPressEditItemCommand = 'Alterar item';
  SPressRemoveItemCommand = 'Remover item';
  SPressSaveFormCommand = 'Salvar';
  SPressCancelFormCommand = 'Cancelar';
  SPressCloseFormCommand = 'Fechar';
  SPressExecuteQueryCommand = 'Executar';
  SPressAssignSelectionQueryCommand = 'Selecionar';
  SPressSelectAllCommand = 'Selecionar tudo';
  SPressSelectNoneCommand = 'Remover sele��o';
  SPressSelectCurrentCommand = 'Selecionar/remover atual';
  SPressSelectInvertCommand = 'Inverter sele��o';
  SPressSortByCommand = 'Ordernar por ''%s''';

  SPressAttributeNameMsg = 'attribute name';
  SPressBooleanValueMsg = 'Valor l�gico';
  SPressClassNameMsg = 'class name';
  SPressEofMsg = 'Final de arquivo';
  SPressIdentifierMsg = 'Identificador';
  SPressIntegerValueMsg = 'Inteiro';
  SPressLineBreakMsg = 'Quebra de linha';
  SPressNumberValueMsg = 'N�mero';
  SPressPropertyNameMsg = 'property name';
  SPressReportErrorMsg = ' ##Erro## ';
  SPressStringDelimiterMsg = 'Delimitador de string';
  SPressStringValueMsg = 'String';

  SPressCancelChangesDialog = 'Cancelar altera��es?';
  SPressConfirmRemoveOneItemDialog = 'Um item selecionado. Confirma remo��o?';
  SPressConfirmRemoveItemsDialog = '%d itens selecionados. Confirma remo��o?';
  SPressSaveChangesDialog = 'Gravar altera��es?';

implementation

end.
