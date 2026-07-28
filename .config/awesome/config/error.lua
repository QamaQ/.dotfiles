local naughty = require("naughty")

if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Ooops, erro al inciar ",
    text = awesome.startup_errors,
  })
end

do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    if in_error then
      return
    end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Ooops, an error happened!",
      text = tostring(err),
    })
    in_error = false
  end)
end
