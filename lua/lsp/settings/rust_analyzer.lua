return {
  ['rust-analyzer'] = {
    cargo = {
      allFeatures = true,
    },
    checkOnSave = {
      command = 'check',
    },
  },
}
