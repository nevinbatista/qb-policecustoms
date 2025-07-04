Config = {}

-- Police garage location
Config.CustomsLocation = {
    coords = vector3(452.5, -1000.5, 28.5), -- Mission Row PD
    radius = 5.0
}

-- Police vehicle models
Config.PoliceVehicles = {

    `VALOR18TAURUS`,  
    `VALOR18TAURUSSLICK`,
    `VALOR16FPIU`,
    `VALOR16FPIUSlick`,
    `Valor16Ram`,
    `Valor16RamK9`,
    `Valor16Ramslick`,
    `Valor16Ramslickk9`,
    `VALOR19GMC`,
    `VALOR19GMCSLICK`,
    `VALOR2020FPIU`,
    `VALOR2020FPIUSlick`,
    `VALOR2020FPIUK9`, 
    `VALOR2020FPIUSlickK9`, 
    `Valor18Tahoe`, 
    `Valor18TahoeSlick`,
    `Valor18F150K9`, 
    `Valor18F150slickK9`, 
    `PD23Suburban`, 
    `camaro`, 
    `mcu`, 
    `M207`, 
    `cvpi`, 
    `VALOR20DURANGO`, 
    `VALOR20DURANGOSLICK`, 
    `VALOR14CHARGER`, 
    `VALOR14CHARGERSLICK`, 
    `Valor14Tahoek9`, 
    `Valor14TahoeSlickk9`, 
    `VALOR18CHARGER`, 
    `VALOR18CHARGERSLICK`,
    `VALOR18CHARGERK9`, 
    `VALOR18CHARGERSLICKK9`, 
    `Valor22Tahoe`,
    `Valor22Tahoeslick`, 
    `valorgator`,
    `valortrailer`, 
    `police`,
    `police2`,
    `police3`,
    `police4`,
    `policeb`,
    `policet`,
    `sheriff`,
    `sheriff2`
}

-- Available mod types (mimicking Los Santos Customs)
Config.ModTypes = {
    { name = "Front Bumper", modType = 1, label = "frontbumper" },
    { name = "Rear Bumper", modType = 2, label = "rearbumper" },
    { name = "Grill", modType = 6, label = "grille" },
    { name = "Hood", modType = 7, label = "hood" },
    { name = "Spoiler", modType = 0, label = "spoiler" },
    { name = "Side Skirt", modType = 3, label = "skirts" },
    { name = "Exhaust", modType = 4, label = "exhaust" },
    { name = "Roll Cage", modType = 5, label = "cage" },
    { name = "Roof", modType = 10, label = "roof" },
    { name = "Wheels", modType = 23, label = "wheels" },
    { name = "Wheel Type", modType = 24, label = "wheeltype" }, -- Custom wheels
    { name = "Livery", modType = 48, label = "livery" },
    { name = "Extras", modType = "extras", label = "extras" } -- Special handling for extras
}