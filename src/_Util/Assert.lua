local Assert = {}

local fmt = string.format

type Array = { [number]: any }

Assert.TYPE = {
  INVALID_TYPE = "%s(...): The `%s` argument must be a %s, but you passed %q (%s)",
  INVALID_ARRAY = "%s(...): The `%s` argument must be an array of %s, but you passed %q (%s) at index #%d",
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

function Assert.arrayOf(
  methodName: string,
  argName: string,
  class: string,
  array: Array
): nil
  Assert.typeOf("Assert.arrayOf", "array", "table", array)

  for index, value in ipairs(array) do
    if typeof(value) ~= class then
      local errorText = fmt(Assert.TYPE.INVALID_ARRAY, methodName, argName, class, tostring(value), typeof(value), index)
      error(errorText, 3)
    end
  end

  return nil
end

function Assert.prepTypeOf(methodName: string)
  return function(argName: string, class: string, value: any?)
    return Assert.typeOf(methodName, argName, class, value)
  end
end

function Assert.prepArrayOf(methodName: string)
  return function(argName: string, class: string, array: Array)
    return Assert.arrayOf(methodName, argName, class, array)
  end
end

return Assert
