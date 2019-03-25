#Include <Log.au3>
#Include <Misc.au3>

AutoItSetOption ('MustDeclareVars', 100)

Global $hLog, $Time, $hWnd

$hLog = _Log_Open(@ScriptDir & '\CO_L3.log', '');открыть файл для записи логов
_Log_Report($hLog, 'Запуск скрипта', 1)	;вывод времени начала работы скрипта в файл

_Log_Report($hLog, 'Попытка запуска CO_L1.exe', 2);вывод времени попытки запустить 1ю программу в файл
Run("C:\Users\Антон\source\repos\CO_L1_3\Release\MEH.exe");попытка запустить 1ю прогамму

$hWnd = WinWaitActive("CO_L1_3", "", 3);если окно 1й программы еще не активно, ждем 3 с
If Not $hWnd Then	;если за 3с. окно 1й программы не стало активным
	_Log_Report($hLog, 'Ошибка! Не удалось запустить CO_L1.exe', 4);вывод сообщения с соотв. ошибкой в файл
	_Log_Report($hLog, 'Выход', 7)	;вывод времени завершения работы скрипта в файл
	_Log_Close($hLog) ;закрытие файла логов
Else
    _Log_Report($hLog, 'Успешный запуск CO_L1.exe', 3) ;вывод сообщения об успешной попытке запустить 1ю программу в файл
EndIf

While WinExists("CO_L1_3")
   ;пока открыто окно 1й программы, отслеживаем нажатие клавиш (0-9) и
   ;выводим соотв. сообщения + время их нажатия в файл
	If _IsPressed("30") Then
        _Log_Report($hLog, 'Нажата клавиша: "0"', 6)
        While _IsPressed("30");пауза в работе скрипта, чтобы
            Sleep(25)		  ;было время отпустить клавишу
		WEnd
    ElseIf _IsPressed("31") Then
        _Log_Report($hLog, 'Нажата клавиша: "1"', 6)
        While _IsPressed("31")
            Sleep(25)
		 WEnd
	ElseIf _IsPressed("32") Then
        _Log_Report($hLog, 'Нажата клавиша: "2"', 6)
        While _IsPressed("32")
            Sleep(25)
		 WEnd
	ElseIf _IsPressed("33") Then
        _Log_Report($hLog, 'Нажата клавиша: "3"', 6)
        While _IsPressed("33")
            Sleep(25)
		 WEnd
    ElseIf _IsPressed("34") Then
        _Log_Report($hLog, 'Нажата клавиша: "4"', 6)
        While _IsPressed("34")
            Sleep(25)
		 WEnd
	ElseIf _IsPressed("35") Then
        _Log_Report($hLog, 'Нажата клавиша: "5"', 6)
        While _IsPressed("35")
            Sleep(25)
		 WEnd
	ElseIf _IsPressed("36") Then
        _Log_Report($hLog, 'Нажата клавиша: "6"', 6)
        While _IsPressed("36")
            Sleep(25)
		 WEnd
    ElseIf _IsPressed("37") Then
        _Log_Report($hLog, 'Нажата клавиша: "7"', 6)
        While _IsPressed("37")
            Sleep(25)
		 WEnd
	ElseIf _IsPressed("38") Then
        _Log_Report($hLog, 'Нажата клавиша: "8"', 6)
        While _IsPressed("38")
            Sleep(25)
		 WEnd
	ElseIf _IsPressed("39") Then
        _Log_Report($hLog, 'Нажата клавиша: "9"', 6)
        While _IsPressed("39")
            Sleep(25)
		WEnd
    EndIf
WEnd

_Log_Report($hLog, 'Завершение CO_L1.exe', 7);вывод сообщения со временем завершения работы 1й программы в файл
_Log_Close($hLog);закрытие файла логов
