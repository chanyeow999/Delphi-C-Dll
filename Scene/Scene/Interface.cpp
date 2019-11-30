#include "stdafx.h"
#include "Interface.h"
#include "handler.h"

API_EXPORT TScene* NewScene() {
	return new TSceneHandler();
}