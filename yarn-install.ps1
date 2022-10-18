@(
  'images\final' 
  'images\start' 
  'morecomponents\final' 
  'morecomponents\start' 
  'statemanagement\final' 
  'statemanagement\start' 
  'sveltekit-demo\start' 
  'sveltekit-demo\final'
) | % { Push-Location $_; yarn; Pop-Location }
