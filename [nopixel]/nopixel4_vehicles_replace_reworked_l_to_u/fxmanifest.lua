fx_version 'adamant'
games { 'gta5' }

author 'NVE Team'
description 'nopixel 4.0 - Vehicle Overhaul'
version '1.0.0'

this_is_a_map 'yes'
lua54 'yes'

files {
	'stream/meta_files/speedo/carcols.meta',
	'stream/meta_files/speedo/carvariations.meta',
	'stream/meta_files/sigma2/carvariations.meta',
	'stream/meta_files/sigma2/handling.meta',
	'stream/meta_files/sigma2/vehicles.meta',
	'stream/meta_files/schafter2/carcols.meta',
	'stream/meta_files/schafter2/carvariations.meta',
	'stream/meta_files/ninef/carcols.meta',
	'stream/meta_files/ninef/carvariations.meta',
	'stream/meta_files/penumbra2/carcols.meta',
	'stream/meta_files/penumbra2/carvariations.meta',
	'stream/meta_files/sultan3/carcols.meta',
	'stream/meta_files/sultan3/carvariations.meta',
}

data_file 'CARCOLS_FILE' 'stream/meta_files/speedo/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'stream/meta_files/speedo/carvariations.meta'
data_file 'VEHICLE_VARIATION_FILE' 'stream/meta_files/sigma2/carvariations.meta'
data_file 'HANDLING_FILE' 'stream/meta_files/sigma2/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'stream/meta_files/sigma2/vehicles.meta'
data_file 'CARCOLS_FILE' 'stream/meta_files/schafter2/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'stream/meta_files/schafter2/carvariations.meta'
data_file 'CARCOLS_FILE' 'stream/meta_files/ninef/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'stream/meta_files/ninef/carvariations.meta'
data_file 'CARCOLS_FILE' 'stream/meta_files/penumbra2/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'stream/meta_files/penumbra2/carvariations.meta'
data_file 'CARCOLS_FILE' 'stream/meta_files/sultan3/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'stream/meta_files/sultan3/carvariations.meta'

client_scripts {
    'stream/meta_files/sigma2/vehicle_name.lua',
}

escrow_ignore {
    'stream/**/*.ytd'
  }
dependency '/assetpacks'