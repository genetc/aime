private _spine = _this selectionPosition "spine3";
private _left = _this selectionPosition "leftshoulder" vectorDiff _spine;
private _right = _this selectionPosition "rightshoulder" vectorDiff _spine;
private _cross = _right vectorCrossProduct _left;

(_cross vectorMultiply 4) vectorAdd _spine;