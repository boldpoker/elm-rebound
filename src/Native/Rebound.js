Elm.Native = Elm.Native || {};
Elm.Native.Rebound = {};
Elm.Native.Rebound.make = function(localRuntime) {
  localRuntime.Native = localRuntime.Native || {};
  localRuntime.Native.Rebound = localRuntime.Native.Rebound || {};

  if (localRuntime.Native.Rebound.values) {
    return localRuntime.Native.Rebound.values;
  }

  var Signal = Elm.Signal.make(localRuntime);
  var NS = Elm.Native.Signal.make(localRuntime);

  function spring(targetValueSignal) {
    var ticker = NS.input()
    var value = 0
    var interval = setInterval(function() {
      value += 0.1;
      localRuntime.notify(ticker.id, value)
    }, 100);

    setTimeout(function() {
      clearInterval(interval);
    }, 2000);

    function f(newTargetValue, v) {
      // set net targetValue
      return v;
    }
    return A3(Signal.map2, F2(f), targetValueSignal, ticker);
  };

  return localRuntime.Native.Rebound.values = {
    spring: spring
  };
};
