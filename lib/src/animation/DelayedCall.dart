class DelayedCall implements Animatable
{
  num _currentTime = 0.0;
  num _totalTime = 0.0;
  int _repeatCount = 1;
  Function _action;
  
  DelayedCall(Function action, num delay)
  {
    _action = action;
    _totalTime = max(delay, 0.0001);
  }

  //-------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------

  bool advanceTime(num time)
  {
    num newTime = _currentTime + time;

    while (newTime >= _totalTime && _repeatCount > 0)
    {
      _currentTime = _totalTime;
      _repeatCount--;
      _action();
      
      newTime -= _totalTime;
    }

    if (_repeatCount == 0)
      return false;
    
    _currentTime = newTime;
    return true;
  }

  //-------------------------------------------------------------------------------------------------
  
  num get totalTime => _totalTime;
  num get currentTime => _currentTime; 
  int get repeatCount => _repeatCount;
    
  void set repeatCount(int value) { _repeatCount = value; }
  
}
