== PhoneBook
============

:: Delphi

Para executar o Demo Agenda Telef�nica, abra e altere o arquivo
principal do projeto, incluindo um broker do InstantObjects.

:: Delphi e Lazarus

Para executar o projeto sem um broker de persist�ncia, remova
todas as refer�ncias ao InstantObjects dentro do arquivo
principal do projeto:

1. PressInstantObjectsBroker
2. IOModel
3. {$R *.mdr}

Note que sem o Broker, executar a Query e abrir o Combo de
atributos Reference (City e Contact) causar� uma exce��o.
