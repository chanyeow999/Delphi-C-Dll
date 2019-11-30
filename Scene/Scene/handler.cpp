#include "stdafx.h"
#include "handler.h"
#include <iostream>

bool TSceneHandler::Init()
{
	head = new TEntityNode();
	tail = new TEntityNode();
	head->xNext = tail;
	head->yNext = tail;
	tail->xPrev = head;
	tail->yPrev = head;
	return true;
}

void TSceneHandler::Free()
{
	TEntityNode* node = head;
	TEntityNode* next;
	while (node != nullptr) {
		next = node->xNext;
		delete node;
		node = next;
	}

	if (this)
		delete this;
}

void TSceneHandler::registerCallBack(TCallBackFuncRcd rcd)
{
	fPrint = rcd.print;
}

TEntityNode* TSceneHandler::Add(TAddNode * node)
{
	TEntityNode* retNode = new TEntityNode();
	retNode->lenKey = node->lenKey;
	retNode->key = new char(node->lenKey);
	memcpy(retNode->key, node->key, node->lenKey);

	retNode->x = node->x;
	retNode->y = node->y;
	_add(retNode);

	return retNode;
}

TEntityNode * TSceneHandler::Get(void * key, int lenKey)
{
	std::string sKey((char*)key, lenKey);
	TEntityNode* node = head->xNext;
	while (node != tail) {
		std::string tempKey((char*)node->key, node->lenKey);
		if (tempKey == sKey) {
			return node;
		}
		node = node->xNext;
	}
	return nullptr;
}

bool TSceneHandler::Leave(void* key, int lenKey)
{
	std::string sKey((char*)key, lenKey);
	TEntityNode* node = head->xNext;
	while (node != tail) {
		std::string tempKey((char*)node->key, node->lenKey);
		if (tempKey == sKey) {
			node->xPrev->xNext = node->xNext;
			node->xNext->xPrev = node->xPrev;

			node->yPrev->yNext = node->yNext;
			node->yNext->yPrev = node->yPrev;

			delete node;
			return true;
		}
		node = node->xNext;
	}
	return false;
}

TEntityNode * TSceneHandler::Move(void* key, int lenKey, int x, int y)
{
	TEntityNode* newNode = new TEntityNode();
	newNode->lenKey = lenKey;
	newNode->key = new char(lenKey);
	memcpy(newNode->key, key, lenKey);
	newNode->x = x;
	newNode->y = y;

	Leave(key, lenKey);
	_add(newNode);
	return newNode;
}

void TSceneHandler::PrintAll(bool isPrintX)
{
	TEntityNode* curNode;
	if (isPrintX) {
		curNode = head->xNext;
		while (curNode != tail) {
			fPrint(curNode);
			curNode = curNode->xNext;
		}
	}
	else {
		curNode = head->yNext;
		while (curNode != tail) {
			fPrint(curNode);
			curNode = curNode->yNext;
		}
	}

}

void TSceneHandler::PrintAOI(TEntityNode * node, int xArea, int yArea)
{
	int inteval;
	//向后找
	TEntityNode* curNode = node->xNext;
	while (curNode != nullptr) {
		if ((curNode->x - node->x) <= xArea) {
			inteval = node->y - curNode->y;
			if ((inteval >= -yArea) and (inteval <= yArea))
				fPrint(curNode);
		}
		else
			break;
		curNode = curNode->xNext;
	}

	//向前找
	curNode = node->xPrev;
	while (curNode != nullptr) {
		if ((node->x - curNode->x) <= xArea) {
			inteval = node->y - curNode->y;
			if ((inteval >= -yArea) and (inteval <= yArea))
				fPrint(curNode);
		}
		else
			break;
		curNode = curNode->xPrev;
	}
}

void TSceneHandler::_add(TEntityNode * node)
{
	TEntityNode* curNode = head->xNext;
	while (curNode != nullptr) {
		if ((curNode->x > node->x) or (curNode == tail)) {
			node->xNext = curNode;
			node->xPrev = curNode->xPrev;
			curNode->xPrev->xNext = node;
			curNode->xPrev = node;
			break;
		}
		curNode = curNode->xNext;
	}

	curNode = head->yNext;
	while (curNode != nullptr) {
		if((curNode->y > node->y) or curNode == tail){
			node->yNext = curNode;
			node->yPrev = curNode->yPrev;
			curNode->yPrev->yNext = node;
			curNode->yPrev = node;
			break;
		}
		curNode = curNode->yNext;
	}
}
