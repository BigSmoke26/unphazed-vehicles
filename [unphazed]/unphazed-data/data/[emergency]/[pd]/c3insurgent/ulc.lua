
--[[ 
  Ultimate Lighting Controller Config
  the ULC resource is required to use this configuration
  get the resource here: https://github.com/Flohhhhh/ultimate-lighting-controller/releases/latest
  To learn how to setup and use ULC visit here: https://docs.dwnstr.com/ulc/overview
]]
                
return {names = {"c3insurgent"},
  steadyBurnConfig = {
    forceOn = false, useTime = false,
    disableWithLights = false,
    sbExtras = {}
  },
  parkConfig = {
    usePark = true,
    useSync = true,
    syncWith = {"c3insurgent"},
    pExtras = {4},
    dExtras = {1,2}
  },
  hornConfig = {
    useHorn = false,
    hornExtras = {},
    disableExtras = {}
  },
  brakeConfig = {
    useBrakes = true,
    speedThreshold = 3,
    brakeExtras = {},
    disableExtras = {}
  },
  reverseConfig = {
    useReverse = false,
    reverseExtras = {},
    disableExtras = {}
  },
  doorConfig = {
    useDoors = false,
    driverSide = {enable = {}, disable = {}},
    passSide = {enable = {}, disable = {}},
    trunk = {enable ={}, disable = {}}
  }, 
  buttons = {
    {label = "Steady Burns", key = 1, color = "green", extra = 5, linkedExtras = {}, oppositeExtras = {}, offExtras = {1,2,4}, repair = false},
		{label = "Front Takedowns", key = 2, color = "green", extra = 3, linkedExtras = {}, oppositeExtras = {}, offExtras = {}, repair = false},
  },
  stages = {
    useStages = true,
    stageKeys = {1},
  },
  defaultStages = {
    useDefaults = false,
    enableKeys = {},
    disableKeys = {}
  }
}
