#include <windows.h>



LRESULT CALLBACK WindowProcess(HWND, UINT, WPARAM, LPARAM);

int WINAPI WinMain(HINSTANCE hInst,
	HINSTANCE hPrevInst,
	LPSTR pCommandLine,
	int nCommandShow) {
	TCHAR className[] = L"Мой класс";
	HWND hWindow;
	MSG message;
	WNDCLASSEX windowClass;

	windowClass.cbSize = sizeof(windowClass);
	windowClass.style = CS_HREDRAW | CS_VREDRAW;
	windowClass.lpfnWndProc = WindowProcess;
	windowClass.lpszMenuName = NULL;
	windowClass.lpszClassName = className;
	windowClass.cbWndExtra = NULL;
	windowClass.cbClsExtra = NULL;
	windowClass.hIcon = LoadIcon(NULL, IDI_WINLOGO);
	windowClass.hIconSm = LoadIcon(NULL, IDI_WINLOGO);
	windowClass.hCursor = LoadCursor(NULL, IDC_ARROW);
	windowClass.hbrBackground = (HBRUSH)GetStockObject(WHITE_BRUSH);
	windowClass.hInstance = hInst;

	if (!RegisterClassEx(&windowClass))
	{
		MessageBox(NULL, L"Не получилось зарегистрировать класс!", L"Ошибка", MB_OK);
		return NULL;
	}
	hWindow = CreateWindow(className,
		L"Квадрат числа",
		WS_OVERLAPPEDWINDOW,
		CW_USEDEFAULT,
		NULL,
		CW_USEDEFAULT,
		NULL,
		(HWND)NULL,
		NULL,
		HINSTANCE(hInst),
		NULL
	);
	if (!hWindow) {
		MessageBox(NULL, L"Не получилось создать окно!", L"Ошибка", MB_OK);
		return NULL;
	}
	ShowWindow(hWindow, nCommandShow);
	UpdateWindow(hWindow);
	while (GetMessage(&message, NULL, NULL, NULL)) {
		TranslateMessage(&message);
		DispatchMessage(&message);
	}
	return message.wParam;
}

LRESULT CALLBACK WindowProcess(HWND hWindow,
	UINT uMessage,
	WPARAM wParameter,
	LPARAM lParameter)
{
	HDC hDeviceContext;
	PAINTSTRUCT paintStruct;
	RECT rectPlace;
	HFONT hFont;

	static wchar_t textOut[2] = {' ', ' '};


	switch (uMessage)
	{

	case WM_PAINT:
		hDeviceContext = BeginPaint(hWindow, &paintStruct);
		GetClientRect(hWindow, &rectPlace);
		SetTextColor(hDeviceContext, NULL);
		hFont = CreateFont(300, 0, 0, 0, 0, 0, 0, 0,
			DEFAULT_CHARSET,
			0, 0, 0, 0,
			L"Arial Bold"
		);
		SelectObject(hDeviceContext, hFont);
		DrawText(hDeviceContext, (LPCWSTR) textOut, 2, &rectPlace, DT_SINGLELINE | DT_CENTER | DT_VCENTER);
		EndPaint(hWindow, &paintStruct);
		break;

	case WM_KEYDOWN:

					  
		switch (wParameter)
		{
			case VK_HOME:case VK_END:case VK_PRIOR:
			case VK_NEXT:case VK_LEFT:case VK_RIGHT:
			case VK_UP:case VK_DOWN:case VK_DELETE:
			case VK_SHIFT:case VK_CONTROL:
			case VK_CAPITAL:case VK_MENU:case VK_TAB:
			case VK_BACK:case VK_RETURN: case VK_ESCAPE: 
			case VK_OEM_3: case VK_OEM_MINUS: case VK_OEM_PLUS:
			case 0x41: case 0x42: case 0x43: case 0x44: case 0x45:
			case 0x46: case 0x47: case 0x48: case 0x49: case 0x4A:
			case 0x4B: case 0x4C: case 0x4D: case 0x4E: case 0x4F:
			case 0x50: case 0x51: case 0x52: case 0x53: case 0x54:
			case 0x55: case 0x56: case 0x57: case 0x58: case 0x59:
			case 0x5A:

			break;

		default:
			switch (wParameter) {
				case 0x30:
					textOut[0] = 0x30;
					InvalidateRect(hWindow, NULL, TRUE);
					break;

				case 0x31:
					textOut[0] = 0x31;
					InvalidateRect(hWindow, NULL, TRUE);
					break;

				case 0x32:
					textOut[0] = 0x34;
					InvalidateRect(hWindow, NULL, TRUE);
					break;

				case 0x33:
					textOut[0] = 0x39;
					InvalidateRect(hWindow, NULL, TRUE);
					break;

				case 0x34:
					textOut[0] = 0x31;
					textOut[1] = 0x36;
					InvalidateRect(hWindow, NULL, TRUE);
					
					break;

				case 0x35:
					textOut[0] = 0x32;
					textOut[1] = 0x35;
					InvalidateRect(hWindow, NULL, TRUE);

					break;

				case 0x36:
					textOut[0] = 0x33;
					textOut[1] = 0x36;
					InvalidateRect(hWindow, NULL, TRUE);

					break;

				case 0x37:
					textOut[0] = 0x34;
					textOut[1] = 0x39;
					InvalidateRect(hWindow, NULL, TRUE);

					break;

				case 0x38:
					textOut[0] = 0x36;
					textOut[1] = 0x34;
					InvalidateRect(hWindow, NULL, TRUE);

					break;

				case 0x39:
					textOut[0] = 0x38;
					textOut[1] = 0x31;
					InvalidateRect(hWindow, NULL, TRUE);

					break;
				
				case VK_SPACE:
					textOut[0] = ' ';
					textOut[1] = ' ';
					InvalidateRect(hWindow, NULL, TRUE);
					break;
			}
		}break; 

	case WM_DESTROY:
		PostQuitMessage(0);
		break;
	default:
		return DefWindowProc(hWindow, uMessage, wParameter, lParameter);
	}
	return NULL;
}