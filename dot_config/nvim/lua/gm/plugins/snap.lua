return {
  'camspiers/snap',
  dependencies = {
    require('gm.plugins.snap-deps'),
  },
  config = function()
    -- Basic example config
    local snap = require('snap')
    snap.maps({
      { '<Leader><Leader>', snap.config.file({ producer = 'fd.file' }) },
    })
  end,
}
