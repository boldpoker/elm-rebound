Elm.Native = Elm.Native || {};
Elm.Native.Rebound = {};
Elm.Native.Rebound.make = function(localRuntime) {
  localRuntime.Native = localRuntime.Native || {};
  localRuntime.Native.Rebound = localRuntime.Native.Rebound || {};

  if (localRuntime.Native.Rebound.values) {
    return localRuntime.Native.Rebound.values;
  }

  var Task = Elm.Native.Task.make(localRuntime);

  function spring(onSpringUpdate) {
    var value = 0.0;
    return Task.asyncFunction(function(callback) {
      var interval = setInterval(function() {
        value += 1.0;
        var task = onSpringUpdate._0(value);
        Task.spawn(task);
      }, 100);

      setTimeout(function() {
        clearInterval(interval);
        return callback(Task.succeed(Utils.Tuple0));
      }, 2000);
    });
  };

  return localRuntime.Native.Rebound.values = {
    spring: spring
  };
};
