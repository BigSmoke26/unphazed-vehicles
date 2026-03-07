fx_version 'adamant'
games { 'gta5' }

author 'NVE Team'
description 'nopixel 4.0 - Vehicle Overhaul'
version '1.0.0'

this_is_a_map 'yes'
lua54 'yes'

files {
	'stream/meta_files/zr300/carcols.meta',
	'stream/meta_files/zr300/carvariations.meta',
	'stream/meta_files/zr300/handling.meta',
	'stream/meta_files/zr300/vehicles.meta',
}

data_file 'CARCOLS_FILE' 'stream/meta_files/zr300/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'stream/meta_files/zr300/carvariations.meta'
data_file 'HANDLING_FILE' 'stream/meta_files/zr300/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'stream/meta_files/zr300/vehicles.meta'

client_scripts {
    'stream/meta_files/zr300/vehicle_name.lua',
}

escrow_ignore {
    'stream/**/*.ytd'
  }
dependency '/assetpacks'