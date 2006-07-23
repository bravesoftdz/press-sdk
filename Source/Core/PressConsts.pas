(*
  PressObjects, Consts unit
  Copyright (C) 2006 Laserpress Ltda.

  http://www.pressobjects.org

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
*)

unit PressConsts;

interface

{$I Press.inc}

const
  SPressBrackets = '()';
  SPressAttributePrefix = '_';
  SPressAttributeSeparator = '.';
  SPressFieldDelimiter = ';';
  SPressLineBreak = #10;
  SPressTrueString = 'True';
  SPressFalseString = 'False';
  SPressNilString = 'nil';
  SPressIdString = 'Id';
  SPressIdentifierString = 'Identifier';
  SPressQueryItemsString = 'QueryItems';

resourcestring
  SAmbiguousConcreteClass = 'Classe concreta amb�gua (%s e %s) para o objeto %s';
  SAttributeAccessError = 'N�o � poss�vel acessar o atributo %s(''%s'') como %s';
  SAttributeConversionError = 'Erro ao converter valor para o atributo %s(''%s''):' + #10 + '%s';
  SAttributeNotFound = 'O atributo %s(''%s'') n�o foi encontrado';
  SAttributeNotSupported = 'O atributo %s(''%s'') n�o � suportado';
  SClassNotFound = 'Classe %s n�o encontrada';
  SComponentIsNotAControl = 'O componente %s(''%s'') n�o � um controle';
  SComponentNotFound = 'O componente %s(''%s'') n�o foi encontrado';
  SComponentNotSupported = 'O componente %s n�o � suportado';
  SControlNotSupported = 'O controle %s(''%s'') n�o � suportado';
  SDialogClassIsAssigned = 'Classe do objeto de di�logo j� est� associado';
  SDisplayNameMissing = 'Falta DisplayName para o controle %s(''%s'')';
  SDisplayNameNotSupported = 'DisplayName n�o � suportado para o atributo %s(''%s.%s'')';
  SEnumMetadataNotFound = 'Enumeration metadata %s n�o encontrado';
  SInstanceNotFound = 'Instance not found: %s(%s)';
  SInvalidAttributeClass = 'O atributo %s(''%s'') requer objetos da classe %s';
  SInvalidAttributeType = 'Tipo inv�lido para o atributo %s (%s)';
  SInvalidAttributeValue = 'Valor ''%s'' inv�lido para %s(''%s'')';
  SMainPresenterClassIsAssigned = 'Classe do presenter principal j� est� associada';
  SMainPresenterIsInitialized = 'Presenter principal j� est� inicializado';
  SMetadataNotFound = 'Metadata da classe %s n�o foi encontrada';
  SMetadataParseError = 'Erro ao interpretar metadata: "(%d,%d) %s"' + SPressLineBreak + '"%s"';
  SNonRelatedClasses = 'Classes %s e %s n�o s�o relacionadas';
  SNoReference = 'N�o existe refer�ncia';
  SObjectClassNotSupported = 'A classe %s n�o � suportada';
  SObjectNotSupported = 'Nenhuma classe %s suporta objetos %s';
  SObjectStoreNotAssigned = 'ObjectStore n�o associado';
  SPersistenceBrokerClassIsAssigned = 'Classe do broker de persist�ncia j� foi associado';
  SPersistentClassNotFound = 'Classe persistente %s n�o encontrada';
  SSubjectNotAssigned = 'Subject n�o foi associado';
  STokenExpected = '''%s'' esperado, mas ''%s'' foi encontrado';
  SUnassignedCandidateClasses = 'Classes candidata n�o est�o associadas';
  SUnassignedTargetClass = 'Classe alvo n�o est� associada';
  SUnassignedConnector = 'Conector n�o est� associado';
  SUnassignedMainForm = 'Formul�rio principal n�o est� associado';
  SUnassignedModel = 'Model n�o est� associado';
  SUnassignedPersistenceBrokerClass = 'Classe do broker de persist�ncia n�o foi associado';
  SUnassignedPersistenceConnector = 'Conector de persist�ncia n�o foi associado';
  SUndefinedSelection = 'Selection n�o definido';
  SUnexpectedEof = 'Fim de arquivo inesperado';
  SUnexpectedMVPClassParam = 'Classe MVP %s inicializada com par�metros inesperados';
  SUnsupportedAttributeType = 'O tipo de atributo %s n�o � suportado';
  SUnsupportedModel = 'Model %s n�o � suportado por %s';

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

  SPressCancelChangesDialog = 'Cancelar altera��es?';
  SPressConfirmRemoveOneItemDialog = 'Um item selecionado. Confirma remo��o?';
  SPressConfirmRemoveItemsDialog = '%d itens selecionados. Confirma remo��o?';
  SPressSaveChangesDialog = 'Gravar altera��es?';

implementation

end.
