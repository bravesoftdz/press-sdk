(*
  PressObjects, Log Classes
  Copyright (C) 2006 Laserpress Ltda.

  http://www.pressobjects.org

  See the file LICENSE.txt, included in this distribution,
  for details about the copyright.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*)

unit PressLog;

{$I Press.inc}

interface

uses
  Classes,
  PressClasses;

resourcestring
  { TODO : Move to PressConsts }
  SLogCreating =                  'Creating object  %:-32s';
  SLogCreatingEvent =             'Creating event   %:-32s';
  SLogDestroying =                'Destroying       %:-32s';
  SLogQueueingNotificationEvent = 'Queueing notific %:-32s';
  SLogNotifyingEvent =            'Notifying event  %:-32s';
  SLogReleasingEvent =            'Releasing event  %:-32s';

type
  TPressLogClass = class of TPressLog;

  TPressLog = class(TPressSingleton)
  { TODO : Create an abstract PressCustomLog;
    Refactor parameters to array of const }
  protected
    function ArrayToString(const AParams: array of TObject): string;
    function FormatClassName(const AMsg: string; AObj: TObject): string;
    function InternalBuildMsg(Sender: TObject; const AMsg: string; const AParams: array of TObject): string; virtual;
  public
    procedure RegisterMsg(Sender: TObject; const AMsg: string; const AParams: array of TObject); virtual;
  end;

var
  PressLogClass: TPressLogClass;

procedure PressLogMsg(Sender: TObject; const AMsg: string); overload;
procedure PressLogMsg(Sender: TObject; const AMsg: string; const AParams: array of TObject); overload;

implementation

uses
  SysUtils,
  PressConsts,
  PressCompatibility;

var
  _PressLogInstance: TPressLog;

function PressLogInstance: TPressLog;
begin
  if not Assigned(_PressLogInstance) then
  begin
    if not Assigned(PressLogClass) then
      PressLogClass := TPressLog;
    _PressLogInstance := PressLogClass.Instance;
  end;
  Result := _PressLogInstance;
end;

procedure PressLogMsg(Sender: TObject; const AMsg: string);
begin
  PressLogInstance.RegisterMsg(Sender, AMsg, []);
end;

procedure PressLogMsg(Sender: TObject; const AMsg: string; const AParams: array of TObject);
begin
  PressLogInstance.RegisterMsg(Sender, AMsg, AParams);
end;

{ TPressLog }

function TPressLog.ArrayToString(const AParams: array of TObject): string;
const
  Comma = ', ';
var
  I: Integer;
begin
  Result := '';
  for I := Low(AParams) to High(AParams) do
  begin
    if Assigned(AParams[I]) then
      Result := Result + AParams[I].ClassName + Comma
    else
      Result := Result + SPressNilString + Comma;
  end;
  if Length(Result) >= Length(Comma) then
    SetLength(Result, Length(Result) - Length(Comma));
end;

function TPressLog.FormatClassName(const AMsg: string; AObj: TObject): string;
const
  SClassNameFormat = '[%s] %s';
begin
  if Assigned(AObj) then
    Result := Format(SClassNameFormat, [AObj.ClassName, AMsg])
  else
    Result := Format(SClassNameFormat, [SPressNilString, AMsg]);
end;

function TPressLog.InternalBuildMsg(
  Sender: TObject; const AMsg: string; const AParams: array of TObject): string;
const
  SLogFormat = '[%s] %s (%s)';
begin
  Result := Format(SLogFormat, [
   FormatDateTime('mmm/dd hh:nn:ss', Now),
   FormatClassName(AMsg, Sender),
   ArrayToString(AParams)]);
  OutputDebugString(Result);
end;

procedure TPressLog.RegisterMsg(
  Sender: TObject; const AMsg: string; const AParams: array of TObject);
begin
  InternalBuildMsg(Sender, AMsg, AParams);
end;

end.
