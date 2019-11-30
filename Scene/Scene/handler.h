#pragma once

#ifndef HANDLER_H
#define HANDLER_H

#include "Interface.h"


class TSceneHandler : public TScene {
public:
	virtual bool __stdcall Init();
	virtual void __stdcall Free();
	virtual void __stdcall registerCallBack(TCallBackFuncRcd rcd);
	virtual TEntityNode* __stdcall Add(TAddNode* node);
	virtual TEntityNode* __stdcall Get(void* key, int lenKey);
	virtual bool __stdcall Leave(void* key, int lenKey);
	virtual TEntityNode* __stdcall Move(void* key, int lenKey, int x, int y);
	virtual void __stdcall PrintAll(bool isPrintX);
	virtual void __stdcall PrintAOI(TEntityNode* node, int xArea, int yArea);
private:
	void _add(TEntityNode* node);
private:
	TEntityNode * head;
	TEntityNode * tail;
	Fun_Print fPrint;
};


#endif