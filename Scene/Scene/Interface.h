#pragma once

#ifndef INTERFACE_H
#define INTERFACE_H

#include "stdafx.h"
#define API_EXPORT __declspec(dllexport)

#pragma pack(push, 1)
struct TEntityNode
{
	TEntityNode* xPrev;
	TEntityNode* xNext;
	TEntityNode* yPrev;
	TEntityNode* yNext;
	void* key;
	int lenKey;
	int x;
	int y;
};
#pragma pack(pop)

#pragma pack(push, 1)
struct TAddNode
{
	void* key;
	int lenKey;
	int x;
	int y;
};
#pragma pack(pop)

//#pragma pack(push, 1)
//struct TPrintCallbackRcd
//{
//	void* key;
//	int len;
//	int x;
//	int y;
//};
//#pragma pack(pop)

typedef void (*Fun_Print)(TEntityNode*);

struct TCallBackFuncRcd
{
	Fun_Print print;
};

class TScene {
public:
	virtual bool __stdcall Init() = 0;
	virtual void __stdcall Free() = 0;
	virtual void __stdcall registerCallBack(TCallBackFuncRcd rcd) = 0;
	virtual TEntityNode* __stdcall Add(TAddNode* node) = 0;
	virtual TEntityNode* __stdcall Get(void* key, int lenKey) = 0;
	virtual bool __stdcall Leave(void* key, int lenKey) = 0;
	virtual TEntityNode* __stdcall Move(void* key, int lenKey, int x, int y) = 0;
	virtual void __stdcall PrintAll(bool isPrintX) = 0;
	virtual void __stdcall PrintAOI(TEntityNode* node, int xArea, int yArea) = 0;
};

extern "C" API_EXPORT TScene *NewScene();

#endif