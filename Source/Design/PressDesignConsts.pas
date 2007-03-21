(*
  PressObjects, Design Consts unit
  Copyright (C) 2007 Laserpress Ltda.

  http://www.pressobjects.org

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit PressDesignConsts;

{$I Press.inc}

interface

const
  SPressAttributeNameMethodName = 'AttributeName';
  SPressMetadataMethodName = 'InternalMetadataStr';
  SPressRegisterEnumMethodName = 'RegisterEnumMetadata';
  SPressResultStr = 'Result';

resourcestring
  SClassNameAndMetadataMismatch = 'Metadata do m�todo %s.' + SPressMetadataMethodName + ' n�o percente � classe %0:s';
  SInterfaceAlreadyInstalled = 'Interface %s j� est� instalada';
  SUninstalledIDEInterface = 'Nenhuma interface para a IDE foi instalada';

  SPressDataTypeDeclarationMsg = 'Declara��o de tipo de dado';
  SPressProcMethodDeclMsg = 'Declara��o de procedimento, fun��o ou m�todo';
  SPressStringConstMsg = 'Constante string';

  SPressProjectBusinessClasses = 'Business classes';
  SPressProjectPersistentClasses = 'Persistent classes';
  SPressProjectQueryClasses = 'Query classes';
  SPressProjectMVPClasses = 'MVP classes';
  SPressProjectModels = 'Models';
  SPressProjectViews = 'Views';
  SPressProjectPresenters = 'Presenters';
  SPressProjectCommands = 'Commands';
  SPressProjectInteractors = 'Interactors';
  SPressProjectRegistries = 'Registries';
  SPressProjectUserAttributes = 'User attributes';
  SPressProjectUserEnumerations = 'User enumerations';
  SPressProjectUserOIDGenerators = 'User OID generators';
  SPressProjectOtherClasses = 'Other classes';
  SPressProjectForms = 'Forms';
  SPressProjectFrames = 'Frames';
  SPressProjectUnknown = 'Unknown';

implementation

end.
