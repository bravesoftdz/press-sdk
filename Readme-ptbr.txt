PressObjects SDK, Vers�o 0.1.1
Copyright (C) 2006-2007 Laserpress Ltda.

http://www.pressobjects.org

Vide arquivo LICENSE.txt, incluso nesta distribui��o, para detalhes do
copyright.


INTRODU��O
==========

PressObjects � um kit de desenvolvimento de software (SDK) composto por diversos
frameworks que auxiliam a constru��o de aplica��es orientadas a objetos. O
c�digo � compat�vel com os compiladores Delphi-Win32 e Free Pascal.


FRAMEWORKS E RECURSOS
=====================

Apresenta��o de objetos de neg�cio
----------------------------------
Atrav�s do padr�o MVP, objetos de neg�cio s�o apresentados em componentes
visuais simples, tal como TEdit e TComboBox. H� diversas vantagens nesta
abordagem, tal como: separar totalmente as regras de neg�cio e de apresenta��o
da implementa��o do formul�rio; permitir o uso de outros componentes que o
framework n�o conhece; replicar c�digo e comportamento apenas registrando
models, views ou interactors customizados, etc.

Persist�ncia
------------
Objetos de neg�cio s�o lidos e armazenados atrav�s da interface IPressDAO,
que pode ser implementada por uma classe de persist�ncia (OPF) ou um webservice.

Notifica��o
-----------
O framework de notifica��o do PressObjects � baseado no padr�o
publish-subscriber, que � um padr�o mais flex�vel do que o observer. Algumas de
suas caracter�sticas: observadores podem escutar um ou mais eventos de um objeto
espec�fico ou de qualquer objeto, bem como um objeto pode gerar tipos de eventos
diferentes a partir da mesma inst�ncia; eventos podem ser enfileirados para
serem processados quando a aplica��o entrar em modo Idle; eventos s�o objetos,
portanto podem transportar dados; classes de eventos podem ser declaradas em uma
unidade diferente daquela em que suas inst�ncias s�o criadas e disparadas,
diminuindo o acoplamento.

Relat�rios
----------
Todo o metadado das classes de neg�cio s�o transformados em campos e containeres
atrav�s do framework de relat�rios. Desta forma, qualquer formul�rio de consulta
de dados ou qualquer pesquisa pode ser transformada em um relat�rio pelo pr�prio
usu�rio da aplica��o. Tal relat�rio ser� disponibilizado para todos os demais
usu�rios sem que seja necess�rio recompilar ou mesmo fechar e reabrir a
aplica��o.

Modelagem visual (em desenvolvimento)
----------------
Classes de neg�cio, classes MVP, classes para relat�rios entre outras s�o
criadas atrav�s do Project Explorer do PressObjects. As informa��es s�o gravadas
apenas nos fontes do projeto, desta forma atualiza��es feitas em c�digo s�o
vis�veis no Project Explorer e vice-versa.

Integra��o
----------
Formul�rios conhecem seus objetos de neg�cio, controles visuais conhecem seus
atributos. Desta forma configurar controles complexos, tal como um grid, � uma
quest�o de informar ao controle qual � o atributo ao qual ele se refere. A
partir deste ponto o controle visual estar� apto a encontrar classes de
formul�rios, instanci�-los e apresent�los sem que seja necess�ria qualquer outra
interven��o do programador.


INSTALA��O
==========

Vide ($Press)/Docs/Install-ptbr.txt


PRIMEIROS PASSOS
================

Para uma vis�o geral:
($Press)/Docs/Overview-ptbr.txt

Para construir uma nova aplica��o:
($Press)/Docs/CreatingApplication-ptbr.txt

Consulte o aplicativo demonstra��o:
($Press)/Demos/


SUPORTE, BUGS, CONTATO
======================

Vide informa��es no site do projeto:
http://br.pressobjects.org
