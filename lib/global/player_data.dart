class PlayerData {
  ComponentMotionState componentMotionState = ComponentMotionState.idle;
  ComponentDirectionState componentDirectionState =
      ComponentDirectionState.left;
}

enum ComponentMotionState {
  walkingLeft,
  walkingRight,
  idle,
}

enum ComponentDirectionState {
  left,
  right,
  up,
  down,
}
