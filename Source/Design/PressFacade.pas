(*
  PressObjects, Fa�ade and Runtime declarations
  Copyright (C) 2007 Laserpress Ltda.

  http://www.pressobjects.org

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit PressFacade;

{$I Press.inc}

interface

uses
  Classes,
  PressSubject,
  PressAttributes,
  PressProjectModel,
  PressCodeUpdater;

type
  TPressRuntimeEnum = (reRuntime);

  TPressRuntimeAttributeMetadata = class(TPressAttributeMetadata)
  private
    FRealAttributeName: string;
  public
    function GetAttributeName: string; override;
    procedure SetAttributeName(const Value: string); override;
  end;

  TPressRuntimeQueryAttributeMetadata = class(TPressQueryAttributeMetadata)
  private
    FRealAttributeName: string;
  public
    function GetAttributeName: string; override;
    procedure SetAttributeName(const Value: string); override;
  end;

  TPressRuntimeObjectMetadata = class(TPressObjectMetadata)
  public
    function InternalAttributeMetadataClass: TPressAttributeMetadataClass; override;
  end;

  TPressRuntimeQueryMetadata = class(TPressQueryMetadata)
  public
    function InternalAttributeMetadataClass: TPressAttributeMetadataClass; override;
  end;

  TPressRuntimeObject = class(TPressObject)
  public
    class function ObjectMetadataClass: TPressObjectMetadataClass; override;
  end;

  TPressRuntimeQuery = class(TPressQuery)
  public
    class function ObjectMetadataClass: TPressObjectMetadataClass; override;
  end;

  TPressRuntimeParts = class(TPressParts)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

  TPressRuntimeReferences = class(TPressReferences)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

  TPressRuntimeBOModel = class(TPressModel)
  private
    FProject: TPressProject;
  protected
    function InternalFindAttribute(const AAttributeName: string): TPressAttributeClass; override;
    function InternalFindClass(const AClassName: string): TPressObjectClass; override;
    function InternalParentMetadataOf(AMetadata: TPressObjectMetadata): TPressObjectMetadata; override;
    property Project: TPressProject read FProject;
  public
    constructor Create(AProject: TPressProject); reintroduce;
    procedure ClearMetadatas;
  end;

  TPressRuntimeMVPModel = class(TObject)
  { TODO : Implement core MVPModel and MVPMetadata }
  private
    FProject: TPressProject;
  protected
    property Project: TPressProject read FProject;
  public
    constructor Create(AProject: TPressProject); reintroduce;
  end;

  TPressFacade = class(TObject)
  private
    FBOModel: TPressRuntimeBOModel;
    FCodeUpdater: TPressCodeUpdater;
    FMVPModel: TPressRuntimeMVPModel;
    FProject: TPressProject;
    function GetBOModel: TPressRuntimeBOModel;
    function GetCodeUpdater: TPressCodeUpdater;
    function GetMVPModel: TPressRuntimeMVPModel;
    function GetProject: TPressProject;
  protected
    property BOModel: TPressRuntimeBOModel read GetBOModel;
    property MVPModel: TPressRuntimeMVPModel read GetMVPModel;
  public
    property CodeUpdater: TPressCodeUpdater read GetCodeUpdater;
    destructor Destroy; override;
    procedure ParseProject;
    property Project: TPressProject read GetProject;
  end;

function PressDesignFacade: TPressFacade;

implementation

uses
  SysUtils,
  PressIDEIntf;

var
  _PressDesignFacade: TPressFacade;

function PressDesignFacade: TPressFacade;
begin
  Result := _PressDesignFacade;
end;

{ TPressRuntimeAttributeMetadata }

function TPressRuntimeAttributeMetadata.GetAttributeName: string;
begin
  Result := FRealAttributeName;
end;

procedure TPressRuntimeAttributeMetadata.SetAttributeName(const Value: string);
begin
  inherited;
  FRealAttributeName := Value;
end;

{ TPressRuntimeQueryAttributeMetadata }

function TPressRuntimeQueryAttributeMetadata.GetAttributeName: string;
begin
  Result := FRealAttributeName;
end;

procedure TPressRuntimeQueryAttributeMetadata.SetAttributeName(
  const Value: string);
begin
  inherited;
  FRealAttributeName := Value;
end;

{ TPressRuntimeObjectMetadata }

function TPressRuntimeObjectMetadata.InternalAttributeMetadataClass: TPressAttributeMetadataClass;
begin
  Result := TPressRuntimeAttributeMetadata;
end;

{ TPressRuntimeQueryMetadata }

function TPressRuntimeQueryMetadata.InternalAttributeMetadataClass: TPressAttributeMetadataClass;
begin
  Result := TPressRuntimeQueryAttributeMetadata;
end;

{ TPressRuntimeObject }

class function TPressRuntimeObject.ObjectMetadataClass: TPressObjectMetadataClass;
begin
  Result := TPressRuntimeObjectMetadata;
end;

{ TPressRuntimeQuery }

class function TPressRuntimeQuery.ObjectMetadataClass: TPressObjectMetadataClass;
begin
  Result := TPressRuntimeQueryMetadata;
end;

{ TPressRuntimeParts }

class function TPressRuntimeParts.ValidObjectClass: TPressObjectClass;
begin
  Result := TPressRuntimeObject;
end;

{ TPressRuntimeReferences }

class function TPressRuntimeReferences.ValidObjectClass: TPressObjectClass;
begin
  Result := TPressRuntimeObject;
end;

{ TPressRuntimeBOModel }

procedure TPressRuntimeBOModel.ClearMetadatas;
begin
  Metadatas.Clear;
  EnumMetadatas.Clear;
end;

constructor TPressRuntimeBOModel.Create(AProject: TPressProject);
begin
  inherited Create;
  FProject := AProject;
end;

function TPressRuntimeBOModel.InternalFindAttribute(
  const AAttributeName: string): TPressAttributeClass;
var
  VClass: TPressProjectClass;
begin
  Result := PressModel.FindAttribute(AAttributeName);
  if not Assigned(Result) then
  begin
    VClass := TPressProjectClass(
     Project.RootUserAttributes.ChildItems.FindItem(
     AAttributeName, TPressProjectClass));
    if Assigned(VClass) then
    begin
      while Assigned(VClass.ParentClass) do
        VClass := VClass.ParentClass;
      if SameText(VClass.ObjectClassName, TPressParts.ClassName) then
        Result := TPressRuntimeParts
      else if SameText(VClass.ObjectClassName, TPressReferences.ClassName) then
        Result := TPressRuntimeReferences
      else
        Result := PressModel.FindAttributeClass(VClass.ObjectClassName);
    end;
  end;
end;

function TPressRuntimeBOModel.InternalFindClass(
  const AClassName: string): TPressObjectClass;
var
  VClass: TPressProjectClass;
begin
  Result := PressModel.FindClass(AClassName);
  if not Assigned(Result) then
  begin
    VClass := TPressProjectClass(
     Project.RootBusinessClasses.ChildItems.FindItem(
     AClassName, TPressProjectClass));
    if Assigned(VClass) then
    begin
      while Assigned(VClass.ParentClass) do
        VClass := VClass.ParentClass;
      if SameText(VClass.ObjectClassName, TPressObject.ClassName) then
        Result := TPressRuntimeObject
      else if SameText(VClass.ObjectClassName, TPressQuery.ClassName) then
        Result := TPressRuntimeQuery
      else
        Result := PressModel.FindClass(VClass.ObjectClassName);
    end;
  end;
end;

function TPressRuntimeBOModel.InternalParentMetadataOf(
  AMetadata: TPressObjectMetadata): TPressObjectMetadata;
var
  VClass: TPressProjectClass;
begin
  VClass := TPressProjectClass(Project.RootBusinessClasses.ChildItems.FindItem(
   AMetadata.ObjectClassName, TPressProjectClass));
  if Assigned(VClass) and Assigned(VClass.ParentClass) then
    if Assigned(VClass.ParentClass.ParentClass) then
      Result := MetadataByName(VClass.ParentClass.ObjectClassName)
    else
      Result := PressModel.ClassByName(
       VClass.ParentClass.ObjectClassName).ClassMetadata
  else
    Result := PressModel.ParentMetadataOf(AMetadata);
end;

{ TPressRuntimeMVPModel }

constructor TPressRuntimeMVPModel.Create(AProject: TPressProject);
begin
  inherited Create;
  FProject := AProject;
end;

{ TPressFacade }

destructor TPressFacade.Destroy;
begin
  FCodeUpdater.Free;
  FMVPModel.Free;
  FBOModel.Free;
  FProject.Free;
  inherited;
end;

function TPressFacade.GetBOModel: TPressRuntimeBOModel;
begin
  if not Assigned(FBOModel) then
    FBOModel := TPressRuntimeBOModel.Create(Project);
  Result := FBOModel;
end;

function TPressFacade.GetCodeUpdater: TPressCodeUpdater;
begin
  if not Assigned(FCodeUpdater) then
    FCodeUpdater := TPressCodeUpdater.Create(Project);
  Result := FCodeUpdater;
end;

function TPressFacade.GetMVPModel: TPressRuntimeMVPModel;
begin
  if not Assigned(FMVPModel) then
    FMVPModel := TPressRuntimeMVPModel.Create(Project);
  Result := FMVPModel;
end;

function TPressFacade.GetProject: TPressProject;
begin
  if not Assigned(FProject) then
    FProject := TPressProject.Create;
  Result := FProject;
end;

procedure TPressFacade.ParseProject;

  procedure AddEnums(AEnums: TPressProjectItemReferences);
  var
    I: Integer;
  begin
    for I := 0 to Pred(AEnums.Count) do
      BOModel.RegisterEnumMetadata(
       TypeInfo(TPressRuntimeEnum), AEnums[I].Name);
  end;

  procedure AddClasses(AClasses: TPressProjectClassReferences);
  var
    VRegistry: TPressObjectMetadataRegistry;
    VMetadata: TPressObjectMetadata;
    VAttributeMetadata: TPressAttributeMetadata;
    VAttributeRegistry: TPressAttributeMetadataRegistry;
    I, J: Integer;
  begin
    for I := 0 to Pred(AClasses.Count) do
    begin
      VRegistry := AClasses[I] as TPressObjectMetadataRegistry;
      VRegistry.DisableChanges;
      try
        VMetadata := BOModel.RegisterMetadata(VRegistry.MetadataStr);
        VRegistry.RuntimeMetadata := VMetadata;
        VRegistry.KeyName := VMetadata.KeyName;
        VRegistry.ObjectClassName := VMetadata.ObjectClassName;
        { TODO : Fix parent class assignment }
        for J := 0 to Pred(VMetadata.AttributeMetadatas.Count) do
        begin
          VAttributeMetadata := VMetadata.AttributeMetadatas[J];
          VAttributeRegistry := VRegistry.AttributeList.Add;
          VAttributeRegistry.RuntimeMetadata := VAttributeMetadata;
          VAttributeRegistry.AttributeType := TPressAttributeTypeRegistry(
           Project.RootUserAttributes.ChildItems.FindItem(
           VAttributeMetadata.AttributeName, TPressAttributeTypeRegistry));
          VAttributeRegistry.ContainerType := TPressObjectMetadataRegistry(
           Project.RootPersistentClasses.ChildItems.FindItem(
           VAttributeMetadata.ObjectClassName, TPressObjectMetadataRegistry));
          VAttributeRegistry.DefaultValue := VAttributeMetadata.DefaultValue;
          VAttributeRegistry.EditMask := VAttributeMetadata.EditMask;
          VAttributeRegistry.IsPersistent := VAttributeMetadata.IsPersistent;
          VAttributeRegistry.Name := VAttributeMetadata.Name;
          VAttributeRegistry.PersistentName :=
           VAttributeMetadata.PersistentName;
          VAttributeRegistry.Size := VAttributeMetadata.Size;
        end;
      finally
        VRegistry.EnableChanges;
      end;
      AddClasses(VRegistry.ChildItems);
    end;
  end;

var
  VModuleNames: TStrings;
  VModuleIntf: IPressIDEModule;
  I: Integer;
begin
  BOModel.ClearMetadatas;
  CodeUpdater.ClearProjectModules;
  Project.DisableChanges;
  VModuleNames := TStringList.Create;
  try
    PressIDEInterface.ProjectModuleNames(VModuleNames);
    for I := 0 to Pred(VModuleNames.Count) do
    begin
      VModuleIntf := PressIDEInterface.FindModule(VModuleNames[I]);
      if Assigned(VModuleIntf) then
        CodeUpdater.ParseModule(VModuleIntf);
    end;
    AddEnums(Project.RootUserEnumerations.ChildItems);
    AddClasses(Project.RootBusinessClasses.ChildItems);
  finally
    VModuleNames.Free;
    Project.EnableChanges;
  end;
end;

initialization
  _PressDesignFacade := TPressFacade.Create;

finalization
  _PressDesignFacade.Free;

end.
