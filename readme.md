MyHomeLibFMX
============

3.07.2019

FireMonkey clone [MyHomeLib](https://github.com/OleksiyPenkov/MyHomeLib)

Компоненты
----------

1. Generic.Collections - установил из https://github.com/maciej-izak/generics.collections
2. Indy 10 - ставим из Download Manager
3. VirtualTrees - есть в поставке нужно скомпилировать и подключить
4. Vcl.Themes, Vcl.Styles - вроде бы не поддерживаются напрямую в Lazarus
6. IMouse
7. TBaloonHint - всплывающая подсказка в форме, в Lazarus работает через свойства формы

Сложности
---------

Закоментировать модули, специфичные для Windows

//ShlObj,
//ShellAPI,
//Windows,
//IOUtils,
//WinInet

Сначала нужно подтащить компоненты.

Конвертация юникода из dfm - русские буквы закодированы (#1111).

**Нужно менять очень много в коде** - есть смысл попробовать сначала конвертнуть в RAD Studio.
Вполне возможно будет меньше проблем, чем с Lazarus.

