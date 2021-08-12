local Assert = {}

local fmt = string.format

Assert.TYPE = {
  INVALID_TYPE = "%s(...): The `%s` argument must be a %s, but you passed %q (%s)",
}

function Assert.typeOf(
  methodName: string,
  argName: string,
  class: string,
  value: any?
): nil
  local errorText = fmt(Assert.TYPE.INVALID_TYPE, methodName, argName, class, tostring(value), typeof(value))

  if typeof(value) ~= class then
    error(errorText, 3)
  end

  return nil
end

function Assert.prepTypeOf(methodName: string): typeof(Assert.typeOf)
  return function(...)
    return Assert.typeOf(methodName, ...)
  end
end

return Assert
