; HEADER_BLOCK_START
; BambuStudio 02.06.00.51
; model printing time: 15m 54s; total estimated time: 22m 12s
; total layer number: 100
; total filament length [mm] : 1592.36
; total filament volume [cm^3] : 3830.07
; total filament weight [g] : 4.83
; filament_density: 1.26,1.24,1.25,1.24
; filament_diameter: 1.75,1.75,1.75,1.75
; max_z_height: 20.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0
; additional_cooling_fan_speed = 70,70,70,70
; additional_fan_full_speed_layer = 0,0,0,0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0,0,0
; change_filament_gcode = ;===== A1 20251031 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X267 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E6 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200
; close_additional_fan_first_x_layers = 1,1,1,1
; close_fan_the_first_x_layers = 1,1,1,1
; complete_print_exhaust_fan_speed = 70,70,70,70
; cool_plate_temp = 35,35,35,35
; cool_plate_temp_initial_layer = 35,35,35,35
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10,10,10,10
; cooling_slowdown_logic = uniform_cooling,uniform_cooling,uniform_cooling,uniform_cooling
; counter_coef_1 = 0,0,0,0
; counter_coef_2 = 0.008,0.008,0.008,0.008
; counter_coef_3 = -0.041,-0.041,-0.041,-0.041
; counter_limit_max = 0.033,0.033,0.033,0.033
; counter_limit_min = -0.035,-0.035,-0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = ;;;
; default_filament_profile = "Bambu PLA Basic @BBL A1"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50
; different_settings_to_system = prime_tower_infill_gap;prime_tower_rib_wall;prime_tower_width;timelapse_type;filament_prime_volume;;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70
; elefant_foot_compensation = 0.075
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_overhang_bridge_fan = 1,1,1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0,0,0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0,0,0
; eng_plate_temp_initial_layer = 0,0,0,0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 256
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = Standard#1
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80,80,80,80
; fan_direction = undefine
; fan_max_speed = 80,80,80,80
; fan_min_speed = 60,60,60,60
; filament_adaptive_volumetric_speed = 0,0,0,0
; filament_adhesiveness_category = 100,100,100,100
; filament_bridge_speed = 25,25,25,25
; filament_change_length = 5,10,10,10
; filament_change_length_nc = 10,10,10,10
; filament_colour = #00FF00;#161616;#B39B84;#DCDCDC
; filament_colour_type = 1;1;1;1
; filament_cooling_before_tower = 0,0,0,0
; filament_cost = 24.99,20,29.99,20
; filament_density = 1.26,1.24,1.25,1.24
; filament_dev_ams_drying_ams_limitations = 1;0;1;0;1;0;1;0
; filament_dev_ams_drying_heat_distortion_temperature = 45,45,45,45
; filament_dev_ams_drying_temperature = 45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45
; filament_dev_ams_drying_time = 12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
; filament_dev_chamber_drying_bed_temperature = 70,70,70,70
; filament_dev_chamber_drying_time = 12,12,12,12
; filament_dev_drying_cooling_temperature = 45,45,45,45
; filament_dev_drying_softening_temperature = 50,50,50,50
; filament_diameter = 1.75,1.75,1.75,1.75
; filament_enable_overhang_speed = 1,1,1,1
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_compatibility = 0,0,0,0
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.98,0.98,0.98
; filament_flush_temp = 0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0
; filament_ids = GFA00;GFL99;GFA02;GFL99
; filament_is_mixed = 0
; filament_is_support = 0,0,0,0
; filament_long_retractions_when_cut = 1,nil,nil,nil
; filament_map = 1,1,1,1
; filament_map_2 = 0,0,0,0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21,12,21,12
; filament_metal_stickiness = None,None,None,None
; filament_minimal_purge_on_wipe_tower = 15,15,15,15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_multi_colour = #00FF00;#161616;#B39B84;#DCDCDC
; filament_notes = 
; filament_nozzle_map = 0,0,0,0
; filament_overhang_1_4_speed = 0,0,0,0
; filament_overhang_2_4_speed = 50,50,50,50
; filament_overhang_3_4_speed = 30,30,30,30
; filament_overhang_4_4_speed = 10,10,10,10
; filament_overhang_totally_speed = 10,10,10,10
; filament_pre_cooling_temperature = 0,0,0,0
; filament_pre_cooling_temperature_nc = 0,0,0,0
; filament_prime_volume = 45,45,45,45
; filament_prime_volume_nc = 60,60,60,60
; filament_printable = 3,3,3,3
; filament_ramming_travel_time = 0,0,0,0
; filament_ramming_travel_time_nc = 0,0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1,-1
; filament_ramming_volumetric_speed_nc = -1,-1,-1,-1
; filament_retract_length_nc = 14,14,14,14
; filament_retraction_distances_when_cut = 18,nil,nil,nil
; filament_scarf_gap = 0%,15%,15%,15%
; filament_scarf_height = 10%,10%,10%,10%
; filament_scarf_length = 10,10,10,10
; filament_scarf_seam_type = none,none,none,none
; filament_self_index = 1,2,3,4
; filament_settings_id = "Bambu PLA Basic @BBL A1";"Generic PLA @BBL A1";"Bambu PLA Metal @BBL A1";"Generic PLA @BBL A1"
; filament_shrink = 100%,100%,100%,100%
; filament_soluble = 0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10,10,10,10
; filament_tower_interface_pre_extrusion_length = 0,0,0,0
; filament_tower_interface_print_temp = -1,-1,-1,-1
; filament_tower_interface_purge_volume = 20,20,20,20
; filament_tower_ironing_area = 4,4,4,4
; filament_type = PLA;PLA;PLA;PLA
; filament_velocity_adaptation_factor = 1,1,1,1
; filament_vendor = "Bambu Lab";Generic;"Bambu Lab";Generic
; filament_volume_map = 0,0,0,0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0,0,0,0
; first_x_layer_part_fan_speed = 0,0,0,0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,146,298,426,534,0,418,501,240,106,0,260,263,94,92,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.3
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.2
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 226x224,256x224,256x256,226x256
; hole_coef_1 = 0,0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008,-0.008
; hole_coef_3 = 0.23415,0.23415,0.23415,0.23415
; hole_limit_max = 0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 65,65,65,65
; hot_plate_temp_initial_layer = 65,65,65,65
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.8,10,16.8,10
; independent_support_layer_height = 0
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_fan_speed = -1,-1,-1,-1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0,0,0
; machine_end_gcode = ;===== date: 20231229 =====================\nG392 S0 ;turn off nozzle clog detect\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != "by object"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X267 F15000\nT255\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 256}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z256 F600\n    G1 Z256\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-48 Y180 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N80\nM1006 A44 B20 L100 C49 D20 M80 E41 F20 N80\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N80\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n;=====printer finish  sound=========\n\n;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM400\nM18 X Y Z\n\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 25
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 12000,12000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 12000,12000
; machine_max_acceleration_y = 12000,12000
; machine_max_acceleration_z = 1500,1500
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 =========================\n;===== date: 20250822 ==================\nG392 S0\nM9833.2\n;M400\n;M73 P1.717\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S140\nM140 S[bed_temperature_initial_layer_single]\n\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A43 B10 L100 C46 D10 M70 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C43 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C41 D10 M80 E41 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E44 F10 N80\nM1006 A0 B10 L100 C49 D10 M80 E49 F10 N80\nM1006 A0 B10 L100 C0 D10 M80 E0 F10 N80\nM1006 A44 B10 L100 C48 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A43 B10 L100 C46 D10 M60 E39 F10 N80\nM1006 W\nM18 \n;=====start printer sound ===================\n\n;=====avoid end stop =================\nG91\nG380 S2 Z40 F1200\nG380 S3 Z-15 F1200\nG90\n\n;===== reset machine status =================\n;M290 X39 Y39 Z8\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.65 Y1.2 Z0.6 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\nM1002 gcode_claim_action : 13\n\nG28 X\nG91\nG1 Z5 F1200\nG90\nG0 X128 F30000\nG0 Y254 F3000\nG91\nG1 Z-5 F1200\n\nM109 S25 H140\n\nM17 E0.3\nM83\nG1 E10 F1200\nG1 E-0.5 F30\nM17 D\n\nG28 Z P0 T140; home z with low precision,permit 300deg temperature\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  G90\n  G1 Z5 F1200\nM623\n\n;M400\n;M73 P1.717\n\n;===== prepare print temperature and material ==========\nM1002 gcode_claim_action : 24\n\nM400\n;G392 S1\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on\n\nG90\nG1 X-28.5 F30000\nG1 X-48.2 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-48.2 F3000\n    M400\n\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM109 S{flush_temperatures[initial_no_support_extruder]} H300\nG92 E0\nG1 E50 F200 ; lower extrusion speed to avoid clog\nM400\nM106 P1 S178\nG92 E0\nG1 E5 F200\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG92 E0\nG1 E-0.5 F300\n\nG1 X-28.5 F30000\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\n\n;G392 S0\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n;M400\n;M73 P1.717\n\n;===== auto extrude cali start =========================\nM975 S1\n;G392 S1\n\nG90\nM83\nT1000\nG1 X-48.2 Y0 Z10 F10000\nM400\nM1002 set_filament_type:UNKNOWN\n\nM412 S1 ;  ===turn on  filament runout detection===\nM400 P10\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\n\nM622 J1\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_extruder]}\n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n\n    M106 P1 S255\n    M400 S5\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S255\n        M400 S5\n        G1 X-28.5 F18000\n        G1 X-48.2 F3000\n        G1 X-28.5 F18000 ;wipe and shake\n        G1 X-48.2 F3000\n        G1 X-28.5 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-48.2 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\nM623 ; end of "draw extrinsic para cali paint"\n\n;G392 S0\n;===== auto extrude cali end ========================\n\n;M400\n;M73 P1.717\n\nM104 S170 ; prepare to wipe nozzle\nM106 S255 ; turn on fan\n\n;===== mech mode fast check start =====================\nM1002 gcode_claim_action : 3\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q1 A5 K0 O3\nM974 Q1 S2 P0\n\nM970.2 Q1 K1 W58 Z0.1\nM974 S2\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q0 A10 K0 O1\nM974 Q0 S2 P0\n\nM970.2 Q0 K1 W78 Z0.1\nM974 S2\n\nM975 S1\nG1 F30000\nG1 X0 Y5\nG28 X ; re-home XY\n\nG1 Z4 F1200\n\n;===== mech mode fast check end =======================\n\n;M400\n;M73 P1.717\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\n\nM975 S1\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\n;===== remove waste by touching start =====\n\nM104 S170 ; set temp down to heatbed acceptable\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nG0 X108 Y-0.5 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X110 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X112 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X114 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X116 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X118 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X120 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X122 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X124 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X126 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X128 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X130 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X132 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X134 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X136 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X138 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X140 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X142 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X144 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X146 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X148 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;===== remove waste by touching end =====\n\nG1 Z10 F1200\nG0 X118 Y261 F30000\nG1 Z5 F1200\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-50}\n\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S140 ; prepare to abl\nG0 Z5 F20000\n\nG0 X128 Y261 F20000  ; move to exposed steel surface\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z10 F1200\n\n;===== brush material wipe nozzle =====\n\nG90\nG1 Y250 F30000\nG1 X55\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X-35 F30000\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Z5.000 F1200\n\nG90\nG1 X30 Y250.000 F30000\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X35 F30000\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Z10.000 F1200\n\n;===== brush material wipe nozzle end =====\n\nG90\n;G0 X128 Y261 F20000  ; move to exposed steel surface\nG1 Y250 F30000\nG1 X138\nG1 Y261\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nM109 S140\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM211 R; pop softend status\n\n;===== wipe nozzle end ================================\n\n;M400\n;M73 P1.717\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\n\nG90\nG1 Z5 F1200\nG1 X0 Y0 F30000\nG29.2 S1 ; turn on ABL\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140\nM106 S0 ; turn off fan , too noisy\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n\n;===== home after wipe mouth end =======================\n\n;M400\n;M73 P1.717\n\nG1 X108.000 Y-0.500 F30000\nG1 Z0.300 F1200\nM400\nG2814 Z0.32\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; prepare to print\n\n;===== nozzle load line ===============================\n;G90\n;M83\n;G1 Z5 F1200\n;G1 X88 Y-0.5 F20000\n;G1 Z0.3 F1200\n\n;M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n\n;G1 E2 F300\n;G1 X168 E4.989 F6000\n;G1 Z1 F1200\n;===== nozzle load line end ===========================\n\n;===== extrude cali test ===============================\n\nM400\n    M900 S\n    M900 C\n    G90\n    M83\n\n    M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n    G0 X128 E8  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\n\nM900 R\n\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    G90\n    G1 X108.000 Y1.000 F30000\n    G91\n    G1 Z-0.700 F1200\n    G90\n    M83\n    G0 X128 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\nM623\n\nG1 Z0.2\n\n;M400\n;M73 P1.717\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\n;G392 S1 ; turn on clog detection\nM1007 S1 ; turn on mass estimation\nG29.4\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 29
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0,0,0,0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 220,220,220,220
; nozzle_temperature_initial_layer = 220,220,220,220
; nozzle_temperature_range_high = 240,240,240,240
; nozzle_temperature_range_low = 190,190,190,190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100,100,100
; overhang_fan_threshold = 50%,50%,50%,50%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0,0,0,0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 2,0,0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 100%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 0
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 10
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab A1 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 256
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1
; printer_notes = 
; printer_settings_id = Bambu Lab A1 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1,1,1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 255
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0,0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1,1,1
; slow_down_layer_time = 6,8,6,8
; slow_down_min_speed = 20,20,20,20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45,45,45,45
; supertack_plate_temp_initial_layer = 45,45,45,45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45,45,45,45
; template_custom_gcode = 
; textured_plate_temp = 65,65,65,65
; textured_plate_temp_initial_layer = 65,65,65,65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
; timelapse_type = 1
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 31.0195
; wipe_tower_y = 232.234
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R22
M201 X12000 Y12000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P12000 R5000 T12000
M205 X9.00 Y9.00 Z3.00 E3.00
M106 S0
; FEATURE: Custom
;===== machine: A1 =========================
;===== date: 20250822 ==================
G392 S0
M9833.2
;M400
;M73 P1.717

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S140
M140 S65

;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A43 B10 L100 C46 D10 M70 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C43 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C41 D10 M80 E41 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E44 F10 N80
M1006 A0 B10 L100 C49 D10 M80 E49 F10 N80
M1006 A0 B10 L100 C0 D10 M80 E0 F10 N80
M1006 A44 B10 L100 C48 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A43 B10 L100 C46 D10 M60 E39 F10 N80
M1006 W
M18 
;=====start printer sound ===================

;=====avoid end stop =================
G91
G380 S2 Z40 F1200
G380 S3 Z-15 F1200
G90

;===== reset machine status =================
;M290 X39 Y39 Z8
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.65 Y1.2 Z0.6 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

M1002 gcode_claim_action : 13

G28 X
G91
G1 Z5 F1200
G90
G0 X128 F30000
G0 Y254 F3000
G91
G1 Z-5 F1200

M109 S25 H140

M17 E0.3
M83
G1 E10 F1200
G1 E-0.5 F30
M17 D

G28 Z P0 T140; home z with low precision,permit 300deg temperature
M104 S220

M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  G90
  G1 Z5 F1200
M623

;M400
;M73 P1.717

;===== prepare print temperature and material ==========
M1002 gcode_claim_action : 24

M400
;G392 S1
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on

G90
G1 X-28.5 F30000
G1 X-48.2 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S220
    M104 S250
    M400
    T0
    G1 X-48.2 F3000
    M400

    M620.1 E F523.843 T240
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
M621 S0A

M109 S240 H300
G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
G1 E5 F200
M104 S220
G92 E0
M73 P2 R21
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P3 R21
G1 X-48.2 F3000
M73 P4 R21
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000

;G392 S0

M400
M106 P1 S0
;===== prepare print temperature and material end =====

;M400
;M73 P1.717

;===== auto extrude cali start =========================
M975 S1
;G392 S1

G90
M83
T1000
G1 X-48.2 Y0 Z10 F10000
M400
M1002 set_filament_type:UNKNOWN

M412 S1 ;  ===turn on  filament runout detection===
M400 P10
M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S220
M73 P5 R21
    G1 E10 F377.08
    M983 F6.28466 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P6 R20
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F6.28466 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
        G1 X-28.5 F18000
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F6.28466 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0
M623 ; end of "draw extrinsic para cali paint"

;G392 S0
;===== auto extrude cali end ========================

;M400
;M73 P1.717

M104 S170 ; prepare to wipe nozzle
M106 S255 ; turn on fan

;===== mech mode fast check start =====================
M1002 gcode_claim_action : 3

M73 P7 R20
G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q1 A5 K0 O3
M974 Q1 S2 P0

M970.2 Q1 K1 W58 Z0.1
M974 S2

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q0 A10 K0 O1
M974 Q0 S2 P0

M970.2 Q0 K1 W78 Z0.1
M974 S2

M975 S1
G1 F30000
G1 X0 Y5
G28 X ; re-home XY

G1 Z4 F1200

;===== mech mode fast check end =======================

;M400
;M73 P1.717

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14

M975 S1
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

;===== remove waste by touching start =====

M104 S170 ; set temp down to heatbed acceptable

M83
G1 E-1 F500
G90
M83

M109 S170
G0 X108 Y-0.5 F30000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X110 F10000
G380 S3 Z-5 F1200
M73 P26 R16
G1 Z2 F1200
G1 X112 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X114 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X116 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X118 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X120 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X122 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X124 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X126 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X128 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X130 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X132 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X134 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X136 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X138 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X140 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X142 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X144 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X146 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X148 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;===== remove waste by touching end =====

G1 Z10 F1200
G0 X118 Y261 F30000
G1 Z5 F1200
M109 S170

G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S140 ; prepare to abl
G0 Z5 F20000

G0 X128 Y261 F20000  ; move to exposed steel surface
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
M73 P27 R16
G1 Z10 F1200

;===== brush material wipe nozzle =====

G90
G1 Y250 F30000
G1 X55
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X-35 F30000
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Z5.000 F1200

G90
G1 X30 Y250.000 F30000
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X35 F30000
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Z10.000 F1200

;===== brush material wipe nozzle end =====

G90
;G0 X128 Y261 F20000  ; move to exposed steel surface
G1 Y250 F30000
G1 X138
G1 Y261
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

M109 S140
M106 S255 ; turn on fan (G28 has turn off fan)

M211 R; pop softend status

;===== wipe nozzle end ================================

;M400
;M73 P1.717

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag

G90
G1 Z5 F1200
G1 X0 Y0 F30000
G29.2 S1 ; turn on ABL

M190 S65; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X27.82 Y118 I110.18 J124.802
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623

;===== home after wipe mouth end =======================

;M400
;M73 P1.717

G1 X108.000 Y-0.500 F30000
G1 Z0.300 F1200
M400
G2814 Z0.32

M104 S220 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S220

;G1 E2 F300
;G1 X168 E4.989 F6000
;G1 Z1 F1200
;===== nozzle load line end ===========================

;===== extrude cali test ===============================

M400
    M900 S
    M900 C
    G90
    M83

    M109 S220
    G0 X128 E8  F904.991
    G0 X133 E.3742  F1508.32
    G0 X138 E.3742  F6033.27
    G0 X143 E.3742  F1508.32
    G0 X148 E.3742  F6033.27
    G0 X153 E.3742  F1508.32
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400

M900 R

M1002 judge_flag extrude_cali_flag
M622 J1
    G90
    G1 X108.000 Y1.000 F30000
    G91
    G1 Z-0.700 F1200
    G90
    M83
    G0 X128 E10  F904.991
    G0 X133 E.3742  F1508.32
    G0 X138 E.3742  F6033.27
    G0 X143 E.3742  F1508.32
    G0 X148 E.3742  F6033.27
    G0 X153 E.3742  F1508.32
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400
M623

G1 Z0.2

;M400
;M73 P1.717

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
;G392 S1 ; turn on clog detection
M1007 S1 ; turn on mass estimation
G29.4
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S200


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
M204 S10000
G1 Z.6 F42000
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/100
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M204 S6000
G1 Z1 F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z1.000
G1 X40.52 Y239.602 F42000
M204 S6000
G1 Z.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X41.020 Y239.602 
M204 S500
G1  X31.019  E0.3801 F3000
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
M73 P28 R15
G1 F33600
M204 S500
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
M204 S6000
G1 X40.52 Y239.102
G1 Z.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S500
G1  X31.519 Y239.102  E0.3421 F3000
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
M204 S6000
G1  X41.476 Y240.059  
M204 S500
G1  X30.562  E0.4148
G1  Y231.777  E0.3148
G1  X41.476  E0.4148
G1  Y240.059  E0.3148
M204 S6000
G1  X41.933 Y240.517  
M204 S500
G1  X30.105  E0.4495
G1  Y231.320  E0.3495
G1  X41.933  E0.4495
G1  Y240.517  E0.3495
M204 S6000
G1  X42.390 Y240.974  
M204 S500
G1  X29.648  E0.4843
G1  Y230.863  E0.3843
G1  X42.390  E0.4843
G1  Y240.974  E0.3843
M204 S6000
G1  X42.847 Y241.431  
M204 S500
G1  X29.191  E0.5190
G1  Y230.406  E0.4190
G1  X42.847  E0.5190
G1  Y241.431  E0.4190
M204 S6000
G1  X43.304 Y241.888  
M204 S500
G1  X28.734  E0.5538
G1  Y229.949  E0.4538
G1  X43.304  E0.5538
G1  Y241.888  E0.4538
M204 S6000
G1  X43.761 Y242.345  
M204 S500
G1  X28.277  E0.5885
G1  Y229.492  E0.4885
G1  X43.761  E0.5885
G1  Y242.345  E0.4885
M204 S6000
G1  X44.218 Y242.802  
M204 S500
G1  X27.820  E0.6233
G1  Y229.035  E0.5232
G1  X44.218  E0.6233
G1  Y242.802  E0.5232
; WIPE_TOWER_END

; WIPE_START
G1 F33600
M204 S500
G1 X44.219 Y240.802 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S6000
G1 X137.218 Y137.218
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X118.782 Y137.218 E.68667
G1 X118.782 Y118.782 E.68667
G1 X137.218 Y118.782 E.68667
G1 X137.218 Y137.158 E.68443
M204 S6000
G1 X137.675 Y137.675 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X118.325 Y137.675 E.72071
G1 X118.325 Y118.325 E.72071
G1 X137.675 Y118.325 E.72071
G1 X137.675 Y137.615 E.71848
; WIPE_START
M73 P29 R15
G1 X135.675 Y137.621 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X135.853 Y129.991 Z.6 F42000
G1 X136.11 Y118.965 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50041
G1 F6300
M204 S500
G1 X136.829 Y119.684 E.03791
G1 X136.829 Y120.331 E.02412
G1 X135.669 Y119.171 E.06118
G1 X135.022 Y119.171 E.02412
G1 X136.829 Y120.978 E.09529
G1 X136.829 Y121.625 E.02412
G1 X134.375 Y119.171 E.1294
G1 X133.728 Y119.171 E.02412
G1 X136.829 Y122.272 E.16351
G1 X136.829 Y122.919 E.02412
G1 X133.081 Y119.171 E.19762
G1 X132.434 Y119.171 E.02412
G1 X136.829 Y123.566 E.23173
G1 X136.829 Y124.213 E.02412
G1 X131.787 Y119.171 E.26584
G1 X131.14 Y119.171 E.02412
G1 X136.829 Y124.86 E.29995
G1 X136.829 Y125.507 E.02412
G1 X130.493 Y119.171 E.33406
G1 X129.846 Y119.171 E.02412
G1 X136.829 Y126.154 E.36817
G1 X136.829 Y126.801 E.02412
G1 X129.199 Y119.171 E.40228
G1 X128.552 Y119.171 E.02412
G1 X136.829 Y127.448 E.43639
G1 X136.829 Y128.095 E.02412
G1 X127.905 Y119.171 E.4705
G1 X127.258 Y119.171 E.02412
G1 X136.829 Y128.742 E.50461
G1 X136.829 Y129.389 E.02412
G1 X126.611 Y119.171 E.53872
G1 X125.964 Y119.171 E.02412
G1 X136.829 Y130.036 E.57283
G1 X136.829 Y130.683 E.02412
G1 X125.317 Y119.171 E.60694
G1 X124.67 Y119.171 E.02412
G1 X136.829 Y131.33 E.64105
G1 X136.829 Y131.977 E.02412
G1 X124.023 Y119.171 E.67516
G1 X123.376 Y119.171 E.02412
G1 X136.829 Y132.624 E.70927
G1 X136.829 Y133.271 E.02412
G1 X122.729 Y119.171 E.74338
G1 X122.082 Y119.171 E.02412
G1 X136.829 Y133.918 E.77749
G1 X136.829 Y134.565 E.02412
G1 X121.435 Y119.171 E.8116
G1 X120.788 Y119.171 E.02412
G1 X136.829 Y135.212 E.84571
G1 X136.829 Y135.859 E.02412
G1 X120.141 Y119.171 E.87982
G1 X119.494 Y119.171 E.02412
G1 X136.829 Y136.506 E.91393
G1 X136.829 Y136.829 E.01207
G1 X136.506 Y136.829 E.01205
G1 X119.171 Y119.494 E.91395
G1 X119.171 Y120.141 E.02412
G1 X135.859 Y136.829 E.87984
G1 X135.212 Y136.829 E.02412
G1 X119.171 Y120.788 E.84573
G1 X119.171 Y121.435 E.02412
G1 X134.565 Y136.829 E.81162
G1 X133.918 Y136.829 E.02412
G1 X119.171 Y122.082 E.77751
G1 X119.171 Y122.729 E.02412
G1 X133.271 Y136.829 E.7434
G1 X132.624 Y136.829 E.02412
G1 X119.171 Y123.376 E.70929
G1 X119.171 Y124.023 E.02412
G1 X131.977 Y136.829 E.67518
M73 P30 R15
G1 X131.33 Y136.829 E.02412
G1 X119.171 Y124.67 E.64107
G1 X119.171 Y125.317 E.02412
G1 X130.683 Y136.829 E.60696
G1 X130.036 Y136.829 E.02412
G1 X119.171 Y125.964 E.57285
G1 X119.171 Y126.611 E.02412
G1 X129.389 Y136.829 E.53874
G1 X128.742 Y136.829 E.02412
G1 X119.171 Y127.258 E.50463
G1 X119.171 Y127.905 E.02412
G1 X128.095 Y136.829 E.47052
G1 X127.448 Y136.829 E.02412
G1 X119.171 Y128.552 E.43641
G1 X119.171 Y129.199 E.02412
G1 X126.801 Y136.829 E.4023
G1 X126.154 Y136.829 E.02412
G1 X119.171 Y129.846 E.36819
G1 X119.171 Y130.493 E.02412
G1 X125.507 Y136.829 E.33408
G1 X124.86 Y136.829 E.02412
G1 X119.171 Y131.14 E.29997
G1 X119.171 Y131.787 E.02412
G1 X124.213 Y136.829 E.26586
G1 X123.566 Y136.829 E.02412
G1 X119.171 Y132.434 E.23175
G1 X119.171 Y133.081 E.02412
G1 X122.919 Y136.829 E.19764
G1 X122.272 Y136.829 E.02412
G1 X119.171 Y133.728 E.16353
G1 X119.171 Y134.375 E.02412
G1 X121.625 Y136.829 E.12942
G1 X120.978 Y136.829 E.02412
G1 X119.171 Y135.022 E.09531
G1 X119.171 Y135.669 E.02412
G1 X120.331 Y136.829 E.0612
G1 X119.684 Y136.829 E.02412
G1 X118.965 Y136.11 E.03793
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X119.684 Y136.829 E-.38667
G1 X120.331 Y136.829 E-.24586
G1 X120.094 Y136.592 E-.12748
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/100
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S198.9
; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z0.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F6300
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
M204 S10000
G1  X41.476 Y240.059  
M204 S6000
G1  X30.562  E0.4148
G1  Y231.777  E0.3148
G1  X41.476  E0.4148
G1  Y240.059  E0.3148
M204 S10000
G1  X41.933 Y240.517  
M204 S6000
G1  X30.105  E0.4495
G1  Y231.320  E0.3495
G1  X41.933  E0.4495
G1  Y240.517  E0.3495
M204 S10000
G1  X42.390 Y240.974  
M204 S6000
G1  X29.648  E0.4843
G1  Y230.863  E0.3843
G1  X42.390  E0.4843
M73 P31 R15
G1  Y240.974  E0.3843
M204 S10000
G1  X42.847 Y241.431  
M204 S6000
G1  X29.191  E0.5190
G1  Y230.406  E0.4190
G1  X42.847  E0.5190
G1  Y241.431  E0.4190
M204 S10000
G1  X43.304 Y241.888  
M204 S6000
G1  X28.734  E0.5538
G1  Y229.949  E0.4538
G1  X43.304  E0.5538
G1  Y241.888  E0.4538
; WIPE_TOWER_END

; WIPE_START
G1 F6300
M204 S6000
G1 X43.305 Y239.887 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.467 Y137.234 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
M204 S6000
G1 X137.065 Y136.637 E.02611
G1 X137.065 Y136.101 E.01658
G1 X136.101 Y137.065 E.04214
G1 X135.564 Y137.065 E.01658
G1 X137.065 Y135.564 E.06559
G1 X137.065 Y135.028 E.01658
G1 X135.028 Y137.065 E.08903
G1 X134.491 Y137.065 E.01658
G1 X137.065 Y134.491 E.11248
G1 X137.065 Y133.955 E.01658
G1 X133.955 Y137.065 E.13593
G1 X133.419 Y137.065 E.01658
G1 X137.065 Y133.419 E.15937
G1 X137.065 Y132.882 E.01658
G1 X132.882 Y137.065 E.18282
G1 X132.346 Y137.065 E.01658
G1 X137.065 Y132.346 E.20627
G1 X137.065 Y131.809 E.01658
G1 X131.809 Y137.065 E.22971
G1 X131.273 Y137.065 E.01658
G1 X137.065 Y131.273 E.25316
G1 X137.065 Y130.737 E.01658
G1 X130.737 Y137.065 E.27661
G1 X130.2 Y137.065 E.01658
G1 X137.065 Y130.2 E.30006
G1 X137.065 Y129.664 E.01658
G1 X129.664 Y137.065 E.3235
G1 X129.127 Y137.065 E.01658
G1 X137.065 Y129.127 E.34695
G1 X137.065 Y128.591 E.01658
G1 X128.591 Y137.065 E.3704
G1 X128.054 Y137.065 E.01658
G1 X137.065 Y128.054 E.39384
G1 X137.065 Y127.518 E.01658
G1 X127.518 Y137.065 E.41729
G1 X126.982 Y137.065 E.01658
G1 X137.065 Y126.982 E.44074
G1 X137.065 Y126.445 E.01658
G1 X126.445 Y137.065 E.46418
G1 X125.909 Y137.065 E.01658
G1 X137.065 Y125.909 E.48763
G1 X137.065 Y125.372 E.01658
G1 X125.372 Y137.065 E.51108
G1 X124.836 Y137.065 E.01658
G1 X137.065 Y124.836 E.53452
G1 X137.065 Y124.3 E.01658
G1 X124.3 Y137.065 E.55797
G1 X123.763 Y137.065 E.01658
G1 X137.065 Y123.763 E.58142
G1 X137.065 Y123.227 E.01658
G1 X123.227 Y137.065 E.60486
G1 X122.69 Y137.065 E.01658
G1 X137.065 Y122.69 E.62831
G1 X137.065 Y122.154 E.01658
G1 X122.154 Y137.065 E.65176
G1 X121.618 Y137.065 E.01658
G1 X137.065 Y121.618 E.67521
G1 X137.065 Y121.081 E.01658
G1 X121.081 Y137.065 E.69865
G1 X120.545 Y137.065 E.01658
G1 X137.065 Y120.545 E.7221
G1 X137.065 Y120.008 E.01658
G1 X120.008 Y137.065 E.74555
G1 X119.472 Y137.065 E.01658
G1 X137.065 Y119.472 E.76899
G1 X137.065 Y118.935 E.01658
G1 X118.935 Y137.065 E.79244
G1 X118.935 Y136.528 E.01657
G1 X136.528 Y118.935 E.76901
G1 X135.992 Y118.935 E.01658
G1 X118.935 Y135.992 E.74556
G1 X118.935 Y135.456 E.01658
G1 X135.456 Y118.935 E.72211
G1 X134.919 Y118.935 E.01658
G1 X118.935 Y134.919 E.69867
G1 X118.935 Y134.383 E.01658
G1 X134.383 Y118.935 E.67522
G1 X133.846 Y118.935 E.01658
G1 X118.935 Y133.846 E.65177
G1 X118.935 Y133.31 E.01658
G1 X133.31 Y118.935 E.62833
G1 X132.774 Y118.935 E.01658
G1 X118.935 Y132.774 E.60488
G1 X118.935 Y132.237 E.01658
G1 X132.237 Y118.935 E.58143
G1 X131.701 Y118.935 E.01658
G1 X118.935 Y131.701 E.55799
G1 X118.935 Y131.164 E.01658
G1 X131.164 Y118.935 E.53454
G1 X130.628 Y118.935 E.01658
G1 X118.935 Y130.628 E.51109
G1 X118.935 Y130.092 E.01658
G1 X130.092 Y118.935 E.48765
G1 X129.555 Y118.935 E.01658
G1 X118.935 Y129.555 E.4642
G1 X118.935 Y129.019 E.01658
G1 X129.019 Y118.935 E.44075
G1 X128.482 Y118.935 E.01658
G1 X118.935 Y128.482 E.4173
G1 X118.935 Y127.946 E.01658
G1 X127.946 Y118.935 E.39386
G1 X127.409 Y118.935 E.01658
G1 X118.935 Y127.409 E.37041
G1 X118.935 Y126.873 E.01658
G1 X126.873 Y118.935 E.34696
G1 X126.337 Y118.935 E.01658
G1 X118.935 Y126.337 E.32352
G1 X118.935 Y125.8 E.01658
G1 X125.8 Y118.935 E.30007
G1 X125.264 Y118.935 E.01658
G1 X118.935 Y125.264 E.27662
G1 X118.935 Y124.727 E.01658
G1 X124.727 Y118.935 E.25318
G1 X124.191 Y118.935 E.01658
G1 X118.935 Y124.191 E.22973
G1 X118.935 Y123.655 E.01658
G1 X123.655 Y118.935 E.20628
G1 X123.118 Y118.935 E.01658
G1 X118.935 Y123.118 E.18284
G1 X118.935 Y122.582 E.01658
G1 X122.582 Y118.935 E.15939
G1 X122.045 Y118.935 E.01658
G1 X118.935 Y122.045 E.13594
G1 X118.935 Y121.509 E.01658
G1 X121.509 Y118.935 E.11249
G1 X120.973 Y118.935 E.01658
G1 X118.935 Y120.973 E.08905
G1 X118.935 Y120.436 E.01658
G1 X120.436 Y118.935 E.0656
G1 X119.9 Y118.935 E.01658
G1 X118.935 Y119.9 E.04215
G1 X118.935 Y119.363 E.01658
G1 X119.533 Y118.766 E.02612
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X118.935 Y119.363 E-.32117
G1 X118.935 Y119.9 E-.20384
G1 X119.373 Y119.462 E-.23499
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/100
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S201.45
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X261 Y250 F20000
      M400 P200
      G39 S1
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z0.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
M204 S10000
G1  X41.476 Y240.059  
M204 S6000
G1  X30.562  E0.4148
G1  Y231.777  E0.3148
G1  X41.476  E0.4148
M73 P32 R15
G1  Y240.059  E0.3148
M204 S10000
G1  X41.933 Y240.517  
M204 S6000
G1  X30.105  E0.4495
G1  Y231.320  E0.3495
G1  X41.933  E0.4495
G1  Y240.517  E0.3495
M204 S10000
G1  X42.390 Y240.974  
M204 S6000
G1  X29.648  E0.4843
G1  Y230.863  E0.3843
G1  X42.390  E0.4843
G1  Y240.974  E0.3843
M204 S10000
G1  X42.847 Y241.431  
M204 S6000
G1  X29.191  E0.5190
G1  Y230.406  E0.4190
G1  X42.847  E0.5190
G1  Y241.431  E0.4190
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X42.848 Y239.43 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.394 Y130.128 Z1 F42000
G1 X137.234 Y119.533 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42222
G1 F15000
M204 S6000
G1 X136.637 Y118.935 E.02611
G1 X136.101 Y118.935 E.01658
G1 X137.065 Y119.899 E.04214
G1 X137.065 Y120.436 E.01658
G1 X135.564 Y118.935 E.06559
G1 X135.028 Y118.935 E.01658
G1 X137.065 Y120.972 E.08903
G1 X137.065 Y121.509 E.01658
G1 X134.491 Y118.935 E.11248
G1 X133.955 Y118.935 E.01658
G1 X137.065 Y122.045 E.13593
G1 X137.065 Y122.581 E.01658
G1 X133.419 Y118.935 E.15937
G1 X132.882 Y118.935 E.01658
G1 X137.065 Y123.118 E.18282
M73 P32 R14
G1 X137.065 Y123.654 E.01658
G1 X132.346 Y118.935 E.20627
G1 X131.809 Y118.935 E.01658
G1 X137.065 Y124.191 E.22971
G1 X137.065 Y124.727 E.01658
G1 X131.273 Y118.935 E.25316
G1 X130.737 Y118.935 E.01658
G1 X137.065 Y125.263 E.27661
G1 X137.065 Y125.8 E.01658
G1 X130.2 Y118.935 E.30005
G1 X129.664 Y118.935 E.01658
G1 X137.065 Y126.336 E.3235
G1 X137.065 Y126.873 E.01658
G1 X129.127 Y118.935 E.34695
G1 X128.591 Y118.935 E.01658
G1 X137.065 Y127.409 E.3704
G1 X137.065 Y127.946 E.01658
G1 X128.054 Y118.935 E.39384
G1 X127.518 Y118.935 E.01658
G1 X137.065 Y128.482 E.41729
G1 X137.065 Y129.018 E.01658
G1 X126.982 Y118.935 E.44074
G1 X126.445 Y118.935 E.01658
G1 X137.065 Y129.555 E.46418
G1 X137.065 Y130.091 E.01658
G1 X125.909 Y118.935 E.48763
G1 X125.372 Y118.935 E.01658
G1 X137.065 Y130.628 E.51108
G1 X137.065 Y131.164 E.01658
G1 X124.836 Y118.935 E.53452
G1 X124.3 Y118.935 E.01658
G1 X137.065 Y131.7 E.55797
G1 X137.065 Y132.237 E.01658
G1 X123.763 Y118.935 E.58142
G1 X123.227 Y118.935 E.01658
G1 X137.065 Y132.773 E.60486
G1 X137.065 Y133.31 E.01658
G1 X122.69 Y118.935 E.62831
G1 X122.154 Y118.935 E.01658
G1 X137.065 Y133.846 E.65176
G1 X137.065 Y134.382 E.01658
G1 X121.618 Y118.935 E.67521
G1 X121.081 Y118.935 E.01658
G1 X137.065 Y134.919 E.69865
G1 X137.065 Y135.455 E.01658
G1 X120.545 Y118.935 E.7221
G1 X120.008 Y118.935 E.01658
G1 X137.065 Y135.992 E.74555
G1 X137.065 Y136.528 E.01658
G1 X119.472 Y118.935 E.76899
G1 X118.935 Y118.935 E.01658
G1 X137.065 Y137.065 E.79244
G1 X136.528 Y137.065 E.01657
G1 X118.935 Y119.472 E.76901
G1 X118.935 Y120.008 E.01658
G1 X135.992 Y137.065 E.74556
G1 X135.456 Y137.065 E.01658
G1 X118.935 Y120.544 E.72211
G1 X118.935 Y121.081 E.01658
G1 X134.919 Y137.065 E.69867
G1 X134.383 Y137.065 E.01658
G1 X118.935 Y121.617 E.67522
G1 X118.935 Y122.154 E.01658
G1 X133.846 Y137.065 E.65177
G1 X133.31 Y137.065 E.01658
G1 X118.935 Y122.69 E.62833
G1 X118.935 Y123.226 E.01658
G1 X132.774 Y137.065 E.60488
G1 X132.237 Y137.065 E.01658
G1 X118.935 Y123.763 E.58143
G1 X118.935 Y124.299 E.01658
G1 X131.701 Y137.065 E.55799
G1 X131.164 Y137.065 E.01658
G1 X118.935 Y124.836 E.53454
G1 X118.935 Y125.372 E.01658
G1 X130.628 Y137.065 E.51109
G1 X130.092 Y137.065 E.01658
G1 X118.935 Y125.908 E.48765
G1 X118.935 Y126.445 E.01658
G1 X129.555 Y137.065 E.4642
G1 X129.019 Y137.065 E.01658
G1 X118.935 Y126.981 E.44075
G1 X118.935 Y127.518 E.01658
G1 X128.482 Y137.065 E.4173
G1 X127.946 Y137.065 E.01658
G1 X118.935 Y128.054 E.39386
G1 X118.935 Y128.591 E.01658
G1 X127.409 Y137.065 E.37041
G1 X126.873 Y137.065 E.01658
G1 X118.935 Y129.127 E.34696
G1 X118.935 Y129.663 E.01658
G1 X126.337 Y137.065 E.32352
G1 X125.8 Y137.065 E.01658
G1 X118.935 Y130.2 E.30007
G1 X118.935 Y130.736 E.01658
G1 X125.264 Y137.065 E.27662
G1 X124.727 Y137.065 E.01658
G1 X118.935 Y131.273 E.25318
G1 X118.935 Y131.809 E.01658
G1 X124.191 Y137.065 E.22973
G1 X123.655 Y137.065 E.01658
G1 X118.935 Y132.345 E.20628
G1 X118.935 Y132.882 E.01658
G1 X123.118 Y137.065 E.18283
G1 X122.582 Y137.065 E.01658
G1 X118.935 Y133.418 E.15939
G1 X118.935 Y133.955 E.01658
G1 X122.045 Y137.065 E.13594
G1 X121.509 Y137.065 E.01658
G1 X118.935 Y134.491 E.11249
G1 X118.935 Y135.027 E.01658
G1 X120.973 Y137.065 E.08905
G1 X120.436 Y137.065 E.01658
G1 X118.935 Y135.564 E.0656
G1 X118.935 Y136.1 E.01658
M73 P33 R14
G1 X119.9 Y137.065 E.04215
G1 X119.363 Y137.065 E.01658
G1 X118.766 Y136.467 E.02612
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X119.363 Y137.065 E-.32117
G1 X119.9 Y137.065 E-.20384
G1 X119.462 Y136.627 E-.23499
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/100
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z1.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
M204 S10000
G1  X41.476 Y240.059  
M204 S6000
G1  X30.562  E0.4148
G1  Y231.777  E0.3148
G1  X41.476  E0.4148
G1  Y240.059  E0.3148
M204 S10000
G1  X41.933 Y240.517  
M204 S6000
G1  X30.105  E0.4495
G1  Y231.320  E0.3495
G1  X41.933  E0.4495
G1  Y240.517  E0.3495
M204 S10000
G1  X42.390 Y240.974  
M204 S6000
G1  X29.648  E0.4843
G1  Y230.863  E0.3843
G1  X42.390  E0.4843
G1  Y240.974  E0.3843
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X42.391 Y238.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F10916
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10916
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
G1 F12000
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y137.05 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10916
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X129.374 Y118.95 E.48898
G1 X126.626 Y118.95 E.09114
G1 X137.05 Y129.374 E.48898
G1 X137.05 Y126.626 E.09114
G1 X126.626 Y137.05 E.48898
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F10916
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X137.05 Y123.326 F42000
G1 F10916
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/100
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z1.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z1
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z1
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
M204 S10000
G1  X41.476 Y240.059  
M204 S6000
G1  X30.562  E0.4148
G1  Y231.777  E0.3148
G1  X41.476  E0.4148
G1  Y240.059  E0.3148
M204 S10000
G1  X41.933 Y240.517  
M204 S6000
G1  X30.105  E0.4495
G1  Y231.320  E0.3495
G1  X41.933  E0.4495
G1  Y240.517  E0.3495
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.934 Y238.516 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8397
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8397
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
G1 F12000
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8397
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
M73 P34 R14
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F8397
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F8397
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X137.05 Y126.626 E.48898
G1 X137.05 Y129.374 E.09114
G1 X126.626 Y118.95 E.48898
G1 X129.374 Y118.95 E.09114
G1 X118.95 Y129.374 E.48898
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/100
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z1.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z1.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z1.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
M204 S10000
G1  X41.476 Y240.059  
M204 S6000
G1  X30.562  E0.4148
G1  Y231.777  E0.3148
G1  X41.476  E0.4148
G1  Y240.059  E0.3148
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.477 Y238.059 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6990
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
G1 F12000
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y137.05 Z1.6 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X129.374 Y118.95 E.48898
G1 X126.626 Y118.95 E.09114
G1 X137.05 Y129.374 E.48898
G1 X137.05 Y126.626 E.09114
G1 X126.626 Y137.05 E.48898
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6990
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X137.05 Y123.326 F42000
G1 F6990
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/100
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z1.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z1.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z1.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5949
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P35 R14
G1 F5949
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
G1 F12000
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5949
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F5949
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F5949
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X137.05 Y126.626 E.48898
G1 X137.05 Y129.374 E.09114
G1 X126.626 Y118.95 E.48898
G1 X129.374 Y118.95 E.09114
G1 X118.95 Y129.374 E.48898
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/100
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z1.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z1.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z1.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F7341
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7341
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
G1 F12000
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z2 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7341
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X119.327 Y119.327 E.83138
G1 X121.321 Y119.327 E.06612
G1 X119.327 Y121.321 E.0935
G1 X119.327 Y122.949 E.05401
M204 S10000
G1 X118.965 Y123.45 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38328
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X118.965 Y119.124 E.11998
G1 X118.992 Y118.992 E.00374
G1 X119.124 Y118.965 E.00374
G1 X126.922 Y118.965 E.21627
; Slow Down End
M204 S10000
G1 X125.375 Y119.327 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7341
M204 S6000
G1 X127.003 Y119.327 E.05401
G1 X136.673 Y128.997 E.4536
G1 X136.673 Y127.003 E.06612
G1 X126.626 Y137.05 E.47129
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X128.997 Y119.327 E.47129
G1 X130.625 Y119.327 E.05401
M204 S10000
G1 X129.253 Y118.965 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383369
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X136.876 Y118.965 E.21147
G1 X137.008 Y118.992 E.00374
G1 X137.035 Y119.124 E.00374
G1 X137.035 Y121.174 E.05687
; Slow Down End
M204 S10000
G1 X137.035 Y131.987 F42000
; Slow Down Start
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X137.035 Y122.632 E.25918
; Slow Down End
M204 S10000
G1 X137.05 Y122.038 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7341
M204 S6000
G1 X137.05 Y121.732 E.01015
G1 X136.673 Y122.11 E.01769
G1 X136.673 Y121.321 E.02617
G1 X134.679 Y119.327 E.0935
G1 X136.673 Y119.327 E.06612
G1 X118.95 Y137.05 E.83138
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/100
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z2.000
M106 S255
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z1.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
M73 P36 R14
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z1.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.919 Y133.616 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X134.767 Y134.767 E.05401
G1 X137.05 Y137.05 E.10706
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X134.192 Y134.726 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.41502
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X137.028 Y131.89 E.22108
G1 X137.028 Y131.232 E.03625
G1 X134.006 Y134.254 E.23555
G1 X133.678 Y133.925 E.02563
G1 X137.028 Y130.575 E.26118
G1 X137.028 Y129.917 E.03625
G1 X133.349 Y133.597 E.28681
G1 X133.02 Y133.268 E.02563
G1 X137.028 Y129.259 E.31244
G1 X137.028 Y128.602 E.03625
G1 X132.691 Y132.939 E.33807
G1 X132.362 Y132.61 E.02563
G1 X137.028 Y127.944 E.3637
G1 X137.028 Y127.286 E.03625
G1 X132.033 Y132.281 E.38933
G1 X131.705 Y131.952 E.02563
G1 X137.028 Y126.629 E.41496
G1 X137.028 Y125.971 E.03625
G1 X131.376 Y131.624 E.4406
G1 X131.047 Y131.295 E.02563
G1 X137.028 Y125.314 E.46623
G1 X137.028 Y124.656 E.03625
G1 X134.556 Y127.128 E.1927
G1 X134.227 Y126.799 E.02563
G1 X137.028 Y123.998 E.21833
G1 X137.028 Y123.341 E.03625
G1 X133.899 Y126.47 E.24396
G1 X133.57 Y126.142 E.02563
G1 X137.231 Y122.48 E.28537
M106 S201.45
M106 S255
M204 S10000
G1 X136.492 Y121.674 F42000
; LINE_WIDTH: 0.41408
G1 F3000
M204 S6000
G1 X137.028 Y121.138 E.04163
G1 X137.028 Y120.481 E.03601
G1 X136.307 Y121.203 E.05598
G1 X136.163 Y121.059 E.01118
G1 X132.325 Y124.897 E.29781
G1 X132.141 Y124.713 E.01428
G1 X137.028 Y119.825 E.37925
G1 X137.028 Y119.169 E.03601
G1 X131.813 Y124.384 E.40471
G1 X131.484 Y124.056 E.02546
G1 X136.569 Y118.972 E.39454
G1 X135.913 Y118.972 E.03601
G1 X131.156 Y123.728 E.36907
G1 X130.828 Y123.4 E.02546
G1 X135.256 Y118.972 E.34361
G1 X134.6 Y118.972 E.03601
G1 X130.5 Y123.072 E.31815
G1 X130.172 Y122.744 E.02546
G1 X133.944 Y118.972 E.29268
G1 X133.287 Y118.972 E.03601
G1 X129.844 Y122.415 E.26722
G1 X129.516 Y122.087 E.02546
G1 X132.631 Y118.972 E.24176
G1 X131.975 Y118.972 E.03601
G1 X129.187 Y121.759 E.21629
G1 X128.859 Y121.431 E.02546
G1 X131.319 Y118.972 E.19083
G1 X130.662 Y118.972 E.03601
G1 X128.531 Y121.103 E.16537
G1 X128.203 Y120.775 E.02546
G1 X130.006 Y118.972 E.13991
G1 X129.35 Y118.972 E.03601
G1 X127.732 Y120.59 E.12555
M106 S201.45
M106 S255
M204 S10000
G1 X126.537 Y121.164 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X127.691 Y120.015 E.05401
G1 X127.264 Y120.442 E.02003
G1 X127.573 Y120.751 E.01451
G1 X118.95 Y129.374 E.40451
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X126.626 Y137.05 E.09114
G1 X131.411 Y132.265 E.22447
G1 X130.393 Y131.247 E.04775
G1 X130.82 Y130.82 E.02003
G1 X123.85 Y123.85 E.32697
G1 X123.423 Y124.277 E.02003
G1 X122.699 Y123.553 E.03399
M204 S10000
G1 X123.274 Y123.808 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.41759
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X127.503 Y119.579 E.33373
G1 X127.172 Y119.248 E.02609
G1 X123.086 Y123.334 E.32243
G1 X122.756 Y123.004 E.02609
G1 X126.788 Y118.972 E.31818
G1 X126.126 Y118.972 E.0369
G1 X122.425 Y122.673 E.29209
G1 X122.095 Y122.342 E.02609
G1 X125.465 Y118.972 E.26599
G1 X124.804 Y118.972 E.0369
G1 X121.764 Y122.012 E.2399
G1 X121.433 Y121.681 E.02609
G1 X124.143 Y118.972 E.21381
G1 X123.481 Y118.972 E.0369
G1 X121.103 Y121.35 E.18772
G1 X121.037 Y121.285 E.00519
G1 X118.972 Y123.35 E.16297
G1 X118.972 Y122.82 E.02956
G1 X122.82 Y118.972 E.30369
G1 X122.159 Y118.972 E.0369
G1 X118.972 Y122.159 E.25151
G1 X118.972 Y121.497 E.0369
G1 X121.497 Y118.972 E.19932
G1 X120.836 Y118.972 E.0369
G1 X118.972 Y120.836 E.14714
G1 X118.972 Y120.175 E.0369
G1 X120.175 Y118.972 E.09495
G1 X119.514 Y118.972 E.0369
G1 X118.769 Y119.716 E.05875
M106 S201.45
M204 S10000
G1 X118.95 Y132.674 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X131.411 Y124.589 E.58456
G1 X132.325 Y125.503 E.04286
G1 X132.752 Y125.076 E.02003
G1 X133.385 Y125.709 E.02972
G1 X134.537 Y124.558 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X133.385 Y125.709 E-.61876
G1 X133.122 Y125.446 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/100
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z2.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F7865
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7865
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
G1 F12000
M204 S6000
M73 P37 R13
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7865
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X121.005 Y121.005 E.75267
G1 X119.643 Y121.005 E.0452
G1 X118.95 Y121.698 E.03248
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X119.804 Y119.804 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53094
G1 F7865
M204 S6000
G1 X125.389 Y119.804 E.22212
M204 S10000
G1 X125.882 Y120.236 F42000
; LINE_WIDTH: 0.41999
G1 F7865
M204 S6000
G1 X125.882 Y119.371 E.02658
G1 X119.371 Y119.371 E.20005
G1 X119.371 Y120.236 E.02658
G1 X125.822 Y120.236 E.1982
M204 S10000
G1 X126.247 Y120.613 F42000
G1 F7865
M204 S6000
G2 X126.259 Y118.994 I-57.342 J-1.214 E.04976
G1 X118.994 Y118.994 E.22322
G1 X118.994 Y120.613 E.04975
G1 X126.187 Y120.613 E.22102
M204 S10000
G1 X126.651 Y120.603 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7865
M204 S6000
G1 X126.651 Y118.975 E.05401
G1 X134.995 Y127.319 E.39143
G1 X134.995 Y128.681 E.0452
G1 X126.626 Y137.05 E.39258
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X129.319 Y119.005 E.4864
G1 X129.319 Y120.634 E.05401
M204 S10000
G1 X130.52 Y119.804 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53093
G1 F7865
M204 S6000
G1 X136.136 Y119.804 E.22333
M204 S10000
G1 X130.088 Y120.236 F42000
; LINE_WIDTH: 0.41999
G1 F7865
M204 S6000
G1 X136.629 Y120.236 E.20099
G1 X136.629 Y119.371 E.02658
G1 X130.088 Y119.371 E.20099
G1 X130.088 Y120.176 E.02474
M204 S10000
G1 X129.711 Y120.602 F42000
G1 F7865
M204 S6000
G1 X137.006 Y120.613 E.22416
G1 X137.006 Y118.994 E.04975
G1 X129.711 Y118.994 E.22416
G1 X129.711 Y120.542 E.04756
M204 S10000
G1 X137.05 Y123.326 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7865
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X136.357 Y121.005 E.03248
G1 X134.995 Y121.005 E.0452
G1 X118.95 Y137.05 E.75267
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X136.196 Y130.631 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53092
G1 F7865
M204 S6000
G1 X136.196 Y125.439 E.20649
M204 S10000
G1 X135.387 Y125.379 F42000
; LINE_WIDTH: 0.41999
G1 F7865
M204 S6000
G1 X135.387 Y131.43 E.18592
G2 X137.006 Y131.441 I1.214 J-57.342 E.04976
G1 X137.006 Y124.569 E.21115
G1 X135.398 Y124.569 E.0494
G1 X135.387 Y125.319 E.02304
M204 S10000
G1 X135.764 Y124.946 F42000
G1 F7865
M204 S6000
G1 X135.764 Y131.064 E.18798
G1 X136.629 Y131.064 E.02658
G1 X136.629 Y124.946 E.18798
G1 X135.824 Y124.946 E.02474
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X136.629 Y124.946 E-.30593
G1 X136.629 Y126.141 E-.45407
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/100
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.6 F4000
            G39.3 S1
            G0 Z2.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z2.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z2.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z2.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F7986
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7986
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
G1 F12000
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.537 Y130.14 Z2.6 F42000
G1 X137.006 Y125.379 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F7986
M204 S6000
G1 X137.006 Y124.569 E.02488
G1 X135.398 Y124.569 E.0494
G1 X135.387 Y131.43 E.2108
G2 X137.006 Y131.441 I1.214 J-57.342 E.04976
G1 X137.006 Y125.439 E.18443
M204 S10000
G1 X136.629 Y125.379 F42000
G1 F7986
M204 S6000
G1 X136.629 Y124.946 E.01329
G1 X135.764 Y124.946 E.02658
G1 X135.764 Y131.064 E.18798
G1 X136.629 Y131.064 E.02658
G1 X136.629 Y125.439 E.17285
M204 S10000
G1 X136.196 Y130.631 F42000
; LINE_WIDTH: 0.53092
G1 F7986
M204 S6000
G1 X136.196 Y125.439 E.20649
M204 S10000
G1 X137.006 Y119.804 F42000
; LINE_WIDTH: 0.41999
G1 F7986
M204 S6000
G1 X137.006 Y118.994 E.02488
G1 X129.711 Y118.994 E.22416
G1 X129.711 Y120.602 E.0494
G1 X137.006 Y120.613 E.22416
G1 X137.006 Y119.864 E.02303
M204 S10000
G1 X136.629 Y119.804 F42000
G1 F7986
M204 S6000
G1 X136.629 Y119.371 E.01329
G1 X130.088 Y119.371 E.20099
G1 X130.088 Y120.236 E.02658
G1 X136.629 Y120.236 E.20099
G1 X136.629 Y119.864 E.01145
M204 S10000
G1 X130.52 Y119.804 F42000
; LINE_WIDTH: 0.53093
G1 F7986
M204 S6000
G1 X136.136 Y119.804 E.22333
M204 S10000
G1 X129.319 Y120.634 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7986
M204 S6000
G1 X129.319 Y119.005 E.05401
G1 X118.95 Y129.374 E.4864
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X126.626 Y137.05 E.09114
G1 X134.995 Y128.681 E.39258
G1 X134.995 Y127.319 E.0452
G1 X126.651 Y118.975 E.39143
G1 X126.651 Y120.603 E.05401
M204 S10000
G1 X126.259 Y119.804 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F7986
M204 S6000
G1 X126.259 Y118.994 E.02488
M73 P38 R13
G1 X118.994 Y118.994 E.22322
G1 X118.994 Y120.613 E.04975
G1 X126.247 Y120.613 E.22287
G1 X126.258 Y119.864 E.02304
M204 S10000
G1 X125.882 Y119.804 F42000
G1 F7986
M204 S6000
G1 X125.882 Y119.371 E.01329
G1 X119.371 Y119.371 E.20005
G1 X119.371 Y120.236 E.02658
G1 X125.882 Y120.236 E.20005
G1 X125.882 Y119.864 E.01145
M204 S10000
G1 X119.804 Y119.804 F42000
; LINE_WIDTH: 0.53094
G1 F7986
M204 S6000
G1 X125.389 Y119.804 E.22212
M204 S10000
G1 X118.95 Y123.326 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7986
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X119.643 Y121.005 E.03248
G1 X121.005 Y121.005 E.0452
G1 X137.05 Y137.05 E.75267
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F7986
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X134.995 Y121.005 E.75267
G1 X136.357 Y121.005 E.0452
G1 X137.05 Y121.698 E.03248
G1 X137.05 Y123.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y121.698 E-.61876
G1 X136.787 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/100
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z2.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z2.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z2.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F7962
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7962
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
G1 F12000
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7962
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X121.005 Y121.005 E.75267
G1 X119.643 Y121.005 E.0452
G1 X118.95 Y121.698 E.03248
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X126.259 Y119.804 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F7962
M204 S6000
G1 X126.259 Y118.994 E.02488
G1 X118.994 Y118.994 E.22322
G1 X118.994 Y120.613 E.04975
G1 X126.247 Y120.613 E.22287
G1 X126.258 Y119.864 E.02304
M204 S10000
G1 X125.882 Y119.804 F42000
G1 F7962
M204 S6000
G1 X125.882 Y119.371 E.01329
G1 X119.371 Y119.371 E.20005
G1 X119.371 Y120.236 E.02658
G1 X125.882 Y120.236 E.20005
G1 X125.882 Y119.864 E.01145
M204 S10000
G1 X119.804 Y119.804 F42000
; LINE_WIDTH: 0.53094
G1 F7962
M204 S6000
G1 X125.389 Y119.804 E.22212
M204 S10000
G1 X126.651 Y120.603 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7962
M204 S6000
G1 X126.651 Y118.975 E.05401
G1 X134.995 Y127.319 E.39143
G1 X134.995 Y128.681 E.0452
G1 X126.626 Y137.05 E.39258
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X129.319 Y119.005 E.4864
G1 X129.319 Y120.634 E.05401
M204 S10000
G1 X137.006 Y119.804 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F7962
M204 S6000
G1 X137.006 Y118.994 E.02488
G1 X129.711 Y118.994 E.22416
G1 X129.711 Y120.602 E.0494
G1 X137.006 Y120.613 E.22416
G1 X137.006 Y119.864 E.02303
M204 S10000
G1 X136.629 Y119.804 F42000
G1 F7962
M204 S6000
G1 X136.629 Y119.371 E.01329
G1 X130.088 Y119.371 E.20099
G1 X130.088 Y120.236 E.02658
G1 X136.629 Y120.236 E.20099
G1 X136.629 Y119.864 E.01145
M204 S10000
G1 X130.52 Y119.804 F42000
; LINE_WIDTH: 0.53093
G1 F7962
M204 S6000
G1 X136.136 Y119.804 E.22333
M204 S10000
G1 X137.05 Y123.326 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7962
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X136.357 Y121.005 E.03248
G1 X134.995 Y121.005 E.0452
G1 X118.95 Y137.05 E.75267
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X137.006 Y125.379 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F7962
M204 S6000
G1 X137.006 Y124.569 E.02488
G1 X135.398 Y124.569 E.0494
G1 X135.387 Y131.43 E.2108
G2 X137.006 Y131.441 I1.214 J-57.342 E.04976
G1 X137.006 Y125.439 E.18443
M204 S10000
G1 X136.629 Y125.379 F42000
G1 F7962
M204 S6000
G1 X136.629 Y124.946 E.01329
G1 X135.764 Y124.946 E.02658
G1 X135.764 Y131.064 E.18798
G1 X136.629 Y131.064 E.02658
G1 X136.629 Y125.439 E.17285
M204 S10000
G1 X136.196 Y130.631 F42000
; LINE_WIDTH: 0.53092
G1 F7962
M204 S6000
G1 X136.196 Y125.439 E.20649
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X136.196 Y127.439 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/100
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z2.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z2.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F12000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z2.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F12000
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9007
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X118.9 Y118.602 E.00988
G1 X118.9 Y120.578 E.06554
G1 X126.223 Y120.578 E.24293
G1 X126.223 Y118.602 E.06554
G1 X129.746 Y118.602 E.11686
G1 X129.746 Y120.578 E.06554
G1 X137.101 Y120.578 E.24396
G1 X137.101 Y118.602 E.06554
G1 X137.398 Y118.602 E.00987
G1 X137.398 Y124.605 E.19912
G1 X135.422 Y124.605 E.06554
G1 X135.422 Y131.406 E.2256
G1 X137.398 Y131.406 E.06554
G1 X137.398 Y137.338 E.19679
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P39 R13
G1 F9007
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
G1 F12000
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.173 Y137.252 Z3 F42000
G1 X124.998 Y137.05 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9007
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.074 Y128.602 E.3963
G1 X135.074 Y127.398 E.03994
G1 X126.626 Y118.95 E.3963
G1 X129.374 Y118.95 E.09114
G1 X118.95 Y129.374 E.48898
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F9007
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X135.074 Y120.926 E.75639
G1 X136.278 Y120.926 E.03994
G1 X137.05 Y121.698 E.0362
G1 X137.05 Y123.326 E.05401
; WIPE_START
G1 F15476.087
G1 X137.05 Y121.698 E-.61876
G1 X136.787 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.825 Y124.827 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9007
M204 S2000
G1 X137.583 Y125.584 E.0329
G1 X137.583 Y126.118
G1 X136.292 Y124.827 E.05608
G1 X135.759 Y124.827
G1 X137.583 Y126.651 E.07925
G1 X137.583 Y127.184
G1 X135.645 Y125.246 E.08421
G1 X135.645 Y125.78
G1 X137.583 Y127.717 E.08421
G1 X137.583 Y128.251
G1 X135.645 Y126.313 E.08421
G1 X135.645 Y126.846
G1 X137.583 Y128.784 E.08421
G1 X137.583 Y129.317
G1 X135.645 Y127.379 E.08421
G1 X135.645 Y127.913
G1 X137.583 Y129.85 E.08421
G1 X137.583 Y130.384
G1 X135.645 Y128.446 E.08421
G1 X135.645 Y128.979
G1 X137.583 Y130.917 E.08421
G1 X137.315 Y131.183
G1 X135.645 Y129.512 E.0726
G1 X135.645 Y130.046
G1 X136.782 Y131.183 E.04943
G1 X136.249 Y131.183
G1 X135.645 Y130.579 E.02626
; WIPE_START
G1 F12000
M204 S6000
G1 X136.249 Y131.183 E-.3247
G1 X136.782 Y131.183 E-.20264
G1 X136.349 Y130.75 E-.23267
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.307 Y123.118 Z3 F42000
G1 X136.281 Y118.417 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9007
M204 S2000
G1 X136.878 Y119.014 E.02593
G1 X136.878 Y119.547
G1 X135.748 Y118.417 E.0491
G1 X135.215 Y118.417
G1 X136.878 Y120.08 E.07227
G1 X136.62 Y120.355
G1 X134.682 Y118.417 E.08421
G1 X134.148 Y118.417
G1 X136.086 Y120.355 E.08421
G1 X135.553 Y120.355
G1 X133.615 Y118.417 E.08421
G1 X133.082 Y118.417
G1 X135.02 Y120.355 E.08421
G1 X134.487 Y120.355
G1 X132.549 Y118.417 E.08421
G1 X132.015 Y118.417
G1 X133.953 Y120.355 E.08421
G1 X133.42 Y120.355
G1 X131.482 Y118.417 E.08421
G1 X130.949 Y118.417
G1 X132.887 Y120.355 E.08421
G1 X132.354 Y120.355
G1 X130.416 Y118.417 E.08421
G1 X129.969 Y118.504
G1 X131.82 Y120.355 E.08046
G1 X131.287 Y120.355
G1 X129.969 Y119.037 E.05729
G1 X129.969 Y119.57
G1 X130.754 Y120.355 E.03412
; WIPE_START
G1 F12000
M204 S6000
G1 X129.969 Y119.57 E-.42194
G1 X129.969 Y119.037 E-.20264
G1 X130.221 Y119.289 E-.13542
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.001 Y118.802 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F9007
M204 S2000
G1 X125.616 Y118.417 E.01671
G1 X125.083 Y118.417
G1 X126.001 Y119.335 E.03988
G1 X126.001 Y119.868
G1 X124.55 Y118.417 E.06305
G1 X124.017 Y118.417
G1 X125.954 Y120.355 E.08421
G1 X125.421 Y120.355
G1 X123.483 Y118.417 E.08421
G1 X122.95 Y118.417
G1 X124.888 Y120.355 E.08421
G1 X124.355 Y120.355
G1 X122.417 Y118.417 E.08421
G1 X121.883 Y118.417
G1 X123.821 Y120.355 E.08421
G1 X123.288 Y120.355
G1 X121.35 Y118.417 E.08421
G1 X120.817 Y118.417
G1 X122.755 Y120.355 E.08421
G1 X122.222 Y120.355
G1 X120.284 Y118.417 E.08421
G1 X119.75 Y118.417
G1 X121.688 Y120.355 E.08421
G1 X121.155 Y120.355
G1 X119.217 Y118.417 E.08421
G1 X119.122 Y118.856
G1 X120.622 Y120.355 E.06516
G1 X120.089 Y120.355
G1 X119.122 Y119.389 E.04199
G1 X119.122 Y119.922
G1 X119.555 Y120.355 E.01882
; WIPE_START
G1 F12000
M204 S6000
G1 X119.122 Y119.922 E-.23273
G1 X119.122 Y119.389 E-.20264
G1 X119.726 Y119.993 E-.32464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.95 Y123.326 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9007
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X119.722 Y120.926 E.0362
G1 X120.926 Y120.926 E.03994
G1 X137.05 Y137.05 E.75639
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y134.302 E-.61876
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/100
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.2 F4000
            G39.3 S1
            G0 Z3.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z3.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z2.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z2.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6715
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X119.375 Y118.602 E.02566
G1 X119.375 Y120.102 E.04976
G1 X125.747 Y120.102 E.21137
G1 X125.747 Y118.602 E.04976
G1 X130.222 Y118.602 E.14842
G1 X130.222 Y120.102 E.04976
G1 X136.625 Y120.102 E.2124
G1 X136.625 Y118.602 E.04976
G1 X137.398 Y118.602 E.02565
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6715
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X119.768 Y118.21 E.04786
G1 X119.768 Y119.71 E.04609
G1 X125.355 Y119.71 E.1717
G1 X125.355 Y118.21 E.04609
G1 X130.614 Y118.21 E.16158
G1 X130.614 Y119.71 E.04609
G1 X136.233 Y119.71 E.17265
G1 X136.233 Y118.21 E.04609
G1 X137.79 Y118.21 E.04785
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6715
M204 S6000
M73 P40 R13
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X121.005 Y121.005 E.75267
G1 X119.643 Y121.005 E.0452
G1 X118.95 Y121.698 E.03248
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.952 Y120.655 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F6715
M204 S6000
G1 X119.423 Y120.654 E.01304
; LINE_WIDTH: 0.402455
G1 X119.477 Y120.629 E.00176
; LINE_WIDTH: 0.441525
G1 X119.532 Y120.604 E.00195
; LINE_WIDTH: 0.480595
G1 X119.586 Y120.579 E.00215
; LINE_WIDTH: 0.539016
G1 X119.641 Y120.554 E.00243
G1 X125.951 Y120.554 E.25508
; LINE_WIDTH: 0.561335
G1 X126.056 Y120.532 E.00453
; LINE_WIDTH: 0.595209
G1 X126.161 Y120.509 E.00482
G1 X126.207 Y120.214 E.01344
; LINE_WIDTH: 0.55522
G1 X126.207 Y119.122 E.04561
M204 S10000
G1 X126.651 Y120.616 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6715
M204 S6000
G2 X126.667 Y118.991 I-46.336 J-1.269 E.05391
G1 X134.995 Y127.319 E.39068
G1 X134.995 Y128.681 E.0452
G1 X126.626 Y137.05 E.39258
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X129.303 Y119.021 E.48564
G1 X129.303 Y120.259 E.04106
G3 X129.319 Y120.647 I-.46 J.213 E.0132
M204 S10000
G1 X129.762 Y119.062 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.55522
G1 F6715
M204 S6000
G1 X129.762 Y120.214 E.04812
; LINE_WIDTH: 0.57335
G1 X129.785 Y120.362 E.00646
; LINE_WIDTH: 0.60961
G1 X129.809 Y120.509 E.0069
; LINE_WIDTH: 0.605605
G1 X129.913 Y120.532 E.00491
; LINE_WIDTH: 0.539568
G1 X130.018 Y120.554 E.00434
G1 X136.359 Y120.554 E.25662
; LINE_WIDTH: 0.519665
G1 X136.42 Y120.579 E.00257
; LINE_WIDTH: 0.480595
G1 X136.481 Y120.605 E.00236
; LINE_WIDTH: 0.441525
G1 X136.542 Y120.63 E.00215
; LINE_WIDTH: 0.385785
G1 X136.603 Y120.655 E.00185
G1 X136.988 Y120.655 E.01075
M204 S10000
G1 X137.011 Y120.305 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.40896
G1 F6715
M204 S6000
G1 X137.011 Y118.806 E.04474
M204 S10000
G1 X137.05 Y123.326 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6715
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X136.357 Y121.005 E.03248
G1 X134.995 Y121.005 E.0452
G1 X118.95 Y137.05 E.75267
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.989 Y120.305 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.40926
G1 F6715
M204 S6000
G1 X118.989 Y118.806 E.04478
; WIPE_START
G1 F15000
G1 X118.989 Y120.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.409 Y122.092 Z3.2 F42000
G1 X136.946 Y124.629 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F6715
M204 S6000
G1 X135.694 Y124.629 E.05063
; LINE_WIDTH: 0.560485
G1 X135.592 Y124.65 E.00443
; LINE_WIDTH: 0.588865
G1 X135.489 Y124.671 E.00467
G1 X135.446 Y124.877 E.00934
; LINE_WIDTH: 0.5392
G1 X135.446 Y131.133 E.25302
; LINE_WIDTH: 0.560485
G1 X135.468 Y131.236 E.00443
; LINE_WIDTH: 0.588865
G1 X135.489 Y131.339 E.00467
G1 X135.694 Y131.381 E.00934
; LINE_WIDTH: 0.5392
G1 X136.886 Y131.381 E.0482
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X135.694 Y131.381 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/100
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z3.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z3
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F12000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z3
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F12000
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F7085
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X119.508 Y118.602 E.03005
G1 X119.508 Y120.102 E.04976
G1 X125.87 Y120.102 E.21106
G1 X125.87 Y118.602 E.04976
G1 X130.099 Y118.602 E.14027
G1 X130.099 Y120.102 E.04976
G1 X136.493 Y120.102 E.2121
G1 X136.493 Y118.602 E.04976
G1 X137.398 Y118.602 E.03003
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7085
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X119.009 Y118.21 E.02454
G1 X119.409 Y118.21 E.01229
G1 X119.809 Y118.21 E.01229
G1 F4730.727
G1 X119.9 Y118.21 E.00281
G1 F3900
G1 X119.9 Y119.669 E.04483
G1 F4262.765
G1 X119.9 Y119.71 E.00126
G1 F7085
G1 X120.3 Y119.71 E.01229
G1 X120.7 Y119.71 E.01229
G1 X125.478 Y119.71 E.14683
G1 X125.478 Y118.21 E.04609
G1 X130.491 Y118.21 E.15402
G1 X130.491 Y119.71 E.04609
G1 X135.301 Y119.71 E.14779
G1 X135.701 Y119.71 E.01229
G1 X136.101 Y119.71 E.01229
G1 F4262.765
G1 X136.101 Y119.669 E.00126
G1 F3900
G1 X136.101 Y118.21 E.04483
G1 F4728.059
G1 X136.192 Y118.21 E.0028
G1 F7085
G1 X136.592 Y118.21 E.01229
G1 X136.992 Y118.21 E.01229
G1 X137.79 Y118.21 E.02453
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.946 Y124.629 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F7085
M204 S6000
G1 X135.694 Y124.629 E.05063
; LINE_WIDTH: 0.560485
G1 X135.592 Y124.65 E.00443
; LINE_WIDTH: 0.588865
G1 X135.489 Y124.671 E.00467
G1 X135.446 Y124.877 E.00934
; LINE_WIDTH: 0.5392
G1 X135.446 Y131.133 E.25302
; LINE_WIDTH: 0.560485
G1 X135.468 Y131.236 E.00443
; LINE_WIDTH: 0.588865
G1 X135.489 Y131.339 E.00467
G1 X135.694 Y131.381 E.00934
; LINE_WIDTH: 0.5392
G1 X136.886 Y131.381 E.0482
; WIPE_START
G1 F12000
G1 X135.694 Y131.381 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.551 Y123.797 Z3.4 F42000
G1 X136.945 Y120.305 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.54105
G1 F7085
M204 S6000
G1 X136.945 Y118.806 E.06088
; WIPE_START
G1 F12647.3
G1 X136.945 Y120.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.639 Y119.062 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.542809
G1 F7085
M204 S6000
G1 X129.639 Y120.098 E.04222
G1 X129.776 Y120.539 E.01881
G1 X129.895 Y120.554 E.00491
G1 X136.227 Y120.554 E.25792
; LINE_WIDTH: 0.519665
G1 X136.288 Y120.579 E.00257
; LINE_WIDTH: 0.480595
G1 X136.349 Y120.605 E.00236
; LINE_WIDTH: 0.441525
G1 X136.41 Y120.63 E.00215
; LINE_WIDTH: 0.385136
G1 X136.471 Y120.655 E.00184
G1 X136.988 Y120.655 E.01441
M204 S10000
G1 X119.055 Y120.305 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.54163
G1 F7085
M204 S6000
G1 X119.055 Y118.806 E.06095
M204 S10000
G1 X118.952 Y120.655 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F7085
M204 S6000
G1 X119.529 Y120.655 E.016
; LINE_WIDTH: 0.402455
G1 X119.59 Y120.63 E.00194
; LINE_WIDTH: 0.441525
G1 X119.651 Y120.605 E.00215
; LINE_WIDTH: 0.480595
G1 X119.712 Y120.579 E.00236
; LINE_WIDTH: 0.538998
G1 X119.773 Y120.554 E.00267
G1 X126.074 Y120.554 E.25469
; LINE_WIDTH: 0.556354
G1 X126.186 Y120.541 E.00474
G1 X126.33 Y120.114 E.01884
G1 X126.33 Y119.122 E.04152
; WIPE_START
G1 F12000
G1 X126.33 Y120.114 E-.48475
G1 X126.186 Y120.541 E-.21997
G1 X126.074 Y120.554 E-.05529
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.961 Y123.322 Z3.4 F42000
G1 X118.95 Y123.326 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7085
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X119.643 Y121.005 E.03248
G1 X121.005 Y121.005 E.0452
G1 X137.05 Y137.05 E.75267
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F7085
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X134.995 Y128.681 E.39258
G1 X134.995 Y127.319 E.0452
G1 X126.79 Y119.114 E.38491
G1 X126.79 Y118.95 E.00542
G1 X129.18 Y118.95 E.07928
G1 X129.18 Y119.144 E.00644
G1 X118.95 Y129.374 E.47988
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F7085
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X134.995 Y121.005 E.75267
G1 X136.357 Y121.005 E.0452
G1 X137.05 Y121.698 E.03248
G1 X137.05 Y123.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y121.698 E-.61876
G1 X136.787 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/100
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.6 F4000
            G39.3 S1
            G0 Z3.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z3.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z3.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z3.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6230
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X119.64 Y118.602 E.03444
M73 P41 R13
G1 X119.64 Y120.102 E.04976
G1 X125.993 Y120.102 E.21075
G1 X125.993 Y118.602 E.04976
G1 X129.976 Y118.602 E.13211
G1 X129.976 Y120.102 E.04976
G1 X136.361 Y120.102 E.21179
G1 X136.361 Y118.602 E.04976
G1 X137.398 Y118.602 E.03441
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6230
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X119.141 Y118.21 E.0286
G1 X119.541 Y118.21 E.01229
G1 X119.941 Y118.21 E.01229
G1 F4730.822
G1 X120.032 Y118.21 E.00281
G1 F3900
G1 X120.032 Y119.669 E.04483
G1 F4262.765
G1 X120.032 Y119.71 E.00126
G1 F6230
G1 X120.432 Y119.71 E.01229
G1 X120.832 Y119.71 E.01229
G1 X125.601 Y119.71 E.14654
G1 X125.601 Y118.21 E.04609
G1 X130.368 Y118.21 E.14647
G1 X130.368 Y119.71 E.04609
G1 X135.169 Y119.71 E.14751
G1 X135.569 Y119.71 E.01229
G1 X135.969 Y119.71 E.01229
G1 F4262.765
G1 X135.969 Y119.669 E.00126
G1 F3900
G1 X135.969 Y118.21 E.04483
G1 F4728.059
G1 X136.06 Y118.21 E.0028
G1 F6230
G1 X136.46 Y118.21 E.01229
G1 X136.86 Y118.21 E.01229
G1 X137.79 Y118.21 E.02859
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6230
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X120.45 Y120.45 E.77871
G1 X120.198 Y120.45 E.00838
G1 X118.95 Y121.698 E.05852
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X119.121 Y120.305 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.67401
G1 F6230
M204 S6000
G1 X119.121 Y118.806 E.07713
; WIPE_START
G1 F9982.729
G1 X119.121 Y120.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.727 Y119.663 Z3.6 F42000
G1 X136.879 Y118.806 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.67314
G1 F6230
M204 S6000
G1 X136.879 Y120.305 E.07703
M204 S10000
G1 X137.05 Y123.326 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6230
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X135.802 Y120.45 E.05852
G1 X135.55 Y120.45 E.00838
G1 X118.95 Y137.05 E.77871
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6230
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X129.374 Y118.95 E.48898
G1 X126.626 Y118.95 E.09114
G1 X135.55 Y127.874 E.41862
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/100
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.8 F4000
            G39.3 S1
            G0 Z3.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z3.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z3.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
M73 P41 R12
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z3.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6092
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X119.773 Y118.602 E.03883
G1 X119.773 Y120.102 E.04976
G1 X126.116 Y120.102 E.21043
G1 X126.116 Y118.602 E.04976
G1 X129.853 Y118.602 E.12395
G1 X129.853 Y120.102 E.04976
G1 X136.229 Y120.102 E.21149
G1 X136.229 Y118.602 E.04976
G1 X137.398 Y118.602 E.03879
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6092
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X119.273 Y118.21 E.03267
G1 X119.673 Y118.21 E.01229
G1 X120.073 Y118.21 E.01229
G1 F4730.822
G1 X120.165 Y118.21 E.00281
G1 F3900
G1 X120.165 Y119.669 E.04483
G1 F4262.765
G1 X120.165 Y119.71 E.00126
G1 F6092
G1 X120.565 Y119.71 E.01229
G1 X120.965 Y119.71 E.01229
G1 X125.724 Y119.71 E.14625
G1 X125.724 Y118.21 E.04609
G1 X130.245 Y118.21 E.13891
G1 X130.245 Y119.71 E.04609
G1 X135.036 Y119.71 E.14723
G1 X135.436 Y119.71 E.01229
G1 X135.836 Y119.71 E.01229
G1 F4262.765
G1 X135.836 Y119.669 E.00126
G1 F3900
G1 X135.836 Y118.21 E.04483
G1 F4728.059
G1 X135.928 Y118.21 E.0028
G1 F6092
G1 X136.328 Y118.21 E.01229
G1 X136.728 Y118.21 E.01229
G1 X137.79 Y118.21 E.03265
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6092
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
M73 P42 R12
G1 X137.05 Y137.05 E.09114
G1 X120.45 Y120.45 E.77871
G1 X120.198 Y120.45 E.00838
G1 X118.95 Y121.698 E.05852
G1 X118.95 Y118.95 E.09114
G1 X119.424 Y119.424 E.02224
G1 X119.424 Y120.45 E.03403
G1 X119.994 Y120.45 E.0189
M204 S10000
G1 X129.505 Y120.448 F42000
G1 F6092
M204 S6000
G1 X129.505 Y118.95 E.04967
G1 X129.374 Y118.95 E.00435
G1 X118.95 Y129.374 E.48898
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X126.626 Y137.05 E.09114
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X126.626 Y118.95 E.41862
G1 X126.465 Y118.95 E.00536
G1 X126.465 Y120.417 E.04865
M204 S10000
G1 X136.006 Y120.45 F42000
G1 F6092
M204 S6000
G1 X136.577 Y120.45 E.01894
G1 X136.577 Y119.423 E.03407
G1 X137.05 Y118.95 E.02218
G1 X137.05 Y121.698 E.09114
G1 X135.802 Y120.45 E.05852
G1 X135.55 Y120.45 E.00838
G1 X118.95 Y137.05 E.77871
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/100
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4 F4000
            G39.3 S1
            G0 Z4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z3.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z3.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z3.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6071
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X119.905 Y118.602 E.04322
G1 X119.905 Y120.102 E.04976
G1 X126.239 Y120.102 E.21012
G1 X126.239 Y118.602 E.04976
G1 X129.73 Y118.602 E.1158
G1 X129.73 Y120.102 E.04976
G1 X136.096 Y120.102 E.21118
G1 X136.096 Y118.602 E.04976
G1 X137.398 Y118.602 E.04317
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6071
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X119.406 Y118.21 E.03674
G1 X119.806 Y118.21 E.01229
G1 X120.206 Y118.21 E.01229
G1 F4730.822
G1 X120.297 Y118.21 E.00281
G1 F3900
G1 X120.297 Y119.669 E.04483
G1 F4262.765
G1 X120.297 Y119.71 E.00126
G1 F6071
G1 X120.697 Y119.71 E.01229
G1 X121.097 Y119.71 E.01229
G1 X125.847 Y119.71 E.14596
G1 X125.847 Y118.21 E.04609
G1 X130.122 Y118.21 E.13136
G1 X130.122 Y119.71 E.04609
G1 X134.904 Y119.71 E.14694
G1 X135.304 Y119.71 E.01229
G1 X135.704 Y119.71 E.01229
G1 F4262.765
G1 X135.704 Y119.669 E.00126
G1 F3900
G1 X135.704 Y118.21 E.04483
G1 F4728.059
G1 X135.795 Y118.21 E.0028
G1 F6071
G1 X136.195 Y118.21 E.01229
G1 X136.595 Y118.21 E.01229
G1 X137.79 Y118.21 E.0367
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.077 Y136.098 Z4 F42000
G1 X131.002 Y137.05 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6071
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X129.374 Y118.95 E.48898
G1 X126.626 Y118.95 E.09114
G1 X135.55 Y127.874 E.41862
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6071
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X135.55 Y120.45 E.77871
G1 X135.802 Y120.45 E.00838
G1 X137.05 Y121.698 E.05852
G1 X137.05 Y118.95 E.09114
G1 X136.445 Y119.555 E.02838
G1 X136.445 Y120.45 E.02969
G1 X136.006 Y120.45 E.01456
M204 S10000
G1 X119.994 Y120.45 F42000
G1 F6071
M204 S6000
G1 X119.557 Y120.45 E.01451
G1 X119.557 Y119.557 E.02964
G1 X118.95 Y118.95 E.02845
G1 X118.95 Y121.698 E.09114
G1 X120.198 Y120.45 E.05852
G1 X120.45 Y120.45 E.00838
G1 X137.05 Y137.05 E.77871
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y134.302 E-.61876
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/100
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.2 F4000
            G39.3 S1
            G0 Z4.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z4.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z3.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z3.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6262
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.037 Y118.602 E.04761
G1 X120.037 Y120.102 E.04976
G1 X126.362 Y120.102 E.2098
G1 X126.362 Y118.602 E.04976
G1 X129.607 Y118.602 E.10764
G1 X129.607 Y120.102 E.04976
G1 X135.964 Y120.102 E.21088
G1 X135.964 Y118.602 E.04976
G1 X137.398 Y118.602 E.04755
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6262
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X119.538 Y118.21 E.04081
G1 X119.938 Y118.21 E.01229
G1 X120.338 Y118.21 E.01229
G1 F4730.822
G1 X120.429 Y118.21 E.00281
G1 F3900
G1 X120.429 Y119.669 E.04483
G1 F4262.765
M73 P43 R12
G1 X120.429 Y119.71 E.00126
G1 F6262
G1 X120.829 Y119.71 E.01229
G1 X121.229 Y119.71 E.01229
G1 X125.97 Y119.71 E.14567
G1 X125.97 Y118.21 E.04609
G1 X129.999 Y118.21 E.1238
G1 X129.999 Y119.71 E.04609
G1 X134.772 Y119.71 E.14666
G1 X135.172 Y119.71 E.01229
G1 X135.572 Y119.71 E.01229
G1 F4262.765
G1 X135.572 Y119.669 E.00126
G1 F3900
G1 X135.572 Y118.21 E.04483
G1 F4728.059
G1 X135.663 Y118.21 E.0028
G1 F6262
G1 X136.063 Y118.21 E.01229
G1 X136.463 Y118.21 E.01229
G1 X137.79 Y118.21 E.04076
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6262
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X120.45 Y120.45 E.77871
G1 X120.198 Y120.45 E.00838
G1 X118.95 Y121.698 E.05852
G1 X118.95 Y118.95 E.09114
G1 X119.689 Y119.689 E.03466
G1 X119.689 Y118.95 E.02451
G1 X119.154 Y118.95 E.01775
; WIPE_START
G1 F15476.087
G1 X119.689 Y118.95 E-.20339
G1 X119.689 Y119.689 E-.28074
G1 X119.176 Y119.176 E-.27587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.808 Y119.078 Z4.2 F42000
G1 X136.846 Y118.95 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F6262
M204 S6000
G1 X136.313 Y118.95 E.0177
G1 X136.313 Y119.687 E.02445
G1 X137.05 Y118.95 E.03458
G1 X137.05 Y121.698 E.09114
G1 X135.802 Y120.45 E.05852
G1 X135.55 Y120.45 E.00838
G1 X118.95 Y137.05 E.77871
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6262
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X126.71 Y119.034 E.41467
G1 X126.71 Y118.95 E.00279
G1 X129.259 Y118.95 E.08454
G1 X129.259 Y119.065 E.00381
G1 X118.95 Y129.374 E.4836
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/100
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.4 F4000
            G39.3 S1
            G0 Z4.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z4.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6270
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.17 Y118.602 E.052
G1 X120.17 Y120.102 E.04976
G1 X126.485 Y120.102 E.20949
G1 X126.485 Y118.602 E.04976
G1 X129.484 Y118.602 E.09949
G1 X129.484 Y120.102 E.04976
G1 X135.832 Y120.102 E.21058
G1 X135.832 Y118.602 E.04976
G1 X137.398 Y118.602 E.05194
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6270
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X119.67 Y118.21 E.04488
G1 X120.07 Y118.21 E.01229
G1 X120.47 Y118.21 E.01229
G1 F4730.822
G1 X120.562 Y118.21 E.00281
G1 F3900
G1 X120.562 Y119.669 E.04483
G1 F4262.765
G1 X120.562 Y119.71 E.00126
G1 F6270
G1 X120.962 Y119.71 E.01229
G1 X121.362 Y119.71 E.01229
G1 X126.093 Y119.71 E.14538
G1 X126.093 Y118.21 E.04609
G1 X129.876 Y118.21 E.11625
G1 X129.876 Y119.71 E.04609
G1 X134.64 Y119.71 E.14638
G1 X135.04 Y119.71 E.01229
G1 X135.44 Y119.71 E.01229
G1 F4262.765
G1 X135.44 Y119.669 E.00126
G1 F3900
G1 X135.44 Y118.21 E.04483
G1 F4728.059
G1 X135.531 Y118.21 E.0028
G1 F6270
G1 X135.931 Y118.21 E.01229
G1 X136.331 Y118.21 E.01229
G1 X137.79 Y118.21 E.04482
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.222 Y125.816 Z4.4 F42000
G1 X126.498 Y120.45 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6270
M204 S6000
G1 X126.833 Y120.45 E.01113
G1 X126.833 Y119.157 E.04289
G1 X135.55 Y127.874 E.4089
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X129.136 Y119.188 E.47783
G1 X129.136 Y120.45 E.04187
G1 X129.502 Y120.45 E.01214
; WIPE_START
G1 F15476.087
G1 X129.136 Y120.45 E-.13911
G1 X129.136 Y119.188 E-.47965
G1 X128.873 Y119.451 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.251 Y119.058 Z4.4 F42000
G1 X119.154 Y118.95 Z4.4
G1 Z4
G1 E.8 F1800
G1 F6270
M204 S6000
G1 X119.821 Y118.95 E.02215
G1 X119.821 Y119.821 E.0289
G1 X118.95 Y118.95 E.04087
G1 X118.95 Y121.698 E.09114
G1 X120.198 Y120.45 E.05852
G1 X120.45 Y120.45 E.00838
G1 X137.05 Y137.05 E.77871
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6270
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X135.55 Y120.45 E.77871
G1 X135.802 Y120.45 E.00838
G1 X137.05 Y121.698 E.05852
G1 X137.05 Y118.95 E.09114
G1 X136.181 Y119.819 E.04077
G1 X136.181 Y118.95 E.02883
G1 X136.846 Y118.95 E.02208
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X136.181 Y118.95 E-.25292
G1 X136.181 Y119.819 E-.33027
G1 X136.51 Y119.49 E-.17681
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/100
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.6 F4000
            G39.3 S1
            G0 Z4.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z4.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z4.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z4.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
M73 P44 R12
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6274
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.302 Y118.602 E.05639
G1 X120.302 Y120.102 E.04976
G1 X126.608 Y120.102 E.20918
G1 X126.608 Y118.602 E.04976
G1 X129.361 Y118.602 E.09133
G1 X129.361 Y120.102 E.04976
G1 X135.7 Y120.102 E.21027
G1 X135.7 Y118.602 E.04976
G1 X137.398 Y118.602 E.05632
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6274
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X119.803 Y118.21 E.04894
G1 X120.203 Y118.21 E.01229
G1 X120.603 Y118.21 E.01229
G1 F4730.822
G1 X120.694 Y118.21 E.00281
G1 F3900
G1 X120.694 Y119.669 E.04483
G1 F4262.765
G1 X120.694 Y119.71 E.00126
G1 F6274
G1 X121.094 Y119.71 E.01229
G1 X121.494 Y119.71 E.01229
G1 X126.216 Y119.71 E.14509
G1 X126.216 Y118.21 E.04609
G1 X129.753 Y118.21 E.1087
G1 X129.753 Y119.71 E.04609
G1 X134.508 Y119.71 E.1461
G1 X134.908 Y119.71 E.01229
G1 X135.308 Y119.71 E.01229
G1 F4262.765
G1 X135.308 Y119.669 E.00126
G1 F3900
G1 X135.308 Y118.21 E.04483
G1 F4728.059
G1 X135.399 Y118.21 E.0028
G1 F6274
G1 X135.799 Y118.21 E.01229
G1 X136.199 Y118.21 E.01229
G1 X137.79 Y118.21 E.04888
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6274
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X120.45 Y120.45 E.77871
G1 X120.198 Y120.45 E.00838
G1 X118.95 Y121.698 E.05852
G1 X118.95 Y118.95 E.09114
G1 X119.954 Y119.954 E.04708
G1 X119.954 Y118.95 E.03329
G1 X119.329 Y118.95 E.02072
; WIPE_START
G1 F15476.087
G1 X119.954 Y118.95 E-.23741
G1 X119.954 Y119.954 E-.38135
G1 X119.691 Y119.691 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.316 Y119.358 Z4.6 F42000
G1 X136.676 Y118.95 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F6274
M204 S6000
G1 X136.048 Y118.95 E.0208
G1 X136.048 Y119.952 E.03321
G1 X137.05 Y118.95 E.04697
G1 X137.05 Y121.698 E.09114
G1 X135.802 Y120.45 E.05852
G1 X135.55 Y120.45 E.00838
G1 X118.95 Y137.05 E.77871
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6274
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X126.956 Y119.28 E.40313
G1 X126.956 Y118.95 E.01095
G1 X129.013 Y118.95 E.06823
G1 X129.013 Y119.311 E.01196
G1 X118.95 Y129.374 E.47206
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/100
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.8 F4000
            G39.3 S1
            G0 Z4.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z4.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z4.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z4.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6273
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.434 Y118.602 E.06079
G1 X120.434 Y120.102 E.04976
G1 X126.731 Y120.102 E.20886
G1 X126.731 Y118.602 E.04976
G1 X129.238 Y118.602 E.08318
G1 X129.238 Y120.102 E.04976
G1 X135.568 Y120.102 E.20997
G1 X135.568 Y118.602 E.04976
G1 X137.398 Y118.602 E.0607
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6273
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X119.935 Y118.21 E.05301
G1 X120.335 Y118.21 E.01229
G1 X120.735 Y118.21 E.01229
G1 F4730.822
G1 X120.827 Y118.21 E.00281
G1 F3900
G1 X120.827 Y119.669 E.04483
G1 F4262.765
G1 X120.827 Y119.71 E.00126
G1 F6273
G1 X121.227 Y119.71 E.01229
G1 X121.627 Y119.71 E.01229
G1 X126.339 Y119.71 E.1448
G1 X126.339 Y118.21 E.04609
G1 X129.63 Y118.21 E.10114
G1 X129.63 Y119.71 E.04609
G1 X134.376 Y119.71 E.14582
G1 X134.776 Y119.71 E.01229
G1 X135.176 Y119.71 E.01229
G1 F4262.765
G1 X135.176 Y119.669 E.00126
G1 F3900
G1 X135.176 Y118.21 E.04483
G1 F4728.059
G1 X135.267 Y118.21 E.0028
G1 F6273
G1 X135.667 Y118.21 E.01229
G1 X136.067 Y118.21 E.01229
G1 X137.79 Y118.21 E.05294
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P45 R12
G1 X132.222 Y125.816 Z4.8 F42000
G1 X126.498 Y120.45 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6273
M204 S6000
G1 X127.079 Y120.45 E.01928
G1 X127.079 Y119.403 E.03473
G1 X135.55 Y127.874 E.39737
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X128.89 Y119.434 E.4663
G1 X128.89 Y120.45 E.03372
G1 X129.502 Y120.45 E.0203
; WIPE_START
G1 F15476.087
G1 X128.89 Y120.45 E-.23253
G1 X128.89 Y119.434 E-.38622
G1 X128.627 Y119.697 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.021 Y119.068 Z4.8 F42000
G1 X119.594 Y118.95 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F6273
M204 S6000
G1 X120.086 Y118.95 E.01633
G1 X120.086 Y120.086 E.03768
G1 X118.95 Y118.95 E.05329
G1 X118.95 Y121.698 E.09114
G1 X120.198 Y120.45 E.05852
G1 X120.45 Y120.45 E.00838
G1 X137.05 Y137.05 E.77871
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6273
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X135.55 Y120.45 E.77871
G1 X135.802 Y120.45 E.00838
G1 X137.05 Y121.698 E.05852
G1 X137.05 Y118.95 E.09114
G1 X135.916 Y120.084 E.05317
G1 X135.916 Y118.95 E.03759
G1 X136.411 Y118.95 E.01642
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X135.916 Y118.95 E-.1881
G1 X135.916 Y120.084 E-.43066
G1 X136.179 Y119.821 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/100
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5 F4000
            G39.3 S1
            G0 Z5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z4.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z4.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z4.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6315
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.567 Y118.602 E.06518
G1 X120.567 Y120.102 E.04976
G1 X126.854 Y120.102 E.20855
G1 X126.854 Y118.602 E.04976
G1 X129.115 Y118.602 E.07502
G1 X129.115 Y120.102 E.04976
G1 X135.436 Y120.102 E.20967
G1 X135.436 Y118.602 E.04976
G1 X137.398 Y118.602 E.06508
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6315
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.068 Y118.21 E.05708
G1 X120.468 Y118.21 E.01229
G1 X120.868 Y118.21 E.01229
G1 F4730.822
G1 X120.959 Y118.21 E.00281
G1 F3900
G1 X120.959 Y119.669 E.04483
G1 F4262.765
G1 X120.959 Y119.71 E.00126
G1 F6315
G1 X121.359 Y119.71 E.01229
G1 X121.759 Y119.71 E.01229
G1 X126.462 Y119.71 E.14451
G1 X126.462 Y118.21 E.04609
G1 X129.508 Y118.21 E.09359
G1 X129.508 Y119.71 E.04609
G1 X134.244 Y119.71 E.14554
G1 X134.644 Y119.71 E.01229
G1 X135.044 Y119.71 E.01229
G1 F4262.765
G1 X135.044 Y119.669 E.00126
G1 F3900
G1 X135.044 Y118.21 E.04483
G1 F4728.059
G1 X135.135 Y118.21 E.0028
G1 F6315
G1 X135.535 Y118.21 E.01229
G1 X135.935 Y118.21 E.01229
G1 X137.79 Y118.21 E.057
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.061 Y123.439 Z5 F42000
G1 X137.05 Y123.326 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6315
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X135.784 Y120.432 E.05936
G1 X135.784 Y120.216 E.00719
G1 X137.05 Y118.95 E.05936
G1 X137.05 Y120.579 E.05401
M204 S10000
G1 X122.079 Y120.45 F42000
G1 F6315
M204 S6000
G1 X120.45 Y120.45 E.05401
G1 X137.05 Y137.05 E.77871
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6315
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X127.202 Y119.526 E.3916
G1 X127.202 Y118.95 E.0191
G1 X128.767 Y118.95 E.05192
G1 X128.767 Y119.557 E.02012
G1 X118.95 Y129.374 E.46053
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6315
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X135.55 Y120.45 E.77871
G1 X133.921 Y120.45 E.05401
M204 S10000
G1 X118.95 Y120.579 F42000
G1 F6315
M204 S6000
G1 X118.95 Y118.95 E.05401
G1 X120.219 Y120.219 E.0595
G1 X120.219 Y120.429 E.00699
G1 X118.95 Y121.698 E.0595
G1 X118.95 Y123.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y121.698 E-.61876
G1 X119.213 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/100
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.2 F4000
            G39.3 S1
            G0 Z5.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z5.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z4.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z4.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6613
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.699 Y118.602 E.06957
G1 X120.699 Y120.102 E.04976
G1 X126.977 Y120.102 E.20824
G1 X126.977 Y118.602 E.04976
G1 X128.993 Y118.602 E.06686
G1 X128.993 Y120.102 E.04976
G1 X135.304 Y120.102 E.20936
G1 X135.304 Y118.602 E.04976
G1 X137.398 Y118.602 E.06946
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6613
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.2 Y118.21 E.06115
G1 X120.6 Y118.21 E.01229
G1 X121 Y118.21 E.01229
G1 F4730.727
G1 X121.091 Y118.21 E.00281
G1 F3900
G1 X121.091 Y119.669 E.04483
G1 F4262.765
G1 X121.091 Y119.71 E.00126
G1 F6613
G1 X121.491 Y119.71 E.01229
G1 X121.891 Y119.71 E.01229
G1 X126.585 Y119.71 E.14422
G1 X126.585 Y118.21 E.04609
M73 P46 R12
G1 X129.385 Y118.21 E.08603
G1 X129.385 Y119.71 E.04609
M73 P46 R11
G1 X134.112 Y119.71 E.14526
G1 X134.512 Y119.71 E.01229
G1 X134.912 Y119.71 E.01229
G1 F4262.765
G1 X134.912 Y119.669 E.00126
G1 F3900
G1 X134.912 Y118.21 E.04483
G1 F4728.059
G1 X135.003 Y118.21 E.0028
G1 F6613
G1 X135.403 Y118.21 E.01229
G1 X135.803 Y118.21 E.01229
G1 X137.79 Y118.21 E.06106
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6613
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X120.45 Y120.45 E.77871
G1 X122.079 Y120.45 E.05401
; WIPE_START
G1 F15476.087
G1 X120.45 Y120.45 E-.61876
G1 X120.713 Y120.713 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.351 Y119.178 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F6613
M204 S6000
G1 X120.351 Y118.95 E.00755
G1 X118.95 Y118.95 E.04646
G1 X120.351 Y120.351 E.06571
G1 X120.351 Y120.297 E.00179
G1 X118.95 Y121.698 E.06571
G1 X118.95 Y123.326 E.05401
; WIPE_START
G1 F15476.087
G1 X118.95 Y121.698 E-.61876
G1 X119.213 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.525 Y119.247 Z5.2 F42000
G1 X127.369 Y118.994 Z5.2
G1 Z4.8
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X128.6 Y118.994 E.03784
G3 X128.576 Y120.163 I-13.486 J.308 E.03594
G1 X128.343 Y120.341 E.00902
G1 X127.618 Y120.341 E.02227
G1 X127.369 Y120.159 E.00948
G1 X127.369 Y119.054 E.03395
; Slow Down End
M204 S10000
G1 X128.198 Y119.61 F42000
; LINE_WIDTH: 0.47018
G1 F6613
M204 S6000
G1 X128.198 Y119.396 E.00744
G1 X127.771 Y119.396 E.01488
G1 X127.771 Y119.939 E.01889
G1 X128.198 Y119.923 E.01489
G1 X128.198 Y119.67 E.0088
; WIPE_START
G1 F12000
G1 X128.198 Y119.923 E-.10308
G1 X127.771 Y119.939 E-.17435
G1 X127.771 Y119.396 E-.22123
G1 X128.198 Y119.396 E-.17423
G1 X128.198 Y119.61 E-.08711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.921 Y120.45 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6613
M204 S6000
G1 X135.55 Y120.45 E.05401
G1 X118.95 Y137.05 E.77871
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6613
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.591 Y120.733 E.40535
G1 X128.409 Y120.733 E.02713
G1 X135.55 Y127.874 E.33498
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X137.05 Y123.326 F42000
G1 F6613
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X135.652 Y120.3 E.06556
G1 X135.652 Y120.348 E.00158
G1 X137.05 Y118.95 E.06556
G1 X135.652 Y118.95 E.04636
G1 X135.652 Y119.181 E.00766
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X135.652 Y118.95 E-.08772
G1 X137.05 Y118.95 E-.53105
G1 X136.787 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/100
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.4 F4000
            G39.3 S1
            G0 Z5.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z5.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z5
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z5
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6174
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.832 Y118.602 E.07396
G1 X120.832 Y120.102 E.04976
G1 X127.1 Y120.102 E.20792
G1 X127.1 Y118.602 E.04976
G1 X128.87 Y118.602 E.05871
G1 X128.87 Y120.102 E.04976
G1 X135.172 Y120.102 E.20906
G1 X135.172 Y118.602 E.04976
G1 X137.398 Y118.602 E.07384
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6174
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.332 Y118.21 E.06521
G1 X120.732 Y118.21 E.01229
G1 X121.132 Y118.21 E.01229
G1 F4730.822
G1 X121.224 Y118.21 E.00281
G1 F3900
G1 X121.224 Y119.669 E.04483
G1 F4262.765
G1 X121.224 Y119.71 E.00126
G1 F6174
G1 X121.624 Y119.71 E.01229
G1 X122.024 Y119.71 E.01229
G1 X126.708 Y119.71 E.14393
G1 X126.708 Y118.21 E.04609
G1 X129.262 Y118.21 E.07848
G1 X129.262 Y119.71 E.04609
G1 X133.98 Y119.71 E.14497
G1 X134.38 Y119.71 E.01229
G1 X134.78 Y119.71 E.01229
G1 F4262.765
G1 X134.78 Y119.669 E.00126
G1 F3900
G1 X134.78 Y118.21 E.04483
G1 F4728.059
G1 X134.871 Y118.21 E.0028
G1 F6174
G1 X135.271 Y118.21 E.01229
G1 X135.671 Y118.21 E.01229
G1 X137.79 Y118.21 E.06512
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.883 Y134.283 Z5.4 F42000
G1 X124.998 Y137.05 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6174
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X127.448 Y119.772 E.38007
G1 X127.448 Y118.95 E.02726
G1 X128.521 Y118.95 E.0356
G1 X128.521 Y119.803 E.02828
G1 X118.95 Y129.374 E.449
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6174
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X137.05 Y121.698 E.09114
G1 X135.52 Y120.168 E.07176
M204 S10000
G1 X120.483 Y120.165 F42000
M73 P47 R11
G1 F6174
M204 S6000
G1 X118.95 Y121.698 E.07192
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y134.302 E-.61876
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/100
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.6 F4000
            G39.3 S1
            G0 Z5.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z5.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z5.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z5.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6210
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.964 Y118.602 E.07835
G1 X120.964 Y120.102 E.04976
G1 X127.223 Y120.102 E.20761
G1 X127.223 Y118.602 E.04976
G1 X128.747 Y118.602 E.05055
G1 X128.747 Y120.102 E.04976
G1 X135.04 Y120.102 E.20875
G1 X135.04 Y118.602 E.04976
G1 X137.398 Y118.602 E.07823
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6210
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.465 Y118.21 E.06928
G1 X120.865 Y118.21 E.01229
G1 X121.265 Y118.21 E.01229
G1 F4730.822
G1 X121.356 Y118.21 E.00281
G1 F3900
G1 X121.356 Y119.669 E.04483
G1 F4262.765
G1 X121.356 Y119.71 E.00126
G1 F6210
G1 X121.756 Y119.71 E.01229
G1 X122.156 Y119.71 E.01229
G1 X126.831 Y119.71 E.14363
G1 X126.831 Y118.21 E.04609
G1 X129.139 Y118.21 E.07092
G1 X129.139 Y119.71 E.04609
G1 X133.848 Y119.71 E.14469
G1 X134.248 Y119.71 E.01229
G1 X134.648 Y119.71 E.01229
G1 F4262.765
G1 X134.648 Y119.669 E.00126
G1 F3900
G1 X134.648 Y118.21 E.04483
G1 F4727.963
G1 X134.739 Y118.21 E.0028
G1 F6210
G1 X135.139 Y118.21 E.01229
G1 X135.539 Y118.21 E.01229
G1 X137.79 Y118.21 E.06917
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.061 Y123.439 Z5.6 F42000
G1 X137.05 Y123.326 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6210
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X135.388 Y120.036 E.07795
G1 X135.388 Y118.95 E.03602
G1 X137.05 Y118.95 E.05512
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6210
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X120.616 Y120.032 E.07813
G1 X120.616 Y118.95 E.03589
G1 X118.95 Y118.95 E.05525
G1 X137.05 Y137.05 E.84908
G1 X137.05 Y134.302 E.09114
G1 X134.302 Y137.05 E.12889
G1 X132.674 Y137.05 E.05401
M204 S10000
G1 X128.255 Y118.95 F42000
G1 F6210
M204 S6000
G1 X127.571 Y118.95 E.02268
G1 X127.571 Y119.895 E.03134
G1 X135.55 Y127.874 E.3743
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X128.398 Y119.926 E.44323
G1 X128.398 Y118.95 E.03235
G1 X128.255 Y118.95 E.00477
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X128.398 Y118.95 E-.05464
G1 X128.398 Y119.926 E-.37063
G1 X127.776 Y120.549 E-.33473
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/100
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.8 F4000
            G39.3 S1
            G0 Z5.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z5.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z5.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z5.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6141
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.096 Y118.602 E.08274
G1 X121.096 Y120.102 E.04976
G1 X127.346 Y120.102 E.2073
G1 X127.346 Y118.602 E.04976
G1 X128.624 Y118.602 E.0424
G1 X128.624 Y120.102 E.04976
G1 X134.908 Y120.102 E.20845
G1 X134.908 Y118.602 E.04976
G1 X137.398 Y118.602 E.08261
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6141
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.597 Y118.21 E.07335
G1 X120.997 Y118.21 E.01229
G1 X121.397 Y118.21 E.01229
G1 F4730.822
G1 X121.488 Y118.21 E.00281
G1 F3900
G1 X121.488 Y119.669 E.04483
G1 F4262.765
G1 X121.488 Y119.71 E.00126
G1 F6141
G1 X121.888 Y119.71 E.01229
G1 X122.288 Y119.71 E.01229
G1 X126.954 Y119.71 E.14334
G1 X126.954 Y118.21 E.04609
G1 X129.016 Y118.21 E.06337
G1 X129.016 Y119.71 E.04609
G1 X133.716 Y119.71 E.14441
G1 X134.116 Y119.71 E.01229
G1 X134.516 Y119.71 E.01229
G1 F4262.765
G1 X134.516 Y119.669 E.00126
G1 F3900
G1 X134.516 Y118.21 E.04483
G1 F4728.059
M73 P48 R11
G1 X134.607 Y118.21 E.0028
G1 F6141
G1 X135.007 Y118.21 E.01229
G1 X135.407 Y118.21 E.01229
G1 X137.79 Y118.21 E.07323
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6141
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X120.748 Y118.95 E.05964
G1 X120.748 Y119.9 E.0315
G1 X118.95 Y121.698 E.08434
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6141
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X135.256 Y118.95 E.0595
G1 X135.256 Y119.904 E.03164
G1 X137.05 Y121.698 E.08415
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6141
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X127.694 Y120.018 E.36853
G1 X127.694 Y118.95 E.03541
G1 X128.275 Y118.95 E.01929
G1 X128.275 Y120.049 E.03643
G1 X118.95 Y129.374 E.43746
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/100
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6 F4000
            G39.3 S1
            G0 Z6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z5.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z5.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z5.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6279
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.229 Y118.602 E.08713
G1 X121.229 Y120.102 E.04976
G1 X127.469 Y120.102 E.20698
G1 X127.469 Y118.602 E.04976
G1 X128.501 Y118.602 E.03424
G1 X128.501 Y120.102 E.04976
G1 X134.776 Y120.102 E.20815
G1 X134.776 Y118.602 E.04976
G1 X137.398 Y118.602 E.08699
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6279
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.729 Y118.21 E.07742
G1 X121.129 Y118.21 E.01229
G1 X121.529 Y118.21 E.01229
G1 F4730.822
G1 X121.621 Y118.21 E.00281
G1 F3900
G1 X121.621 Y119.669 E.04483
G1 F4262.765
G1 X121.621 Y119.71 E.00126
G1 F6279
G1 X122.021 Y119.71 E.01229
G1 X122.421 Y119.71 E.01229
G1 X127.076 Y119.71 E.14305
G1 X127.076 Y118.21 E.04609
G1 X128.893 Y118.21 E.05581
G1 X128.893 Y119.71 E.04609
G1 X133.584 Y119.71 E.14413
G1 X133.984 Y119.71 E.01229
G1 X134.384 Y119.71 E.01229
G1 F4262.765
G1 X134.384 Y119.669 E.00126
G1 F3900
G1 X134.384 Y118.21 E.04483
G1 F4728.059
G1 X134.475 Y118.21 E.0028
G1 F6279
G1 X134.875 Y118.21 E.01229
G1 X135.275 Y118.21 E.01229
G1 X137.79 Y118.21 E.07729
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.077 Y136.098 Z6 F42000
G1 X131.002 Y137.05 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6279
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.67 Y120.654 E.40907
G1 X128.33 Y120.654 E.02187
G1 X135.55 Y127.874 E.3387
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6279
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X120.881 Y119.768 E.09055
G1 X120.881 Y118.95 E.02711
G1 X118.95 Y118.95 E.06403
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
; WIPE_START
G1 F15476.087
G1 X137.05 Y134.302 E-.61876
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.369 Y126.944 Z6 F42000
G1 X135.931 Y118.95 Z6
G1 Z5.6
G1 E.8 F1800
G1 F6279
M204 S6000
G1 X135.124 Y118.95 E.02676
G1 X135.124 Y119.772 E.02725
G1 X137.05 Y121.698 E.09034
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X127.985 Y120.305 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.66813
G1 F6279
M204 S6000
G1 X127.985 Y118.806 E.07641
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10076.615
G1 X127.985 Y120.305 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/100
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.2 F4000
            G39.3 S1
            G0 Z6.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z6.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z5.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F10076.615
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z5.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F10076.615
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6270
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.361 Y118.602 E.09152
G1 X121.361 Y120.102 E.04976
G1 X127.591 Y120.102 E.20667
G1 X127.591 Y118.602 E.04976
G1 X128.378 Y118.602 E.02609
G1 X128.378 Y120.102 E.04976
G1 X134.643 Y120.102 E.20784
G1 X134.643 Y118.602 E.04976
G1 X137.398 Y118.602 E.09137
M73 P49 R11
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6270
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.862 Y118.21 E.08148
G1 X121.262 Y118.21 E.01229
G1 X121.662 Y118.21 E.01229
G1 F4730.822
G1 X121.753 Y118.21 E.00281
G1 F3900
G1 X121.753 Y119.669 E.04483
G1 F4262.765
G1 X121.753 Y119.71 E.00126
G1 F6270
G1 X122.153 Y119.71 E.01229
G1 X122.553 Y119.71 E.01229
G1 X127.199 Y119.71 E.14276
G1 X127.199 Y118.21 E.04609
G1 X128.77 Y118.21 E.04826
G1 X128.77 Y119.71 E.04609
G1 X133.451 Y119.71 E.14385
G1 X133.851 Y119.71 E.01229
G1 X134.251 Y119.71 E.01229
G1 F4262.765
G1 X134.251 Y119.669 E.00126
G1 F3900
G1 X134.251 Y118.21 E.04483
G1 F4728.059
G1 X134.343 Y118.21 E.0028
G1 F6270
G1 X134.743 Y118.21 E.01229
G1 X135.143 Y118.21 E.01229
G1 X137.79 Y118.21 E.08135
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.883 Y134.283 Z6.2 F42000
G1 X124.998 Y137.05 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6270
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.33 Y120.654 E.3387
G1 X127.67 Y120.654 E.02187
G1 X118.95 Y129.374 E.40907
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6270
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.992 Y118.95 E.06827
G1 X134.992 Y119.64 E.02287
G1 X137.05 Y121.698 E.09654
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X127.985 Y120.305 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.42227
G1 F6270
M204 S6000
G1 X127.985 Y118.806 E.04637
; WIPE_START
G1 F15000
G1 X127.985 Y120.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.746 Y122.726 Z6.2 F42000
G1 X118.95 Y123.326 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6270
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.013 Y119.635 E.09676
G1 X121.013 Y118.95 E.02272
G1 X118.95 Y118.95 E.06842
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y134.302 E-.61876
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/100
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.4 F4000
            G39.3 S1
            G0 Z6.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z6.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6215
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.494 Y118.602 E.09592
G1 X121.494 Y120.102 E.04976
G1 X127.714 Y120.102 E.20636
G1 X127.714 Y118.602 E.04976
G1 X128.255 Y118.602 E.01793
G1 X128.255 Y120.102 E.04976
G1 X134.511 Y120.102 E.20754
G1 X134.511 Y118.602 E.04976
G1 X137.398 Y118.602 E.09575
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6215
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.994 Y118.21 E.08555
G1 X121.394 Y118.21 E.01229
G1 X121.794 Y118.21 E.01229
G1 F4730.822
G1 X121.886 Y118.21 E.00281
G1 F3900
G1 X121.886 Y119.669 E.04483
G1 F4262.765
G1 X121.886 Y119.71 E.00126
G1 F6215
G1 X122.286 Y119.71 E.01229
G1 X122.686 Y119.71 E.01229
G1 X127.322 Y119.71 E.14247
G1 X127.322 Y118.21 E.04609
G1 X128.647 Y118.21 E.0407
G1 X128.647 Y119.71 E.04609
G1 X133.319 Y119.71 E.14357
G1 X133.719 Y119.71 E.01229
G1 X134.119 Y119.71 E.01229
G1 F4262.765
G1 X134.119 Y119.669 E.00126
G1 F3900
G1 X134.119 Y118.21 E.04483
G1 F4728.059
G1 X134.21 Y118.21 E.0028
G1 F6215
G1 X134.61 Y118.21 E.01229
G1 X135.01 Y118.21 E.01229
G1 X137.79 Y118.21 E.08541
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.061 Y123.439 Z6.4 F42000
G1 X137.05 Y123.326 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6215
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.86 Y119.508 E.10274
G1 X134.86 Y118.95 E.01849
G1 X137.05 Y118.95 E.07265
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6215
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.145 Y119.503 E.10297
G1 X121.145 Y118.95 E.01833
G1 X118.95 Y118.95 E.07281
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
M73 P50 R11
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6215
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.67 Y120.654 E.40907
G1 X128.33 Y120.654 E.02187
G1 X135.55 Y127.874 E.3387
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X127.985 Y120.305 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.17641
G1 F6215
M204 S6000
G1 X127.985 Y118.806 E.01632
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X127.985 Y120.305 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/100
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.6 F4000
            G39.3 S1
            G0 Z6.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z6.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z6.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z6.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6098
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.626 Y118.602 E.10031
G1 X121.626 Y120.102 E.04976
G1 X127.837 Y120.102 E.20604
G1 X127.837 Y118.602 E.04976
G1 X128.132 Y118.602 E.00978
G1 X128.132 Y120.102 E.04976
G1 X134.379 Y120.102 E.20723
G1 X134.379 Y118.602 E.04976
G1 X137.398 Y118.602 E.10013
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6098
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.127 Y118.21 E.08962
G1 X121.527 Y118.21 E.01229
G1 X121.927 Y118.21 E.01229
G1 F4730.822
G1 X122.018 Y118.21 E.00281
G1 F3900
G1 X122.018 Y119.669 E.04483
G1 F4262.765
G1 X122.018 Y119.71 E.00126
G1 F6098
G1 X122.418 Y119.71 E.01229
G1 X122.818 Y119.71 E.01229
G1 X127.445 Y119.71 E.14218
G1 X127.445 Y118.21 E.04609
G1 X128.524 Y118.21 E.03315
G1 X128.524 Y119.71 E.04609
G1 X133.187 Y119.71 E.14329
G1 X133.587 Y119.71 E.01229
G1 X133.987 Y119.71 E.01229
G1 F4262.765
G1 X133.987 Y119.669 E.00126
G1 F3900
G1 X133.987 Y118.21 E.04483
G1 F4728.059
G1 X134.078 Y118.21 E.0028
G1 F6098
G1 X134.478 Y118.21 E.01229
G1 X134.878 Y118.21 E.01229
G1 X137.79 Y118.21 E.08947
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6098
M204 S6000
M73 P50 R10
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.278 Y118.95 E.0772
G1 X121.278 Y119.37 E.01394
G1 X118.95 Y121.698 E.10918
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6098
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.728 Y118.95 E.07703
G1 X134.728 Y119.376 E.01411
G1 X137.05 Y121.698 E.10893
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6098
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/100
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.8 F4000
            G39.3 S1
            G0 Z6.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z6.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z6.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z6.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6276
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.758 Y118.602 E.1047
G1 X121.758 Y120.102 E.04976
G1 X134.247 Y120.102 E.41428
G1 X134.247 Y118.602 E.04976
G1 X137.398 Y118.602 E.10452
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6276
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.259 Y118.21 E.09369
G1 X121.659 Y118.21 E.01229
G1 X122.059 Y118.21 E.01229
G1 F4730.822
G1 X122.15 Y118.21 E.00281
G1 F3900
G1 X122.15 Y119.669 E.04483
G1 F4262.765
G1 X122.15 Y119.71 E.00126
G1 F6276
G1 X122.55 Y119.71 E.01229
G1 X122.95 Y119.71 E.01229
G1 X127.568 Y119.71 E.14189
G1 X127.568 Y118.21 E.04609
G1 X128.401 Y118.21 E.02559
G1 X128.401 Y119.71 E.04609
G1 X133.055 Y119.71 E.143
G1 X133.455 Y119.71 E.01229
G1 X133.855 Y119.71 E.01229
G1 F4262.765
G1 X133.855 Y119.669 E.00126
G1 F3900
G1 X133.855 Y118.21 E.04483
G1 F4728.059
G1 X133.946 Y118.21 E.0028
G1 F6276
G1 X134.346 Y118.21 E.01229
G1 X134.746 Y118.21 E.01229
G1 X137.79 Y118.21 E.09353
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z6.8 F42000
M73 P51 R10
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6276
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.41 Y118.95 E.08159
G1 X121.41 Y119.238 E.00954
G1 X118.95 Y121.698 E.11539
G1 X118.95 Y123.326 E.05401
; WIPE_START
G1 F15476.087
G1 X118.95 Y121.698 E-.61876
G1 X119.213 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.732 Y120.124 Z6.8 F42000
G1 X127.985 Y119.906 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.48383
G1 F6276
M204 S6000
G1 X127.985 Y118.406 E.05389
; WIPE_START
G1 F14288.631
G1 X127.985 Y119.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.126 Y122.6 Z6.8 F42000
G1 X137.05 Y123.326 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6276
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.595 Y119.244 E.11513
G1 X134.595 Y118.95 E.00973
G1 X137.05 Y118.95 E.08141
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6276
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/100
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7 F4000
            G39.3 S1
            G0 Z7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z6.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z6.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z6.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6280
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.891 Y118.602 E.10909
G1 X121.891 Y120.102 E.04976
G1 X134.115 Y120.102 E.40551
G1 X134.115 Y118.602 E.04976
G1 X137.398 Y118.602 E.1089
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6280
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.391 Y118.21 E.09775
G1 X121.791 Y118.21 E.01229
G1 X122.191 Y118.21 E.01229
G1 F4730.822
G1 X122.283 Y118.21 E.00281
G1 F3900
G1 X122.283 Y119.669 E.04483
G1 F4262.765
G1 X122.283 Y119.71 E.00126
G1 F6280
G1 X122.683 Y119.71 E.01229
G1 X123.083 Y119.71 E.01229
G1 X127.691 Y119.71 E.1416
G1 X127.691 Y118.21 E.04609
G1 X128.278 Y118.21 E.01804
G1 X128.278 Y119.71 E.04609
G1 X132.923 Y119.71 E.14272
G1 X133.323 Y119.71 E.01229
G1 X133.723 Y119.71 E.01229
G1 F4262.765
G1 X133.723 Y119.669 E.00126
G1 F3900
G1 X133.723 Y118.21 E.04483
G1 F4728.059
G1 X133.814 Y118.21 E.0028
G1 F6280
G1 X134.214 Y118.21 E.01229
G1 X134.614 Y118.21 E.01229
G1 X137.79 Y118.21 E.09759
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6280
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.542 Y118.95 E.08598
G1 X121.542 Y119.106 E.00515
G1 X118.95 Y121.698 E.1216
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6280
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.463 Y118.95 E.08579
G1 X134.463 Y119.111 E.00535
G1 X137.05 Y121.698 E.12133
G1 X137.05 Y123.326 E.05401
; WIPE_START
G1 F15476.087
G1 X137.05 Y121.698 E-.61876
G1 X136.787 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.267 Y120.129 Z7 F42000
G1 X127.985 Y119.906 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23797
G1 F6280
M204 S6000
G1 X127.985 Y118.406 E.02384
; WIPE_START
G1 F15000
G1 X127.985 Y119.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.675 Y127.425 Z7 F42000
G1 X124.998 Y137.05 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6280
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/100
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.2 F4000
            G39.3 S1
            G0 Z7.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z7.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z6.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z6.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z6.8
M73 P52 R10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6187
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.023 Y118.602 E.11348
G1 X122.023 Y120.102 E.04976
G1 X133.983 Y120.102 E.39674
G1 X133.983 Y118.602 E.04976
G1 X137.398 Y118.602 E.11328
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6187
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.524 Y118.21 E.10182
G1 X121.924 Y118.21 E.01229
G1 X122.324 Y118.21 E.01229
G1 F4730.727
G1 X122.415 Y118.21 E.00281
G1 F3900
G1 X122.415 Y119.669 E.04483
G1 F4262.765
G1 X122.415 Y119.71 E.00126
G1 F6187
G1 X122.815 Y119.71 E.01229
G1 X123.215 Y119.71 E.01229
G1 X127.814 Y119.71 E.14131
G1 X127.814 Y118.21 E.04609
G1 X128.155 Y118.21 E.01049
G1 X128.155 Y119.71 E.04609
G1 X132.791 Y119.71 E.14244
G1 X133.191 Y119.71 E.01229
G1 X133.591 Y119.71 E.01229
G1 F4262.765
G1 X133.591 Y119.669 E.00126
G1 F3900
G1 X133.591 Y118.21 E.04483
G1 F4728.059
G1 X133.682 Y118.21 E.0028
G1 F6187
G1 X134.082 Y118.21 E.01229
G1 X134.482 Y118.21 E.01229
G1 X137.79 Y118.21 E.10164
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.077 Y136.098 Z7.2 F42000
G1 X131.002 Y137.05 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6187
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6187
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.675 Y118.95 E.12835
G1 X118.95 Y118.95 E.09038
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
; WIPE_START
G1 F15476.087
G1 X137.05 Y134.302 E-.61876
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.398 Y127.06 Z7.2 F42000
G1 X134.174 Y120.45 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F6187
M204 S6000
G1 X134.331 Y120.45 E.00522
G1 X134.331 Y118.979 E.04879
G1 X137.05 Y121.698 E.12752
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/100
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.4 F4000
            G39.3 S1
            G0 Z7.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z7.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z7
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z7
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6008
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.155 Y118.602 E.11787
G1 X122.155 Y120.102 E.04976
G1 X133.851 Y120.102 E.38796
G1 X133.851 Y118.602 E.04976
G1 X137.398 Y118.602 E.11766
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6008
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.656 Y118.21 E.10589
G1 X122.056 Y118.21 E.01229
G1 X122.456 Y118.21 E.01229
G1 F4730.822
G1 X122.547 Y118.21 E.00281
G1 F3900
G1 X122.547 Y119.669 E.04483
G1 F4262.765
G1 X122.547 Y119.71 E.00126
G1 F6008
G1 X122.947 Y119.71 E.01229
G1 X123.347 Y119.71 E.01229
G1 X127.937 Y119.71 E.14102
G1 X127.937 Y118.21 E.04609
G1 X128.032 Y118.21 E.00293
G1 X128.032 Y119.71 E.04609
G1 X132.659 Y119.71 E.14216
G1 X133.059 Y119.71 E.01229
G1 X133.459 Y119.71 E.01229
G1 F4262.765
G1 X133.459 Y119.669 E.00126
G1 F3900
G1 X133.459 Y118.21 E.04483
G1 F4728.059
G1 X133.55 Y118.21 E.0028
G1 F6008
G1 X133.95 Y118.21 E.01229
G1 X134.35 Y118.21 E.01229
G1 X137.79 Y118.21 E.1057
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6008
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6008
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6008
M204 S6000
G1 X126.626 Y137.05 E.05401
M73 P53 R10
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/100
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.6 F4000
            G39.3 S1
            G0 Z7.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z7.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z7.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z7.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6004
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.288 Y118.602 E.12226
G1 X122.288 Y120.102 E.04976
G1 X133.719 Y120.102 E.37919
G1 X133.719 Y118.602 E.04976
G1 X137.398 Y118.602 E.12204
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6004
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.788 Y118.21 E.10996
G1 X122.188 Y118.21 E.01229
G1 X122.588 Y118.21 E.01229
G1 F4730.822
G1 X122.68 Y118.21 E.00281
G1 F3900
G1 X122.68 Y119.669 E.04483
G1 F4262.765
G1 X122.68 Y119.71 E.00126
G1 F6004
G1 X123.08 Y119.71 E.01229
G1 X123.48 Y119.71 E.01229
G1 X132.527 Y119.71 E.27799
G1 X132.927 Y119.71 E.01229
G1 X133.327 Y119.71 E.01229
G1 F4262.765
G1 X133.327 Y119.669 E.00126
G1 F3900
G1 X133.327 Y118.21 E.04483
G1 F4728.059
G1 X133.418 Y118.21 E.0028
G1 F6004
G1 X133.818 Y118.21 E.01229
G1 X134.218 Y118.21 E.01229
G1 X137.79 Y118.21 E.10976
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.061 Y123.439 Z7.6 F42000
G1 X137.05 Y123.326 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6004
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6004
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6004
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/100
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.8 F4000
            G39.3 S1
            G0 Z7.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z7.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z7.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z7.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6003
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.42 Y118.602 E.12665
G1 X122.42 Y120.102 E.04976
G1 X133.587 Y120.102 E.37042
G1 X133.587 Y118.602 E.04976
G1 X137.398 Y118.602 E.12642
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6003
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.921 Y118.21 E.11402
G1 X122.321 Y118.21 E.01229
G1 X122.721 Y118.21 E.01229
G1 F4730.822
G1 X122.812 Y118.21 E.00281
G1 F3900
G1 X122.812 Y119.669 E.04483
G1 F4262.765
G1 X122.812 Y119.71 E.00126
G1 F6003
G1 X123.212 Y119.71 E.01229
G1 X123.612 Y119.71 E.01229
G1 X132.395 Y119.71 E.26986
G1 X132.795 Y119.71 E.01229
G1 X133.195 Y119.71 E.01229
G1 F4262.765
G1 X133.195 Y119.669 E.00126
G1 F3900
G1 X133.195 Y118.21 E.04483
G1 F4728.059
G1 X133.286 Y118.21 E.0028
G1 F6003
G1 X133.686 Y118.21 E.01229
G1 X134.086 Y118.21 E.01229
G1 X137.79 Y118.21 E.11382
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6003
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6003
M204 S6000
G1 X118.95 Y134.302 E.05401
M73 P54 R10
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6003
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/100
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8 F4000
            G39.3 S1
            G0 Z8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z7.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z7.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z7.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6003
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.553 Y118.602 E.13105
G1 X122.553 Y120.102 E.04976
G1 X133.455 Y120.102 E.36164
G1 X133.455 Y118.602 E.04976
G1 X137.398 Y118.602 E.1308
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6003
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.053 Y118.21 E.11809
G1 X122.453 Y118.21 E.01229
G1 X122.853 Y118.21 E.01229
G1 F4730.822
G1 X122.945 Y118.21 E.00281
G1 F3900
G1 X122.945 Y119.669 E.04483
G1 F4262.765
G1 X122.945 Y119.71 E.00126
G1 F6003
G1 X123.345 Y119.71 E.01229
G1 X123.745 Y119.71 E.01229
G1 X132.263 Y119.71 E.26173
G1 X132.663 Y119.71 E.01229
G1 X133.063 Y119.71 E.01229
G1 F4262.765
G1 X133.063 Y119.669 E.00126
G1 F3900
G1 X133.063 Y118.21 E.04483
G1 F4727.963
G1 X133.154 Y118.21 E.0028
G1 F6003
G1 X133.554 Y118.21 E.01229
G1 X133.954 Y118.21 E.01229
G1 X137.79 Y118.21 E.11788
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.061 Y123.439 Z8 F42000
G1 X137.05 Y123.326 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6003
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6003
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6003
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/100
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.2 F4000
            G39.3 S1
            G0 Z8.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z8.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z7.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z7.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6003
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.685 Y118.602 E.13544
G1 X122.685 Y120.102 E.04976
G1 X133.323 Y120.102 E.35287
G1 X133.323 Y118.602 E.04976
G1 X137.398 Y118.602 E.13519
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6003
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.186 Y118.21 E.12216
G1 X122.586 Y118.21 E.01229
G1 X122.986 Y118.21 E.01229
G1 F4730.822
M73 P55 R10
G1 X123.077 Y118.21 E.00281
G1 F3900
G1 X123.077 Y119.669 E.04483
M73 P55 R9
G1 F4262.765
G1 X123.077 Y119.71 E.00126
G1 F6003
G1 X123.477 Y119.71 E.01229
G1 X123.877 Y119.71 E.01229
G1 X132.131 Y119.71 E.25361
G1 X132.531 Y119.71 E.01229
G1 X132.931 Y119.71 E.01229
G1 F4262.765
G1 X132.931 Y119.669 E.00126
G1 F3900
G1 X132.931 Y118.21 E.04483
G1 F4728.059
G1 X133.022 Y118.21 E.0028
G1 F6003
G1 X133.422 Y118.21 E.01229
G1 X133.822 Y118.21 E.01229
G1 X137.79 Y118.21 E.12194
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6003
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6003
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6003
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/100
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.4 F4000
            G39.3 S1
            G0 Z8.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z8.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6003
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.817 Y118.602 E.13983
G1 X122.817 Y120.102 E.04976
G1 X133.191 Y120.102 E.3441
G1 X133.191 Y118.602 E.04976
G1 X137.398 Y118.602 E.13957
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6003
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.318 Y118.21 E.12623
G1 X122.718 Y118.21 E.01229
G1 X123.118 Y118.21 E.01229
G1 F4730.822
G1 X123.209 Y118.21 E.00281
G1 F3900
G1 X123.209 Y119.669 E.04483
G1 F4262.765
G1 X123.209 Y119.71 E.00126
G1 F6003
G1 X123.609 Y119.71 E.01229
G1 X124.009 Y119.71 E.01229
G1 X131.998 Y119.71 E.24548
G1 X132.398 Y119.71 E.01229
G1 X132.798 Y119.71 E.01229
G1 F4262.765
G1 X132.798 Y119.669 E.00126
G1 F3900
G1 X132.798 Y118.21 E.04483
G1 F4728.059
G1 X132.89 Y118.21 E.0028
G1 F6003
G1 X133.29 Y118.21 E.01229
G1 X133.69 Y118.21 E.01229
G1 X137.79 Y118.21 E.126
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.061 Y123.439 Z8.4 F42000
G1 X137.05 Y123.326 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6003
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6003
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6003
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/100
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.6 F4000
            G39.3 S1
            G0 Z8.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z8.400
M204 S10000
M73 P56 R9
G1 X40.52 Y239.602 F42000
G1 Z8.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z8.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6002
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.95 Y118.602 E.14422
G1 X122.95 Y120.102 E.04976
G1 X133.058 Y120.102 E.33532
G1 X133.058 Y118.602 E.04976
G1 X137.398 Y118.602 E.14395
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6002
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.45 Y118.21 E.1303
G1 X122.85 Y118.21 E.01229
G1 X123.25 Y118.21 E.01229
G1 F4730.822
G1 X123.342 Y118.21 E.00281
G1 F3900
G1 X123.342 Y119.669 E.04483
G1 F4262.765
G1 X123.342 Y119.71 E.00126
G1 F6002
G1 X123.742 Y119.71 E.01229
G1 X124.142 Y119.71 E.01229
G1 X131.866 Y119.71 E.23735
G1 X132.266 Y119.71 E.01229
G1 X132.666 Y119.71 E.01229
G1 F4262.765
G1 X132.666 Y119.669 E.00126
G1 F3900
G1 X132.666 Y118.21 E.04483
G1 F4728.059
G1 X132.757 Y118.21 E.0028
G1 F6002
G1 X133.157 Y118.21 E.01229
G1 X133.557 Y118.21 E.01229
G1 X137.79 Y118.21 E.13006
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6002
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6002
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6002
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/100
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.8 F4000
            G39.3 S1
            G0 Z8.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z8.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z8.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z8.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6003
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.082 Y118.602 E.14861
G1 X123.082 Y120.102 E.04976
G1 X132.926 Y120.102 E.32655
G1 X132.926 Y118.602 E.04976
G1 X137.398 Y118.602 E.14833
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6003
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.583 Y118.21 E.13436
G1 X122.983 Y118.21 E.01229
G1 X123.383 Y118.21 E.01229
G1 F4730.822
G1 X123.474 Y118.21 E.00281
G1 F3900
G1 X123.474 Y119.669 E.04483
G1 F4262.765
G1 X123.474 Y119.71 E.00126
G1 F6003
G1 X123.874 Y119.71 E.01229
G1 X124.274 Y119.71 E.01229
G1 X131.734 Y119.71 E.22923
G1 X132.134 Y119.71 E.01229
G1 X132.534 Y119.71 E.01229
G1 F4262.765
G1 X132.534 Y119.669 E.00126
G1 F3900
G1 X132.534 Y118.21 E.04483
G1 F4728.059
G1 X132.625 Y118.21 E.0028
G1 F6003
G1 X133.025 Y118.21 E.01229
G1 X133.425 Y118.21 E.01229
G1 X137.79 Y118.21 E.13411
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.061 Y123.439 Z8.8 F42000
G1 X137.05 Y123.326 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6003
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6003
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6003
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
M73 P57 R9
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/100
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9 F4000
            G39.3 S1
            G0 Z9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z8.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z8.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z8.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6002
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.214 Y118.602 E.153
G1 X123.214 Y120.102 E.04976
G1 X132.794 Y120.102 E.31778
G1 X132.794 Y118.602 E.04976
G1 X137.398 Y118.602 E.15271
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6002
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.715 Y118.21 E.13843
G1 X123.115 Y118.21 E.01229
G1 X123.515 Y118.21 E.01229
G1 F4730.727
G1 X123.607 Y118.21 E.00281
G1 F3900
G1 X123.607 Y119.669 E.04483
G1 F4262.765
G1 X123.607 Y119.71 E.00126
G1 F6002
G1 X124.007 Y119.71 E.01229
G1 X124.407 Y119.71 E.01229
G1 X131.602 Y119.71 E.2211
G1 X132.002 Y119.71 E.01229
G1 X132.402 Y119.71 E.01229
G1 F4262.765
G1 X132.402 Y119.669 E.00126
G1 F3900
G1 X132.402 Y118.21 E.04483
G1 F4728.059
G1 X132.493 Y118.21 E.0028
G1 F6002
G1 X132.893 Y118.21 E.01229
G1 X133.293 Y118.21 E.01229
G1 X137.79 Y118.21 E.13817
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6002
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6002
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6002
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/100
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.2 F4000
            G39.3 S1
            G0 Z9.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z9.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z8.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z8.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y130.93
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6003
M204 S6000
G1 X137.398 Y130.93 E.04976
G1 X137.398 Y137.398 E.21456
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.347 Y118.602 E.15739
G1 X123.347 Y120.102 E.04976
G1 X132.662 Y120.102 E.30901
G1 X132.662 Y118.602 E.04976
G1 X137.398 Y118.602 E.15709
G1 X137.398 Y125.08 E.2149
G1 X135.898 Y125.08 E.04976
G1 X135.898 Y130.87 E.19205
M204 S250
G1 X136.29 Y130.538 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6003
M204 S5000
G1 X137.79 Y130.538 E.04609
G1 X137.79 Y137.79 E.22284
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.848 Y118.21 E.1425
G1 X123.248 Y118.21 E.01229
G1 X123.648 Y118.21 E.01229
G1 F4730.822
G1 X123.739 Y118.21 E.00281
G1 F3900
G1 X123.739 Y119.669 E.04483
G1 F4262.765
G1 X123.739 Y119.71 E.00126
G1 F6003
G1 X124.139 Y119.71 E.01229
G1 X124.539 Y119.71 E.01229
G1 X131.47 Y119.71 E.21298
G1 X131.87 Y119.71 E.01229
G1 X132.27 Y119.71 E.01229
G1 F4262.765
G1 X132.27 Y119.669 E.00126
G1 F3900
G1 X132.27 Y118.21 E.04483
G1 F4728.059
G1 X132.361 Y118.21 E.0028
G1 F6003
G1 X132.761 Y118.21 E.01229
G1 X133.161 Y118.21 E.01229
G1 X137.79 Y118.21 E.14223
G1 X137.79 Y125.472 E.22316
G1 X136.29 Y125.472 E.04609
G1 X136.29 Y130.478 E.1538
; WIPE_START
M73 P58 R9
G1 F12000
M204 S6000
G1 X137.79 Y130.538 E-.57046
G1 X137.79 Y131.037 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.061 Y123.439 Z9.2 F42000
G1 X137.05 Y123.326 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6003
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6003
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6003
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/100
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.4 F4000
            G39.3 S1
            G0 Z9.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z9.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z9
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z9
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y131.009
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6002
M204 S6000
G1 X137.398 Y131.009 E.04976
G1 X137.398 Y137.398 E.21195
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.479 Y118.602 E.16178
G1 X123.479 Y120.102 E.04976
G1 X132.53 Y120.102 E.30023
G1 X132.53 Y118.602 E.04976
G1 X137.398 Y118.602 E.16148
G1 X137.398 Y125.002 E.21228
G1 X135.898 Y125.002 E.04976
G1 X135.898 Y130.949 E.19727
M204 S250
G1 X136.29 Y130.616 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6002
M204 S5000
G1 X137.79 Y130.616 E.04609
G1 X137.79 Y137.79 E.22042
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.98 Y118.21 E.14657
G1 X123.38 Y118.21 E.01229
G1 X123.78 Y118.21 E.01229
G1 F4730.822
G1 X123.871 Y118.21 E.00281
G1 F3900
G1 X123.871 Y119.669 E.04483
G1 F4262.765
G1 X123.871 Y119.71 E.00126
G1 F6002
G1 X124.271 Y119.71 E.01229
G1 X124.671 Y119.71 E.01229
G1 X131.338 Y119.71 E.20485
G1 X131.738 Y119.71 E.01229
G1 X132.138 Y119.71 E.01229
G1 F4262.765
G1 X132.138 Y119.669 E.00126
G1 F3900
G1 X132.138 Y118.21 E.04483
G1 F4728.059
G1 X132.229 Y118.21 E.0028
G1 F6002
G1 X132.629 Y118.21 E.01229
G1 X133.029 Y118.21 E.01229
G1 X137.79 Y118.21 E.14629
G1 X137.79 Y125.394 E.22073
G1 X136.29 Y125.394 E.04609
G1 X136.29 Y130.556 E.15864
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.616 E-.57046
G1 X137.79 Y131.115 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6002
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6002
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6002
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/100
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.6 F4000
            G39.3 S1
            G0 Z9.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z9.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z9.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z9.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
M73 P59 R9
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y131.142
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6003
M204 S6000
G1 X137.398 Y131.142 E.04976
G1 X137.398 Y137.398 E.20751
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.612 Y118.602 E.16618
G1 X123.612 Y120.102 E.04976
G1 X132.398 Y120.102 E.29146
G1 X132.398 Y118.602 E.04976
G1 X137.398 Y118.602 E.16586
G1 X137.398 Y124.868 E.20784
G1 X135.898 Y124.868 E.04976
G1 X135.898 Y131.082 E.20615
M204 S250
G1 X136.29 Y130.75 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6003
M204 S5000
G1 X137.79 Y130.75 E.04609
G1 X137.79 Y137.79 E.21631
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.112 Y118.21 E.15063
G1 X123.512 Y118.21 E.01229
G1 X123.912 Y118.21 E.01229
G1 F4730.822
G1 X124.004 Y118.21 E.00281
G1 F3900
G1 X124.004 Y119.669 E.04483
G1 F4262.765
G1 X124.004 Y119.71 E.00126
G1 F6003
G1 X124.404 Y119.71 E.01229
G1 X124.804 Y119.71 E.01229
G1 X131.206 Y119.71 E.19672
G1 X131.606 Y119.71 E.01229
G1 X132.006 Y119.71 E.01229
G1 F4262.765
G1 X132.006 Y119.669 E.00126
G1 F3900
G1 X132.006 Y118.21 E.04483
G1 F4728.059
G1 X132.097 Y118.21 E.0028
G1 F6003
G1 X132.497 Y118.21 E.01229
G1 X132.897 Y118.21 E.01229
G1 X137.79 Y118.21 E.15035
G1 X137.79 Y125.26 E.21662
G1 X136.29 Y125.26 E.04609
G1 X136.29 Y130.69 E.16687
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.75 E-.57046
G1 X137.79 Y131.249 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.08 Y123.65 Z9.6 F42000
G1 X137.05 Y123.326 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6003
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6003
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6003
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/100
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.8 F4000
            G39.3 S1
            G0 Z9.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z9.600
M204 S10000
G1 X40.52 Y239.602 F42000
M73 P59 R8
G1 Z9.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z9.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y131.276
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6001
M204 S6000
G1 X137.398 Y131.276 E.04976
G1 X137.398 Y137.398 E.20307
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.744 Y118.602 E.17057
G1 X123.744 Y120.102 E.04976
G1 X132.266 Y120.102 E.28269
G1 X132.266 Y118.602 E.04976
G1 X137.398 Y118.602 E.17024
G1 X137.398 Y124.734 E.20339
G1 X135.898 Y124.734 E.04976
G1 X135.898 Y131.216 E.21504
M204 S250
G1 X136.29 Y130.884 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6001
M204 S5000
G1 X137.79 Y130.884 E.04609
G1 X137.79 Y137.79 E.2122
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.245 Y118.21 E.1547
G1 X123.645 Y118.21 E.01229
G1 X124.045 Y118.21 E.01229
G1 F4730.822
G1 X124.136 Y118.21 E.00281
G1 F3900
G1 X124.136 Y119.669 E.04483
G1 F4262.765
G1 X124.136 Y119.71 E.00126
G1 F6001
G1 X124.536 Y119.71 E.01229
G1 X124.936 Y119.71 E.01229
G1 X131.074 Y119.71 E.1886
G1 X131.474 Y119.71 E.01229
G1 X131.874 Y119.71 E.01229
G1 F4262.765
G1 X131.874 Y119.669 E.00126
G1 F3900
G1 X131.874 Y118.21 E.04483
G1 F4728.059
G1 X131.965 Y118.21 E.0028
G1 F6001
G1 X132.365 Y118.21 E.01229
G1 X132.765 Y118.21 E.01229
G1 X137.79 Y118.21 E.15441
G1 X137.79 Y125.126 E.2125
G1 X136.29 Y125.126 E.04609
G1 X136.29 Y130.824 E.1751
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y130.884 E-.57046
G1 X137.79 Y131.383 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6001
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6001
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F6001
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41861
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/100
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
M204 S10000
G17
M73 P60 R8
G3 Z9.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10 F4000
            G39.3 S1
            G0 Z10 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z9.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z9.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z9.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y131.41
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6004
M204 S6000
G1 X137.398 Y131.41 E.04976
G1 X137.398 Y137.398 E.19863
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.876 Y118.602 E.17496
G1 X123.876 Y120.102 E.04976
G1 X132.134 Y120.102 E.27391
G1 X132.134 Y118.602 E.04976
G1 X137.398 Y118.602 E.17462
G1 X137.398 Y124.599 E.19895
G1 X135.898 Y124.599 E.04976
G1 X135.898 Y131.35 E.22392
M204 S250
G1 X136.29 Y131.018 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6004
M204 S5000
G1 X137.79 Y131.018 E.04609
G1 X137.79 Y137.79 E.20809
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.377 Y118.21 E.15877
G1 X123.777 Y118.21 E.01229
G1 X124.177 Y118.21 E.01229
G1 F4730.822
G1 X124.268 Y118.21 E.00281
G1 F3900
G1 X124.268 Y119.669 E.04483
G1 F4262.765
G1 X124.268 Y119.71 E.00126
G1 F6004
G1 X124.668 Y119.71 E.01229
G1 X125.068 Y119.71 E.01229
G1 X130.942 Y119.71 E.18047
G1 X131.342 Y119.71 E.01229
G1 X131.742 Y119.71 E.01229
G1 F4262.765
G1 X131.742 Y119.669 E.00126
G1 F3900
G1 X131.742 Y118.21 E.04483
G1 F4728.059
G1 X131.833 Y118.21 E.0028
G1 F6004
G1 X132.233 Y118.21 E.01229
G1 X132.633 Y118.21 E.01229
G1 X137.79 Y118.21 E.15847
G1 X137.79 Y124.992 E.20838
G1 X136.29 Y124.992 E.04609
G1 X136.29 Y130.958 E.18333
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y131.018 E-.57046
G1 X137.79 Y131.517 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.103 Y123.915 Z10 F42000
G1 X137.05 Y123.326 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6004
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6004
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6004
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/100
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.2 F4000
            G39.3 S1
            G0 Z10.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z10.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z9.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z9.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y131.544
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6091
M204 S6000
G1 X137.398 Y131.544 E.04976
G1 X137.398 Y137.398 E.1942
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X124.009 Y118.602 E.17935
G1 X124.009 Y120.102 E.04976
G1 X132.002 Y120.102 E.26514
G1 X132.002 Y118.602 E.04976
G1 X137.398 Y118.602 E.179
G1 X137.398 Y124.465 E.1945
G1 X135.898 Y124.465 E.04976
G1 X135.898 Y131.484 E.23281
M204 S250
G1 X136.29 Y131.152 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6091
M204 S5000
G1 X137.79 Y131.152 E.04609
G1 X137.79 Y137.79 E.20398
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.509 Y118.21 E.16284
G1 X123.909 Y118.21 E.01229
G1 X124.309 Y118.21 E.01229
G1 F4730.822
G1 X124.401 Y118.21 E.00281
G1 F3900
G1 X124.401 Y119.669 E.04483
G1 F4262.765
G1 X124.401 Y119.71 E.00126
G1 F6091
G1 X124.801 Y119.71 E.01229
G1 X125.201 Y119.71 E.01229
G1 X130.81 Y119.71 E.17234
G1 X131.21 Y119.71 E.01229
G1 X131.61 Y119.71 E.01229
G1 F4262.765
G1 X131.61 Y119.669 E.00126
G1 F3900
G1 X131.61 Y118.21 E.04483
G1 F4727.963
G1 X131.701 Y118.21 E.0028
G1 F6091
G1 X132.101 Y118.21 E.01229
G1 X132.501 Y118.21 E.01229
G1 X137.79 Y118.21 E.16253
G1 X137.79 Y124.858 E.20426
G1 X136.29 Y124.858 E.04609
G1 X136.29 Y131.092 E.19156
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y131.152 E-.57046
G1 X137.79 Y131.65 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6091
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
M73 P61 R8
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6091
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
; WIPE_START
G1 F15476.087
G1 X137.05 Y121.698 E-.61876
G1 X136.787 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.188 Y127.526 Z10.2 F42000
G1 X124.998 Y137.05 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F6091
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/100
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.4 F4000
            G39.3 S1
            G0 Z10.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z10.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z10
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z10
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y131.678
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6024
M204 S6000
G1 X137.398 Y131.678 E.04976
G1 X137.398 Y137.398 E.18976
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X124.141 Y118.602 E.18374
G1 X124.141 Y120.102 E.04976
G1 X131.87 Y120.102 E.25637
G1 X131.87 Y118.602 E.04976
G1 X137.398 Y118.602 E.18338
G1 X137.398 Y124.331 E.19005
G1 X135.898 Y124.331 E.04976
G1 X135.898 Y131.618 E.24169
M204 S250
G1 X136.29 Y131.285 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6024
M204 S5000
G1 X137.79 Y131.285 E.04609
G1 X137.79 Y137.79 E.19987
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.642 Y118.21 E.1669
G1 X124.042 Y118.21 E.01229
G1 X124.442 Y118.21 E.01229
G1 F4730.822
G1 X124.533 Y118.21 E.00281
G1 F3900
G1 X124.533 Y119.669 E.04483
G1 F4262.765
G1 X124.533 Y119.71 E.00126
G1 F6024
G1 X124.933 Y119.71 E.01229
G1 X125.333 Y119.71 E.01229
G1 X130.678 Y119.71 E.16422
G1 X131.078 Y119.71 E.01229
G1 X131.478 Y119.71 E.01229
G1 F4262.765
G1 X131.478 Y119.669 E.00126
G1 F3900
G1 X131.478 Y118.21 E.04483
G1 F4728.059
G1 X131.569 Y118.21 E.0028
G1 F6024
G1 X131.969 Y118.21 E.01229
G1 X132.369 Y118.21 E.01229
G1 X137.79 Y118.21 E.16658
G1 X137.79 Y124.723 E.20014
G1 X136.29 Y124.723 E.04609
G1 X136.29 Y131.225 E.19979
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y131.285 E-.57046
G1 X137.79 Y131.784 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6024
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X137.05 Y123.326 F42000
G1 F6024
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6024
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41861
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/100
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.6 F4000
            G39.3 S1
            G0 Z10.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z10.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z10.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z10.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y131.811
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6091
M204 S6000
G1 X137.398 Y131.811 E.04976
G1 X137.398 Y137.398 E.18532
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X124.273 Y118.602 E.18813
M73 P62 R8
G1 X124.273 Y120.102 E.04976
G1 X131.738 Y120.102 E.2476
G1 X131.738 Y118.602 E.04976
G1 X137.398 Y118.602 E.18777
G1 X137.398 Y124.197 E.18561
G1 X135.898 Y124.197 E.04976
G1 X135.898 Y131.751 E.25058
M204 S250
G1 X136.29 Y131.419 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6091
M204 S5000
G1 X137.79 Y131.419 E.04609
G1 X137.79 Y137.79 E.19576
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.774 Y118.21 E.17097
G1 X124.174 Y118.21 E.01229
G1 X124.574 Y118.21 E.01229
G1 F4730.822
G1 X124.666 Y118.21 E.00281
G1 F3900
G1 X124.666 Y119.669 E.04483
G1 F4262.765
G1 X124.666 Y119.71 E.00126
G1 F6091
G1 X125.066 Y119.71 E.01229
G1 X125.466 Y119.71 E.01229
G1 X130.545 Y119.71 E.15609
G1 X130.945 Y119.71 E.01229
G1 X131.345 Y119.71 E.01229
G1 F4262.765
G1 X131.345 Y119.669 E.00126
G1 F3900
G1 X131.345 Y118.21 E.04483
G1 F4728.059
G1 X131.437 Y118.21 E.0028
G1 F6091
G1 X131.837 Y118.21 E.01229
G1 X132.237 Y118.21 E.01229
G1 X137.79 Y118.21 E.17064
G1 X137.79 Y124.589 E.19602
G1 X136.29 Y124.589 E.04609
G1 X136.29 Y131.359 E.20802
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y131.419 E-.57046
G1 X137.79 Y131.918 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6091
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6091
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
; WIPE_START
G1 F15476.087
G1 X137.05 Y121.698 E-.61876
G1 X136.787 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.188 Y127.526 Z10.6 F42000
G1 X124.998 Y137.05 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F6091
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/100
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.8 F4000
            G39.3 S1
            G0 Z10.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z10.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z10.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z10.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y131.945
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6097
M204 S6000
G1 X137.398 Y131.945 E.04976
G1 X137.398 Y137.398 E.18088
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X124.406 Y118.602 E.19252
G1 X124.406 Y120.102 E.04976
G1 X131.69 Y120.102 E.24162
G1 X131.69 Y118.602 E.04976
G1 X137.398 Y118.602 E.18935
G1 X137.398 Y124.063 E.18116
G1 X135.898 Y124.063 E.04976
G1 X135.898 Y131.885 E.25946
M204 S250
G1 X136.29 Y131.553 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6097
M204 S5000
G1 X137.79 Y131.553 E.04609
G1 X137.79 Y137.79 E.19164
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.907 Y118.21 E.17504
G1 X124.307 Y118.21 E.01229
G1 X124.707 Y118.21 E.01229
G1 F4730.822
G1 X124.798 Y118.21 E.00281
G1 F3900
G1 X124.798 Y119.669 E.04483
G1 F4262.765
G1 X124.798 Y119.71 E.00126
G1 F6097
G1 X125.198 Y119.71 E.01229
G1 X125.598 Y119.71 E.01229
G1 X131.298 Y119.71 E.17514
G1 X131.298 Y119.669 E.00126
G1 X131.298 Y118.21 E.04483
G1 X131.304 Y118.21 E.00021
G1 X137.79 Y118.21 E.19928
G1 X137.79 Y124.455 E.1919
G1 X136.29 Y124.455 E.04609
G1 X136.29 Y131.493 E.21625
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y131.553 E-.57046
G1 X137.79 Y132.052 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.644 Y136.577 Z10.8 F42000
G1 X131.002 Y137.05 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6097
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6097
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
; WIPE_START
G1 F15476.087
G1 X137.05 Y134.302 E-.61876
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.965 Y126.935 Z10.8 F42000
G1 X137.05 Y123.326 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F6097
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/100
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
M204 S10000
G17
G3 Z10.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11 F4000
            G39.3 S1
            G0 Z11 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z10.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z10.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
M73 P63 R8
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z10.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y132.079
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5995
M204 S6000
G1 X137.398 Y132.079 E.04976
G1 X137.398 Y137.398 E.17644
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X124.298 Y118.602 E.18893
G1 X124.298 Y120.102 E.04976
G1 X131.818 Y120.102 E.24948
G1 X131.818 Y118.602 E.04976
G1 X137.398 Y118.602 E.18509
G1 X137.398 Y123.929 E.17671
G1 X135.898 Y123.929 E.04976
G1 X135.898 Y132.019 E.26835
M204 S250
G1 X136.29 Y131.687 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5995
M204 S5000
G1 X137.79 Y131.687 E.04609
G1 X137.79 Y137.79 E.18753
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X124.69 Y118.21 E.1991
G1 X124.69 Y119.71 E.04609
G1 X131.426 Y119.71 E.207
G1 X131.426 Y118.21 E.04609
G1 X137.79 Y118.21 E.19554
G1 X137.79 Y124.321 E.18779
G1 X136.29 Y124.321 E.04609
G1 X136.29 Y131.627 E.22448
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y131.687 E-.57046
G1 X137.79 Y132.186 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5995
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F5995
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.326 E.05401
; WIPE_START
G1 F15476.087
G1 X137.05 Y121.698 E-.61876
G1 X136.787 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.188 Y127.526 Z11 F42000
G1 X124.998 Y137.05 Z11
G1 Z10.6
G1 E.8 F1800
G1 F5995
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/100
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.2 F4000
            G39.3 S1
            G0 Z11.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z11.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z10.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z10.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y132.213
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6073
M204 S6000
G1 X137.398 Y132.213 E.04976
G1 X137.398 Y137.398 E.172
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X124.167 Y118.602 E.18459
G1 X124.167 Y120.102 E.04976
G1 X131.947 Y120.102 E.25808
G1 X131.947 Y118.602 E.04976
G1 X137.398 Y118.602 E.18083
G1 X137.398 Y123.795 E.17227
G1 X135.898 Y123.795 E.04976
G1 X135.898 Y132.153 E.27723
M204 S250
G1 X136.29 Y131.821 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6073
M204 S5000
G1 X137.79 Y131.821 E.04609
G1 X137.79 Y137.79 E.18342
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X124.559 Y118.21 E.19508
G1 X124.559 Y119.71 E.04609
G1 X131.555 Y119.71 E.21497
G1 X131.555 Y118.21 E.04609
G1 X137.79 Y118.21 E.19159
G1 X137.79 Y124.187 E.18367
G1 X136.29 Y124.187 E.04609
G1 X136.29 Y131.761 E.23271
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y131.821 E-.57046
G1 X137.79 Y132.319 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.528 Y136.683 Z11.2 F42000
G1 X131.002 Y137.05 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6073
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6073
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.674 E.05401
; WIPE_START
G1 F15476.087
G1 X137.05 Y134.302 E-.61876
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.965 Y126.935 Z11.2 F42000
G1 X137.05 Y123.326 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F6073
M204 S6000
G1 X137.05 Y121.698 E.05401
M73 P64 R8
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
M73 P64 R7
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/100
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
M204 S10000
G17
G3 Z11.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.4 F4000
            G39.3 S1
            G0 Z11.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z11.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z11
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z11
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y132.347
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5994
M204 S6000
G1 X137.398 Y132.347 E.04976
G1 X137.398 Y137.398 E.16756
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X124.036 Y118.602 E.18024
G1 X124.036 Y120.102 E.04976
G1 X132.075 Y120.102 E.26669
G1 X132.075 Y118.602 E.04976
G1 X137.398 Y118.602 E.17656
G1 X137.398 Y123.661 E.16782
G1 X135.898 Y123.661 E.04976
G1 X135.898 Y132.287 E.28612
M204 S250
G1 X136.29 Y131.954 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5994
M204 S5000
G1 X137.79 Y131.954 E.04609
G1 X137.79 Y137.79 E.17931
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X124.428 Y118.21 E.19105
G1 X124.428 Y119.71 E.04609
G1 X131.683 Y119.71 E.22294
G1 X131.683 Y118.21 E.04609
G1 X137.79 Y118.21 E.18764
G1 X137.79 Y124.053 E.17955
G1 X136.29 Y124.053 E.04609
G1 X136.29 Y131.894 E.24094
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y131.954 E-.57046
G1 X137.79 Y132.453 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.029 Y132.695 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5994
M204 S6000
G1 X137.05 Y134.302 E.05333
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F5994
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.037 Y123.313 E.05358
; WIPE_START
G1 F15476.087
G1 X137.05 Y121.698 E-.61379
G1 X136.778 Y121.426 E-.14621
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.183 Y127.52 Z11.4 F42000
G1 X124.998 Y137.05 Z11.4
G1 Z11
G1 E.8 F1800
G1 F5994
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/100
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
M204 S10000
G17
G3 Z11.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.6 F4000
            G39.3 S1
            G0 Z11.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z11.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z11.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z11.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y132.48
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5979
M204 S6000
G1 X137.398 Y132.48 E.04976
G1 X137.398 Y137.398 E.16313
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.905 Y118.602 E.1759
G1 X123.905 Y120.102 E.04976
G1 X132.204 Y120.102 E.2753
G1 X132.204 Y118.602 E.04976
G1 X137.398 Y118.602 E.1723
G1 X137.398 Y123.527 E.16337
G1 X135.898 Y123.527 E.04976
G1 X135.898 Y132.42 E.295
M204 S250
G1 X136.29 Y132.088 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5979
M204 S5000
G1 X137.79 Y132.088 E.04609
G1 X137.79 Y137.79 E.1752
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X124.297 Y118.21 E.18703
G1 X124.297 Y119.71 E.04609
G1 X131.812 Y119.71 E.23092
G1 X131.812 Y118.21 E.04609
G1 X137.79 Y118.21 E.18369
G1 X137.79 Y123.919 E.17543
M73 P65 R7
G1 X136.29 Y123.919 E.04609
G1 X136.29 Y132.028 E.24917
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y132.088 E-.57046
G1 X137.79 Y132.587 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.895 Y132.829 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5979
M204 S6000
G1 X137.05 Y132.829 E.00513
G1 X137.05 Y134.302 E.04888
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X136.902 Y123.179 F42000
G1 F5979
M204 S6000
G1 X137.05 Y123.179 E.00488
G1 X137.05 Y121.698 E.04913
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F5979
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41861
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/100
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
M204 S10000
G17
G3 Z11.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.8 F4000
            G39.3 S1
            G0 Z11.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z11.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z11.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z11.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y132.614
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5998
M204 S6000
G1 X137.398 Y132.614 E.04976
G1 X137.398 Y137.398 E.15869
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.774 Y118.602 E.17155
G1 X123.774 Y120.102 E.04976
G1 X132.332 Y120.102 E.28391
G1 X132.332 Y118.602 E.04976
G1 X137.398 Y118.602 E.16803
G1 X137.398 Y123.393 E.15893
G1 X135.898 Y123.393 E.04976
G1 X135.898 Y132.554 E.30389
M204 S250
G1 X136.29 Y132.222 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5998
M204 S5000
G1 X137.79 Y132.222 E.04609
G1 X137.79 Y137.79 E.17109
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X124.166 Y118.21 E.183
G1 X124.166 Y119.71 E.04609
G1 X131.94 Y119.71 E.23889
G1 X131.94 Y118.21 E.04609
G1 X137.79 Y118.21 E.17975
G1 X137.79 Y123.785 E.17131
G1 X136.29 Y123.785 E.04609
G1 X136.29 Y132.162 E.2574
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y132.222 E-.57046
G1 X137.79 Y132.721 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.56 Y135.167 Z11.8 F42000
G1 X124.998 Y137.05 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5998
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41861
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F5998
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y123.045 E.04469
G1 X136.768 Y123.045 E.00933
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F5998
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y132.962 E.04444
G1 X136.761 Y132.962 E.00957
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X137.05 Y132.962 E-.10963
G1 X137.05 Y134.302 E-.50914
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/100
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
M204 S10000
G17
G3 Z11.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12 F4000
            G39.3 S1
            G0 Z12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z11.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z11.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z11.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y132.748
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6123
M204 S6000
G1 X137.398 Y132.748 E.04976
G1 X137.398 Y137.398 E.15425
G1 X118.602 Y137.398 E.62349
M73 P66 R7
G1 X118.602 Y118.602 E.62349
G1 X123.643 Y118.602 E.16721
G1 X123.643 Y120.102 E.04976
G1 X132.461 Y120.102 E.29252
G1 X132.461 Y118.602 E.04976
G1 X137.398 Y118.602 E.16377
G1 X137.398 Y123.259 E.15448
G1 X135.898 Y123.259 E.04976
G1 X135.898 Y132.688 E.31277
M204 S250
G1 X136.29 Y132.356 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6123
M204 S5000
G1 X137.79 Y132.356 E.04609
G1 X137.79 Y137.79 E.16698
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X124.035 Y118.21 E.17898
G1 X124.035 Y119.71 E.04609
G1 X132.069 Y119.71 E.24686
G1 X132.069 Y118.21 E.04609
G1 X137.79 Y118.21 E.1758
G1 X137.79 Y123.651 E.16719
G1 X136.29 Y123.651 E.04609
G1 X136.29 Y132.296 E.26563
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y132.356 E-.57046
G1 X137.79 Y132.855 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.297 Y136.867 Z12 F42000
G1 X131.002 Y137.05 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6123
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6123
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y133.096 E.04001
G1 X136.627 Y133.096 E.01401
; WIPE_START
G1 F15476.087
G1 X137.05 Y133.096 E-.16047
G1 X137.05 Y134.302 E-.45829
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.687 Y126.933 Z12 F42000
G1 X136.634 Y122.911 Z12
G1 Z11.6
G1 E.8 F1800
G1 F6123
M204 S6000
G1 X137.05 Y122.911 E.01377
G1 X137.05 Y121.698 E.04024
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/100
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
M204 S10000
G17
G3 Z12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.2 F4000
            G39.3 S1
            G0 Z12.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z12.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z11.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z11.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y132.882
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5907
M204 S6000
G1 X137.398 Y132.882 E.04976
G1 X137.398 Y137.398 E.14981
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.512 Y118.602 E.16286
G1 X123.512 Y120.102 E.04976
G1 X132.589 Y120.102 E.30112
G1 X132.589 Y118.602 E.04976
G1 X137.398 Y118.602 E.15951
G1 X137.398 Y123.125 E.15004
G1 X135.898 Y123.125 E.04976
G1 X135.898 Y132.822 E.32166
M204 S250
G1 X136.29 Y132.49 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5907
M204 S5000
G1 X137.79 Y132.49 E.04609
G1 X137.79 Y137.79 E.16286
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.904 Y118.21 E.17496
G1 X123.904 Y119.71 E.04609
G1 X132.197 Y119.71 E.25484
G1 X132.197 Y118.21 E.04609
G1 X137.79 Y118.21 E.17185
G1 X137.79 Y123.517 E.16307
G1 X136.29 Y123.517 E.04609
G1 X136.29 Y132.43 E.27386
M204 S10000
G1 X136.494 Y133.23 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5907
M204 S6000
G1 X137.05 Y133.23 E.01845
G1 X137.05 Y134.302 E.03557
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F5907
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y122.777 E.03579
G1 X136.5 Y122.777 E.01822
; WIPE_START
G1 F15476.087
G1 X137.05 Y122.777 E-.20873
G1 X137.05 Y121.698 E-.41003
G1 X136.787 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.188 Y127.526 Z12.2 F42000
G1 X124.998 Y137.05 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F5907
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
M73 P67 R7
G1 E-.04 F1800
; layer num/total_layer_count: 60/100
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
M204 S10000
G17
G3 Z12.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.4 F4000
            G39.3 S1
            G0 Z12.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z12.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z12
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z12
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y133.016
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6073
M204 S6000
G1 X137.398 Y133.016 E.04976
G1 X137.398 Y137.398 E.14537
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.381 Y118.602 E.15852
G1 X123.381 Y120.102 E.04976
G1 X132.718 Y120.102 E.30973
G1 X132.718 Y118.602 E.04976
G1 X137.398 Y118.602 E.15524
G1 X137.398 Y122.991 E.14559
G1 X135.898 Y122.991 E.04976
G1 X135.898 Y132.956 E.33054
M204 S250
G1 X136.29 Y132.623 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6073
M204 S5000
G1 X137.79 Y132.623 E.04609
G1 X137.79 Y137.79 E.15875
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.773 Y118.21 E.17093
G1 X123.773 Y119.71 E.04609
G1 X132.326 Y119.71 E.26281
G1 X132.326 Y118.21 E.04609
G1 X137.79 Y118.21 E.1679
G1 X137.79 Y123.383 E.15895
G1 X136.29 Y123.383 E.04609
G1 X136.29 Y132.563 E.28209
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y132.623 E-.57046
G1 X137.79 Y133.122 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.184 Y136.945 Z12.4 F42000
G1 X131.002 Y137.05 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6073
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6073
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y133.364 E.03113
G1 X136.36 Y133.364 E.02289
; WIPE_START
G1 F15476.087
G1 X137.05 Y133.364 E-.26216
G1 X137.05 Y134.302 E-.3566
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.518 Y126.937 Z12.4 F42000
G1 X136.366 Y122.643 Z12.4
G1 Z12
G1 E.8 F1800
G1 F6073
M204 S6000
G1 X137.05 Y122.643 E.02267
G1 X137.05 Y121.698 E.03135
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/100
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
M204 S10000
G17
G3 Z12.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.6 F4000
            G39.3 S1
            G0 Z12.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z12.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z12.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z12.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y133.149
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5907
M204 S6000
G1 X137.398 Y133.149 E.04976
G1 X137.398 Y137.398 E.14093
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.25 Y118.602 E.15417
G1 X123.25 Y120.102 E.04976
G1 X132.847 Y120.102 E.31834
G1 X132.847 Y118.602 E.04976
G1 X137.398 Y118.602 E.15098
G1 X137.398 Y122.857 E.14114
G1 X135.898 Y122.857 E.04976
G1 X135.898 Y133.089 E.33943
M204 S250
G1 X136.29 Y132.757 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5907
M204 S5000
G1 X137.79 Y132.757 E.04609
G1 X137.79 Y137.79 E.15464
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.642 Y118.21 E.16691
G1 X123.642 Y119.71 E.04609
G1 X132.454 Y119.71 E.27079
G1 X132.454 Y118.21 E.04609
G1 X137.79 Y118.21 E.16395
G1 X137.79 Y123.249 E.15484
G1 X136.29 Y123.249 E.04609
G1 X136.29 Y132.697 E.29032
M204 S10000
G1 X136.226 Y133.498 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5907
M204 S6000
G1 X137.05 Y133.498 E.02732
G1 X137.05 Y134.302 E.02669
M73 P68 R7
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F5907
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y122.509 E.0269
G1 X136.232 Y122.509 E.02711
; WIPE_START
G1 F15476.087
G1 X137.05 Y122.509 E-.3106
G1 X137.05 Y121.698 E-.30817
G1 X136.787 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.188 Y127.526 Z12.6 F42000
G1 X124.998 Y137.05 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F5907
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/100
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
M204 S10000
G17
G3 Z12.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.8 F4000
            G39.3 S1
            G0 Z12.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z12.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z12.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z12.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y133.283
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6074
M204 S6000
G1 X137.398 Y133.283 E.04976
G1 X137.398 Y137.398 E.1365
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X123.119 Y118.602 E.14983
G1 X123.119 Y120.102 E.04976
G1 X132.975 Y120.102 E.32695
G1 X132.975 Y118.602 E.04976
G1 X137.398 Y118.602 E.14672
G1 X137.398 Y122.723 E.1367
G1 X135.898 Y122.723 E.04976
G1 X135.898 Y133.223 E.34831
M204 S250
G1 X136.29 Y132.891 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6074
M204 S5000
G1 X137.79 Y132.891 E.04609
G1 X137.79 Y137.79 E.15053
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.511 Y118.21 E.16288
G1 X123.511 Y119.71 E.04609
M73 P68 R6
G1 X132.583 Y119.71 E.27876
G1 X132.583 Y118.21 E.04609
G1 X137.79 Y118.21 E.16
G1 X137.79 Y123.115 E.15072
G1 X136.29 Y123.115 E.04609
G1 X136.29 Y132.831 E.29855
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y132.891 E-.57046
G1 X137.79 Y133.39 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.072 Y137.012 Z12.8 F42000
G1 X131.002 Y137.05 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6074
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6074
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y133.631 E.02225
G1 X136.092 Y133.631 E.03176
; WIPE_START
G1 F15476.087
G1 X137.05 Y133.631 E-.36385
G1 X137.05 Y134.302 E-.25491
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.356 Y126.945 Z12.8 F42000
G1 X136.098 Y122.375 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F6074
M204 S6000
G1 X137.05 Y122.375 E.03156
G1 X137.05 Y121.698 E.02245
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/100
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
M204 S10000
G17
G3 Z12.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13 F4000
            G39.3 S1
            G0 Z13 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z12.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z12.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z12.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y133.417
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5823
M204 S6000
G1 X137.398 Y133.417 E.04976
G1 X137.398 Y137.398 E.13206
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.988 Y118.602 E.14549
G1 X122.988 Y120.102 E.04976
M73 P69 R6
G1 X133.104 Y120.102 E.33556
G1 X133.104 Y118.602 E.04976
G1 X137.398 Y118.602 E.14245
G1 X137.398 Y122.589 E.13225
G1 X135.898 Y122.589 E.04976
G1 X135.898 Y133.357 E.3572
M204 S250
G1 X136.29 Y133.025 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5823
M204 S5000
G1 X137.79 Y133.025 E.04609
G1 X137.79 Y137.79 E.14642
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.38 Y118.21 E.15886
G1 X123.38 Y119.71 E.04609
G1 X132.712 Y119.71 E.28673
G1 X132.712 Y118.21 E.04609
G1 X137.79 Y118.21 E.15605
G1 X137.79 Y122.981 E.1466
G1 X136.29 Y122.981 E.04609
G1 X136.29 Y132.965 E.30678
M204 S10000
G1 X135.958 Y133.765 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5823
M204 S6000
G1 X137.05 Y133.765 E.0362
G1 X137.05 Y134.302 E.01781
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F5823
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y122.241 E.01801
G1 X135.964 Y122.241 E.03601
M204 S10000
G1 X124.998 Y137.05 F42000
G1 F5823
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/100
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
M204 S10000
G17
G3 Z13 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13.2 F4000
            G39.3 S1
            G0 Z13.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z13.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z12.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z12.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y133.551
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5890
M204 S6000
G1 X137.398 Y133.551 E.04976
G1 X137.398 Y137.398 E.12762
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.857 Y118.602 E.14114
G1 X122.857 Y120.102 E.04976
G1 X133.232 Y120.102 E.34416
G1 X133.232 Y118.602 E.04976
G1 X137.398 Y118.602 E.13819
G1 X137.398 Y122.455 E.1278
G1 X135.898 Y122.455 E.04976
G1 X135.898 Y133.491 E.36608
M204 S250
G1 X136.29 Y133.159 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5890
M204 S5000
G1 X137.79 Y133.159 E.04609
G1 X137.79 Y137.79 E.14231
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.249 Y118.21 E.15483
G1 X123.249 Y119.71 E.04609
G1 X132.84 Y119.71 E.29471
G1 X132.84 Y118.21 E.04609
G1 X137.79 Y118.21 E.1521
G1 X137.79 Y122.847 E.14248
G1 X136.29 Y122.847 E.04609
G1 X136.29 Y133.099 E.31501
M204 S10000
G1 X135.825 Y133.899 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5890
M204 S6000
G1 X137.05 Y133.899 E.04064
G1 X137.05 Y134.302 E.01338
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X135.83 Y122.107 F42000
G1 F5890
M204 S6000
G1 X137.05 Y122.107 E.04045
G1 X137.05 Y121.698 E.01356
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F5890
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41861
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/100
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
M204 S10000
G17
G3 Z13.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13.4 F4000
            G39.3 S1
            G0 Z13.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z13.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z13
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z13
G1 E.8 F1800
M106 S255
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
M73 P70 R6
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y133.685
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6707
M204 S6000
G1 X137.398 Y133.685 E.04976
G1 X137.398 Y137.398 E.12318
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.726 Y118.602 E.1368
G1 X122.726 Y120.102 E.04976
G1 X133.361 Y120.102 E.35277
G1 X133.361 Y118.602 E.04976
G1 X137.398 Y118.602 E.13392
G1 X137.398 Y122.321 E.12336
G1 X135.898 Y122.321 E.04976
G1 X135.898 Y133.625 E.37497
M204 S250
G1 X136.29 Y133.292 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6707
M204 S5000
G1 X137.79 Y133.292 E.04609
G1 X137.79 Y137.79 E.1382
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X123.118 Y118.21 E.15081
G1 X123.118 Y119.71 E.04609
G1 X132.969 Y119.71 E.30268
G1 X132.969 Y118.21 E.04609
G1 X137.79 Y118.21 E.14815
G1 X137.79 Y122.713 E.13836
G1 X136.29 Y122.713 E.04609
G1 X136.29 Y126.746 E.12392
G1 X136.29 Y127.146 E.01229
G1 X136.29 Y127.546 E.01229
G1 F3030.236
G1 X136.29 Y127.946 E.01229
G1 F747.19
G1 X136.331 Y127.946 E.00126
G1 F600
G1 X136.931 Y127.946 E.01844
M106 S201.45
M106 S255
G1 X137.19 Y127.946 E.00796
M106 S201.45
M106 S255
G1 X137.79 Y127.946 E.01844
G1 X137.79 Y128.076 E.00401
G1 X137.19 Y128.076 E.01844
M106 S201.45
M106 S255
G1 X136.931 Y128.076 E.00796
M106 S201.45
M106 S255
G1 X136.331 Y128.076 E.01844
M106 S201.45
G1 F747.19
G1 X136.29 Y128.076 E.00126
G1 F3030.236
G1 X136.29 Y128.476 E.01229
G1 F6707
G1 X136.29 Y128.876 E.01229
G1 X136.29 Y129.276 E.01229
G1 X136.29 Y133.232 E.12157
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y133.292 E-.57046
G1 X137.79 Y133.791 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.394 Y135.675 Z13.4 F42000
G1 X124.998 Y137.05 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6707
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41861
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6707
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X137.05 Y121.973 E.00912
G1 X135.696 Y121.973 E.0449
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6707
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y134.033 E.00894
G1 X135.691 Y134.033 E.04508
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y134.033 E-.51639
G1 X137.05 Y134.302 E-.10238
G1 X136.787 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/100
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
M204 S10000
G17
G3 Z13.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13.6 F4000
            G39.3 S1
            G0 Z13.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z13.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z13.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z13.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y133.818
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6103
M204 S6000
G1 X137.398 Y133.818 E.04976
G1 X137.398 Y137.398 E.11874
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.595 Y118.602 E.13245
G1 X122.595 Y120.102 E.04976
G1 X133.489 Y120.102 E.36138
G1 X133.489 Y118.602 E.04976
G1 X137.398 Y118.602 E.12966
G1 X137.398 Y122.187 E.11891
G1 X135.898 Y122.187 E.04976
G1 X135.898 Y133.758 E.38385
M204 S250
G1 X136.29 Y133.426 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6103
M204 S5000
G1 X137.79 Y133.426 E.04609
G1 X137.79 Y137.79 E.13408
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.987 Y118.21 E.14679
G1 X122.987 Y119.71 E.04609
G1 X133.097 Y119.71 E.31065
G1 X133.097 Y118.21 E.04609
G1 X137.79 Y118.21 E.1442
G1 X137.79 Y122.579 E.13424
G1 X136.29 Y122.579 E.04609
M73 P71 R6
G1 X136.29 Y127.026 E.13666
G1 X136.29 Y127.426 E.01229
G1 X136.29 Y127.826 E.01229
G1 X136.331 Y127.826 E.00126
G1 F5700
G1 X137.79 Y127.826 E.04483
G1 F6103
G1 X137.79 Y127.905 E.00241
G1 X137.79 Y128.117 E.00653
G1 X137.79 Y128.196 E.00242
G1 F5700
G1 X136.331 Y128.196 E.04483
G1 F6103
G1 X136.29 Y128.196 E.00126
G1 X136.29 Y128.596 E.01229
G1 X136.29 Y128.996 E.01229
G1 X136.29 Y133.366 E.13429
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y133.426 E-.57046
G1 X137.79 Y133.925 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y137.05 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6103
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6103
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X137.05 Y134.302 E.12889
G1 X137.05 Y134.167 E.0045
G1 X135.557 Y134.167 E.04952
M204 S10000
G1 X135.562 Y121.839 F42000
G1 F6103
M204 S6000
G1 X137.05 Y121.839 E.04934
G1 X137.05 Y121.698 E.00467
G1 X134.302 Y118.95 E.12889
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/100
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
M204 S10000
G17
G3 Z13.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13.8 F4000
            G39.3 S1
            G0 Z13.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z13.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z13.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
M106 S255
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z13.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y133.952
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6918
M204 S6000
G1 X137.398 Y133.952 E.04976
G1 X137.398 Y137.398 E.1143
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.464 Y118.602 E.12811
G1 X122.464 Y120.102 E.04976
G1 X133.618 Y120.102 E.36999
G1 X133.618 Y118.602 E.04976
G1 X137.398 Y118.602 E.1254
G1 X137.398 Y122.053 E.11447
G1 X135.898 Y122.053 E.04976
G1 X135.898 Y133.892 E.39273
M204 S250
G1 X136.29 Y133.56 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6918
M204 S5000
G1 X137.79 Y133.56 E.04609
G1 X137.79 Y137.79 E.12997
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.856 Y118.21 E.14276
G1 X122.856 Y119.71 E.04609
G1 X126.848 Y119.71 E.12267
G1 X127.248 Y119.71 E.01229
G1 F6849.283
G1 X127.648 Y119.71 E.01229
G1 F3030.236
G1 X128.048 Y119.71 E.01229
G1 F747.19
G1 X128.048 Y119.669 E.00126
G1 F600
G1 X128.048 Y119.069 E.01844
M106 S201.45
M106 S255
G1 X128.048 Y118.81 E.00796
M106 S201.45
M106 S255
G1 X128.048 Y118.21 E.01844
G1 X128.099 Y118.21 E.00156
G1 X128.099 Y118.81 E.01844
M106 S201.45
M106 S255
G1 X128.099 Y119.069 E.00796
M106 S201.45
M106 S255
G1 X128.099 Y119.669 E.01844
M106 S201.45
G1 F747.19
G1 X128.099 Y119.71 E.00126
G1 F3030.236
G1 X128.499 Y119.71 E.01229
G1 F6849.283
G1 X128.899 Y119.71 E.01229
G1 F6918
G1 X129.299 Y119.71 E.01229
G1 X133.226 Y119.71 E.12066
G1 X133.226 Y118.21 E.04609
G1 X137.79 Y118.21 E.14025
G1 X137.79 Y122.445 E.13012
G1 X136.29 Y122.445 E.04609
G1 X136.29 Y126.907 E.13711
G1 X136.29 Y127.307 E.01229
G1 X136.29 Y127.707 E.01229
G1 F6136.876
G1 X136.331 Y127.707 E.00126
G1 F5700
G1 X137.79 Y127.707 E.04483
G1 F6550.347
G1 X137.79 Y127.785 E.00241
G1 F6918
G1 X137.79 Y128.237 E.01387
G1 F6553.039
G1 X137.79 Y128.316 E.00242
G1 F5700
G1 X136.331 Y128.316 E.04483
G1 F6136.876
G1 X136.29 Y128.316 E.00126
G1 F6918
G1 X136.29 Y128.716 E.01229
G1 X136.29 Y129.116 E.01229
G1 X136.29 Y133.5 E.13472
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y133.56 E-.57046
G1 X137.79 Y134.059 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.55 Y134.174 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6918
M204 S6000
G1 X135.55 Y134.3 E.0042
G1 X137.05 Y134.302 E.04976
G1 X134.302 Y137.05 E.12889
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6918
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.302 Y118.95 E.09114
G1 X137.05 Y121.698 E.12889
G1 X135.55 Y121.704 E.04976
G1 X135.55 Y121.826 E.00403
; WIPE_START
G1 F15476.087
G1 X135.55 Y121.704 E-.0462
G1 X137.05 Y121.698 E-.57001
G1 X136.782 Y121.43 E-.14379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.094 Y128.011 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.25954
G1 F6918
M204 S6000
G1 X137.594 Y128.011 E.02648
; WIPE_START
G1 F15000
G1 X136.094 Y128.011 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.176 Y132.832 Z13.8 F42000
G1 X124.998 Y137.05 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6918
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
M73 P72 R6
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/100
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
M204 S10000
G17
G3 Z13.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z14 F4000
            G39.3 S1
            G0 Z14 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z13.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z13.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z13.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y134.086
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6205
M204 S6000
G1 X137.398 Y134.086 E.04976
G1 X137.398 Y137.398 E.10986
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.333 Y118.602 E.12376
G1 X122.333 Y120.102 E.04976
G1 X133.746 Y120.102 E.3786
G1 X133.746 Y118.602 E.04976
G1 X137.398 Y118.602 E.12113
G1 X137.398 Y121.919 E.11002
G1 X135.898 Y121.919 E.04976
G1 X135.898 Y134.026 E.40162
M204 S250
G1 X136.29 Y133.694 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6205
M204 S5000
G1 X137.79 Y133.694 E.04609
G1 X137.79 Y137.79 E.12586
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.725 Y118.21 E.13874
G1 X122.725 Y119.71 E.04609
G1 X127.533 Y119.71 E.14774
G1 X127.933 Y119.71 E.01229
G1 X127.933 Y119.669 E.00126
G1 X127.933 Y118.21 E.04483
G1 X128.007 Y118.21 E.00228
G1 X128.14 Y118.21 E.00408
G1 X128.211 Y118.21 E.00218
G1 X128.211 Y119.669 E.04483
G1 X128.211 Y119.71 E.00126
G1 X128.611 Y119.71 E.01229
G1 X133.354 Y119.71 E.14575
G1 X133.354 Y118.21 E.04609
G1 X137.79 Y118.21 E.1363
G1 X137.79 Y122.311 E.12601
G1 X136.29 Y122.311 E.04609
G1 X136.29 Y126.787 E.13756
G1 X136.29 Y127.187 E.01229
G1 X136.29 Y127.587 E.01229
G1 F6136.876
G1 X136.331 Y127.587 E.00126
G1 F5700
G1 X137.79 Y127.587 E.04483
G1 F6205
G1 X137.79 Y127.666 E.00241
G1 X137.79 Y128.066 E.01229
G1 X137.79 Y128.357 E.00893
G1 X137.79 Y128.435 E.00242
G1 F5700
G1 X136.331 Y128.435 E.04483
G1 F6136.876
G1 X136.29 Y128.435 E.00126
G1 F6205
G1 X136.29 Y128.835 E.01229
G1 X136.29 Y129.235 E.01229
G1 X136.29 Y133.634 E.13516
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y133.694 E-.57046
G1 X137.79 Y134.193 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.094 Y128.011 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.49867
G1 F6205
M204 S6000
G1 X137.594 Y128.011 E.0557
; WIPE_START
G1 F13823.369
G1 X136.094 Y128.011 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.55 Y121.826 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6205
M204 S6000
G1 X135.55 Y121.57 E.00848
G1 X136.922 Y121.57 E.04553
G1 X134.302 Y118.95 E.12292
G1 X137.05 Y118.95 E.09114
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6205
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X136.918 Y134.434 E.1227
G1 X135.55 Y134.434 E.04538
G1 X135.55 Y134.174 E.00864
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6205
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.55 Y127.874 E.34825
G1 X135.55 Y128.126 E.00838
G1 X126.626 Y137.05 E.41862
G1 X124.998 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/100
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
M204 S10000
G17
G3 Z14 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z14.2 F4000
            G39.3 S1
            G0 Z14.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z14.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z13.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z13.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y134.22
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6252
M204 S6000
G1 X137.398 Y134.22 E.04976
G1 X137.398 Y137.398 E.10543
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.202 Y118.602 E.11942
G1 X122.202 Y120.102 E.04976
G1 X133.875 Y120.102 E.3872
G1 X133.875 Y118.602 E.04976
G1 X137.398 Y118.602 E.11687
G1 X137.398 Y121.785 E.10557
G1 X135.898 Y121.785 E.04976
G1 X135.898 Y127.86 E.20153
G1 X137.398 Y127.86 E.04976
G1 X137.398 Y128.163 E.01004
G1 X135.898 Y128.163 E.04976
G1 X135.898 Y134.16 E.19893
M204 S250
G1 X136.29 Y133.828 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6252
M204 S5000
G1 X137.79 Y133.828 E.04609
G1 X137.79 Y137.79 E.12175
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.594 Y118.21 E.13471
G1 X122.594 Y119.71 E.04609
G1 X127.418 Y119.71 E.14822
G1 X127.818 Y119.71 E.01229
G1 X127.818 Y119.669 E.00126
G1 X127.818 Y118.21 E.04483
G1 X127.892 Y118.21 E.00228
G1 X128.252 Y118.21 E.01105
G1 X128.323 Y118.21 E.00218
G1 X128.323 Y119.669 E.04483
G1 X128.323 Y119.71 E.00126
G1 X128.723 Y119.71 E.01229
G1 X133.483 Y119.71 E.14626
G1 X133.483 Y118.21 E.04609
G1 X137.79 Y118.21 E.13235
G1 X137.79 Y122.177 E.12189
G1 X136.29 Y122.177 E.04609
G1 X136.29 Y126.668 E.138
G1 X136.29 Y127.068 E.01229
G1 X136.29 Y127.468 E.01229
G1 F6136.876
G1 X136.331 Y127.468 E.00126
G1 F5700
G1 X137.79 Y127.468 E.04483
G1 F6252
G1 X137.79 Y127.546 E.00241
G1 X137.79 Y127.946 E.01229
G1 X137.79 Y128.476 E.01628
G1 X137.79 Y128.555 E.00242
G1 F5700
G1 X136.331 Y128.555 E.04483
G1 F6136.876
G1 X136.29 Y128.555 E.00126
G1 F6252
G1 X136.29 Y128.955 E.01229
M73 P73 R6
G1 X136.29 Y129.355 E.01229
G1 X136.29 Y133.768 E.13559
M204 S10000
G1 X135.55 Y134.174 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6252
M204 S6000
G1 X135.55 Y134.568 E.01307
G1 X136.784 Y134.568 E.04094
G1 X134.302 Y137.05 E.11642
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.698 Y118.95 E.09114
G1 X118.95 Y121.698 E.12889
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6252
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X137.05 Y121.436 E.08247
G1 X136.788 Y121.436 E.00867
G1 X134.302 Y118.95 E.11663
G1 X134.223 Y118.95 E.00263
G1 X134.223 Y120.45 E.04976
G1 X134.174 Y120.45 E.00163
; WIPE_START
G1 F15476.087
M73 P73 R5
G1 X134.223 Y120.45 E-.01867
G1 X134.223 Y118.95 E-.57
G1 X134.302 Y118.95 E-.03009
G1 X134.565 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.07 Y119.906 Z14.2 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15564
G1 F6252
M204 S6000
G1 X128.07 Y118.406 E.01378
; WIPE_START
G1 F15000
G1 X128.07 Y119.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.724 Y127.419 Z14.2 F42000
G1 X124.998 Y137.05 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6252
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.55 Y128.126 E.41862
G1 X135.55 Y127.874 E.00838
G1 X128.126 Y120.45 E.34825
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/100
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
M204 S10000
G17
G3 Z14.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z14.4 F4000
            G39.3 S1
            G0 Z14.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z14.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z14
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z14
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y134.354
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6418
M204 S6000
G1 X137.398 Y134.354 E.04976
G1 X137.398 Y137.398 E.10099
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X122.071 Y118.602 E.11508
G1 X122.071 Y120.102 E.04976
G1 X134.003 Y120.102 E.39581
G1 X134.003 Y118.602 E.04976
G1 X137.398 Y118.602 E.11261
G1 X137.398 Y121.651 E.10113
G1 X135.898 Y121.651 E.04976
G1 X135.898 Y127.741 E.20202
G1 X137.398 Y127.741 E.04976
G1 X137.398 Y128.283 E.01798
G1 X135.898 Y128.283 E.04976
G1 X135.898 Y134.294 E.1994
M204 S250
G1 X136.29 Y133.962 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6418
M204 S5000
G1 X137.79 Y133.962 E.04609
G1 X137.79 Y137.79 E.11764
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.463 Y118.21 E.13069
G1 X122.463 Y119.71 E.04609
G1 X127.303 Y119.71 E.14871
G1 X127.703 Y119.71 E.01229
G1 X127.703 Y119.669 E.00126
G1 X127.703 Y118.21 E.04483
G1 X127.777 Y118.21 E.00228
G1 X128.364 Y118.21 E.01803
G1 X128.435 Y118.21 E.00218
G1 X128.435 Y119.669 E.04483
G1 X128.435 Y119.71 E.00126
G1 X128.835 Y119.71 E.01229
G1 X133.611 Y119.71 E.14677
G1 X133.611 Y118.21 E.04609
G1 X137.79 Y118.21 E.1284
G1 X137.79 Y122.043 E.11777
G1 X136.29 Y122.043 E.04609
G1 X136.29 Y126.549 E.13845
G1 X136.29 Y126.949 E.01229
G1 X136.29 Y127.349 E.01229
G1 F6136.876
G1 X136.331 Y127.349 E.00126
G1 F5700
G1 X137.79 Y127.349 E.04483
G1 F6418
G1 X137.79 Y127.427 E.00241
G1 X137.79 Y127.827 E.01229
G1 X137.79 Y128.227 E.01229
G1 X137.79 Y128.596 E.01134
G1 X137.79 Y128.675 E.00242
G1 F5700
G1 X136.331 Y128.675 E.04483
G1 F6136.876
G1 X136.29 Y128.675 E.00126
G1 F6418
G1 X136.29 Y129.075 E.01229
G1 X136.29 Y129.475 E.01229
G1 X136.29 Y133.902 E.13603
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y133.962 E-.57046
G1 X137.79 Y134.46 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.695 Y128.012 Z14.4 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17779
G1 F6418
M204 S6000
G1 X137.194 Y128.012 E.01648
; WIPE_START
G1 F15000
G1 X135.695 Y128.012 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.19 Y120.529 Z14.4 F42000
G1 X134.174 Y120.45 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6418
M204 S6000
G1 X134.352 Y120.45 E.00589
G1 X134.352 Y119 E.04812
G1 X136.654 Y121.302 E.10802
G1 X137.05 Y121.302 E.01312
G1 X137.05 Y118.95 E.07802
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6418
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.698 Y118.95 E.12889
G1 X118.95 Y118.95 E.09114
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X136.65 Y134.702 E.11014
G1 X135.55 Y134.702 E.0365
G1 X135.55 Y134.174 E.01751
M204 S10000
G1 X131.002 Y137.05 F42000
G1 F6418
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41862
G1 X128.126 Y120.45 E.00838
G1 X135.346 Y127.67 E.3387
G1 X135.346 Y128.33 E.02187
G1 X126.626 Y137.05 E.40907
G1 X124.998 Y137.05 E.05401
; WIPE_START
G1 F15476.087
G1 X126.626 Y137.05 E-.61876
G1 X126.889 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.421 Y129.173 Z14.4 F42000
G1 X128.069 Y119.906 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.38271
G1 F6418
M204 S6000
G1 X128.069 Y118.406 E.04153
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X128.069 Y119.906 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/100
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
M204 S10000
G17
G3 Z14.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z14.6 F4000
            G39.3 S1
            G0 Z14.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z14.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z14.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z14.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
M73 P74 R5
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y134.487
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6295
M204 S6000
G1 X137.398 Y134.487 E.04976
G1 X137.398 Y137.398 E.09655
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.94 Y118.602 E.11073
G1 X121.94 Y120.102 E.04976
G1 X134.132 Y120.102 E.40442
G1 X134.132 Y118.602 E.04976
G1 X137.398 Y118.602 E.10834
G1 X137.398 Y121.517 E.09668
G1 X135.898 Y121.517 E.04976
G1 X135.898 Y127.621 E.2025
G1 X137.398 Y127.621 E.04976
G1 X137.398 Y128.402 E.02591
G1 X135.898 Y128.402 E.04976
G1 X135.898 Y134.427 E.19986
M204 S250
G1 X136.29 Y134.095 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6295
M204 S5000
G1 X137.79 Y134.095 E.04609
G1 X137.79 Y137.79 E.11353
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.332 Y118.21 E.12666
G1 X122.332 Y119.71 E.04609
G1 X127.188 Y119.71 E.1492
G1 X127.588 Y119.71 E.01229
G1 X127.588 Y119.669 E.00126
G1 X127.588 Y118.21 E.04483
G1 X127.662 Y118.21 E.00228
G1 X128.062 Y118.21 E.01229
G1 X128.476 Y118.21 E.01272
G1 X128.547 Y118.21 E.00218
G1 X128.547 Y119.669 E.04483
G1 X128.547 Y119.71 E.00126
G1 X128.947 Y119.71 E.01229
G1 X133.74 Y119.71 E.14728
G1 X133.74 Y118.21 E.04609
G1 X137.79 Y118.21 E.12445
G1 X137.79 Y121.909 E.11365
G1 X136.29 Y121.909 E.04609
G1 X136.29 Y126.429 E.1389
G1 X136.29 Y126.829 E.01229
G1 X136.29 Y127.229 E.01229
G1 F6136.876
G1 X136.331 Y127.229 E.00126
G1 F5700
G1 X137.79 Y127.229 E.04483
G1 F6295
G1 X137.79 Y127.308 E.00241
G1 X137.79 Y127.708 E.01229
G1 X137.79 Y128.108 E.01229
G1 X137.79 Y128.316 E.00639
G1 X137.79 Y128.716 E.01229
G1 X137.79 Y128.794 E.00242
G1 F5700
G1 X136.331 Y128.794 E.04483
G1 F6136.876
G1 X136.29 Y128.794 E.00126
G1 F6295
G1 X136.29 Y129.194 E.01229
G1 X136.29 Y129.594 E.01229
G1 X136.29 Y134.035 E.13646
M204 S10000
G1 X135.55 Y134.174 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6295
M204 S6000
G1 X135.55 Y134.836 E.02195
G1 X136.516 Y134.836 E.03206
G1 X134.302 Y137.05 E.10386
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.592 Y118.95 E.08763
G1 X121.592 Y119.056 E.00351
G1 X118.95 Y121.698 E.12392
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6295
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.48 Y118.95 E.08524
G1 X134.48 Y119.128 E.0059
G1 X136.52 Y121.168 E.09571
G1 X135.55 Y121.168 E.0322
G1 X135.55 Y121.826 E.02182
M204 S10000
G1 X135.695 Y128.012 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.41693
G1 F6295
M204 S6000
G1 X137.194 Y128.012 E.04571
; WIPE_START
G1 F15000
G1 X135.695 Y128.012 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.464 Y122.453 Z14.6 F42000
G1 X128.067 Y119.906 Z14.6
G1 Z14.2
G1 E.8 F1800
; LINE_WIDTH: 0.60976
G1 F6295
M204 S6000
G1 X128.067 Y118.406 E.06928
; WIPE_START
G1 F11114.248
G1 X128.067 Y119.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.722 Y127.419 Z14.6 F42000
G1 X124.998 Y137.05 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6295
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X135.346 Y128.33 E.40907
G1 X135.346 Y127.67 E.02187
G1 X128.126 Y120.45 E.3387
G1 X127.874 Y120.45 E.00838
G1 X118.95 Y129.374 E.41862
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/100
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
M204 S10000
G17
G3 Z14.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z14.8 F4000
            G39.3 S1
            G0 Z14.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z14.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z14.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z14.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y134.621
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6305
M204 S6000
G1 X137.398 Y134.621 E.04976
G1 X137.398 Y137.398 E.09211
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.809 Y118.602 E.10639
G1 X121.809 Y120.102 E.04976
G1 X127.865 Y120.102 E.20088
G1 X127.865 Y118.602 E.04976
G1 X128.267 Y118.602 E.01333
G1 X128.267 Y120.102 E.04976
G1 X134.26 Y120.102 E.19882
G1 X134.26 Y118.602 E.04976
G1 X137.398 Y118.602 E.10408
G1 X137.398 Y121.383 E.09223
G1 X135.898 Y121.383 E.04976
G1 X135.898 Y127.502 E.20298
G1 X137.398 Y127.502 E.04976
G1 X137.398 Y128.522 E.03384
G1 X135.898 Y128.522 E.04976
G1 X135.898 Y134.561 E.20033
M204 S250
G1 X136.29 Y134.229 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6305
M204 S5000
G1 X137.79 Y134.229 E.04609
G1 X137.79 Y137.79 E.10942
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.201 Y118.21 E.12264
G1 X122.201 Y119.71 E.04609
G1 X127.073 Y119.71 E.14969
G1 X127.473 Y119.71 E.01229
G1 X127.473 Y119.669 E.00126
G1 X127.473 Y118.21 E.04483
G1 X127.547 Y118.21 E.00228
G1 X127.947 Y118.21 E.01229
G1 X128.188 Y118.21 E.0074
G1 X128.588 Y118.21 E.01229
G1 X128.659 Y118.21 E.00218
G1 X128.659 Y119.669 E.04483
G1 X128.659 Y119.71 E.00126
G1 X129.059 Y119.71 E.01229
G1 X133.868 Y119.71 E.14779
G1 X133.868 Y118.21 E.04609
G1 X137.79 Y118.21 E.1205
G1 X137.79 Y121.775 E.10953
G1 X136.29 Y121.775 E.04609
G1 X136.29 Y126.31 E.13935
G1 X136.29 Y126.71 E.01229
G1 X136.29 Y127.11 E.01229
G1 F6136.876
G1 X136.331 Y127.11 E.00126
G1 F5700
G1 X137.79 Y127.11 E.04483
G1 F6305
G1 X137.79 Y127.188 E.00241
G1 X137.79 Y127.588 E.01229
G1 X137.79 Y127.988 E.01229
G1 X137.79 Y128.435 E.01374
G1 X137.79 Y128.835 E.01229
G1 X137.79 Y128.914 E.00242
G1 F5700
G1 X136.331 Y128.914 E.04483
G1 F6136.876
G1 X136.29 Y128.914 E.00126
G1 F6305
G1 X136.29 Y129.314 E.01229
G1 X136.29 Y129.714 E.01229
G1 X136.29 Y134.169 E.13689
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y134.229 E-.57046
G1 X137.79 Y134.728 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.002 Y137.05 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6305
M204 S6000
G1 X129.374 Y137.05 E.05401
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.874 Y120.45 E.41861
G1 X128.126 Y120.45 E.00838
G1 X135.346 Y127.67 E.3387
G1 X135.346 Y128.33 E.02187
G1 X126.626 Y137.05 E.40907
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X135.695 Y128.012 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.65605
G1 F6305
M204 S6000
G1 X137.194 Y128.012 E.07494
; WIPE_START
G1 F10275.146
G1 X135.695 Y128.012 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.55 Y121.826 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6305
M204 S6000
G1 X135.55 Y121.034 E.02626
G1 X136.386 Y121.034 E.02775
G1 X134.609 Y119.257 E.08339
G1 X134.609 Y118.95 E.01016
G1 X137.05 Y118.95 E.08097
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6305
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.461 Y119.187 E.11778
G1 X121.461 Y118.95 E.00786
G1 X118.95 Y118.95 E.08328
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X136.382 Y134.969 E.09759
G1 X135.55 Y134.969 E.02763
G1 X135.55 Y134.174 E.02639
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X135.55 Y134.969 E-.3023
M73 P75 R5
G1 X136.382 Y134.969 E-.31646
G1 X136.12 Y135.232 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/100
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
M204 S10000
G17
G3 Z14.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z15 F4000
            G39.3 S1
            G0 Z15 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z14.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z14.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z14.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y134.755
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6368
M204 S6000
G1 X137.398 Y134.755 E.04976
G1 X137.398 Y137.398 E.08767
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.678 Y118.602 E.10204
G1 X121.678 Y120.102 E.04976
G1 X127.75 Y120.102 E.2014
G1 X127.75 Y118.602 E.04976
G1 X128.379 Y118.602 E.02086
G1 X128.379 Y120.102 E.04976
G1 X134.389 Y120.102 E.19937
G1 X134.389 Y118.602 E.04976
G1 X137.398 Y118.602 E.09981
G1 X137.398 Y121.249 E.08779
G1 X135.898 Y121.249 E.04976
G1 X135.898 Y127.382 E.20347
G1 X137.398 Y127.382 E.04976
G1 X137.398 Y128.642 E.04177
G1 X135.898 Y128.642 E.04976
G1 X135.898 Y134.695 E.2008
M204 S250
G1 X136.29 Y134.363 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6368
M204 S5000
G1 X137.79 Y134.363 E.04609
G1 X137.79 Y137.79 E.1053
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X122.07 Y118.21 E.11862
G1 X122.07 Y119.71 E.04609
G1 X126.958 Y119.71 E.15018
G1 X127.358 Y119.71 E.01229
G1 X127.358 Y119.669 E.00126
G1 X127.358 Y118.21 E.04483
G1 X127.432 Y118.21 E.00228
G1 X127.832 Y118.21 E.01229
G1 X128.3 Y118.21 E.01438
G1 X128.7 Y118.21 E.01229
G1 X128.771 Y118.21 E.00218
G1 X128.771 Y119.669 E.04483
G1 X128.771 Y119.71 E.00126
G1 X129.171 Y119.71 E.01229
G1 X133.997 Y119.71 E.14829
G1 X133.997 Y118.21 E.04609
G1 X137.79 Y118.21 E.11655
G1 X137.79 Y121.641 E.10541
G1 X136.29 Y121.641 E.04609
G1 X136.29 Y126.19 E.1398
G1 X136.29 Y126.59 E.01229
G1 X136.29 Y126.99 E.01229
G1 F6136.876
G1 X136.331 Y126.99 E.00126
G1 F5700
G1 X137.79 Y126.99 E.04483
G1 F6368
G1 X137.79 Y127.069 E.00241
G1 X137.79 Y127.469 E.01229
G1 X137.79 Y127.869 E.01229
G1 X137.79 Y128.155 E.0088
G1 X137.79 Y128.555 E.01229
G1 X137.79 Y128.955 E.01229
G1 X137.79 Y129.034 E.00242
G1 F5700
G1 X136.331 Y129.034 E.04483
G1 F6136.876
G1 X136.29 Y129.034 E.00126
G1 F6368
G1 X136.29 Y129.434 E.01229
G1 X136.29 Y129.834 E.01229
G1 X136.29 Y134.303 E.13733
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y134.363 E-.57046
G1 X137.79 Y134.862 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y135.931 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6368
M204 S6000
G1 X137.05 Y135.103 E.02744
G1 X136.249 Y135.103 E.02657
G1 X134.302 Y137.05 E.09131
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.33 Y118.95 E.07894
G1 X121.33 Y119.318 E.0122
G1 X118.95 Y121.698 E.11163
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6368
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X137.05 Y120.9 E.06468
G1 X136.252 Y120.9 E.02645
G1 X134.737 Y119.385 E.07107
G1 X134.737 Y120.45 E.03533
G1 X134.174 Y120.45 E.01869
M204 S10000
G1 X128.064 Y120.305 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.26472
G1 F6368
M204 S6000
G1 X128.064 Y118.806 E.02711
; WIPE_START
G1 F15000
G1 X128.064 Y120.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.943 Y125.173 Z15 F42000
G1 X137.05 Y127.745 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6368
M204 S6000
G1 X137.05 Y128.293 E.01818
G1 X135.969 Y128.293 E.03584
G1 X128.33 Y120.654 E.35839
G1 X127.67 Y120.654 E.02187
G1 X118.95 Y129.374 E.40907
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X126.626 Y137.05 E.09114
G1 X135.945 Y127.731 E.43718
G1 X137.05 Y127.745 E.03663
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X135.945 Y127.731 E-.41967
G1 X135.312 Y128.364 E-.34033
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/100
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
M204 S10000
G17
G3 Z15 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z15.2 F4000
            G39.3 S1
            G0 Z15.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z15.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z14.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z14.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y134.889
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6492
M204 S6000
G1 X137.398 Y134.889 E.04976
G1 X137.398 Y137.398 E.08323
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.547 Y118.602 E.0977
G1 X121.547 Y120.102 E.04976
G1 X127.635 Y120.102 E.20193
G1 X127.635 Y118.602 E.04976
G1 X128.491 Y118.602 E.02839
G1 X128.491 Y120.102 E.04976
G1 X134.517 Y120.102 E.19992
G1 X134.517 Y118.602 E.04976
G1 X137.398 Y118.602 E.09555
G1 X137.398 Y121.114 E.08334
G1 X135.898 Y121.114 E.04976
G1 X135.898 Y127.263 E.20395
G1 X137.398 Y127.263 E.04976
G1 X137.398 Y128.761 E.04971
M73 P76 R5
G1 X135.898 Y128.761 E.04976
G1 X135.898 Y134.829 E.20127
M204 S250
G1 X136.29 Y134.497 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6492
M204 S5000
G1 X137.79 Y134.497 E.04609
G1 X137.79 Y137.79 E.10119
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.939 Y118.21 E.11459
G1 X121.939 Y119.71 E.04609
G1 X126.843 Y119.71 E.15066
G1 X127.243 Y119.71 E.01229
G1 X127.243 Y119.669 E.00126
G1 X127.243 Y118.21 E.04483
G1 X127.317 Y118.21 E.00228
G1 X127.717 Y118.21 E.01229
G1 X128.412 Y118.21 E.02135
G1 X128.812 Y118.21 E.01229
G1 X128.883 Y118.21 E.00218
G1 X128.883 Y119.669 E.04483
G1 X128.883 Y119.71 E.00126
G1 X129.283 Y119.71 E.01229
G1 X134.125 Y119.71 E.1488
G1 X134.125 Y118.21 E.04609
G1 X137.79 Y118.21 E.1126
G1 X137.79 Y121.507 E.10129
G1 X136.29 Y121.507 E.04609
G1 X136.29 Y126.071 E.14025
G1 X136.29 Y126.471 E.01229
G1 X136.29 Y126.871 E.01229
G1 F6136.876
G1 X136.331 Y126.871 E.00126
G1 F5700
G1 X137.79 Y126.871 E.04483
G1 F6492
G1 X137.79 Y126.949 E.00241
G1 X137.79 Y127.349 E.01229
G1 X137.79 Y127.749 E.01229
G1 X137.79 Y128.275 E.01615
G1 X137.79 Y128.675 E.01229
G1 X137.79 Y129.075 E.01229
G1 X137.79 Y129.153 E.00242
G1 F5700
G1 X136.331 Y129.153 E.04483
G1 F6136.876
G1 X136.29 Y129.153 E.00126
G1 F6492
G1 X136.29 Y129.553 E.01229
G1 X136.29 Y129.953 E.01229
G1 X136.29 Y134.437 E.13776
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y134.497 E-.57046
G1 X137.79 Y134.996 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y127.745 Z15.2 F42000
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6492
M204 S6000
G1 X137.05 Y127.611 E.00445
G1 X136.065 Y127.611 E.03267
G1 X126.626 Y137.05 E.44278
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X127.67 Y120.654 E.40907
G1 X128.33 Y120.654 E.02187
G1 X136.089 Y128.413 E.36401
G1 X137.05 Y128.413 E.03187
G1 X137.05 Y127.745 E.02215
; WIPE_START
G1 F15476.087
G1 X137.05 Y128.413 E-.25371
G1 X136.089 Y128.413 E-.36505
G1 X135.826 Y128.15 E-.14125
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.969 Y120.604 Z15.2 F42000
G1 X137.05 Y120.069 Z15.2
G1 Z14.8
G1 E.8 F1800
G1 F6492
M204 S6000
G1 X137.05 Y120.766 E.02311
G1 X136.118 Y120.766 E.0309
G1 X134.866 Y119.514 E.05875
G1 X134.866 Y118.95 E.01869
G1 X137.05 Y118.95 E.07245
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6492
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X121.199 Y119.449 E.10549
G1 X121.199 Y118.95 E.01654
G1 X118.95 Y118.95 E.07459
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X136.115 Y135.237 E.08503
G1 X137.05 Y135.237 E.03101
G1 X137.05 Y135.931 E.023
; WIPE_START
G1 F15476.087
G1 X137.05 Y135.237 E-.26353
G1 X136.115 Y135.237 E-.35523
G1 X135.852 Y135.5 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.37 Y128.708 Z15.2 F42000
G1 X128.063 Y120.305 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.49177
G1 F6492
M204 S6000
G1 X128.063 Y118.806 E.05486
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F14035.87
G1 X128.063 Y120.305 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/100
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
M204 S10000
G17
G3 Z15.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z15.4 F4000
            G39.3 S1
            G0 Z15.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z15.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z15
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F14035.87
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z15
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F14035.87
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y135.023
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6311
M204 S6000
G1 X137.398 Y135.023 E.04976
G1 X137.398 Y137.398 E.07879
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.416 Y118.602 E.09335
G1 X121.416 Y120.102 E.04976
G1 X127.52 Y120.102 E.20246
G1 X127.52 Y118.602 E.04976
G1 X128.603 Y118.602 E.03592
G1 X128.603 Y120.102 E.04976
G1 X134.646 Y120.102 E.20047
G1 X134.646 Y118.602 E.04976
G1 X137.398 Y118.602 E.09129
G1 X137.398 Y120.98 E.0789
G1 X135.898 Y120.98 E.04976
G1 X135.898 Y127.143 E.20444
G1 X137.398 Y127.143 E.04976
G1 X137.398 Y128.881 E.05764
G1 X135.898 Y128.881 E.04976
G1 X135.898 Y134.963 E.20174
M204 S250
G1 X136.29 Y134.631 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6311
M204 S5000
G1 X137.79 Y134.631 E.04609
G1 X137.79 Y137.79 E.09708
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.808 Y118.21 E.11057
G1 X121.808 Y119.71 E.04609
G1 X126.728 Y119.71 E.15115
G1 X127.128 Y119.71 E.01229
G1 X127.128 Y119.669 E.00126
G1 X127.128 Y118.21 E.04483
G1 X127.202 Y118.21 E.00228
G1 X127.602 Y118.21 E.01229
G1 X128.524 Y118.21 E.02833
G1 X128.924 Y118.21 E.01229
G1 X128.995 Y118.21 E.00218
G1 X128.995 Y119.669 E.04483
G1 X128.995 Y119.71 E.00126
G1 X129.395 Y119.71 E.01229
G1 X134.254 Y119.71 E.14931
G1 X134.254 Y118.21 E.04609
G1 X137.79 Y118.21 E.10865
G1 X137.79 Y121.373 E.09718
G1 X136.29 Y121.373 E.04609
G1 X136.29 Y125.951 E.14069
G1 X136.29 Y126.351 E.01229
G1 X136.29 Y126.751 E.01229
G1 F6136.876
G1 X136.331 Y126.751 E.00126
G1 F5700
G1 X137.79 Y126.751 E.04483
G1 F6311
G1 X137.79 Y126.83 E.00241
G1 X137.79 Y127.23 E.01229
G1 X137.79 Y127.63 E.01229
G1 X137.79 Y128.394 E.02349
G1 X137.79 Y128.794 E.01229
G1 X137.79 Y129.194 E.01229
G1 X137.79 Y129.273 E.00242
G1 F5700
G1 X136.331 Y129.273 E.04483
G1 F6136.876
G1 X136.29 Y129.273 E.00126
G1 F6311
G1 X136.29 Y129.673 E.01229
G1 X136.29 Y130.073 E.01229
G1 X136.29 Y134.571 E.13819
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y134.631 E-.57046
G1 X137.79 Y135.129 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y135.931 Z15.4 F42000
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6311
M204 S6000
G1 X137.05 Y135.371 E.01857
G1 X135.981 Y135.371 E.03545
G1 X134.302 Y137.05 E.07876
G1 X137.05 Y137.05 E.09114
G1 X118.95 Y118.95 E.84908
G1 X121.068 Y118.95 E.07025
G1 X121.068 Y119.58 E.02089
G1 X118.95 Y121.698 E.09935
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6311
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X137.05 Y118.95 E.84908
G1 X134.994 Y118.95 E.06818
G1 X134.994 Y119.642 E.02296
G1 X135.984 Y120.632 E.04644
G1 X137.05 Y120.632 E.03535
G1 X137.05 Y120.069 E.01867
; WIPE_START
G1 F15476.087
G1 X137.05 Y120.632 E-.21384
G1 X135.984 Y120.632 E-.40492
G1 X135.721 Y120.369 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.254 Y118.951 Z15.4 F42000
G1 Z15
G1 E.8 F1800
G1 F6311
M204 S6000
G1 X128.254 Y120.07 E.03712
G1 X118.95 Y129.374 E.43647
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X126.626 Y137.05 E.09114
G1 X136.184 Y127.492 E.44839
G1 X137.05 Y127.492 E.02871
G1 X137.05 Y128.533 E.03453
G1 X136.209 Y128.533 E.0279
G1 X127.868 Y120.192 E.39129
G1 X127.868 Y118.95 E.04119
G1 X128.254 Y118.951 E.01282
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X127.868 Y118.95 E-.14685
G1 X127.868 Y120.192 E-.47181
G1 X128.131 Y120.455 E-.14134
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/100
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
M204 S10000
G17
G3 Z15.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z15.6 F4000
            G39.3 S1
            G0 Z15.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z15.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z15.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
M73 P77 R5
G1 Z15.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y135.156
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6192
M204 S6000
G1 X137.398 Y135.156 E.04976
G1 X137.398 Y137.398 E.07436
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.285 Y118.602 E.08901
G1 X121.285 Y120.102 E.04976
G1 X127.405 Y120.102 E.20299
G1 X127.405 Y118.602 E.04976
G1 X128.715 Y118.602 E.04346
G1 X128.715 Y120.102 E.04976
G1 X134.775 Y120.102 E.20102
G1 X134.775 Y118.602 E.04976
G1 X137.398 Y118.602 E.08702
G1 X137.398 Y120.846 E.07445
G1 X135.898 Y120.846 E.04976
G1 X135.898 Y127.024 E.20492
G1 X137.398 Y127.024 E.04976
G1 X137.398 Y129.001 E.06557
G1 X135.898 Y129.001 E.04976
G1 X135.898 Y135.096 E.2022
M204 S250
G1 X136.29 Y134.764 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6192
M204 S5000
G1 X137.79 Y134.764 E.04609
G1 X137.79 Y137.79 E.09297
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.677 Y118.21 E.10654
G1 X121.677 Y119.71 E.04609
G1 X126.612 Y119.71 E.15164
G1 X127.012 Y119.71 E.01229
G1 X127.012 Y119.669 E.00126
G1 X127.012 Y118.21 E.04483
G1 X127.087 Y118.21 E.00228
G1 X127.487 Y118.21 E.01229
G1 X128.636 Y118.21 E.03531
G1 X129.036 Y118.21 E.01229
G1 X129.107 Y118.21 E.00218
G1 X129.107 Y119.669 E.04483
G1 X129.107 Y119.71 E.00126
G1 X129.507 Y119.71 E.01229
G1 X134.382 Y119.71 E.14982
G1 X134.382 Y118.21 E.04609
G1 X137.79 Y118.21 E.1047
G1 X137.79 Y121.238 E.09306
G1 X136.29 Y121.238 E.04609
G1 X136.29 Y125.832 E.14114
G1 X136.29 Y126.232 E.01229
G1 X136.29 Y126.632 E.01229
G1 F6136.876
G1 X136.331 Y126.632 E.00126
G1 F5700
G1 X137.79 Y126.632 E.04483
G1 F6192
G1 X137.79 Y126.71 E.00241
G1 X137.79 Y127.11 E.01229
G1 X137.79 Y127.51 E.01229
G1 X137.79 Y128.514 E.03084
G1 X137.79 Y128.914 E.01229
G1 X137.79 Y129.314 E.01229
G1 X137.79 Y129.393 E.00242
G1 F5700
G1 X136.331 Y129.393 E.04483
G1 F6136.876
G1 X136.29 Y129.393 E.00126
G1 F6192
G1 X136.29 Y129.793 E.01229
G1 X136.29 Y130.193 E.01229
G1 X136.29 Y134.704 E.13863
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y134.764 E-.57046
G1 X137.79 Y135.263 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.9 Y127.868 Z15.6 F42000
G1 X135.55 Y126.498 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6192
M204 S6000
G1 X135.55 Y127.372 E.029
G1 X136.304 Y127.372 E.02501
G1 X126.626 Y137.05 E.45399
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X128.366 Y119.958 E.44172
G1 X128.366 Y118.95 E.03342
G1 X127.753 Y118.95 E.02035
G1 X127.753 Y120.077 E.03737
G1 X136.328 Y128.652 E.4023
G1 X135.55 Y128.652 E.02583
G1 X135.55 Y129.502 E.02818
M204 S10000
G1 X135.85 Y120.498 F42000
G1 F6192
M204 S6000
G1 X135.123 Y119.771 E.03412
G1 X135.123 Y118.95 E.02722
G1 X137.05 Y118.95 E.06392
G1 X118.95 Y137.05 E.84908
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6192
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X120.937 Y119.711 E.0932
G1 X120.937 Y118.95 E.02523
G1 X118.95 Y118.95 E.0659
G1 X137.05 Y137.05 E.84908
G1 X134.302 Y137.05 E.09114
G1 X135.847 Y135.505 E.07248
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X134.433 Y136.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/100
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
M204 S10000
G17
G3 Z15.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z15.8 F4000
            G39.3 S1
            G0 Z15.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z15.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z15.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
M73 P77 R4
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z15.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y135.29
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6405
M204 S6000
G1 X137.398 Y135.29 E.04976
G1 X137.398 Y137.398 E.06992
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.154 Y118.602 E.08466
G1 X121.154 Y120.102 E.04976
G1 X127.289 Y120.102 E.20351
G1 X127.289 Y118.602 E.04976
G1 X128.827 Y118.602 E.05099
G1 X128.827 Y120.102 E.04976
G1 X134.903 Y120.102 E.20157
G1 X134.903 Y118.602 E.04976
G1 X137.398 Y118.602 E.08276
G1 X137.398 Y120.712 E.07
G1 X135.898 Y120.712 E.04976
G1 X135.898 Y126.905 E.20541
G1 X137.398 Y126.905 E.04976
G1 X137.398 Y129.12 E.0735
G1 X135.898 Y129.12 E.04976
G1 X135.898 Y135.23 E.20267
M204 S250
G1 X136.29 Y134.898 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6405
M204 S5000
G1 X137.79 Y134.898 E.04609
G1 X137.79 Y137.79 E.08886
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.546 Y118.21 E.10252
G1 X121.546 Y119.71 E.04609
G1 X126.497 Y119.71 E.15213
G1 X126.897 Y119.71 E.01229
G1 X126.897 Y119.669 E.00126
G1 X126.897 Y118.21 E.04483
G1 X126.971 Y118.21 E.00228
G1 X127.371 Y118.21 E.01229
G1 X128.748 Y118.21 E.04228
G1 X129.148 Y118.21 E.01229
G1 X129.219 Y118.21 E.00218
G1 X129.219 Y119.669 E.04483
G1 X129.219 Y119.71 E.00126
G1 X129.619 Y119.71 E.01229
G1 X134.511 Y119.71 E.15033
G1 X134.511 Y118.21 E.04609
G1 X137.79 Y118.21 E.10076
G1 X137.79 Y121.104 E.08894
G1 X136.29 Y121.104 E.04609
G1 X136.29 Y125.712 E.14159
G1 X136.29 Y126.112 E.01229
G1 X136.29 Y126.512 E.01229
G1 F6136.876
G1 X136.331 Y126.512 E.00126
G1 F5700
G1 X137.79 Y126.512 E.04483
G1 F6405
G1 X137.79 Y126.591 E.00241
G1 X137.79 Y126.991 E.01229
G1 X137.79 Y127.391 E.01229
G1 X137.79 Y128.634 E.03819
G1 X137.79 Y129.034 E.01229
G1 X137.79 Y129.434 E.01229
M73 P78 R4
G1 X137.79 Y129.512 E.00242
G1 F5700
G1 X136.331 Y129.512 E.04483
G1 F6136.876
G1 X136.29 Y129.512 E.00126
G1 F6405
G1 X136.29 Y129.912 E.01229
G1 X136.29 Y130.312 E.01229
G1 X136.29 Y134.838 E.13906
M204 S10000
G1 X136.833 Y135.638 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6405
M204 S6000
G1 X137.05 Y135.638 E.0072
G1 X137.05 Y137.05 E.04681
G1 X135.638 Y135.638 E.0662
G1 X135.713 Y135.638 E.00249
G1 X134.302 Y137.05 E.0662
G1 X132.674 Y137.05 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6405
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X135.55 Y120.45 E.77871
G1 X135.55 Y127.253 E.22565
G1 X136.423 Y127.253 E.02897
G1 X126.626 Y137.05 E.45959
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X128.478 Y119.846 E.44698
G1 X128.478 Y118.95 E.0297
G1 X127.638 Y118.95 E.02788
G1 X127.638 Y119.962 E.03355
G1 X136.448 Y128.772 E.41331
G1 X135.55 Y128.772 E.0298
G1 X135.55 Y135.55 E.22482
G1 X118.95 Y118.95 E.77871
G1 X120.806 Y118.95 E.06156
G1 X120.806 Y119.842 E.02958
G1 X118.95 Y121.698 E.08706
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X134.174 Y120.45 F42000
G1 F6405
M204 S6000
G1 X135.251 Y120.45 E.03574
G1 X135.251 Y119.899 E.01827
G1 X135.716 Y120.364 E.0218
G1 X135.636 Y120.364 E.00266
G1 X137.05 Y118.95 E.06632
G1 X137.05 Y120.364 E.0469
G1 X136.835 Y120.364 E.00712
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X137.05 Y120.364 E-.08152
G1 X137.05 Y118.95 E-.53724
G1 X136.787 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/100
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
M204 S10000
G17
G3 Z15.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z16 F4000
            G39.3 S1
            G0 Z16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z15.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z15.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z15.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y135.424
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6432
M204 S6000
G1 X137.398 Y135.424 E.04976
G1 X137.398 Y137.398 E.06548
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X121.023 Y118.602 E.08032
G1 X121.023 Y120.102 E.04976
G1 X127.174 Y120.102 E.20404
G1 X127.174 Y118.602 E.04976
G1 X128.938 Y118.602 E.05852
G1 X128.938 Y120.102 E.04976
G1 X135.032 Y120.102 E.20212
G1 X135.032 Y118.602 E.04976
G1 X137.398 Y118.602 E.0785
G1 X137.398 Y120.578 E.06556
G1 X135.898 Y120.578 E.04976
G1 X135.898 Y126.785 E.20589
G1 X137.398 Y126.785 E.04976
G1 X137.398 Y129.24 E.08144
G1 X135.898 Y129.24 E.04976
G1 X135.898 Y135.364 E.20314
M204 S250
G1 X136.29 Y135.032 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6432
M204 S5000
G1 X137.79 Y135.032 E.04609
G1 X137.79 Y137.79 E.08475
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.415 Y118.21 E.0985
G1 X121.415 Y119.71 E.04609
G1 X126.382 Y119.71 E.15262
G1 X126.782 Y119.71 E.01229
G1 X126.782 Y119.669 E.00126
G1 X126.782 Y118.21 E.04483
G1 X126.856 Y118.21 E.00228
G1 X127.256 Y118.21 E.01229
G1 X128.86 Y118.21 E.04926
G1 X129.26 Y118.21 E.01229
G1 X129.331 Y118.21 E.00218
G1 X129.331 Y119.669 E.04483
G1 X129.331 Y119.71 E.00126
G1 X129.731 Y119.71 E.01229
G1 X134.64 Y119.71 E.15084
G1 X134.64 Y118.21 E.04609
G1 X137.79 Y118.21 E.09681
G1 X137.79 Y120.97 E.08482
G1 X136.29 Y120.97 E.04609
G1 X136.29 Y125.593 E.14204
G1 X136.29 Y125.993 E.01229
G1 X136.29 Y126.393 E.01229
G1 F6136.876
G1 X136.331 Y126.393 E.00126
G1 F5700
G1 X137.79 Y126.393 E.04483
G1 F6432
G1 X137.79 Y126.471 E.00241
G1 X137.79 Y126.871 E.01229
G1 X137.79 Y127.271 E.01229
G1 X137.79 Y128.753 E.04554
G1 X137.79 Y129.153 E.01229
G1 X137.79 Y129.553 E.01229
G1 X137.79 Y129.632 E.00242
G1 F5700
G1 X136.331 Y129.632 E.04483
G1 F6136.876
G1 X136.29 Y129.632 E.00126
G1 F6432
G1 X136.29 Y130.032 E.01229
G1 X136.29 Y130.432 E.01229
G1 X136.29 Y134.972 E.13949
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y135.032 E-.57046
G1 X137.79 Y135.531 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.211 Y136.431 Z16 F42000
G1 X124.998 Y137.05 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6432
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X136.543 Y127.133 E.46519
G1 X137.05 Y127.133 E.01682
G1 X137.05 Y128.892 E.05833
G1 X136.568 Y128.892 E.01599
G1 X127.523 Y119.847 E.42433
G1 X127.523 Y118.95 E.02973
G1 X128.59 Y118.95 E.03541
G1 X128.59 Y119.734 E.02599
G1 X118.95 Y129.374 E.45223
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X134.302 Y137.05 E.16349
G1 X135.58 Y135.772 E.05993
G1 X135.772 Y135.772 E.00639
G1 X137.05 Y137.05 E.05993
G1 X135.421 Y137.05 E.05401
M204 S10000
G1 X135.55 Y122.079 F42000
G1 F6432
M204 S6000
G1 X135.55 Y120.45 E.05401
G1 X118.95 Y137.05 E.77871
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6432
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X120.675 Y119.973 E.08092
G1 X120.675 Y118.95 E.03392
G1 X118.95 Y118.95 E.05722
G1 X135.55 Y135.55 E.77871
G1 X135.55 Y133.921 E.05401
M204 S10000
G1 X134.174 Y120.45 F42000
G1 F6432
M204 S6000
G1 X135.38 Y120.45 E.04
G1 X135.38 Y120.028 E.01401
G2 X135.77 Y120.23 I.296 J-.094 E.01619
G1 X137.05 Y118.95 E.06004
G1 X135.421 Y118.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X137.05 Y118.95 E-.61876
G1 X136.787 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/100
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
M204 S10000
G17
G3 Z16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z16.2 F4000
            G39.3 S1
            G0 Z16.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z16.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z15.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z15.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y135.558
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6579
M204 S6000
G1 X137.398 Y135.558 E.04976
G1 X137.398 Y137.398 E.06104
M73 P79 R4
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.892 Y118.602 E.07598
G1 X120.892 Y120.102 E.04976
G1 X127.059 Y120.102 E.20457
G1 X127.059 Y118.602 E.04976
G1 X129.05 Y118.602 E.06605
G1 X129.05 Y120.102 E.04976
G1 X135.16 Y120.102 E.20267
G1 X135.16 Y118.602 E.04976
G1 X137.398 Y118.602 E.07423
G1 X137.398 Y120.444 E.06111
G1 X135.898 Y120.444 E.04976
G1 X135.898 Y126.666 E.20637
G1 X137.398 Y126.666 E.04976
G1 X137.398 Y129.36 E.08937
G1 X135.898 Y129.36 E.04976
G1 X135.898 Y135.498 E.20361
M204 S250
G1 X136.29 Y135.166 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6579
M204 S5000
G1 X137.79 Y135.166 E.04609
G1 X137.79 Y137.79 E.08064
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.285 Y118.21 E.09447
G1 X121.285 Y119.71 E.04609
G1 X126.267 Y119.71 E.15311
G1 X126.667 Y119.71 E.01229
G1 X126.667 Y119.669 E.00126
G1 X126.667 Y118.21 E.04483
G1 X126.741 Y118.21 E.00228
G1 X127.141 Y118.21 E.01229
G1 X128.972 Y118.21 E.05624
G1 X129.372 Y118.21 E.01229
G1 X129.443 Y118.21 E.00218
G1 X129.443 Y119.669 E.04483
G1 X129.443 Y119.71 E.00126
G1 X129.843 Y119.71 E.01229
G1 X134.768 Y119.71 E.15135
G1 X134.768 Y118.21 E.04609
G1 X137.79 Y118.21 E.09286
G1 X137.79 Y120.836 E.0807
G1 X136.29 Y120.836 E.04609
G1 X136.29 Y125.474 E.14249
G1 X136.29 Y125.874 E.01229
G1 X136.29 Y126.274 E.01229
G1 F6136.876
G1 X136.331 Y126.274 E.00126
G1 F5700
G1 X137.79 Y126.274 E.04483
G1 F6550.347
G1 X137.79 Y126.352 E.00241
G1 F6579
G1 X137.79 Y126.752 E.01229
G1 X137.79 Y127.152 E.01229
G1 X137.79 Y128.873 E.05288
G1 X137.79 Y129.273 E.01229
G1 X137.79 Y129.673 E.01229
G1 F6553.039
G1 X137.79 Y129.752 E.00242
G1 F5700
G1 X136.331 Y129.752 E.04483
G1 F6136.876
G1 X136.29 Y129.752 E.00126
G1 F6579
G1 X136.29 Y130.152 E.01229
G1 X136.29 Y130.552 E.01229
G1 X136.29 Y135.106 E.13993
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y135.166 E-.57046
G1 X137.79 Y135.665 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.76 Y128.102 Z16.2 F42000
G1 X135.694 Y120.273 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10754
G1 F6579
M204 S6000
G1 X135.364 Y120.273 E.00174
M204 S10000
G1 X137.006 Y118.994 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F6579
M204 S6000
G1 X135.552 Y118.994 E.04467
G1 X135.552 Y119.827 E.0256
G1 X135.921 Y119.829 E.01132
G1 X136.035 Y119.886 E.00394
G1 X136.123 Y120.052 E.00577
G1 X137.006 Y120.052 E.02713
G1 X137.006 Y119.054 E.03067
M204 S10000
G1 X136.647 Y119.523 F42000
; LINE_WIDTH: 0.383446
G1 F6579
M204 S6000
G1 X136.647 Y119.353 E.00472
G1 X135.911 Y119.353 E.02043
G1 X135.911 Y119.469 E.00323
G1 X136.296 Y119.64 E.01169
G1 X136.317 Y119.693 E.00159
G1 X136.647 Y119.693 E.00915
G1 X136.647 Y119.583 E.00306
; WIPE_START
G1 F12000
G1 X136.647 Y119.693 E-.04316
G1 X136.317 Y119.693 E-.12915
G1 X136.296 Y119.64 E-.02249
G1 X135.911 Y119.469 E-.16487
G1 X135.911 Y119.353 E-.04553
G1 X136.647 Y119.353 E-.28815
G1 X136.647 Y119.523 E-.06665
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.02 Y119.798 Z16.2 F42000
G1 X120.544 Y120.104 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6579
M204 S6000
G1 X118.95 Y121.698 E.07477
G1 X118.95 Y118.95 E.09114
G1 X135.55 Y135.55 E.77871
G1 X135.55 Y135.802 E.00838
G1 X134.302 Y137.05 E.05852
G1 X137.05 Y137.05 E.09114
G1 X135.906 Y135.906 E.05365
G1 X137.05 Y135.906 E.03794
G1 X137.05 Y136.391 E.01608
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6579
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X135.325 Y120.675 E.76816
G1 X135.55 Y120.675 E.00746
G1 X135.55 Y127.014 E.21026
G1 X136.662 Y127.014 E.0369
G1 X126.626 Y137.05 E.4708
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X128.702 Y119.622 E.45748
G1 X128.702 Y118.95 E.02228
G1 X127.408 Y118.95 E.04295
G1 X127.408 Y119.732 E.02592
G1 X136.687 Y129.012 E.43534
G1 X135.55 Y129.012 E.03774
G1 X135.55 Y129.502 E.01627
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X135.55 Y129.012 E-.1864
G1 X136.687 Y129.012 E-.43236
G1 X136.425 Y128.749 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/100
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
M204 S10000
G17
G3 Z16.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z16.4 F4000
            G39.3 S1
            G0 Z16.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z16.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z16
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z16
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y135.692
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6502
M204 S6000
G1 X137.398 Y135.692 E.04976
G1 X137.398 Y137.398 E.0566
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.761 Y118.602 E.07163
G1 X120.761 Y120.102 E.04976
G1 X126.944 Y120.102 E.20509
G1 X126.944 Y118.602 E.04976
G1 X129.162 Y118.602 E.07358
G1 X129.162 Y120.102 E.04976
G1 X135.289 Y120.102 E.20322
G1 X135.289 Y118.602 E.04976
G1 X137.398 Y118.602 E.06997
G1 X137.398 Y120.31 E.05666
G1 X135.898 Y120.31 E.04976
G1 X135.898 Y126.546 E.20686
G1 X137.398 Y126.546 E.04976
G1 X137.398 Y129.479 E.0973
G1 X135.898 Y129.479 E.04976
G1 X135.898 Y135.632 E.20408
M204 S250
G1 X136.29 Y135.3 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6502
M204 S5000
G1 X137.79 Y135.3 E.04609
G1 X137.79 Y137.79 E.07653
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.154 Y118.21 E.09045
G1 X121.154 Y119.71 E.04609
G1 X126.152 Y119.71 E.15359
G1 X126.552 Y119.71 E.01229
G1 X126.552 Y119.669 E.00126
G1 X126.552 Y118.21 E.04483
G1 X126.626 Y118.21 E.00228
G1 X127.026 Y118.21 E.01229
G1 X129.084 Y118.21 E.06321
G1 X129.484 Y118.21 E.01229
G1 X129.555 Y118.21 E.00218
G1 X129.555 Y119.669 E.04483
G1 X129.555 Y119.71 E.00126
G1 X129.955 Y119.71 E.01229
G1 X134.897 Y119.71 E.15186
G1 X134.897 Y118.21 E.04609
G1 X137.79 Y118.21 E.08891
G1 X137.79 Y120.702 E.07658
G1 X136.29 Y120.702 E.04609
G1 X136.29 Y125.354 E.14294
G1 X136.29 Y125.754 E.01229
G1 X136.29 Y126.154 E.01229
G1 F6136.876
G1 X136.331 Y126.154 E.00126
G1 F5700
G1 X137.79 Y126.154 E.04483
G1 F6502
G1 X137.79 Y126.233 E.00241
G1 X137.79 Y126.633 E.01229
G1 X137.79 Y127.033 E.01229
G1 X137.79 Y128.993 E.06023
G1 X137.79 Y129.393 E.01229
G1 X137.79 Y129.793 E.01229
G1 X137.79 Y129.872 E.00242
G1 F5700
G1 X136.331 Y129.872 E.04483
G1 F6136.876
G1 X136.29 Y129.872 E.00126
G1 F6502
G1 X136.29 Y130.272 E.01229
G1 X136.29 Y130.672 E.01229
G1 X136.29 Y135.24 E.14036
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y135.3 E-.57046
G1 X137.79 Y135.798 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.55 Y129.502 Z16.4 F42000
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6502
M204 S6000
G1 X135.55 Y129.131 E.0123
G1 X136.807 Y129.131 E.04171
G1 X127.292 Y119.617 E.44635
G1 X127.292 Y118.95 E.0221
G1 X128.814 Y118.95 E.05048
G1 X128.814 Y119.51 E.01856
G1 X118.95 Y129.374 E.46273
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X126.626 Y137.05 E.09114
G1 X136.781 Y126.894 E.4764
G1 X135.55 Y126.894 E.04086
G1 X135.55 Y120.45 E.21376
G1 X118.95 Y137.05 E.77871
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F6502
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X120.413 Y120.235 E.06863
G1 X120.413 Y118.95 E.04261
G1 X118.95 Y118.95 E.04853
G1 X135.55 Y135.55 E.77871
G1 X135.55 Y135.802 E.00838
G1 X134.302 Y137.05 E.05852
G1 X137.05 Y137.05 E.09114
G1 X136.04 Y136.04 E.04737
G1 X137.05 Y136.04 E.0335
G1 X137.05 Y136.658 E.02052
; WIPE_START
G1 F15476.087
G1 X137.05 Y136.04 E-.23503
G1 X136.04 Y136.04 E-.38373
G1 X136.303 Y136.303 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.364 Y128.67 Z16.4 F42000
G1 X136.433 Y119.962 Z16.4
G1 Z16
G1 E.8 F1800
G1 F6502
M204 S6000
G1 X137.05 Y119.962 E.02045
G1 X137.05 Y118.95 E.03356
G1 X136.038 Y119.962 E.04746
G1 X135.637 Y119.962 E.0133
G1 X135.637 Y118.95 E.03356
G1 X135.852 Y118.95 E.00715
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
M73 P80 R4
G1 F15476.087
G1 X135.637 Y118.95 E-.08191
G1 X135.637 Y119.962 E-.38444
G1 X136.038 Y119.962 E-.15241
G1 X136.301 Y119.699 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/100
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
M204 S10000
G17
G3 Z16.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z16.6 F4000
            G39.3 S1
            G0 Z16.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z16.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z16.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z16.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y135.825
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6494
M204 S6000
G1 X137.398 Y135.825 E.04976
G1 X137.398 Y137.398 E.05216
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.631 Y118.602 E.06729
G1 X120.631 Y120.102 E.04976
G1 X126.829 Y120.102 E.20562
G1 X126.829 Y118.602 E.04976
G1 X129.274 Y118.602 E.08111
G1 X129.274 Y120.102 E.04976
G1 X135.417 Y120.102 E.20377
G1 X135.417 Y118.602 E.04976
G1 X137.398 Y118.602 E.0657
G1 X137.398 Y120.176 E.05222
G1 X135.898 Y120.176 E.04976
G1 X135.898 Y126.427 E.20734
G1 X137.398 Y126.427 E.04976
G1 X137.398 Y129.599 E.10523
G1 X135.898 Y129.599 E.04976
G1 X135.898 Y135.765 E.20455
M204 S250
G1 X136.29 Y135.433 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6494
M204 S5000
G1 X137.79 Y135.433 E.04609
G1 X137.79 Y137.79 E.07241
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X121.023 Y118.21 E.08642
G1 X121.023 Y119.71 E.04609
G1 X126.037 Y119.71 E.15408
G1 X126.437 Y119.71 E.01229
G1 X126.437 Y119.669 E.00126
G1 X126.437 Y118.21 E.04483
G1 X126.511 Y118.21 E.00228
G1 X126.911 Y118.21 E.01229
G1 X129.196 Y118.21 E.07019
G1 X129.596 Y118.21 E.01229
G1 X129.666 Y118.21 E.00218
G1 X129.666 Y119.669 E.04483
G1 X129.666 Y119.71 E.00126
G1 X130.066 Y119.71 E.01229
G1 X135.025 Y119.71 E.15237
G1 X135.025 Y118.21 E.04609
G1 X137.79 Y118.21 E.08496
G1 X137.79 Y120.568 E.07246
G1 X136.29 Y120.568 E.04609
G1 X136.29 Y125.235 E.14339
G1 X136.29 Y125.635 E.01229
G1 X136.29 Y126.035 E.01229
G1 F6136.876
G1 X136.331 Y126.035 E.00126
G1 F5700
G1 X137.79 Y126.035 E.04483
G1 F6494
G1 X137.79 Y126.113 E.00241
G1 X137.79 Y126.513 E.01229
G1 X137.79 Y126.913 E.01229
G1 X137.79 Y129.113 E.06758
G1 X137.79 Y129.513 E.01229
G1 X137.79 Y129.913 E.01229
G1 X137.79 Y129.991 E.00242
G1 F5700
G1 X136.331 Y129.991 E.04483
G1 F6136.876
G1 X136.29 Y129.991 E.00126
G1 F6494
G1 X136.29 Y130.391 E.01229
G1 X136.29 Y130.791 E.01229
G1 X136.29 Y135.373 E.1408
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y135.433 E-.57046
G1 X137.79 Y135.932 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y136.846 Z16.6 F42000
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6494
M204 S6000
G1 X137.05 Y136.174 E.02231
G1 X136.174 Y136.174 E.02906
G1 X137.05 Y137.05 E.0411
G1 X134.302 Y137.05 E.09114
G1 X135.55 Y135.802 E.05852
G1 X135.55 Y135.55 E.00838
G1 X120.45 Y120.45 E.70834
G1 X127.177 Y120.45 E.22315
G1 X127.177 Y119.501 E.03148
G1 X136.927 Y129.251 E.45737
G1 X137.05 Y129.251 E.00407
G1 X137.05 Y126.775 E.08213
G1 X136.901 Y126.775 E.00493
G1 X126.626 Y137.05 E.482
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X128.926 Y119.398 E.46799
G1 X128.926 Y120.45 E.03491
G1 X135.251 Y120.45 E.2098
G1 X135.251 Y120.654 E.00675
G1 X135.346 Y120.654 E.00316
G1 X118.95 Y137.05 E.76917
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X118.95 Y120.579 F42000
G1 F6494
M204 S6000
G1 X118.95 Y118.95 E.05401
G1 X120.282 Y120.282 E.06248
G1 X120.282 Y120.366 E.00277
G1 X118.95 Y121.698 E.06248
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X135.658 Y120.305 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.11659
G1 F6494
M204 S6000
G1 X135.658 Y119.973 E.002
M204 S10000
G1 X136.063 Y119.646 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F6494
M204 S6000
G1 X136.123 Y119.784 E.00462
G1 X137.006 Y119.784 E.02713
G1 X137.006 Y118.994 E.02428
G1 X135.809 Y118.994 E.03677
G1 X135.809 Y119.581 E.01802
G1 X136.014 Y119.611 E.00637
M204 S10000
G1 X136.611 Y119.389 F42000
; LINE_WIDTH: 0.45588
G1 F6494
M204 S6000
G1 X136.422 Y119.389 E.00635
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F12000
G1 X136.611 Y119.389 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/100
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
M204 S10000
G17
G3 Z16.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z16.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z16.8 F4000
            G39.3 S1
            G0 Z16.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z16.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z16.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F12000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z16.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F12000
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z16.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y135.959
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6532
M204 S6000
G1 X137.398 Y135.959 E.04976
G1 X137.398 Y137.398 E.04773
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.5 Y118.602 E.06294
G1 X120.5 Y120.102 E.04976
G1 X126.714 Y120.102 E.20615
G1 X126.714 Y118.602 E.04976
G1 X129.386 Y118.602 E.08865
G1 X129.386 Y120.102 E.04976
G1 X135.546 Y120.102 E.20432
G1 X135.546 Y118.602 E.04976
G1 X137.398 Y118.602 E.06144
G1 X137.398 Y120.042 E.04777
G1 X135.898 Y120.042 E.04976
G1 X135.898 Y126.307 E.20783
G1 X137.398 Y126.307 E.04976
G1 X137.398 Y129.719 E.11317
G1 X135.898 Y129.719 E.04976
G1 X135.898 Y135.899 E.20501
M204 S250
G1 X136.29 Y135.567 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P81 R4
G1 F6532
M204 S5000
G1 X137.79 Y135.567 E.04609
G1 X137.79 Y137.79 E.0683
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.892 Y118.21 E.0824
G1 X120.892 Y119.71 E.04609
G1 X125.922 Y119.71 E.15457
G1 X126.322 Y119.71 E.01229
G1 X126.322 Y119.669 E.00126
G1 X126.322 Y118.21 E.04483
G1 X126.396 Y118.21 E.00228
G1 X126.796 Y118.21 E.01229
G1 X129.307 Y118.21 E.07717
G1 X129.707 Y118.21 E.01229
G1 X129.778 Y118.21 E.00218
G1 X129.778 Y119.669 E.04483
G1 X129.778 Y119.71 E.00126
G1 X130.178 Y119.71 E.01229
G1 X135.154 Y119.71 E.15287
G1 X135.154 Y118.21 E.04609
G1 X137.79 Y118.21 E.08101
G1 X137.79 Y120.434 E.06835
G1 X136.29 Y120.434 E.04609
G1 X136.29 Y125.115 E.14383
G1 X136.29 Y125.515 E.01229
G1 X136.29 Y125.915 E.01229
G1 F6136.876
G1 X136.331 Y125.915 E.00126
G1 F5700
G1 X137.79 Y125.915 E.04483
G1 F6532
G1 X137.79 Y125.994 E.00241
G1 X137.79 Y126.394 E.01229
G1 X137.79 Y126.794 E.01229
G1 X137.79 Y129.232 E.07493
G1 X137.79 Y129.632 E.01229
G1 X137.79 Y130.032 E.01229
G1 X137.79 Y130.111 E.00242
G1 F5700
G1 X136.331 Y130.111 E.04483
G1 F6136.876
G1 X136.29 Y130.111 E.00126
G1 F6532
G1 X136.29 Y130.511 E.01229
G1 X136.29 Y130.911 E.01229
G1 X136.29 Y135.507 E.14123
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y135.567 E-.57046
G1 X137.79 Y136.066 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.97 Y128.478 Z16.8 F42000
G1 X136.008 Y119.58 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55946
G1 F6532
M204 S6000
G1 X136.936 Y119.58 E.03909
G1 X136.936 Y119.064 E.02174
G1 X136.008 Y119.064 E.03909
G1 X136.008 Y119.52 E.01922
; WIPE_START
G1 F12196.539
G1 X136.008 Y119.064 E-.17349
G1 X136.936 Y119.064 E-.35287
G1 X136.936 Y119.58 E-.19629
G1 X136.838 Y119.58 E-.03736
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.211 Y119.3 Z16.8 F42000
G1 X119.724 Y118.95 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6532
M204 S6000
G1 X120.151 Y118.95 E.01418
G1 X120.151 Y120.151 E.03984
G1 X118.95 Y118.95 E.05634
G1 X118.95 Y121.698 E.09114
G1 X120.198 Y120.45 E.05852
G1 X120.45 Y120.45 E.00838
G1 X135.55 Y135.55 E.70834
G1 X135.55 Y135.802 E.00838
G1 X134.302 Y137.05 E.05852
G1 X137.05 Y137.05 E.09114
G1 X136.307 Y136.307 E.03482
G1 X137.05 Y136.307 E.02462
G1 X137.05 Y136.846 E.01787
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6532
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X135.55 Y120.45 E.77871
G1 X129.038 Y120.45 E.216
G1 X129.038 Y119.286 E.03863
G1 X118.95 Y129.374 E.47324
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X126.626 Y137.05 E.09114
G1 X137.02 Y126.656 E.48761
G1 X137.05 Y129.371 E.09007
G1 X127.062 Y119.386 E.46845
G1 X127.062 Y120.45 E.03529
G1 X126.498 Y120.45 E.01872
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X127.062 Y120.45 E-.21446
G1 X127.062 Y119.386 E-.4043
G1 X127.325 Y119.649 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/100
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
M204 S10000
G17
G3 Z16.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z17 F4000
            G39.3 S1
            G0 Z17 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z16.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z16.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z16.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y136.093
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6618
M204 S6000
G1 X137.398 Y136.093 E.04976
G1 X137.398 Y137.398 E.04329
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.369 Y118.602 E.0586
G1 X120.369 Y120.102 E.04976
G1 X126.599 Y120.102 E.20667
G1 X126.599 Y118.602 E.04976
G1 X129.498 Y118.602 E.09618
G1 X129.498 Y120.102 E.04976
G1 X135.898 Y120.102 E.21229
G1 X135.898 Y126.188 E.20188
G1 X137.398 Y126.188 E.04976
G1 X137.398 Y129.839 E.1211
G1 X135.898 Y129.839 E.04976
G1 X135.898 Y136.033 E.20548
; WIPE_START
G1 F15476.087
G1 X137.398 Y136.093 E-.57046
G1 X137.398 Y136.592 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.614 Y129 Z17 F42000
G1 X135.674 Y119.908 Z17
G1 Z16.6
G1 E.8 F1800
G1 F6618
M204 S6000
G1 X135.674 Y118.602 E.04333
G1 X137.398 Y118.602 E.05718
G1 X137.398 Y119.908 E.04333
G1 X135.734 Y119.908 E.05519
; WIPE_START
G1 F15476.087
G1 X135.674 Y118.602 E-.49684
G1 X136.367 Y118.602 E-.26316
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.333 Y126.234 Z17 F42000
G1 X136.29 Y135.701 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6618
M204 S5000
G1 X137.79 Y135.701 E.04609
G1 X137.79 Y137.79 E.06419
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.761 Y118.21 E.07837
G1 X120.761 Y119.71 E.04609
G1 X125.807 Y119.71 E.15506
G1 X126.207 Y119.71 E.01229
G1 X126.207 Y119.669 E.00126
G1 F6600
G1 X126.207 Y118.21 E.04483
G1 F6618
G1 X126.281 Y118.21 E.00228
G1 X126.681 Y118.21 E.01229
G1 X129.419 Y118.21 E.08414
G1 X129.819 Y118.21 E.01229
G1 X129.89 Y118.21 E.00218
G1 F6600
G1 X129.89 Y119.669 E.04483
G1 F6618
G1 X129.89 Y119.71 E.00126
G1 X130.29 Y119.71 E.01229
G1 X135.282 Y119.71 E.15338
G1 X135.282 Y118.21 E.04609
G1 X137.79 Y118.21 E.07706
G1 X137.79 Y120.3 E.06423
G1 X136.29 Y120.3 E.04609
G1 X136.29 Y124.996 E.14428
G1 X136.29 Y125.396 E.01229
G1 X136.29 Y125.796 E.01229
G1 F6136.876
G1 X136.331 Y125.796 E.00126
G1 F5700
G1 X137.79 Y125.796 E.04483
G1 F6550.347
G1 X137.79 Y125.874 E.00241
G1 F6618
G1 X137.79 Y126.274 E.01229
G1 X137.79 Y126.674 E.01229
G1 X137.79 Y129.352 E.08228
G1 X137.79 Y129.752 E.01229
G1 X137.79 Y130.152 E.01229
G1 F6553.039
G1 X137.79 Y130.231 E.00242
G1 F5700
G1 X136.331 Y130.231 E.04483
G1 F6136.876
G1 X136.29 Y130.231 E.00126
G1 F6618
G1 X136.29 Y130.631 E.01229
G1 X136.29 Y131.031 E.01229
G1 X136.29 Y135.641 E.14166
M204 S10000
G1 X135.55 Y136.006 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X135.55 Y136.441 E.01445
G1 X136.441 Y136.441 E.02958
G1 X137.05 Y137.05 E.02854
G1 X134.302 Y137.05 E.09114
G1 X135.55 Y135.802 E.05852
G1 X135.55 Y135.55 E.00838
G1 X120.45 Y120.45 E.70834
G1 X120.198 Y120.45 E.00838
G1 X118.95 Y121.698 E.05852
G1 X118.95 Y118.95 E.09114
G1 X120.02 Y120.02 E.0502
G1 X120.02 Y118.95 E.03549
G1 X119.462 Y118.95 E.01852
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6618
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X135.55 Y120.45 E.77871
G1 X135.55 Y122.079 E.05401
; WIPE_START
G1 F15476.087
G1 X135.55 Y120.45 E-.61876
G1 X135.287 Y120.713 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.103 Y119.48 Z17 F42000
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49244
G1 F6618
M204 S6000
G1 X136.97 Y119.48 E.03176
G1 X136.97 Y119.03 E.01647
G1 X136.103 Y119.03 E.03176
G1 X136.103 Y119.42 E.01427
; WIPE_START
G1 F14014.95
G1 X136.103 Y119.03 E-.14802
G1 X136.97 Y119.03 E-.32949
G1 X136.97 Y119.48 E-.17082
G1 X136.676 Y119.48 E-.11167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.451 Y125.836 Z17 F42000
G1 X124.998 Y137.05 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6618
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X137.05 Y126.626 E.48898
G1 X137.05 Y129.374 E.09114
G1 X126.947 Y119.271 E.47393
G1 X126.947 Y118.95 E.01065
G1 X129.15 Y118.95 E.07307
G1 X129.15 Y119.174 E.00742
G1 X118.95 Y129.374 E.47849
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X131.002 Y137.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
M73 P82 R4
G1 F15476.087
G1 X129.374 Y137.05 E-.61876
G1 X129.111 Y136.787 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/100
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
M204 S10000
G17
G3 Z17 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z17.2 F4000
            G39.3 S1
            G0 Z17.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z17.000
M204 S10000
M73 P82 R3
G1 X40.52 Y239.602 F42000
G1 Z16.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z16.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y136.227
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6764
M204 S6000
G1 X137.398 Y136.227 E.04976
G1 X137.398 Y137.398 E.03885
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.238 Y118.602 E.05425
G1 X120.238 Y120.102 E.04976
G1 X126.484 Y120.102 E.2072
G1 X126.484 Y118.602 E.04976
G1 X129.61 Y118.602 E.10371
G1 X129.61 Y120.102 E.04976
G1 X135.898 Y120.102 E.20857
G1 X135.898 Y126.068 E.19792
G1 X137.398 Y126.068 E.04976
G1 X137.398 Y129.958 E.12903
G1 X135.898 Y129.958 E.04976
G1 X135.898 Y136.167 E.20595
; WIPE_START
G1 F15476.087
G1 X137.398 Y136.227 E-.57046
G1 X137.398 Y136.726 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.683 Y129.127 Z17.2 F42000
G1 X135.803 Y119.774 Z17.2
G1 Z16.8
G1 E.8 F1800
G1 F6764
M204 S6000
G1 X135.803 Y118.602 E.03888
G1 X137.398 Y118.602 E.05291
G1 X137.398 Y119.774 E.03888
G1 X135.863 Y119.774 E.05092
; WIPE_START
G1 F15476.087
G1 X135.803 Y118.602 E-.44597
G1 X136.629 Y118.602 E-.31403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.479 Y126.233 Z17.2 F42000
G1 X136.29 Y135.835 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6764
M204 S5000
G1 X137.79 Y135.835 E.04609
G1 X137.79 Y137.79 E.06008
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.63 Y118.21 E.07435
G1 X120.63 Y119.71 E.04609
G1 X125.692 Y119.71 E.15555
G1 X126.092 Y119.71 E.01229
G1 X126.092 Y119.669 E.00126
G1 F6600
G1 X126.092 Y118.21 E.04483
G1 F6764
G1 X126.166 Y118.21 E.00228
G1 X126.566 Y118.21 E.01229
G1 X129.531 Y118.21 E.09112
G1 X129.931 Y118.21 E.01229
G1 X130.002 Y118.21 E.00218
G1 F6600
G1 X130.002 Y119.669 E.04483
G1 F6764
G1 X130.002 Y119.71 E.00126
G1 X130.402 Y119.71 E.01229
G1 X135.411 Y119.71 E.15389
G1 X135.411 Y118.21 E.04609
G1 X137.79 Y118.21 E.07311
G1 X137.79 Y120.166 E.06011
G1 X136.29 Y120.166 E.04609
G1 X136.29 Y124.876 E.14473
G1 X136.29 Y125.276 E.01229
G1 X136.29 Y125.676 E.01229
G1 F6136.876
G1 X136.331 Y125.676 E.00126
G1 F5700
G1 X137.79 Y125.676 E.04483
G1 F6550.235
G1 X137.79 Y125.755 E.00241
G1 F6764
G1 X137.79 Y126.155 E.01229
G1 X137.79 Y126.555 E.01229
G1 X137.79 Y129.472 E.08962
G1 X137.79 Y129.872 E.01229
G1 X137.79 Y130.272 E.01229
G1 F6553.039
G1 X137.79 Y130.35 E.00242
G1 F5700
G1 X136.331 Y130.35 E.04483
G1 F6136.876
G1 X136.29 Y130.35 E.00126
G1 F6764
G1 X136.29 Y130.75 E.01229
G1 X136.29 Y131.15 E.01229
G1 X136.29 Y135.775 E.1421
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y135.835 E-.57046
G1 X137.79 Y136.334 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.076 Y128.735 Z17.2 F42000
G1 X136.198 Y119.379 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42542
G1 F6764
M204 S6000
G1 X137.003 Y119.379 E.02511
G1 X137.003 Y118.997 E.01192
G1 X136.198 Y118.997 E.02511
G1 X136.198 Y119.319 E.01005
; WIPE_START
G1 F15000
G1 X136.198 Y118.997 E-.12255
G1 X137.003 Y118.997 E-.30612
G1 X137.003 Y119.379 E-.14535
G1 X136.514 Y119.379 E-.18598
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.884 Y119.19 Z17.2 F42000
G1 X119.2 Y118.95 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6764
M204 S6000
G1 X119.889 Y118.95 E.02286
G1 X119.889 Y119.889 E.03115
G1 X118.95 Y118.95 E.04405
G1 X118.95 Y121.698 E.09114
G1 X120.198 Y120.45 E.05852
G1 X120.45 Y120.45 E.00838
G1 X135.55 Y135.55 E.70834
G1 X135.55 Y135.802 E.00838
G1 X134.302 Y137.05 E.05852
G1 X137.05 Y137.05 E.09114
G1 X136.575 Y136.575 E.02226
G1 X135.55 Y136.575 E.03401
G1 X135.55 Y136.006 E.01889
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6764
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X135.55 Y120.45 E.77871
G1 X129.262 Y120.45 E.20857
G1 X129.262 Y119.062 E.04605
G1 X118.95 Y129.374 E.48375
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X126.626 Y137.05 E.09114
G1 X137.05 Y126.626 E.48898
G1 X137.05 Y129.374 E.09114
G1 X126.832 Y119.156 E.47932
G1 X126.832 Y120.45 E.04293
G1 X126.498 Y120.45 E.01109
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X126.832 Y120.45 E-.127
G1 X126.832 Y119.156 E-.49175
G1 X127.095 Y119.419 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/100
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
M204 S10000
G17
G3 Z17.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z17.4 F4000
            G39.3 S1
            G0 Z17.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z17.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z17
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z17
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y136.361
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6753
M204 S6000
G1 X137.398 Y136.361 E.04976
G1 X137.398 Y137.398 E.03441
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X120.107 Y118.602 E.04991
G1 X120.107 Y120.102 E.04976
G1 X126.369 Y120.102 E.20773
G1 X126.369 Y118.602 E.04976
G1 X129.722 Y118.602 E.11124
G1 X129.722 Y120.102 E.04976
G1 X135.898 Y120.102 E.20486
G1 X135.898 Y125.949 E.19395
G1 X137.398 Y125.949 E.04976
G1 X137.398 Y130.078 E.13696
G1 X135.898 Y130.078 E.04976
G1 X135.898 Y136.301 E.20642
; WIPE_START
G1 F15476.087
M73 P83 R3
G1 X137.398 Y136.361 E-.57046
G1 X137.398 Y136.859 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.75 Y129.254 Z17.4 F42000
G1 X135.931 Y119.64 Z17.4
G1 Z17
G1 E.8 F1800
G1 F6753
M204 S6000
G1 X135.931 Y118.602 E.03443
G1 X137.398 Y118.602 E.04865
G1 X137.398 Y119.64 E.03443
G1 X135.991 Y119.64 E.04666
; WIPE_START
G1 F15476.087
G1 X135.931 Y118.602 E-.39511
G1 X136.892 Y118.602 E-.36489
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.627 Y126.23 Z17.4 F42000
G1 X136.29 Y135.969 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6753
M204 S5000
G1 X137.79 Y135.969 E.04609
G1 X137.79 Y137.79 E.05597
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.499 Y118.21 E.07033
G1 X120.499 Y119.71 E.04609
G1 X125.577 Y119.71 E.15603
G1 X125.977 Y119.71 E.01229
G1 X125.977 Y119.669 E.00126
G1 F6600
G1 X125.977 Y118.21 E.04483
G1 F6753
G1 X126.051 Y118.21 E.00228
G1 X126.451 Y118.21 E.01229
G1 X129.643 Y118.21 E.0981
G1 X130.043 Y118.21 E.01229
G1 X130.114 Y118.21 E.00218
G1 F6600
G1 X130.114 Y119.669 E.04483
G1 F6753
G1 X130.114 Y119.71 E.00126
G1 X130.514 Y119.71 E.01229
G1 X135.539 Y119.71 E.1544
G1 X135.539 Y118.21 E.04609
G1 X137.79 Y118.21 E.06916
G1 X137.79 Y120.032 E.05599
G1 X136.29 Y120.032 E.04609
G1 X136.29 Y124.757 E.14518
G1 X136.29 Y125.157 E.01229
G1 X136.29 Y125.557 E.01229
G1 F6136.876
G1 X136.331 Y125.557 E.00126
G1 F5700
G1 X137.79 Y125.557 E.04483
G1 F6550.235
G1 X137.79 Y125.635 E.00241
G1 F6753
G1 X137.79 Y126.035 E.01229
G1 X137.79 Y126.435 E.01229
G1 X137.79 Y129.591 E.09697
G1 X137.79 Y129.991 E.01229
G1 X137.79 Y130.391 E.01229
G1 F6553.039
G1 X137.79 Y130.47 E.00242
G1 F5700
G1 X136.331 Y130.47 E.04483
G1 F6136.876
G1 X136.29 Y130.47 E.00126
G1 F6753
G1 X136.29 Y130.87 E.01229
G1 X136.29 Y131.27 E.01229
G1 X136.29 Y135.909 E.14253
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y135.969 E-.57046
G1 X137.79 Y136.467 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.695 Y136.879 Z17.4 F42000
G1 Z17
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.67317
G1 F6753
M204 S6000
G1 X137.194 Y136.879 E.07703
M204 S10000
G1 X132.674 Y137.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6753
M204 S6000
G1 X134.302 Y137.05 E.05401
G1 X135.55 Y135.802 E.05852
G1 X135.55 Y135.55 E.00838
G1 X120.45 Y120.45 E.70834
G1 X120.198 Y120.45 E.00838
G1 X118.95 Y121.698 E.05852
G1 X118.95 Y118.95 E.09114
G1 X119.758 Y119.758 E.03791
G1 X119.758 Y118.95 E.02681
G1 X119.154 Y118.95 E.02005
; WIPE_START
G1 F15476.087
G1 X119.758 Y118.95 E-.22972
G1 X119.758 Y119.758 E-.30707
G1 X119.343 Y119.343 E-.22321
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.498 Y120.45 Z17.4 F42000
G1 Z17
G1 E.8 F1800
G1 F6753
M204 S6000
G1 X126.717 Y120.45 E.00727
G1 X126.717 Y119.041 E.04674
G1 X137.05 Y129.374 E.48472
G1 X137.05 Y126.626 E.09114
G1 X126.626 Y137.05 E.48898
G1 X129.374 Y137.05 E.09114
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X129.374 Y118.95 E.48898
G1 X129.374 Y120.45 E.04976
G1 X135.55 Y120.45 E.20486
G1 X118.95 Y137.05 E.77871
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.916 Y129.493 Z17.4 F42000
G1 X135.735 Y119.871 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11263
G1 F6753
M204 S6000
G1 X136.094 Y119.871 E.00204
M204 S10000
G1 X136.293 Y119.279 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3584
G1 F6753
M204 S6000
G1 X137.037 Y119.279 E.01913
G1 X137.037 Y118.963 E.00811
G1 X136.293 Y118.963 E.01913
G1 X136.293 Y119.219 E.00657
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X136.293 Y118.963 E-.09708
G1 X137.037 Y118.963 E-.28274
G1 X137.037 Y119.279 E-.11988
G1 X136.352 Y119.279 E-.26029
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/100
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
M204 S10000
G17
G3 Z17.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z17.6 F4000
            G39.3 S1
            G0 Z17.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z17.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z17.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z17.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y136.494
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6664
M204 S6000
G1 X137.398 Y136.494 E.04976
G1 X137.398 Y137.398 E.02997
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X119.976 Y118.602 E.04557
G1 X119.976 Y120.102 E.04976
G1 X126.254 Y120.102 E.20826
G1 X126.254 Y118.602 E.04976
G1 X129.834 Y118.602 E.11877
G1 X129.834 Y120.102 E.04976
G1 X135.898 Y120.102 E.20114
G1 X135.898 Y125.83 E.18999
G1 X137.398 Y125.83 E.04976
G1 X137.398 Y130.198 E.1449
G1 X135.898 Y130.198 E.04976
G1 X135.898 Y136.434 E.20689
; WIPE_START
G1 F15476.087
G1 X137.398 Y136.494 E-.57046
G1 X137.398 Y136.993 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.816 Y129.383 Z17.6 F42000
G1 X136.06 Y119.506 Z17.6
G1 Z17.2
G1 E.8 F1800
G1 F6664
M204 S6000
G1 X136.06 Y118.602 E.02999
G1 X137.398 Y118.602 E.04439
G1 X137.398 Y119.506 E.02999
G1 X136.12 Y119.506 E.0424
; WIPE_START
G1 F15476.087
G1 X136.06 Y118.602 E-.34427
G1 X137.154 Y118.602 E-.41573
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.778 Y126.225 Z17.6 F42000
G1 X136.29 Y136.102 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6664
M204 S5000
G1 X137.79 Y136.102 E.04609
G1 X137.79 Y137.79 E.05186
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.368 Y118.21 E.0663
G1 X120.368 Y119.71 E.04609
G1 X125.462 Y119.71 E.15652
G1 X125.862 Y119.71 E.01229
G1 X125.862 Y119.669 E.00126
G1 F6600
G1 X125.862 Y118.21 E.04483
G1 F6664
G1 X125.936 Y118.21 E.00228
G1 X126.336 Y118.21 E.01229
G1 X129.755 Y118.21 E.10507
G1 X130.155 Y118.21 E.01229
G1 X130.226 Y118.21 E.00218
G1 F6600
G1 X130.226 Y119.669 E.04483
G1 F6664
G1 X130.226 Y119.71 E.00126
G1 X130.626 Y119.71 E.01229
G1 X135.668 Y119.71 E.15491
G1 X135.668 Y118.21 E.04609
G1 X137.79 Y118.21 E.06521
G1 X137.79 Y119.898 E.05187
G1 X136.29 Y119.898 E.04609
G1 X136.29 Y124.637 E.14563
G1 X136.29 Y125.037 E.01229
G1 X136.29 Y125.437 E.01229
G1 F6136.876
G1 X136.331 Y125.437 E.00126
G1 F5700
G1 X137.79 Y125.437 E.04483
G1 F6550.347
G1 X137.79 Y125.516 E.00241
G1 F6664
G1 X137.79 Y125.916 E.01229
G1 X137.79 Y126.316 E.01229
G1 X137.79 Y129.711 E.10432
G1 X137.79 Y130.111 E.01229
G1 X137.79 Y130.511 E.01229
G1 F6553.039
G1 X137.79 Y130.59 E.00242
G1 F5700
G1 X136.331 Y130.59 E.04483
G1 F6136.876
G1 X136.29 Y130.59 E.00126
G1 F6664
G1 X136.29 Y130.99 E.01229
G1 X136.29 Y131.39 E.01229
G1 X136.29 Y136.042 E.14296
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y136.102 E-.57046
G1 X137.79 Y136.601 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.695 Y136.946 Z17.6 F42000
G1 Z17.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.53937
G1 F6664
M204 S6000
G1 X137.194 Y136.946 E.06068
M204 S10000
G1 X124.998 Y137.05 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6664
M204 S6000
G1 X126.626 Y137.05 E.05401
G1 X137.05 Y126.626 E.48898
G1 X137.05 Y129.374 E.09114
G1 X126.626 Y118.95 E.48898
G1 X129.374 Y118.95 E.09114
G1 X118.95 Y129.374 E.48898
G1 X118.95 Y126.626 E.09114
G1 X129.374 Y137.05 E.48898
G1 X134.302 Y137.05 E.16349
G1 X135.55 Y135.802 E.05852
G1 X135.55 Y135.55 E.00838
G1 X120.45 Y120.45 E.70834
G1 X120.198 Y120.45 E.00838
G1 X118.95 Y121.698 E.05852
G1 X118.95 Y118.95 E.09114
G1 X119.627 Y119.627 E.03176
G1 X119.627 Y120.45 E.0273
G1 X119.994 Y120.45 E.01217
M204 S10000
G1 X135.55 Y122.079 F42000
G1 F6664
M204 S6000
G1 X135.55 Y120.45 E.05401
G1 X118.95 Y137.05 E.77871
G1 X121.698 Y137.05 E.09114
G1 X118.95 Y134.302 E.12889
G1 X118.95 Y132.674 E.05401
; WIPE_START
G1 F15476.087
G1 X118.95 Y134.302 E-.61876
G1 X119.213 Y134.565 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.896 Y129.47 Z17.6 F42000
G1 X136.512 Y119.054 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53985
G1 F6664
M204 S6000
G1 X136.886 Y119.054 E.01515
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F12677.842
G1 X136.512 Y119.054 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/100
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
M204 S10000
G17
G3 Z17.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z17.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z17.8 F4000
            G39.3 S1
            G0 Z17.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z17.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z17.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F12677.842
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z17.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
M73 P84 R3
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F12677.842
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z17.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y136.628
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6723
M204 S6000
G1 X137.398 Y136.628 E.04976
G1 X137.398 Y137.398 E.02553
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X119.845 Y118.602 E.04122
G1 X119.845 Y120.102 E.04976
G1 X126.139 Y120.102 E.20878
G1 X126.139 Y118.602 E.04976
G1 X129.946 Y118.602 E.1263
G1 X129.946 Y120.102 E.04976
G1 X135.898 Y120.102 E.19743
G1 X135.898 Y125.71 E.18603
G1 X137.398 Y125.71 E.04976
G1 X137.398 Y130.317 E.15283
G1 X135.898 Y130.317 E.04976
G1 X135.898 Y136.568 E.20735
; WIPE_START
G1 F15476.087
G1 X137.398 Y136.628 E-.57046
G1 X137.398 Y137.127 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.879 Y129.512 Z17.8 F42000
G1 X136.188 Y119.372 Z17.8
G1 Z17.4
G1 E.8 F1800
G1 F6723
M204 S6000
G1 X136.188 Y118.602 E.02554
G1 X137.398 Y118.602 E.04012
G1 X137.398 Y119.372 E.02554
G1 X136.248 Y119.372 E.03813
; WIPE_START
G1 F15476.087
G1 X136.188 Y118.602 E-.29347
G1 X137.398 Y118.602 E-.45963
G1 X137.398 Y118.62 E-.00691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.919 Y126.238 Z17.8 F42000
G1 X136.29 Y136.236 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6723
M204 S5000
G1 X137.79 Y136.236 E.04609
G1 X137.79 Y137.79 E.04775
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.237 Y118.21 E.06228
G1 X120.237 Y119.71 E.04609
G1 X125.347 Y119.71 E.15701
G1 X125.747 Y119.71 E.01229
G1 X125.747 Y119.669 E.00126
G1 F6600
G1 X125.747 Y118.21 E.04483
G1 F6723
G1 X125.821 Y118.21 E.00228
G1 X126.221 Y118.21 E.01229
G1 X129.867 Y118.21 E.11205
G1 X130.267 Y118.21 E.01229
G1 X130.338 Y118.21 E.00218
G1 F6600
G1 X130.338 Y119.669 E.04483
G1 F6723
G1 X130.338 Y119.71 E.00126
G1 X130.738 Y119.71 E.01229
G1 X135.796 Y119.71 E.15542
G1 X135.796 Y118.21 E.04609
G1 X137.79 Y118.21 E.06126
G1 X137.79 Y119.764 E.04775
G1 X136.29 Y119.764 E.04609
G1 X136.29 Y124.518 E.14608
G1 X136.29 Y124.918 E.01229
G1 X136.29 Y125.318 E.01229
G1 F6136.876
G1 X136.331 Y125.318 E.00126
G1 F5700
G1 X137.79 Y125.318 E.04483
G1 F6550.235
G1 X137.79 Y125.396 E.00241
G1 F6723
G1 X137.79 Y125.796 E.01229
G1 X137.79 Y126.196 E.01229
G1 X137.79 Y129.831 E.11167
G1 X137.79 Y130.231 E.01229
G1 X137.79 Y130.631 E.01229
G1 F6553.039
G1 X137.79 Y130.709 E.00242
G1 F5700
G1 X136.331 Y130.709 E.04483
G1 F6136.876
G1 X136.29 Y130.709 E.00126
G1 F6723
G1 X136.29 Y131.109 E.01229
G1 X136.29 Y131.509 E.01229
G1 X136.29 Y136.176 E.1434
; WIPE_START
G1 F12000
M204 S6000
G1 X137.79 Y136.236 E-.57046
G1 X137.79 Y136.735 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.695 Y137.013 Z17.8 F42000
G1 Z17.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.40557
G1 F6723
M204 S6000
G1 X137.194 Y137.013 E.04432
; WIPE_START
G1 F15000
G1 X135.695 Y137.013 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.85 Y129.382 Z17.8 F42000
G1 X136.043 Y119.906 Z17.8
G1 Z17.4
G1 E.8 F1800
; LINE_WIDTH: 0.14453
G1 F6723
M204 S6000
G1 X136.043 Y119.568 E.0028
M204 S10000
G1 X136.392 Y118.987 F42000
; LINE_WIDTH: 0.4058
G1 F6723
M204 S6000
G1 X137.194 Y118.987 E.02373
; WIPE_START
G1 F15000
G1 X136.392 Y118.987 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.79 Y119.665 Z17.8 F42000
G1 X119.994 Y120.45 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6723
M204 S6000
G1 X119.496 Y120.45 E.01651
G1 X119.496 Y119.496 E.03164
G1 X118.95 Y118.95 E.02562
G1 X118.95 Y121.698 E.09114
G1 X120.198 Y120.45 E.05852
G1 X120.45 Y120.45 E.00838
G1 X135.55 Y135.55 E.70834
G1 X135.55 Y135.802 E.00838
G1 X134.302 Y137.05 E.05852
G1 X129.374 Y137.05 E.16349
G1 X118.95 Y126.626 E.48898
G1 X118.95 Y129.374 E.09114
G1 X129.374 Y118.95 E.48898
G1 X126.626 Y118.95 E.09114
G1 X137.05 Y129.374 E.48898
G1 X137.05 Y126.626 E.09114
G1 X126.626 Y137.05 E.48898
G1 X124.998 Y137.05 E.05401
M204 S10000
G1 X118.95 Y132.674 F42000
G1 F6723
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X121.698 Y137.05 E.12889
G1 X118.95 Y137.05 E.09114
G1 X135.55 Y120.45 E.77871
G1 X135.55 Y122.079 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X135.55 Y120.45 E-.61876
G1 X135.287 Y120.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/100
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
M204 S10000
G17
G3 Z17.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z18 F4000
            G39.3 S1
            G0 Z18 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z17.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z17.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z17.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.898 Y136.762
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F10826
M204 S6000
G1 X137.398 Y136.762 E.04976
G1 X137.398 Y137.398 E.02109
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X119.714 Y118.602 E.03688
G1 X119.714 Y120.102 E.04976
G1 X126.024 Y120.102 E.20931
G1 X126.024 Y118.602 E.04976
G1 X130.058 Y118.602 E.13384
G1 X130.058 Y120.102 E.04976
G1 X135.898 Y120.102 E.19371
G1 X135.898 Y125.591 E.18207
G1 X137.398 Y125.591 E.04976
G1 X137.398 Y130.437 E.16076
G1 X135.898 Y130.437 E.04976
G1 X135.898 Y136.702 E.20782
; WIPE_START
G1 F15476.087
G1 X137.398 Y136.762 E-.57046
G1 X137.398 Y137.261 E-.18954
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.941 Y129.642 Z18 F42000
G1 X136.317 Y119.238 Z18
G1 Z17.6
G1 E.8 F1800
G1 F10826
M204 S6000
G1 X136.317 Y118.602 E.02109
G1 X137.398 Y118.602 E.03586
G1 X137.398 Y119.238 E.02109
M73 P85 R3
G1 X136.377 Y119.238 E.03387
; WIPE_START
G1 F15476.087
G1 X136.317 Y118.602 E-.24272
G1 X137.398 Y118.602 E-.41078
G1 X137.398 Y118.882 E-.1065
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.915 Y126.5 Z18 F42000
G1 X136.29 Y136.37 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10826
M204 S5000
G1 X137.79 Y136.37 E.04609
G1 X137.79 Y137.79 E.04363
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X120.106 Y118.21 E.05825
G1 X120.106 Y119.71 E.04609
G1 X125.232 Y119.71 E.1575
G1 X125.632 Y119.71 E.01229
G1 F7069.489
G1 X125.632 Y119.669 E.00126
G1 F6600
G1 X125.632 Y118.21 E.04483
G1 F7460.26
G1 X125.706 Y118.21 E.00228
G1 F10826
G1 X126.106 Y118.21 E.01229
G1 X129.979 Y118.21 E.11903
G1 X130.379 Y118.21 E.01229
G1 F7423.324
G1 X130.45 Y118.21 E.00218
G1 F6600
G1 X130.45 Y119.669 E.04483
G1 F7069.489
G1 X130.45 Y119.71 E.00126
G1 F10826
G1 X130.85 Y119.71 E.01229
G1 X135.925 Y119.71 E.15593
G1 X135.925 Y118.21 E.04609
G1 X137.79 Y118.21 E.05731
G1 X137.79 Y119.63 E.04363
G1 X136.29 Y119.63 E.04609
G1 X136.29 Y124.399 E.14652
G1 X136.29 Y124.799 E.01229
G1 X136.29 Y125.199 E.01229
G1 F6136.876
G1 X136.331 Y125.199 E.00126
G1 F5700
G1 X137.79 Y125.199 E.04483
G1 F6550.235
G1 X137.79 Y125.277 E.00241
G1 F10826
G1 X137.79 Y125.677 E.01229
G1 X137.79 Y126.077 E.01229
G1 X137.79 Y129.95 E.11902
G1 X137.79 Y130.35 E.01229
G1 X137.79 Y130.75 E.01229
G1 F6553.039
G1 X137.79 Y130.829 E.00242
G1 F5700
G1 X136.331 Y130.829 E.04483
G1 F6136.876
G1 X136.29 Y130.829 E.00126
G1 F10826
G1 X136.29 Y131.229 E.01229
G1 X136.29 Y131.629 E.01229
G1 X136.29 Y136.31 E.14383
M204 S10000
G1 X135.695 Y137.08 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.27176
G1 F10826
M204 S6000
G1 X137.194 Y137.08 E.02797
; WIPE_START
G1 F15000
G1 X135.695 Y137.08 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.52 Y134.98 Z18 F42000
G1 Z17.6
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X135.52 Y132.578 E.06653
G1 X135.46 Y132.4 E.00521
G1 X135.46 Y131.489 E.02523
G1 X135.535 Y131.33 E.00487
G1 X135.535 Y131.085 E.00681
; Slow Down End
M204 S10000
G1 X135.978 Y126.023 F42000
G1 F10826
M204 S6000
G1 X135.674 Y126.023 E.00841
G1 X135.525 Y125.934 E.00482
G1 X135.525 Y125.172 E.02109
G1 X135.46 Y125.024 E.00448
G1 X135.46 Y124.54 E.01343
M204 S10000
G1 X135.173 Y122.456 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826
M204 S6000
G1 X135.173 Y120.827 E.05401
G1 X119.327 Y136.673 E.74332
G1 X121.321 Y136.673 E.06612
G1 X119.327 Y134.679 E.0935
G1 X119.327 Y133.051 E.05401
M204 S10000
G1 X118.965 Y134.993 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X118.965 Y132.142 E.07897
; Slow Down End
M204 S10000
G1 X118.965 Y127.344 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X118.965 Y120.687 E.18444
; Slow Down End
M204 S10000
G1 X119.366 Y119.162 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826
M204 S6000
G1 X119.365 Y118.95 E.00702
G1 X118.95 Y118.95 E.01377
G1 X119.366 Y119.365 E.01948
G1 X119.365 Y119.815 E.01493
G3 X119.327 Y119.752 I-.001 J-.043 E.00298
G1 X118.95 Y120.129 E.01769
G1 X118.95 Y119.57 E.01855
; WIPE_START
G1 F15476.087
G1 X118.95 Y120.129 E-.21246
G1 X119.327 Y119.752 E-.20269
G1 X119.365 Y119.815 E-.02819
G1 X119.366 Y119.365 E-.17099
G1 X119.094 Y119.094 E-.14568
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.667 Y120.05 Z18 F42000
G1 X129.954 Y120.465 Z18
G1 Z17.6
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G2 X130.635 Y120.54 I.913 J-5.165 E.01899
G1 X135.376 Y120.54 E.13135
G1 X135.525 Y120.624 E.00475
G1 X135.525 Y123.754 E.08672
; Slow Down End
M204 S10000
G1 X126.386 Y119.387 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X126.465 Y119.088 E.00858
G1 X126.546 Y118.965 E.00407
G1 X129.536 Y118.965 E.08286
G1 X129.695 Y119.324 E.01089
; Slow Down End
M204 S10000
G1 X126.131 Y120.465 F42000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X125.447 Y120.54 E.01907
G1 X120.786 Y120.54 E.12913
G1 X120.637 Y120.474 E.00452
G1 X119.655 Y120.466 E.02719
G1 X119.354 Y120.347 E.00899
G1 X119.353 Y120.301 E.00127
; Slow Down End
; WIPE_START
G1 X119.354 Y120.347 E-.01736
G1 X119.655 Y120.466 E-.12327
G1 X120.637 Y120.474 E-.37297
G1 X120.786 Y120.54 E-.06203
G1 X121.271 Y120.54 E-.18438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.861 Y119.734 Z18 F42000
G1 X136.52 Y118.92 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.27176
G1 F10826
M204 S6000
G1 X137.194 Y118.92 E.01257
; WIPE_START
G1 F15000
G1 X136.52 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.242 Y126.445 Z18 F42000
G1 X133.442 Y137.035 Z18
G1 Z17.6
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X128.908 Y137.035 E.12562
; Slow Down End
M204 S10000
G1 X127.333 Y137.035 F42000
; Slow Down Start
; LINE_WIDTH: 0.384986
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X119.068 Y137.035 E.23036
G1 X118.978 Y137.022 E.00255
G1 X118.938 Y136.899 E.00362
G1 X118.957 Y136.688 E.00589
; Slow Down End
M204 S10000
G1 X125.375 Y136.673 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10826
M204 S6000
G1 X127.003 Y136.673 E.05401
G1 X137.05 Y126.626 E.4713
G1 X137.05 Y129.374 E.09114
G1 X127.003 Y119.327 E.47129
G1 X128.997 Y119.327 E.06612
G1 X118.95 Y129.374 E.47129
G1 X118.95 Y127.714 E.05506
G1 X119.327 Y127.653 E.01267
G1 X119.327 Y127.003 E.02156
G1 X128.997 Y136.673 E.4536
G1 X134.318 Y136.673 E.17652
G1 X133.941 Y137.05 E.01769
G1 X134.302 Y137.05 E.01199
G1 X135.55 Y135.802 E.05852
G1 X135.55 Y135.55 E.00838
G1 X135.495 Y135.495 E.00255
G1 X135.173 Y135.818 E.01514
G1 X135.173 Y135.173 E.02141
G1 X120.827 Y120.827 E.67295
G1 X119.821 Y120.827 E.0334
G1 X119.327 Y121.321 E.02313
G1 X119.327 Y122.949 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15476.087
G1 X119.327 Y121.321 E-.61876
G1 X119.59 Y121.058 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/100
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
M106 S193.8
M204 S10000
G17
G3 Z18 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.2
G1 X0 Y128 F18000 ; move to safe pos
M106 S255
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z18.2 F4000
            G39.3 S1
            G0 Z18.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z18.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z17.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z17.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y136.793
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X137.398 Y137.398 E.02006
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X118.933 Y118.602 E.01099
G1 X119.333 Y118.602 E.01327
G1 F9575.02
G1 X119.733 Y118.602 E.01327
G1 F4919.51
G1 X120.133 Y118.602 E.01327
G1 F1800
G1 X120.516 Y118.602 E.01269
M106 S193.8
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S5000
G1 X125.222 Y118.602 E.1561
M106 S193.8
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X125.604 Y118.602 E.01269
M106 S193.8
M106 S255
G1 F4919.51
G1 X126.004 Y118.602 E.01327
G1 F9575.02
G1 X126.404 Y118.602 E.01327
G1 F15476.087
G1 X126.804 Y118.602 E.01327
G1 X129.278 Y118.602 E.08206
G1 X129.678 Y118.602 E.01327
G1 F9575.02
G1 X130.078 Y118.602 E.01327
G1 F4919.51
G1 X130.478 Y118.602 E.01327
G1 F1800
G1 X130.86 Y118.602 E.01269
M106 S193.8
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S5000
G1 X135.515 Y118.602 E.1544
M106 S193.8
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X135.897 Y118.602 E.01269
M106 S193.8
M106 S255
G1 F4919.51
G1 X136.297 Y118.602 E.01327
G1 F9575.02
G1 X136.697 Y118.602 E.01327
G1 F15476.087
G1 X137.097 Y118.602 E.01327
G1 X137.398 Y118.602 E.00997
G1 F13352.312
G1 X137.398 Y118.858 E.00847
G1 F9575.02
G1 X137.398 Y119.258 E.01327
G1 F4919.51
G1 X137.398 Y119.658 E.01327
G1 F1800
G1 X137.398 Y120.04 E.01269
M106 S193.8
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S5000
G1 X137.398 Y124.789 E.15752
M106 S193.8
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X137.398 Y125.171 E.01269
M106 S193.8
M106 S255
G1 F4919.51
G1 X137.398 Y125.571 E.01327
G1 F9575.02
G1 X137.398 Y125.971 E.01327
G1 F15476.087
G1 X137.398 Y126.371 E.01327
G1 X137.398 Y129.657 E.10898
G1 X137.398 Y130.057 E.01327
G1 F9575.02
G1 X137.398 Y130.457 E.01327
G1 F4919.51
G1 X137.398 Y130.857 E.01327
G1 F1800
G1 X137.398 Y131.239 E.01269
M106 S193.8
M106 S255
; FEATURE: Overhang wall
G1 F3000
M204 S5000
G1 X137.398 Y135.96 E.1566
M106 S193.8
M106 S255
; FEATURE: Inner wall
G1 F1800
M204 S6000
G1 X137.398 Y136.342 E.01269
M106 S193.8
M106 S255
G1 F4829.252
G1 X137.398 Y136.733 E.01296
M204 S250
G1 X137.79 Y136.793 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X137.79 Y137.79 E.03063
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X118.947 Y118.21 E.02264
G1 X119.347 Y118.21 E.01229
G1 F9575.02
G1 X119.747 Y118.21 E.01229
G1 F4919.51
G1 X120.147 Y118.21 E.01229
G1 F1800
G1 X120.516 Y118.21 E.01134
M106 S193.8
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X125.222 Y118.21 E.1561
M106 S193.8
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X125.591 Y118.21 E.01134
M106 S193.8
M106 S255
G1 F4919.51
G1 X125.991 Y118.21 E.01229
G1 F9575.02
G1 X126.391 Y118.21 E.01229
G1 F12000
G1 X126.791 Y118.21 E.01229
G1 X129.291 Y118.21 E.07684
G1 X129.691 Y118.21 E.01229
G1 F9575.02
G1 X130.091 Y118.21 E.01229
G1 F4919.51
G1 X130.491 Y118.21 E.01229
G1 F1800
G1 X130.86 Y118.21 E.01134
M106 S193.8
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X135.515 Y118.21 E.1544
M106 S193.8
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X135.884 Y118.21 E.01134
M106 S193.8
M106 S255
G1 F4919.51
G1 X136.284 Y118.21 E.01229
G1 F9575.02
G1 X136.684 Y118.21 E.01229
G1 F12000
G1 X137.084 Y118.21 E.01229
G1 X137.79 Y118.21 E.0217
G1 X137.79 Y118.471 E.00802
G1 X137.79 Y118.871 E.01229
G1 F9575.02
G1 X137.79 Y119.271 E.01229
G1 F4919.51
G1 X137.79 Y119.671 E.01229
G1 F1800
G1 X137.79 Y120.04 E.01134
M106 S193.8
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X137.79 Y124.789 E.15752
M106 S193.8
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X137.79 Y125.158 E.01134
M106 S193.8
M106 S255
G1 F4919.51
G1 X137.79 Y125.558 E.01229
G1 F9575.02
G1 X137.79 Y125.958 E.01229
G1 F12000
G1 X137.79 Y126.358 E.01229
G1 X137.79 Y129.67 E.10178
G1 X137.79 Y130.07 E.01229
G1 F9575.02
G1 X137.79 Y130.47 E.01229
G1 F4919.51
G1 X137.79 Y130.87 E.01229
G1 F1800
G1 X137.79 Y131.239 E.01134
M106 S193.8
M106 S255
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X137.79 Y135.96 E.1566
M106 S193.8
M106 S255
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X137.79 Y136.329 E.01134
M106 S193.8
M106 S255
G1 F4960.121
G1 X137.79 Y136.733 E.01242
M204 S10000
G1 X137.04 Y137.234 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.46891
G1 F3000
M204 S6000
G1 X137.04 Y130.282 E.24134
M73 P86 R3
G1 X136.614 Y130.282 E.01479
G1 X136.614 Y137.065 E.23545
G1 X136.188 Y137.065 E.01479
G1 X136.188 Y131.623 E.18888
G1 X135.762 Y131.66 E.01484
G1 X135.762 Y137.234 E.19351
M106 S193.8
M106 S255
M204 S10000
G1 X134.015 Y136.984 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.46335
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X134.436 Y136.564 E.02037
G1 X134.953 Y136.564 E.01771
G1 X135.125 Y136.984 E.01556
G1 X134.075 Y136.984 E.03595
; Slow Down End
M204 S10000
G1 X133.152 Y137.231 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40218
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X135.438 Y134.944 E.16735
G1 X135.438 Y134.305 E.0331
G1 X132.715 Y137.028 E.19934
G1 X132.075 Y137.028 E.0331
G1 X135.438 Y133.665 E.24615
G1 X135.438 Y133.026 E.0331
G1 X131.436 Y137.028 E.29296
G1 X130.796 Y137.028 E.0331
G1 X135.325 Y132.499 E.33151
G1 X135.005 Y132.18 E.0234
G1 X130.157 Y137.028 E.35491
G1 X129.517 Y137.028 E.0331
G1 X134.686 Y131.86 E.37831
G1 X134.366 Y131.54 E.0234
G1 X128.913 Y136.993 E.39917
G1 X128.886 Y136.381 E.03174
G1 X134.046 Y131.22 E.37773
G1 X133.726 Y130.901 E.0234
G1 X128.155 Y136.472 E.40781
G1 X127.218 Y137.028 E.05644
G1 X126.96 Y137.028 E.01335
G1 X133.407 Y130.581 E.47193
G1 X133.087 Y130.261 E.0234
G1 X126.32 Y137.028 E.49534
G1 X125.681 Y137.028 E.0331
G1 X132.767 Y129.941 E.51874
G1 X132.448 Y129.622 E.0234
G1 X125.041 Y137.028 E.54215
G1 X124.402 Y137.028 E.0331
G1 X132.128 Y129.302 E.56555
G1 X131.808 Y128.982 E.0234
G1 X123.762 Y137.028 E.58896
G1 X123.123 Y137.028 E.0331
G1 X131.488 Y128.663 E.61236
G1 X131.169 Y128.343 E.0234
G1 X127.864 Y131.647 E.24188
M106 S193.8
M106 S255
M204 S10000
G1 X127.739 Y131.772 F42000
G1 F3000
M204 S6000
G1 X122.281 Y137.231 E.39957
M106 S193.8
M106 S255
M204 S10000
G1 X121.641 Y137.231 F42000
G1 F3000
M204 S6000
G1 X130.849 Y128.023 E.67399
G1 X130.529 Y127.703 E.0234
G1 X121.204 Y137.028 E.68257
G1 X120.565 Y137.028 E.0331
G1 X130.209 Y127.384 E.70598
G1 X129.89 Y127.064 E.0234
G1 X119.925 Y137.028 E.72938
G1 X119.286 Y137.028 E.0331
G1 X129.57 Y126.744 E.75279
G1 X129.25 Y126.424 E.0234
G1 X119.038 Y136.636 E.7475
G1 X120.1 Y134.935 E.10381
G1 X128.93 Y126.105 E.64636
G1 X128.611 Y125.785 E.0234
G1 X119.551 Y134.845 E.66319
G1 X118.972 Y134.925 E.03024
G1 X118.972 Y134.784 E.00729
G1 X128.291 Y125.465 E.68215
G1 X127.971 Y125.145 E.0234
G1 X118.972 Y134.145 E.65875
G1 X118.972 Y133.505 E.0331
G1 X127.651 Y124.826 E.63534
G1 X127.332 Y124.506 E.0234
G1 X118.972 Y132.866 E.61194
G1 X118.972 Y132.226 E.0331
G1 X127.012 Y124.186 E.58853
G1 X126.692 Y123.866 E.0234
G1 X121.318 Y129.241 E.39342
G1 X120.998 Y128.921 E.0234
G1 X126.372 Y123.547 E.39342
G1 X126.053 Y123.227 E.0234
G1 X120.678 Y128.602 E.39342
G1 X120.358 Y128.282 E.0234
G1 X125.733 Y122.907 E.39342
G1 X125.413 Y122.587 E.0234
G1 X120.039 Y127.962 E.39342
G1 X119.719 Y127.642 E.0234
G1 X128.389 Y118.972 E.63468
G1 X129.029 Y118.972 E.0331
G1 X128.118 Y119.883 E.06667
G1 X128.438 Y120.202 E.0234
G1 X129.479 Y119.161 E.07624
G1 X129.791 Y119.489 E.02341
G1 X128.758 Y120.522 E.07561
G1 X129.077 Y120.842 E.0234
G1 X129.947 Y119.972 E.06368
G1 X129.947 Y120.555 E.03016
G1 X129.995 Y120.564 E.0025
G1 X129.397 Y121.161 E.04373
G1 X129.717 Y121.481 E.0234
G1 X130.54 Y120.672 E.05971
G2 X131.157 Y120.681 I.351 J-3.11 E.032
G1 X130.037 Y121.801 E.082
G1 X130.356 Y122.121 E.0234
G1 X131.796 Y120.681 E.1054
G1 X132.436 Y120.681 E.0331
G1 X130.676 Y122.44 E.1288
G1 X130.996 Y122.76 E.0234
G1 X133.075 Y120.681 E.15221
G1 X133.715 Y120.681 E.0331
G1 X131.316 Y123.08 E.17561
G1 X131.635 Y123.4 E.0234
G1 X134.354 Y120.681 E.19902
G1 X134.994 Y120.681 E.0331
G1 X133.546 Y122.128 E.10596
G1 X133.866 Y122.448 E.0234
G1 X135.449 Y120.865 E.11589
G1 X135.449 Y121.504 E.0331
G1 X134.186 Y122.768 E.09248
G1 X134.505 Y123.088 E.0234
G1 X135.449 Y122.144 E.06908
G1 X135.449 Y122.783 E.0331
G1 X134.825 Y123.407 E.04568
G1 X135.145 Y123.727 E.0234
G1 X135.652 Y123.22 E.03709
M106 S193.8
M106 S255
M204 S10000
G1 X135.522 Y124.754 F42000
; LINE_WIDTH: 0.41876
G1 F3000
M204 S6000
G1 X133.117 Y122.349 E.19084
M106 S193.8
M106 S255
M204 S10000
G1 X135.652 Y125.547 F42000
G1 F3000
M204 S6000
G1 X132.929 Y122.824 E.21609
G1 X132.597 Y123.155 E.0263
G1 X136.332 Y126.891 E.29643
G1 X136.593 Y127.331 E.0287
G1 X136.351 Y127.572 E.01915
G1 X132.266 Y123.487 E.32423
G1 X131.934 Y123.818 E.0263
G1 X136.02 Y127.904 E.32423
G1 X135.688 Y128.235 E.0263
G1 X127.765 Y120.312 E.62881
G1 X127.433 Y120.643 E.0263
G1 X135.357 Y128.567 E.62881
G1 X135.025 Y128.898 E.0263
G1 X127.102 Y120.975 E.62881
G1 X126.77 Y121.306 E.0263
G1 X134.694 Y129.23 E.62881
G1 X134.363 Y129.561 E.0263
G1 X126.439 Y121.637 E.62881
G1 X126.107 Y121.969 E.02631
G1 X135.413 Y131.274 E.73847
G1 X135.319 Y131.282 E.00528
G1 X135.319 Y131.844 E.03149
G1 X125.633 Y122.157 E.7687
M106 S193.8
M106 S255
M204 S10000
G1 X125.894 Y120.242 F42000
; LINE_WIDTH: 0.47014
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S6000
G1 X120.974 Y120.242 E.17125
G1 X120.974 Y120.137 E.00365
G1 X119.903 Y120.137 E.03731
G1 X119.678 Y120.01 E.00898
G1 X119.678 Y119.815 E.0068
G1 X125.724 Y119.815 E.21047
G1 X125.724 Y119.474 E.01185
G1 X125.811 Y119.388 E.00427
G1 X119.652 Y119.388 E.21439
G2 X119.567 Y119.264 I-.191 J.041 E.00536
G1 X119.567 Y118.96 E.01058
G1 X126.358 Y118.96 E.23643
M106 S193.8
M106 S255
M204 S10000
G1 X129.893 Y119.247 F42000
; LINE_WIDTH: 0.42035
G1 F3000
M204 S6000
G1 X129.893 Y118.935 E.00958
G1 X130.271 Y118.935 E.01161
G1 X130.271 Y119.384 E.01381
G1 X130.361 Y119.474 E.00393
G1 X130.361 Y120.215 E.02278
G2 X130.644 Y120.267 I.407 J-1.422 E.00888
G1 X130.648 Y118.935 E.04096
G1 X131.026 Y118.935 E.01161
G1 X131.026 Y120.267 E.04096
G1 X131.403 Y120.267 E.01161
G1 X131.403 Y118.935 E.04096
G1 X131.78 Y118.935 E.01161
G1 X131.78 Y120.267 E.04096
G1 X132.158 Y120.267 E.01161
G1 X132.158 Y118.935 E.04096
G1 X132.535 Y118.935 E.01161
G1 X132.535 Y120.267 E.04096
G1 X132.913 Y120.267 E.01161
G1 X132.913 Y118.935 E.04096
G1 X133.29 Y118.935 E.01161
G1 X133.29 Y120.267 E.04096
G1 X133.668 Y120.267 E.01161
G1 X133.668 Y118.935 E.04096
G1 X134.045 Y118.935 E.01161
G1 X134.045 Y120.267 E.04096
G1 X134.422 Y120.267 E.01161
G1 X134.422 Y118.935 E.04096
G1 X134.8 Y118.935 E.01161
G1 X134.8 Y120.267 E.04096
G1 X135.099 Y120.267 E.00921
G1 X135.177 Y120.189 E.0034
G1 X135.177 Y118.935 E.03856
G1 X135.555 Y118.935 E.01161
G1 X135.555 Y120.137 E.03697
G1 X135.659 Y120.137 E.00322
G1 X135.862 Y120.34 E.00883
G3 X135.863 Y123.884 I-456.863 J1.807 E.10898
G1 X135.863 Y124.562 E.02086
G1 X135.733 Y124.692 E.00564
G1 X135.733 Y124.836 E.00444
G1 X135.863 Y124.836 E.00399
G1 X135.863 Y125.734 E.02762
G1 X135.932 Y125.745 E.00216
G1 X135.932 Y118.935 E.20945
G1 X136.31 Y118.935 E.01161
G1 X136.31 Y125.745 E.20945
G1 X136.687 Y125.745 E.01161
G1 X136.687 Y118.935 E.20945
G1 X137.064 Y118.935 E.01161
M73 P86 R2
G1 X137.064 Y125.915 E.21467
M106 S193.8
M106 S255
M204 S10000
G1 X137.05 Y126.26 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X137.05 Y126.138 E.00407
G1 X136.386 Y126.138 E.02203
G1 X136.814 Y126.862 E.02792
G1 X137.05 Y126.626 E.01107
G1 X137.05 Y127.262 E.02109
G1 X136.917 Y127.038 E.00865
M204 S10000
G1 X135.937 Y129.89 F42000
G1 F15476.087
M204 S6000
G1 X137.05 Y129.89 E.0369
G1 X137.05 Y129.374 E.01711
G1 X136.103 Y128.427 E.04442
G1 X134.951 Y129.578 E.05401
M204 S10000
G1 X136.188 Y130.112 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.46891
G1 F3000
M204 S6000
G1 X136.188 Y131.426 E.04561
M106 S193.8
M106 S255
M204 S10000
G1 X128.473 Y136.913 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60488
G1 F11210.763
M204 S6000
G3 X128.378 Y136.853 I-.066 J-.002 E.0127
M204 S10000
G1 X118.95 Y129.374 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X119.897 Y128.427 E.04442
M204 S10000
G1 X119.256 Y127.466 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40218
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X127.75 Y118.972 E.62176
G1 X127.111 Y118.972 E.0331
G1 X126.138 Y119.945 E.07122
G1 X126.138 Y120.554 E.03156
G1 X125.541 Y120.673 E.03148
G3 X125.402 Y120.681 I-.111 J-.706 E.00724
G1 X118.972 Y127.111 E.47065
G1 X118.972 Y126.471 E.0331
G1 X124.762 Y120.681 E.42384
G1 X124.123 Y120.681 E.0331
G1 X118.972 Y125.832 E.37703
G1 X118.972 Y125.192 E.0331
G1 X123.483 Y120.681 E.33022
G1 X122.844 Y120.681 E.0331
G1 X118.972 Y124.553 E.28341
G1 X118.972 Y123.913 E.0331
G1 X122.204 Y120.681 E.2366
G1 X121.565 Y120.681 E.0331
G1 X118.972 Y123.274 E.18979
G1 X118.972 Y122.634 E.0331
G1 X120.925 Y120.681 E.14299
G1 X120.561 Y120.681 E.01886
G1 X120.561 Y120.551 E.00672
G1 X120.416 Y120.551 E.00752
G1 X118.972 Y121.995 E.10568
G1 X118.972 Y121.355 E.0331
G1 X119.782 Y120.545 E.05934
G1 X119.374 Y120.313 E.02428
G1 X118.769 Y120.918 E.04429
M106 S193.8
M204 S10000
G1 X119.175 Y119.175 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
M73 P87 R2
G1 F15476.087
M204 S6000
G1 X118.95 Y118.95 E.01054
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X119.175 Y119.175 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/100
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
M106 S201.45
M204 S10000
G17
G3 Z18.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z18.4 F4000
            G39.3 S1
            G0 Z18.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z18.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z18
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z18
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.471 Y137.234 Z18.4 F42000
G1 Z18
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42079
G1 F15000
M204 S6000
G1 X137.065 Y136.64 E.02588
G1 X137.065 Y136.106 E.01645
G1 X136.106 Y137.065 E.04176
G1 X135.571 Y137.065 E.01645
G1 X137.065 Y135.571 E.06503
G1 X137.065 Y135.037 E.01645
G1 X135.037 Y137.065 E.0883
G1 X134.503 Y137.065 E.01645
G1 X137.065 Y134.503 E.11157
G1 X137.065 Y133.968 E.01645
G1 X133.968 Y137.065 E.13484
G1 X133.434 Y137.065 E.01645
G1 X137.065 Y133.434 E.15811
G1 X137.065 Y132.899 E.01645
G1 X132.899 Y137.065 E.18138
G1 X132.365 Y137.065 E.01645
G1 X137.065 Y132.365 E.20465
G1 X137.065 Y131.831 E.01645
G1 X131.831 Y137.065 E.22792
G1 X131.296 Y137.065 E.01645
G1 X137.065 Y131.296 E.25119
G1 X137.065 Y130.762 E.01645
G1 X130.762 Y137.065 E.27446
G1 X130.228 Y137.065 E.01645
G1 X136.891 Y130.401 E.29016
G1 X136.356 Y130.401 E.01645
G1 X135.862 Y130.895 E.02151
G1 X135.862 Y131.364 E.01441
G1 X135.428 Y131.538 E.01443
G1 X135.326 Y131.432 E.00453
G1 X129.693 Y137.065 E.24528
G1 X129.159 Y137.065 E.01645
G1 X135.064 Y131.159 E.25716
G1 X134.803 Y130.887 E.01164
G1 X128.624 Y137.065 E.26903
G1 X128.09 Y137.065 E.01645
G1 X134.541 Y130.614 E.28091
G1 X134.279 Y130.341 E.01164
G1 X127.556 Y137.065 E.29279
G1 X127.021 Y137.065 E.01645
G1 X134.018 Y130.068 E.30467
G1 X133.756 Y129.796 E.01164
G1 X126.487 Y137.065 E.31654
G1 X125.952 Y137.065 E.01645
G1 X133.494 Y129.523 E.32842
G1 X133.233 Y129.25 E.01164
G1 X125.418 Y137.065 E.3403
G1 X124.884 Y137.065 E.01645
G1 X132.971 Y128.977 E.35218
G1 X132.71 Y128.704 E.01164
G1 X124.349 Y137.065 E.36406
G1 X123.815 Y137.065 E.01645
G1 X132.448 Y128.432 E.37593
G1 X132.186 Y128.159 E.01164
G1 X123.28 Y137.065 E.38781
G1 X122.746 Y137.065 E.01645
G1 X131.925 Y127.886 E.39969
G1 X131.663 Y127.613 E.01164
G1 X122.212 Y137.065 E.41157
G1 X121.677 Y137.065 E.01645
G1 X131.401 Y127.341 E.42345
G1 X131.14 Y127.068 E.01164
G1 X121.143 Y137.065 E.43532
G1 X120.609 Y137.065 E.01645
G1 X130.878 Y126.795 E.4472
G1 X130.617 Y126.522 E.01164
G1 X120.375 Y136.764 E.44596
G1 X120.375 Y136.736 E.00086
G1 X120.526 Y136.585 E.00656
G1 X120.579 Y136.458 E.00425
G1 X120.579 Y136.026 E.0133
G1 X125.42 Y131.184 E.21083
G1 X124.886 Y131.184 E.01645
G1 X120.579 Y135.491 E.18756
G1 X120.579 Y134.957 E.01645
G1 X124.352 Y131.184 E.16429
G1 X123.817 Y131.184 E.01645
G1 X120.579 Y134.423 E.14102
G1 X120.579 Y133.888 E.01645
G1 X123.283 Y131.184 E.11775
G1 X122.748 Y131.184 E.01645
G1 X120.579 Y133.354 E.09448
G1 X120.579 Y132.819 E.01645
G1 X122.214 Y131.184 E.07121
G1 X121.68 Y131.184 E.01645
G1 X120.579 Y132.285 E.04794
G1 X120.579 Y131.751 E.01645
G1 X121.145 Y131.184 E.02467
G1 X120.611 Y131.184 E.01645
G1 X120.409 Y131.386 E.00879
M204 S10000
G1 X118.95 Y135.421 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X118.95 Y137.05 E.05401
G1 X120.187 Y135.813 E.058
G1 X120.187 Y135.539 E.00912
G1 X118.95 Y134.302 E.058
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X124.325 Y129.373 F42000
G1 F15476.087
M204 S6000
G1 X125.452 Y130.548 E.05401
G1 X125.208 Y130.792 E.01144
G1 X123.116 Y130.792 E.06939
G1 X118.95 Y126.626 E.19542
G1 X118.95 Y129.374 E.09114
G1 X121.694 Y126.63 E.12871
G1 X120.567 Y125.455 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F15476.087
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X119.378 Y121.27 E.02008
G1 X119.378 Y120.381 E.02949
G1 X119.286 Y120.289 E.00432
G1 X119.286 Y119.538 E.0249
G3 X119.175 Y119.175 I.126 J-.237 E.014
G1 X118.95 Y118.95 E.01053
G1 X118.95 Y120.579 E.05401
M204 S10000
G1 X120.204 Y118.766 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42079
G1 F15000
M204 S6000
G1 X119.632 Y119.338 E.02493
G1 X119.678 Y119.45 E.00374
G1 X119.678 Y119.826 E.01156
G1 X120.569 Y118.935 E.03878
G1 X121.103 Y118.935 E.01645
G1 X119.763 Y120.275 E.05836
G1 X119.77 Y120.802 E.01623
G1 X121.638 Y118.935 E.08131
G1 X122.172 Y118.935 E.01645
G1 X119.77 Y121.337 E.10458
G1 X119.77 Y121.871 E.01645
G1 X122.706 Y118.935 E.12785
G1 X123.241 Y118.935 E.01645
G1 X119.77 Y122.406 E.15112
G1 X119.77 Y122.94 E.01645
G1 X123.775 Y118.935 E.17439
G1 X124.31 Y118.935 E.01645
G1 X119.77 Y123.474 E.19766
G1 X119.77 Y124.009 E.01645
G1 X124.844 Y118.935 E.22093
G1 X125.378 Y118.935 E.01645
G1 X120.008 Y124.306 E.23386
G1 X120.27 Y124.578 E.01164
G1 X125.913 Y118.935 E.24574
G1 X126.447 Y118.935 E.01645
G1 X120.531 Y124.851 E.25762
G1 X120.793 Y125.124 E.01164
G1 X126.982 Y118.935 E.2695
G1 X127.516 Y118.935 E.01645
G1 X121.054 Y125.397 E.28137
G1 X121.316 Y125.669 E.01164
G1 X128.05 Y118.935 E.29325
G1 X128.585 Y118.935 E.01646
G1 X121.578 Y125.942 E.30513
G1 X121.839 Y126.215 E.01164
G1 X129.119 Y118.935 E.31701
G1 X129.653 Y118.935 E.01645
G1 X122.101 Y126.488 E.32888
G1 X122.363 Y126.761 E.01164
G1 X130.188 Y118.935 E.34076
G1 X130.722 Y118.935 E.01645
G1 X122.624 Y127.033 E.35264
G1 X122.886 Y127.306 E.01164
G1 X131.257 Y118.935 E.36452
G1 X131.791 Y118.935 E.01645
G1 X123.147 Y127.579 E.37639
G1 X123.409 Y127.852 E.01164
G1 X132.325 Y118.935 E.38827
G1 X132.86 Y118.935 E.01645
G1 X123.671 Y128.124 E.40015
G1 X123.932 Y128.397 E.01164
G1 X133.394 Y118.935 E.41203
G1 X133.929 Y118.935 E.01645
G1 X124.194 Y128.67 E.42391
G1 X124.456 Y128.943 E.01164
G1 X134.463 Y118.935 E.43578
G1 X134.997 Y118.935 E.01645
G1 X124.717 Y129.215 E.44766
G1 X124.979 Y129.488 E.01164
G1 X135.532 Y118.935 E.45954
G1 X136.066 Y118.935 E.01645
G1 X130.165 Y124.836 E.25697
G1 X130.699 Y124.836 E.01645
G1 X136.601 Y118.935 E.25697
G1 X137.065 Y118.935 E.0143
G1 X137.065 Y119.005 E.00216
G1 X131.234 Y124.836 E.25391
G1 X131.768 Y124.836 E.01645
G1 X137.065 Y119.54 E.23064
G1 X137.065 Y120.074 E.01645
G1 X132.303 Y124.836 E.20737
G1 X132.837 Y124.836 E.01645
M73 P88 R2
G1 X137.065 Y120.609 E.1841
G1 X137.065 Y121.143 E.01645
G1 X133.371 Y124.836 E.16083
G1 X133.906 Y124.836 E.01645
G1 X137.065 Y121.677 E.13756
G1 X137.065 Y122.212 E.01645
G1 X134.44 Y124.836 E.11429
G1 X134.975 Y124.836 E.01645
G1 X137.065 Y122.746 E.09102
G1 X137.065 Y123.28 E.01645
G1 X135.509 Y124.836 E.06775
G1 X135.659 Y124.836 E.00463
G1 X135.851 Y125.028 E.00836
G1 X137.065 Y123.815 E.05284
G1 X137.065 Y124.349 E.01645
G1 X135.862 Y125.552 E.05236
G1 X135.874 Y125.626 E.00232
G1 X136.322 Y125.626 E.01381
G1 X137.065 Y124.884 E.03233
G1 X137.065 Y125.418 E.01645
G1 X136.687 Y125.796 E.01645
M204 S10000
G1 X131.463 Y126.839 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X130.336 Y125.664 E.05401
G1 X130.772 Y125.228 E.02042
G1 X132.904 Y125.228 E.07075
G1 X137.05 Y129.374 E.19446
G1 X137.05 Y126.626 E.09114
G1 X134.094 Y129.582 E.13864
G1 X132.967 Y128.407 E.05401
M204 S10000
G1 X125.905 Y130.699 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42079
G1 F15000
M204 S6000
G1 X130.355 Y126.25 E.19376
G1 X130.093 Y125.977 E.01164
G1 X125.764 Y130.306 E.18854
G1 X125.502 Y130.034 E.01164
G1 X129.832 Y125.704 E.18854
G1 X129.57 Y125.431 E.01164
G1 X125.12 Y129.881 E.19377
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X126.535 Y128.467 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/100
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
M204 S10000
G17
G3 Z18.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z18.6 F4000
            G39.3 S1
            G0 Z18.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z18.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z18.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z18.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.234 Y133.532 Z18.6 F42000
G1 Z18.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42358
G1 F15000
M204 S6000
G1 X122.637 Y118.935 E.64033
G1 X122.099 Y118.935 E.0167
G1 X137.065 Y133.901 E.6565
G1 X137.065 Y134.439 E.0167
G1 X121.561 Y118.935 E.68012
G1 X121.022 Y118.935 E.0167
G1 X137.065 Y134.978 E.70373
G1 X137.065 Y135.516 E.0167
G1 X120.484 Y118.935 E.72735
G1 X119.946 Y118.935 E.0167
G1 X137.065 Y136.054 E.75096
G1 X137.065 Y136.593 E.0167
G1 X119.567 Y119.095 E.76757
G1 X119.567 Y119.264 E.00525
G1 X119.718 Y119.415 E.00661
G1 X119.771 Y119.542 E.00428
G1 X119.771 Y119.837 E.00913
G1 X136.998 Y137.065 E.75575
G1 X136.46 Y137.065 E.0167
G1 X119.771 Y120.375 E.73213
G1 X119.771 Y120.913 E.0167
G1 X135.922 Y137.065 E.70852
G1 X135.383 Y137.065 E.0167
G1 X119.771 Y121.452 E.6849
G1 X119.771 Y121.99 E.0167
G1 X134.845 Y137.065 E.66128
G1 X134.307 Y137.065 E.0167
G1 X119.771 Y122.528 E.63767
G1 X119.771 Y123.067 E.0167
G1 X133.768 Y137.065 E.61405
G1 X133.23 Y137.065 E.0167
G1 X119.771 Y123.605 E.59044
G1 X119.773 Y124.061 E.01414
G1 X121.775 Y126.148 E.0897
G1 X132.692 Y137.065 E.47889
G1 X132.153 Y137.065 E.0167
G1 X126.097 Y131.008 E.2657
G1 X126.021 Y131.184 E.00595
G1 X125.735 Y131.184 E.00889
G1 X131.615 Y137.065 E.25796
G1 X131.077 Y137.065 E.0167
G1 X125.196 Y131.184 E.25796
G1 X124.658 Y131.184 E.0167
G1 X130.538 Y137.065 E.25796
G1 X130 Y137.065 E.0167
G1 X124.12 Y131.184 E.25796
G1 X123.581 Y131.184 E.0167
G1 X129.462 Y137.065 E.25796
G1 X128.923 Y137.065 E.0167
G1 X123.043 Y131.184 E.25796
G1 X122.505 Y131.184 E.0167
G1 X128.385 Y137.065 E.25796
G1 X127.847 Y137.065 E.0167
G1 X121.966 Y131.184 E.25796
G1 X121.428 Y131.184 E.0167
G1 X127.308 Y137.065 E.25796
G1 X126.77 Y137.065 E.0167
G1 X120.89 Y131.184 E.25796
G1 X120.59 Y131.184 E.00929
G1 X120.579 Y131.412 E.00707
G1 X126.232 Y137.065 E.24798
G1 X125.693 Y137.065 E.0167
G1 X120.579 Y131.95 E.22436
G1 X120.579 Y132.488 E.0167
G1 X125.155 Y137.065 E.20075
G1 X124.617 Y137.065 E.0167
G1 X120.579 Y133.027 E.17713
G1 X120.579 Y133.565 E.0167
G1 X124.078 Y137.065 E.15352
G1 X123.54 Y137.065 E.0167
G1 X120.579 Y134.103 E.1299
G1 X120.579 Y134.642 E.0167
G1 X123.002 Y137.065 E.10629
G1 X122.463 Y137.065 E.0167
G1 X120.579 Y135.18 E.08267
G1 X120.579 Y135.718 E.0167
G1 X121.925 Y137.065 E.05906
G1 X121.387 Y137.065 E.0167
G1 X120.579 Y136.257 E.03544
G3 X120.447 Y136.664 I-.408 J.093 E.01392
G1 X121.018 Y137.234 E.02503
M204 S10000
G1 X118.95 Y132.674 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X120.187 Y135.539 E.058
G1 X120.187 Y135.813 E.00911
G1 X118.95 Y137.05 E.058
G1 X118.95 Y135.421 E.05401
M204 S10000
G1 X120.567 Y125.455 F42000
G1 F15476.087
M204 S6000
G1 X121.694 Y126.63 E.05401
G1 X118.95 Y129.374 E.12871
G1 X118.95 Y126.626 E.09114
G1 X123.116 Y130.792 E.19543
G1 X125.208 Y130.792 E.06939
G1 X125.452 Y130.548 E.01145
G1 X124.325 Y129.373 E.05401
M204 S10000
G1 X118.95 Y120.579 F42000
G1 F15476.087
M204 S6000
G1 X118.95 Y118.95 E.05401
G3 X119.175 Y119.427 I-.126 J.351 E.01941
G1 X119.378 Y119.63 E.00954
G1 X119.378 Y121.27 E.05439
G1 X118.95 Y121.698 E.02008
G1 X118.95 Y123.326 E.05401
M204 S10000
G1 X135.221 Y130.757 F42000
G1 F15476.087
M204 S6000
G1 X134.094 Y129.582 E.05401
G1 X137.05 Y126.626 E.13865
G1 X137.05 Y129.374 E.09114
G1 X132.904 Y125.228 E.19447
G1 X130.772 Y125.228 E.07075
G1 X130.336 Y125.664 E.02042
G1 X131.463 Y126.839 E.05401
M204 S10000
G1 X136.815 Y130.96 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42358
G1 F15000
M204 S6000
G1 X137.065 Y131.209 E.01093
G1 X137.065 Y131.748 E.0167
G1 X136.591 Y131.273 E.0208
G1 X136.591 Y131.812 E.0167
G1 X137.065 Y132.286 E.0208
G1 X137.065 Y132.824 E.0167
G1 X136.476 Y132.236 E.02581
G1 X136.029 Y132.322 E.01414
G1 X135.92 Y132.052 E.00906
G1 X129.404 Y125.258 E.292
G1 X129.432 Y125.191 E.00224
G1 X123.176 Y118.935 E.27444
G1 X123.714 Y118.935 E.0167
G1 X129.615 Y124.836 E.25886
G1 X130.153 Y124.836 E.0167
G1 X124.252 Y118.935 E.25886
G1 X124.791 Y118.935 E.0167
G1 X130.692 Y124.836 E.25886
G1 X131.23 Y124.836 E.0167
G1 X125.329 Y118.935 E.25886
G1 X125.867 Y118.935 E.0167
G1 X131.768 Y124.836 E.25886
G1 X132.307 Y124.836 E.0167
G1 X126.406 Y118.935 E.25886
G1 X126.944 Y118.935 E.0167
G1 X132.845 Y124.836 E.25886
G1 X133.383 Y124.836 E.0167
G1 X127.482 Y118.935 E.25886
G1 X128.021 Y118.935 E.0167
G1 X133.922 Y124.836 E.25886
G1 X134.46 Y124.836 E.0167
G1 X128.559 Y118.935 E.25886
G1 X129.097 Y118.935 E.0167
G1 X134.998 Y124.836 E.25886
G1 X135.537 Y124.836 E.0167
G1 X129.636 Y118.935 E.25886
G1 X130.174 Y118.935 E.0167
G1 X136.075 Y124.836 E.25886
G1 X136.523 Y124.819 E.0139
G1 X136.602 Y124.898 E.00347
G1 X136.675 Y124.898 E.00227
G1 X130.712 Y118.935 E.26157
G1 X131.251 Y118.935 E.0167
G1 X137.065 Y124.749 E.25504
G1 X137.065 Y124.211 E.0167
G1 X131.789 Y118.935 E.23142
G1 X132.327 Y118.935 E.0167
G1 X137.065 Y123.673 E.20781
G1 X137.065 Y123.134 E.0167
G1 X132.866 Y118.935 E.18419
G1 X133.404 Y118.935 E.0167
G1 X137.065 Y122.596 E.16058
G1 X137.065 Y122.057 E.0167
G1 X133.942 Y118.935 E.13696
G1 X134.481 Y118.935 E.0167
G1 X137.065 Y121.519 E.11335
G1 X137.065 Y120.981 E.0167
G1 X135.019 Y118.935 E.08973
G1 X135.557 Y118.935 E.0167
G1 X137.065 Y120.442 E.06612
G1 X137.065 Y119.904 E.0167
G1 X136.096 Y118.935 E.0425
G1 X136.634 Y118.935 E.0167
G1 X137.234 Y119.536 E.02633
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15000
G1 X136.634 Y118.935 E-.32254
G1 X136.096 Y118.935 E-.20457
G1 X136.529 Y119.369 E-.23289
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/100
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
M204 S10000
G17
G3 Z18.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z18.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
M73 P89 R2
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z18.8 F4000
            G39.3 S1
            G0 Z18.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z18.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z18.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z18.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z18.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X137.398 Y137.398
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.487 Y137.234 Z18.8 F42000
G1 Z18.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F15000
M204 S6000
G1 X136.056 Y136.666 E.02483
G3 X135.922 Y136.263 I.272 J-.313 E.01373
G1 X135.121 Y137.065 E.03498
G1 X134.585 Y137.065 E.01654
G1 X135.922 Y135.728 E.05837
G1 X135.922 Y135.192 E.01654
G1 X134.05 Y137.065 E.08175
G1 X133.514 Y137.065 E.01654
G1 X135.922 Y134.656 E.10514
G1 X135.922 Y134.12 E.01654
G1 X132.978 Y137.065 E.12852
G1 X132.443 Y137.065 E.01654
G1 X135.922 Y133.585 E.15191
G1 X135.922 Y133.049 E.01654
G1 X131.907 Y137.065 E.17529
G1 X131.371 Y137.065 E.01654
G1 X135.922 Y132.513 E.19868
G1 X135.922 Y132.059 E.01404
G2 X135.885 Y132.015 I-.072 J.025 E.00181
G1 X130.835 Y137.065 E.22042
G1 X130.3 Y137.065 E.01654
G1 X135.623 Y131.742 E.23236
G1 X135.36 Y131.468 E.0117
G1 X129.764 Y137.065 E.2443
G1 X129.228 Y137.065 E.01654
G1 X135.098 Y131.195 E.25623
G1 X134.836 Y130.921 E.0117
G1 X128.693 Y137.065 E.26817
G1 X128.157 Y137.065 E.01654
G1 X134.574 Y130.648 E.2801
G1 X134.311 Y130.375 E.0117
G1 X127.621 Y137.065 E.29204
G1 X127.086 Y137.065 E.01654
G1 X134.049 Y130.101 E.30398
G1 X133.787 Y129.828 E.0117
G1 X126.55 Y137.065 E.31591
G1 X126.014 Y137.065 E.01654
G1 X133.524 Y129.554 E.32785
G1 X133.262 Y129.281 E.0117
G1 X125.478 Y137.065 E.33979
G1 X124.943 Y137.065 E.01654
G1 X133 Y129.007 E.35172
G1 X132.738 Y128.734 E.0117
G1 X124.407 Y137.065 E.36366
G1 X123.871 Y137.065 E.01654
G1 X132.475 Y128.461 E.3756
G1 X132.213 Y128.187 E.0117
G1 X123.336 Y137.065 E.38753
G1 X122.8 Y137.065 E.01654
G1 X131.951 Y127.914 E.39947
G1 X131.689 Y127.64 E.0117
G1 X122.264 Y137.065 E.41141
G1 X121.728 Y137.065 E.01654
G1 X131.426 Y127.367 E.42334
G1 X131.164 Y127.093 E.0117
G1 X121.193 Y137.065 E.43528
G1 X120.657 Y137.065 E.01654
G1 X130.902 Y126.82 E.44722
G1 X130.64 Y126.546 E.0117
G1 X120.375 Y136.811 E.44806
G1 X120.375 Y136.736 E.00231
G1 X120.526 Y136.585 E.00658
G1 X120.579 Y136.458 E.00426
G1 X120.579 Y136.071 E.01192
G1 X125.466 Y131.184 E.21334
G1 X124.93 Y131.184 E.01654
G1 X120.579 Y135.536 E.18996
G1 X120.579 Y135 E.01654
G1 X124.395 Y131.184 E.16657
G1 X123.859 Y131.184 E.01654
G1 X120.579 Y134.464 E.14319
G1 X120.579 Y133.929 E.01654
G1 X123.323 Y131.184 E.1198
G1 X122.788 Y131.184 E.01654
G1 X120.579 Y133.393 E.09642
G1 X120.579 Y132.857 E.01654
G1 X122.252 Y131.184 E.07303
G1 X121.716 Y131.184 E.01654
G1 X120.579 Y132.322 E.04965
G1 X120.579 Y131.786 E.01654
G1 X121.18 Y131.184 E.02626
G1 X120.645 Y131.184 E.01654
G1 X120.409 Y131.42 E.01028
M204 S10000
G1 X118.95 Y135.421 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X118.95 Y137.05 E.05401
G1 X120.187 Y135.813 E.058
G1 X120.187 Y135.539 E.00911
G1 X118.95 Y134.302 E.058
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X124.325 Y129.373 F42000
G1 F15476.087
M204 S6000
G1 X125.452 Y130.548 E.05401
G1 X125.208 Y130.792 E.01145
G1 X123.116 Y130.792 E.06939
G1 X118.95 Y126.626 E.19543
G1 X118.95 Y129.374 E.09114
G1 X121.694 Y126.63 E.12871
G1 X120.567 Y125.455 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F15476.087
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X119.378 Y121.27 E.02008
G1 X119.378 Y119.63 E.05439
G3 X119.175 Y119.175 I.126 J-.329 E.01837
G1 X118.95 Y118.95 E.01054
G1 X118.95 Y120.579 E.05401
M204 S10000
G1 X119.517 Y119.455 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F15000
M204 S6000
G1 X120.037 Y118.935 E.02267
G1 X120.572 Y118.935 E.01654
G1 X119.771 Y119.737 E.03501
G1 X119.771 Y120.273 E.01654
G1 X121.108 Y118.935 E.05839
G1 X121.644 Y118.935 E.01654
G1 X119.771 Y120.809 E.08178
G1 X119.771 Y121.344 E.01654
G1 X122.18 Y118.935 E.10516
G1 X122.715 Y118.935 E.01654
G1 X119.771 Y121.88 E.12855
G1 X119.771 Y122.416 E.01654
G1 X123.251 Y118.935 E.15193
G1 X123.787 Y118.935 E.01654
G1 X119.771 Y122.951 E.17532
G1 X119.771 Y123.487 E.01654
G1 X124.322 Y118.935 E.1987
G1 X124.858 Y118.935 E.01654
G1 X119.771 Y124.023 E.22209
G1 X119.773 Y124.061 E.00118
G1 X120.016 Y124.314 E.0108
G1 X125.394 Y118.935 E.23478
G1 X125.93 Y118.935 E.01654
G1 X120.278 Y124.587 E.24671
G1 X120.54 Y124.86 E.0117
G1 X126.465 Y118.935 E.25865
G1 X127.001 Y118.935 E.01654
G1 X120.802 Y125.134 E.27059
G1 X121.065 Y125.407 E.0117
G1 X127.537 Y118.935 E.28252
G1 X128.072 Y118.935 E.01654
G1 X121.327 Y125.681 E.29446
G1 X121.589 Y125.954 E.0117
G1 X128.608 Y118.935 E.30639
G1 X129.144 Y118.935 E.01654
G1 X121.851 Y126.228 E.31833
G1 X122.114 Y126.501 E.0117
G1 X129.679 Y118.935 E.33027
G1 X130.215 Y118.935 E.01654
G1 X122.376 Y126.774 E.3422
G1 X122.638 Y127.048 E.0117
G1 X130.751 Y118.935 E.35414
G1 X131.287 Y118.935 E.01654
G1 X122.901 Y127.321 E.36608
G1 X123.163 Y127.595 E.0117
G1 X131.822 Y118.935 E.37801
G1 X132.358 Y118.935 E.01654
G1 X123.425 Y127.868 E.38995
G1 X123.687 Y128.142 E.0117
G1 X132.894 Y118.935 E.40188
G1 X133.429 Y118.935 E.01654
G1 X123.95 Y128.415 E.41382
G1 X124.212 Y128.689 E.0117
G1 X133.965 Y118.935 E.42576
G1 X134.501 Y118.935 E.01654
G1 X124.474 Y128.962 E.43769
G1 X124.736 Y129.235 E.0117
G1 X135.037 Y118.935 E.44963
G1 X135.572 Y118.935 E.01654
G1 X124.999 Y129.509 E.46157
G1 X125.261 Y129.782 E.0117
G1 X129.59 Y125.453 E.189
G1 X129.853 Y125.726 E.0117
G1 X125.523 Y130.056 E.189
G1 X125.786 Y130.329 E.0117
G1 X130.115 Y126 E.189
G1 X130.377 Y126.273 E.0117
G1 X125.928 Y130.723 E.19424
M204 S10000
G1 X131.463 Y126.839 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X130.336 Y125.664 E.05401
G1 X130.772 Y125.228 E.02042
G1 X132.904 Y125.228 E.07075
G1 X137.05 Y129.374 E.19447
G1 X137.05 Y126.626 E.09114
G1 X134.094 Y129.582 E.13865
G1 X135.221 Y130.757 E.05401
M204 S10000
G1 X137.05 Y132.674 F42000
G1 F15476.087
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X136.315 Y135.037 E.03448
G1 X136.315 Y136.315 E.04237
G1 X137.05 Y137.05 E.03448
G1 X137.05 Y135.421 E.05401
M204 S10000
G1 X135.93 Y125.006 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F15000
M204 S6000
G1 X136.229 Y124.707 E.01307
G1 X136.229 Y124.171 E.01654
G1 X135.564 Y124.836 E.02905
G1 X135.028 Y124.836 E.01654
G1 X136.229 Y123.635 E.05243
G1 X136.229 Y123.099 E.01654
G1 X134.493 Y124.836 E.07582
G1 X133.957 Y124.836 E.01654
G1 X136.229 Y122.564 E.0992
G1 X136.229 Y122.028 E.01654
G1 X133.421 Y124.836 E.12259
G1 X132.886 Y124.836 E.01654
G1 X136.229 Y121.492 E.14597
G1 X136.229 Y120.957 E.01654
G1 X132.35 Y124.836 E.16936
G1 X131.814 Y124.836 E.01654
G1 X136.229 Y120.421 E.19274
G1 X136.229 Y119.885 E.01654
G1 X131.278 Y124.836 E.21613
G1 X130.743 Y124.836 E.01654
M73 P90 R2
G1 X136.433 Y119.146 E.24839
G1 X136.433 Y118.935 E.0065
G1 X136.108 Y118.935 E.01003
G1 X130.037 Y125.006 E.265
M204 S10000
G1 X137.05 Y120.579 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X137.05 Y118.95 E.05401
G2 X136.825 Y119.427 I.126 J.351 E.01941
G1 X136.622 Y119.63 E.00954
G1 X136.622 Y121.27 E.05439
G1 X137.05 Y121.698 E.02008
G1 X137.05 Y123.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X137.05 Y121.698 E-.61876
G1 X136.787 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/100
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
M204 S10000
G17
G3 Z18.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z19 F4000
            G39.3 S1
            G0 Z19 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z18.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z18.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z18.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X135.887 Y136.578
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X120.614 Y136.578 E.50663
G1 X120.614 Y131.22 E.17774
G1 X126.689 Y131.22 E.2015
G1 X119.806 Y124.044 E.32983
G1 X119.806 Y119.422 E.15331
G1 X136.194 Y119.422 E.54362
G1 X136.194 Y124.801 E.17842
G1 X128.916 Y124.801 E.24142
G1 X135.887 Y132.069 E.33406
G1 X135.887 Y136.518 E.14758
; WIPE_START
G1 X133.887 Y136.526 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.398 Y137.398 Z19 F42000
G1 Z18.6
G1 E.8 F1800
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.091 Y136.988 Z19 F42000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45602
G1 F15000
M204 S6000
G1 X120.411 Y136.988 E.52782
M204 S10000
G1 X118.95 Y132.674 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X118.95 Y134.302 E.05401
G1 X120.266 Y135.618 E.06172
G1 X120.266 Y135.734 E.00385
G1 X118.95 Y137.05 E.06172
G1 X118.95 Y135.421 E.05401
M204 S10000
G1 X120.623 Y125.399 F42000
G1 F15476.087
M204 S6000
G1 X121.75 Y126.574 E.05401
G1 X118.95 Y129.374 E.13134
G1 X118.95 Y126.626 E.09114
G1 X123.195 Y130.871 E.19915
G1 X125.129 Y130.871 E.06413
G1 X125.508 Y130.492 E.0178
G1 X124.381 Y129.317 E.05401
; WIPE_START
G1 X125.508 Y130.492 E-.61876
G1 X125.245 Y130.755 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.23 Y124.264 Z19 F42000
G1 X118.95 Y120.579 Z19
G1 Z18.6
G1 E.8 F1800
G1 F15476.087
M204 S6000
G1 X118.95 Y118.95 E.05401
G1 X119.254 Y119.254 E.01426
G1 X119.254 Y119.589 E.01109
G1 X119.458 Y119.589 E.00675
G1 X119.458 Y121.19 E.05314
G1 X118.95 Y121.698 E.0238
G1 X118.95 Y123.326 E.05401
; WIPE_START
G1 X118.95 Y121.698 E-.61876
G1 X119.213 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.095 Y119.653 Z19 F42000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
M204 S6000
G1 X120.031 Y119.69 E.00204
G1 X120.08 Y119.718 E.00155
M204 S10000
G1 X135.948 Y119.653 F42000
G1 F15000
M204 S6000
G1 X135.884 Y119.69 E.00204
G1 X135.933 Y119.718 E.00155
M204 S10000
G1 X135.948 Y124.496 F42000
G1 F15000
M204 S6000
G1 X135.884 Y124.533 E.00204
G1 X135.933 Y124.561 E.00155
M204 S10000
G1 X128.63 Y124.536 F42000
G1 F15000
M204 S6000
G1 X128.566 Y124.573 E.00204
G1 X128.614 Y124.601 E.00155
; WIPE_START
G1 X128.566 Y124.573 E-.32874
G1 X128.63 Y124.536 E-.43126
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.018 Y131.411 Z19 F42000
G1 Z18.6
G1 E.8 F1800
G1 F15000
M204 S6000
G1 X126.954 Y131.447 E.00204
G1 X127.003 Y131.476 E.00155
M204 S10000
G1 X120.903 Y131.45 F42000
G1 F15000
M204 S6000
G1 X120.839 Y131.487 E.00204
G1 X120.888 Y131.515 E.00155
M204 S10000
G1 X120.903 Y136.273 F42000
G1 F15000
M204 S6000
G1 X120.839 Y136.31 E.00204
G1 X120.888 Y136.338 E.00155
M204 S10000
G1 X135.641 Y136.273 F42000
G1 F15000
M204 S6000
G1 X135.577 Y136.31 E.00204
G1 X135.626 Y136.338 E.00155
; WIPE_START
G1 X135.577 Y136.31 E-.32873
G1 X135.641 Y136.273 E-.43127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y135.421 Z19 F42000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X137.05 Y137.05 E.05401
G1 X136.235 Y136.235 E.0382
G1 X136.235 Y135.117 E.03711
G1 X137.05 Y134.302 E.0382
G1 X137.05 Y132.674 E.05401
M204 S10000
G1 X135.165 Y130.813 F42000
G1 F15476.087
M204 S6000
G1 X134.038 Y129.638 E.05401
G1 X137.05 Y126.626 E.14128
G1 X137.05 Y129.374 E.09114
G1 X132.825 Y125.149 E.19819
G1 X130.851 Y125.149 E.06549
G1 X130.28 Y125.72 E.02677
G1 X131.407 Y126.895 E.05401
; WIPE_START
G1 X130.28 Y125.72 E-.61876
G1 X130.543 Y125.457 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y123.326 Z19 F42000
G1 Z18.6
G1 E.8 F1800
G1 F15476.087
M204 S6000
G1 X137.05 Y121.698 E.05401
G1 X136.542 Y121.19 E.0238
G1 X136.542 Y119.589 E.05314
G1 X136.746 Y119.589 E.00675
G1 X136.746 Y119.254 E.01109
G1 X137.05 Y118.95 E.01426
G1 X137.05 Y120.579 E.05401
; WIPE_START
G1 X137.05 Y118.95 E-.61876
G1 X136.787 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.923 Y120.192 Z19 F42000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X135.424 Y119.693 E.02171
G1 X134.891 Y119.693
G1 X135.923 Y120.726 E.04488
G1 X135.923 Y121.259
G1 X134.357 Y119.693 E.06805
G1 X133.824 Y119.693
G1 X135.923 Y121.792 E.09122
G1 X135.923 Y122.325
G1 X133.291 Y119.693 E.1144
G1 X132.758 Y119.693
G1 X135.923 Y122.859 E.13757
G1 X135.923 Y123.392
G1 X132.224 Y119.693 E.16074
G1 X131.691 Y119.693
G1 X135.923 Y123.925 E.18392
G1 X135.904 Y124.439
G1 X131.158 Y119.693 E.20624
G1 X130.625 Y119.693
G1 X135.462 Y124.53 E.2102
G1 X134.929 Y124.53
G1 X130.091 Y119.693 E.2102
G1 X129.558 Y119.693
G1 X134.395 Y124.53 E.2102
G1 X133.862 Y124.53
G1 X129.025 Y119.693 E.2102
G1 X128.492 Y119.693
G1 X133.329 Y124.53 E.2102
G1 X132.796 Y124.53
G1 X127.958 Y119.693 E.2102
G1 X127.425 Y119.693
G1 X132.262 Y124.53 E.2102
G1 X131.729 Y124.53
G1 X126.892 Y119.693 E.2102
G1 X126.359 Y119.693
G1 X131.196 Y124.53 E.2102
G1 X130.663 Y124.53
G1 X125.825 Y119.693 E.2102
G1 X125.292 Y119.693
G1 X130.129 Y124.53 E.2102
G1 X129.596 Y124.53
G1 X124.759 Y119.693 E.2102
G1 X124.225 Y119.693
G1 X129.063 Y124.53 E.2102
G1 X128.565 Y124.566
G1 X123.692 Y119.693 E.21174
G1 X123.159 Y119.693
G1 X134.979 Y131.513 E.51365
M204 S10000
G1 X135.616 Y132.684 F42000
G1 F12000
M204 S2000
G1 X122.626 Y119.693 E.56451
G1 X122.092 Y119.693
G1 X135.616 Y133.217 E.58768
G1 X135.616 Y133.75
G1 X121.559 Y119.693 E.61086
G1 X121.026 Y119.693
G1 X135.616 Y134.283 E.63403
G1 X135.616 Y134.817
G1 X120.493 Y119.693 E.6572
G1 X120.077 Y119.81
G1 X135.616 Y135.35 E.67528
G1 X135.616 Y135.883
G1 X120.077 Y120.343 E.67528
G1 X120.077 Y120.877
G1 X135.506 Y136.306 E.6705
G1 X134.974 Y136.307
G1 X120.077 Y121.41 E.64736
G1 X120.077 Y121.943
G1 X134.441 Y136.307 E.62419
G1 X133.907 Y136.307
G1 X120.077 Y122.476 E.60102
G1 X120.077 Y123.01
G1 X133.374 Y136.307 E.57784
G1 X132.841 Y136.307
G1 X120.077 Y123.543 E.55467
M204 S10000
G1 X123.389 Y127.389 F42000
G1 F12000
M204 S2000
G1 X132.308 Y136.307 E.38756
G1 X131.774 Y136.307
G1 X126.958 Y131.49 E.20932
G1 X126.424 Y131.49
G1 X131.241 Y136.307 E.20932
G1 X130.708 Y136.307
G1 X125.891 Y131.49 E.20932
M73 P91 R2
G1 X125.358 Y131.49
G1 X130.175 Y136.307 E.20932
G1 X129.641 Y136.307
G1 X124.824 Y131.49 E.20932
M73 P91 R1
G1 X124.291 Y131.49
G1 X129.108 Y136.307 E.20932
G1 X128.575 Y136.307
G1 X123.758 Y131.49 E.20931
G1 X123.225 Y131.49
G1 X128.042 Y136.307 E.20932
G1 X127.508 Y136.307
G1 X122.691 Y131.49 E.20932
G1 X122.158 Y131.49
G1 X126.975 Y136.307 E.20932
G1 X126.442 Y136.307
G1 X121.625 Y131.49 E.20932
G1 X121.092 Y131.49
G1 X125.909 Y136.307 E.20932
G1 X125.375 Y136.307
G1 X120.885 Y131.817 E.19513
G1 X120.885 Y132.35
G1 X124.842 Y136.307 E.17196
G1 X124.309 Y136.307
G1 X120.885 Y132.883 E.14878
G1 X120.885 Y133.417
G1 X123.776 Y136.307 E.12561
G1 X123.242 Y136.307
G1 X120.885 Y133.95 E.10244
G1 X120.885 Y134.483
G1 X122.709 Y136.307 E.07927
G1 X122.176 Y136.307
G1 X120.885 Y135.016 E.05609
G1 X120.885 Y135.55
G1 X121.642 Y136.307 E.03292
; WIPE_START
M204 S6000
G1 X120.885 Y135.55 E-.40713
G1 X120.885 Y135.016 E-.20264
G1 X121.164 Y135.296 E-.15023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.444 Y129.784 Z19 F42000
G1 X135.942 Y119.87 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.14806
G1 F15000
M204 S6000
G1 X135.746 Y119.674 E.00238
; WIPE_START
G1 X135.942 Y119.87 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.389 Y123.783 Z19 F42000
G1 X123.449 Y127.329 Z19
G1 Z18.6
G1 E.8 F1800
; LINE_WIDTH: 0.223889
G1 F15000
M204 S6000
G1 X121.753 Y125.597 E.03574
; LINE_WIDTH: 0.175604
G1 X120.058 Y123.866 E.0262
; WIPE_START
G1 X121.457 Y125.295 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.049 Y131.471 Z19 F42000
G1 Z18.6
G1 E.8 F1800
; LINE_WIDTH: 0.140243
G1 F15000
M204 S6000
G2 X120.913 Y131.613 I.435 J.557 E.00156
G2 X120.955 Y131.746 I.286 J-.017 E.00112
; WIPE_START
G1 X120.913 Y131.613 E-.31696
G1 X121.049 Y131.471 E-.44304
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.669 Y131.906 Z19 F42000
G1 X135.635 Y132.304 Z19
G1 Z18.6
G1 E.8 F1800
; LINE_WIDTH: 0.240086
G1 F15000
M204 S6000
G1 X134.919 Y131.573 E.01644
; WIPE_START
G1 X135.635 Y132.304 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.072 Y124.684 Z19 F42000
G1 X136.398 Y119.012 Z19
G1 Z18.6
G1 E.8 F1800
; LINE_WIDTH: 0.45602
G1 F15000
M204 S6000
G1 X119.602 Y119.012 E.56536
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15000
G1 X121.602 Y119.012 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/100
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
M204 S10000
G17
G3 Z19 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z19.2 F4000
            G39.3 S1
            G0 Z19.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z19.000
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z18.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z18.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X123.833 Y119.898
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F12622
M204 S6000
G1 X135.718 Y119.898 E.39426
G1 X135.718 Y124.325 E.14686
G1 X127.801 Y124.325 E.26264
G1 X135.411 Y132.26 E.36471
G1 X135.411 Y136.102 E.12745
G1 X121.09 Y136.102 E.47507
G1 X121.09 Y131.695 E.14618
G1 X127.804 Y131.695 E.22272
G1 X120.282 Y123.853 E.36049
G1 X120.282 Y119.898 E.13118
G1 X123.773 Y119.898 E.11582
; WIPE_START
G1 F15476.087
G1 X125.773 Y119.898 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.881 Y123.933 Z19.2 F42000
G1 Z18.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X135.019 Y132.418 E.36124
G1 X135.019 Y135.71 E.10117
G1 X121.482 Y135.71 E.41596
G1 X121.482 Y132.087 E.11131
G1 X128.723 Y132.087 E.22251
G1 X120.674 Y123.695 E.35733
G1 X120.674 Y120.29 E.10462
G1 X135.326 Y120.29 E.45023
G1 X135.326 Y123.933 E.11194
G1 X126.941 Y123.933 E.25764
; WIPE_START
M204 S6000
G1 X128.321 Y125.382 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.921 Y131.472 Z19.2 F42000
G1 X137.398 Y137.398 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12622
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.05 Y132.674 Z19.2 F42000
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12622
M204 S6000
G1 X137.05 Y134.302 E.05401
G1 X136.315 Y135.037 E.03448
G1 X136.315 Y136.315 E.04237
G1 X137.05 Y137.05 E.03448
G1 X137.05 Y135.421 E.05401
; WIPE_START
G1 F15476.087
G1 X137.05 Y137.05 E-.61876
G1 X136.787 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.186 Y130.057 Z19.2 F42000
G1 X131.463 Y126.839 Z19.2
G1 Z18.8
G1 E.8 F1800
G1 F12622
M204 S6000
G1 X130.336 Y125.664 E.05401
G1 X130.772 Y125.228 E.02042
G1 X132.904 Y125.228 E.07075
G1 X137.05 Y129.374 E.19447
G1 X137.05 Y126.626 E.09114
G1 X134.094 Y129.582 E.13865
G1 X135.221 Y130.757 E.05401
; WIPE_START
G1 F15476.087
G1 X134.094 Y129.582 E-.61876
G1 X134.357 Y129.319 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.821 Y130.525 Z19.2 F42000
G1 X126.158 Y130.632 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.539127
G1 F12000
M204 S6000
G1 X119.899 Y124.106 E.3656
G1 X119.832 Y123.978 E.00586
G1 X119.83 Y123.934 E.00175
G1 X119.83 Y119.754 E.16902
; WIPE_START
G1 X119.83 Y121.754 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.97 Y124.453 Z19.2 F42000
G1 X129.447 Y125.389 Z19.2
G1 Z18.8
G1 E.8 F1800
; LINE_WIDTH: 0.53922
G1 F12000
M204 S6000
G1 X135.794 Y132.006 E.37083
G3 X135.863 Y132.178 I-.099 J.14 E.00791
G1 X135.863 Y136.289 E.16624
; WIPE_START
G1 X135.863 Y134.289 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.66 Y131.765 Z19.2 F42000
G1 X126.177 Y130.895 Z19.2
G1 Z18.8
G1 E.8 F1800
; LINE_WIDTH: 0.493507
G1 F12000
M204 S6000
G1 X126.178 Y130.892 E.00012
; LINE_WIDTH: 0.508763
G1 X126.158 Y130.632 E.00991
; LINE_WIDTH: 0.521405
G1 X126.282 Y130.739 E.00642
; LINE_WIDTH: 0.505233
G3 X126.828 Y131.279 I-2.901 J3.477 E.02895
; LINE_WIDTH: 0.484054
G1 X125.94 Y131.242 E.03195
G1 X126.101 Y131.083 E.00813
; LINE_WIDTH: 0.482368
G1 X126.154 Y130.951 E.0051
; WIPE_START
G1 X126.101 Y131.083 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.504 Y124.938 Z19.2 F42000
G1 Z18.8
G1 E.8 F1800
; LINE_WIDTH: 0.48628
G1 F12000
M204 S6000
G1 X129.665 Y124.779 E.00817
; LINE_WIDTH: 0.54288
G1 X128.777 Y124.741 E.03621
; LINE_WIDTH: 0.46837
G1 X129.198 Y125.173 E.02092
; LINE_WIDTH: 0.493295
G1 X129.322 Y125.281 E.00604
; LINE_WIDTH: 0.533117
G1 X129.447 Y125.389 E.00658
G1 X129.426 Y125.132 E.0103
; LINE_WIDTH: 0.481949
G1 X129.482 Y124.994 E.00534
; WIPE_START
G1 X129.426 Y125.132 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.368 Y120.341 Z19.2 F42000
G1 X136.17 Y119.694 Z19.2
G1 Z18.8
G1 E.8 F1800
; LINE_WIDTH: 0.5391
G1 F12000
M204 S6000
G1 X136.17 Y124.529 E.19546
; LINE_WIDTH: 0.560385
G1 X136.149 Y124.631 E.00443
; LINE_WIDTH: 0.588765
G1 F11541.739
G1 X136.127 Y124.734 E.00467
G1 X135.922 Y124.777 E.00934
; LINE_WIDTH: 0.53911
G1 F12000
G1 X129.725 Y124.777 E.25057
; WIPE_START
G1 X131.725 Y124.777 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.392 Y119.198 Z19.2 F42000
G1 Z18.8
G1 E.8 F1800
; LINE_WIDTH: 0.488497
G1 F12000
M204 S6000
G1 X136.392 Y119.035 E.0059
G1 X135.922 Y119.028 E.01707
G1 X120.078 Y119.028 E.57527
G1 X119.608 Y119.035 E.01707
G1 X119.608 Y119.258 E.00808
G3 X119.825 Y119.58 I-.455 J.54 E.01429
; LINE_WIDTH: 0.521997
G1 X119.83 Y119.694 E.00447
G1 X119.86 Y119.588 E.00431
G1 X120.039 Y119.474 E.00831
; LINE_WIDTH: 0.48766
G1 X135.922 Y119.472 E.57559
G1 X136.013 Y119.484 E.00334
G1 X136.14 Y119.588 E.00595
; LINE_WIDTH: 0.520953
G1 X136.17 Y119.694 E.0043
G1 X136.175 Y119.58 E.00446
G1 X136.371 Y119.254 E.01482
; WIPE_START
G1 X136.175 Y119.58 E-.47756
G1 X136.17 Y119.694 E-.14381
G1 X136.14 Y119.588 E-.13863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.958 Y125.192 Z19.2 F42000
G1 X120.64 Y136.349 Z19.2
G1 Z18.8
G1 E.8 F1800
; LINE_WIDTH: 0.539117
G1 F12000
M204 S6000
G1 X120.638 Y131.492 E.19639
; LINE_WIDTH: 0.56038
G1 X120.66 Y131.389 E.00443
; LINE_WIDTH: 0.588754
G1 F11541.985
G1 X120.681 Y131.286 E.00467
G1 X120.886 Y131.244 E.00934
; LINE_WIDTH: 0.53911
G1 F12000
G1 X125.88 Y131.244 E.20191
; WIPE_START
G1 X123.88 Y131.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.64 Y136.349 Z19.2 F42000
G1 Z18.8
G1 E.8 F1800
; LINE_WIDTH: 0.509621
M73 P92 R1
G1 F12000
M204 S6000
G1 X120.55 Y136.586 E.00964
G1 X120.416 Y136.742 E.00783
G1 X120.416 Y136.965 E.00846
; LINE_WIDTH: 0.488231
G1 X136.085 Y136.965 E.56857
G1 X136.085 Y136.742 E.00807
G1 X135.933 Y136.572 E.00827
; LINE_WIDTH: 0.524609
G1 X135.861 Y136.349 E.00922
G1 X135.696 Y136.52 E.00936
; LINE_WIDTH: 0.487444
G1 X120.793 Y136.52 E.53981
; LINE_WIDTH: 0.52684
G1 X120.68 Y136.394 E.0067
M204 S10000
G1 X118.95 Y135.421 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12622
M204 S6000
G1 X118.95 Y137.05 E.05401
G1 X120.187 Y135.813 E.058
G1 X120.187 Y135.539 E.00911
G1 X118.95 Y134.302 E.058
G1 X118.95 Y132.674 E.05401
M204 S10000
G1 X124.325 Y129.373 F42000
G1 F12622
M204 S6000
G1 X125.452 Y130.548 E.05401
G1 X125.208 Y130.792 E.01145
G1 X123.116 Y130.792 E.06939
G1 X118.95 Y126.626 E.19543
G1 X118.95 Y129.374 E.09114
G1 X121.694 Y126.63 E.12871
G1 X120.567 Y125.455 E.05401
M204 S10000
G1 X118.95 Y123.326 F42000
G1 F12622
M204 S6000
G1 X118.95 Y121.698 E.05401
G1 X119.378 Y121.27 E.02008
G1 X119.378 Y119.63 E.05439
G3 X119.175 Y119.175 I.126 J-.329 E.01837
G1 X118.95 Y118.95 E.01054
G1 X118.95 Y120.579 E.05401
; WIPE_START
G1 F15476.087
G1 X118.95 Y118.95 E-.61876
G1 X119.175 Y119.175 E-.12072
G1 X119.175 Y119.229 E-.02052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.786 Y119.804 Z19.2 F42000
G1 X137.05 Y120.579 Z19.2
G1 Z18.8
G1 E.8 F1800
G1 F12622
M204 S6000
G1 X137.05 Y118.95 E.05401
G2 X136.825 Y119.427 I.126 J.351 E.01941
G1 X136.622 Y119.63 E.00954
G1 X136.622 Y121.27 E.05439
G1 X137.05 Y121.698 E.02008
G1 X137.05 Y123.326 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X137.05 Y121.698 E-.61876
G1 X136.787 Y121.435 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/100
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
M204 S10000
G17
G3 Z19.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z19.4 F4000
            G39.3 S1
            G0 Z19.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z19.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z19
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z19
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X123.833 Y119.898
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X135.718 Y119.898 E.39426
G1 X135.718 Y124.325 E.14686
G1 X127.801 Y124.325 E.26264
G1 X135.411 Y132.26 E.36471
G1 X135.411 Y136.102 E.12745
G1 X121.09 Y136.102 E.47507
G1 X121.09 Y131.695 E.14618
G1 X127.804 Y131.695 E.22272
G1 X120.282 Y123.853 E.36049
G1 X120.282 Y119.898 E.13118
G1 X123.773 Y119.898 E.11582
; WIPE_START
G1 X125.773 Y119.898 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.881 Y123.933 Z19.4 F42000
G1 Z19
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X135.019 Y132.418 E.36124
G1 X135.019 Y135.71 E.10117
G1 X121.482 Y135.71 E.41596
G1 X121.482 Y132.087 E.11131
G1 X128.723 Y132.087 E.22251
G1 X120.674 Y123.695 E.35733
G1 X120.674 Y120.29 E.10462
G1 X135.326 Y120.29 E.45023
G1 X135.326 Y123.933 E.11194
G1 X126.941 Y123.933 E.25764
; WIPE_START
M204 S6000
G1 X128.321 Y125.382 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.921 Y131.472 Z19.4 F42000
G1 X137.398 Y137.398 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.673 Y135.931 Z19.4 F42000
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X136.673 Y136.206 E.00911
G1 X137.05 Y136.09 E.01308
G1 X137.05 Y137.05 E.03182
G1 X136.315 Y136.315 E.03448
G1 X136.315 Y135.037 E.04238
G1 X136.673 Y134.679 E.01678
G1 X136.673 Y133.051 E.05401
M204 S10000
G1 X137.035 Y135.614 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X137.035 Y122.737 E.35676
; Slow Down End
M204 S10000
G1 X136.673 Y123.127 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X136.673 Y122.486 E.02127
G1 X137.05 Y122.228 E.01515
G1 X137.05 Y121.698 E.01759
G1 X136.622 Y121.27 E.02008
G1 X136.622 Y119.63 E.05439
G2 X136.825 Y119.175 I-.126 J-.329 E.01838
G1 X137.05 Y118.95 E.01053
G1 X137.05 Y120.579 E.05401
; WIPE_START
G1 X137.05 Y118.95 E-.61876
G1 X136.825 Y119.175 E-.12067
G1 X136.825 Y119.229 E-.02057
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.429 Y125.468 Z19.4 F42000
G1 X131.463 Y126.839 Z19.4
G1 Z19
G1 E.8 F1800
G1 F15476.087
M204 S6000
G1 X130.336 Y125.664 E.05401
G1 X130.772 Y125.228 E.02042
G1 X132.904 Y125.228 E.07075
G1 X136.673 Y128.997 E.17677
G1 X136.673 Y127.003 E.06611
G1 X134.094 Y129.582 E.12095
G1 X135.221 Y130.757 E.05401
; WIPE_START
G1 X134.094 Y129.582 E-.61876
G1 X134.357 Y129.319 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.821 Y130.525 Z19.4 F42000
G1 X126.158 Y130.631 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.539327
G1 F12000
M204 S6000
G1 X119.899 Y124.106 E.36574
G1 X119.832 Y123.978 E.00587
G1 X119.83 Y123.934 E.00175
G1 X119.83 Y119.754 E.16908
; WIPE_START
G1 X119.83 Y121.754 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.97 Y124.453 Z19.4 F42000
G1 X129.447 Y125.389 Z19.4
G1 Z19
G1 E.8 F1800
; LINE_WIDTH: 0.539434
G1 F12000
M204 S6000
G1 X135.794 Y132.006 E.37098
G3 X135.863 Y132.178 I-.099 J.14 E.00792
G1 X135.863 Y136.289 E.16632
; WIPE_START
G1 X135.863 Y134.289 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.721 Y131.597 Z19.4 F42000
G1 X126.158 Y130.631 Z19.4
G1 Z19
G1 E.8 F1800
; LINE_WIDTH: 0.523985
G1 F12000
M204 S6000
G1 X126.168 Y130.76 E.00506
; LINE_WIDTH: 0.486487
G1 X126.179 Y130.889 E.00466
G1 X126.101 Y131.082 E.00755
; LINE_WIDTH: 0.500525
G1 X126.02 Y131.162 E.00422
; LINE_WIDTH: 0.508369
G1 X125.94 Y131.242 E.00429
G1 X126.828 Y131.279 E.03371
; LINE_WIDTH: 0.473265
G1 X126.407 Y130.847 E.02116
; LINE_WIDTH: 0.493395
G1 X126.305 Y130.759 E.00494
; LINE_WIDTH: 0.523985
G1 X126.203 Y130.671 E.00528
; WIPE_START
G1 X126.305 Y130.759 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.447 Y125.389 Z19.4 F42000
G1 Z19
G1 E.8 F1800
G1 F12000
M204 S6000
G1 X129.437 Y125.26 E.00506
; LINE_WIDTH: 0.486487
G1 X129.426 Y125.132 E.00466
G1 X129.504 Y124.938 E.00755
; LINE_WIDTH: 0.500525
G1 X129.585 Y124.858 E.00422
; LINE_WIDTH: 0.508369
G1 X129.665 Y124.779 E.00429
G1 X128.777 Y124.741 E.03371
; LINE_WIDTH: 0.473265
G1 X129.198 Y125.173 E.02116
; LINE_WIDTH: 0.493395
G1 X129.3 Y125.262 E.00494
; LINE_WIDTH: 0.523985
G1 X129.402 Y125.35 E.00528
; WIPE_START
G1 X129.3 Y125.262 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.23 Y120.456 Z19.4 F42000
G1 X136.17 Y119.694 Z19.4
G1 Z19
G1 E.8 F1800
; LINE_WIDTH: 0.5393
G1 F12000
M204 S6000
G1 X136.17 Y124.529 E.19554
; LINE_WIDTH: 0.560595
G1 X136.149 Y124.631 E.00443
; LINE_WIDTH: 0.588989
G1 F11537.019
G1 X136.127 Y124.734 E.00467
G1 X135.922 Y124.777 E.00934
; LINE_WIDTH: 0.53931
G1 F12000
G1 X129.725 Y124.777 E.25067
; WIPE_START
G1 X131.725 Y124.777 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.392 Y119.198 Z19.4 F42000
G1 Z19
G1 E.8 F1800
; LINE_WIDTH: 0.488501
G1 F12000
M204 S6000
G1 X136.392 Y119.035 E.0059
G1 X135.922 Y119.028 E.01708
G1 X120.078 Y119.028 E.57527
G1 X119.608 Y119.035 E.01708
G1 X119.608 Y119.258 E.00808
G3 X119.825 Y119.58 I-.456 J.54 E.01429
; LINE_WIDTH: 0.522123
G1 X119.83 Y119.694 E.00447
G1 X119.86 Y119.588 E.00431
G1 X120.039 Y119.474 E.00831
; LINE_WIDTH: 0.487661
G1 X135.922 Y119.472 E.57559
G1 X136.013 Y119.484 E.00334
G1 X136.14 Y119.588 E.00595
; LINE_WIDTH: 0.521075
G1 X136.17 Y119.694 E.0043
G1 X136.175 Y119.58 E.00446
G1 X136.371 Y119.254 E.01482
; WIPE_START
G1 X136.175 Y119.58 E-.47763
G1 X136.17 Y119.694 E-.14377
G1 X136.14 Y119.588 E-.13859
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.958 Y125.192 Z19.4 F42000
G1 X120.64 Y136.349 Z19.4
G1 Z19
G1 E.8 F1800
; LINE_WIDTH: 0.539317
G1 F12000
M204 S6000
G1 X120.638 Y131.492 E.19647
; LINE_WIDTH: 0.560585
G1 X120.66 Y131.389 E.00443
; LINE_WIDTH: 0.588965
G1 F11537.511
G1 X120.681 Y131.286 E.00467
G1 X120.886 Y131.244 E.00934
; LINE_WIDTH: 0.53931
G1 F12000
G1 X125.88 Y131.244 E.20199
; WIPE_START
G1 X123.88 Y131.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.64 Y136.349 Z19.4 F42000
M73 P93 R1
G1 Z19
G1 E.8 F1800
; LINE_WIDTH: 0.509682
G1 F12000
M204 S6000
G1 X120.55 Y136.586 E.00964
G1 X120.416 Y136.742 E.00784
G1 X120.416 Y136.965 E.00846
; LINE_WIDTH: 0.488233
G1 X136.085 Y136.965 E.56859
G1 X136.085 Y136.742 E.00807
G1 X135.934 Y136.572 E.00827
; LINE_WIDTH: 0.524692
G1 X135.861 Y136.349 E.00922
G1 X135.696 Y136.52 E.00936
; LINE_WIDTH: 0.487444
G1 X120.793 Y136.52 E.53982
; LINE_WIDTH: 0.526875
G1 X120.68 Y136.394 E.0067
M204 S10000
G1 X118.965 Y133.929 F42000
; Slow Down Start
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X118.965 Y120.925 E.36028
; Slow Down End
M204 S10000
G1 X119.027 Y120.504 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X118.95 Y120.502 E.00253
G1 X118.95 Y118.95 E.05148
G3 X119.175 Y119.427 I-.126 J.351 E.01941
G1 X119.378 Y119.63 E.00954
G1 X119.327 Y122.949 E.1101
M204 S10000
G1 X124.325 Y129.373 F42000
G1 F15476.087
M204 S6000
G1 X125.452 Y130.548 E.05401
G1 X125.208 Y130.792 E.01144
G1 X123.116 Y130.792 E.06939
G1 X119.327 Y127.003 E.17773
G1 X119.327 Y128.997 E.06611
G1 X121.694 Y126.63 E.11102
G1 X120.567 Y125.455 E.05401
M204 S10000
G1 X119.327 Y132.894 F42000
G1 F15476.087
M204 S6000
G1 X119.327 Y134.119 E.04066
G1 X118.996 Y134.348 E.01335
G1 X120.187 Y135.539 E.05585
G1 X120.187 Y135.813 E.00912
G1 X118.95 Y137.05 E.058
G1 X118.95 Y135.421 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15476.087
G1 X118.95 Y137.05 E-.61876
G1 X119.213 Y136.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/100
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
M106 S198.9
M204 S10000
G17
G3 Z19.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z19.6 F4000
            G39.3 S1
            G0 Z19.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z19.400
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z19.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.6 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z19.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
M106 S255
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F15476.087
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.6 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X123.833 Y119.898
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X135.718 Y119.898 E.39426
G1 X135.718 Y124.325 E.14686
G1 X127.801 Y124.325 E.26264
G1 X135.411 Y132.26 E.36471
G1 X135.411 Y136.102 E.12745
G1 X121.09 Y136.102 E.47507
G1 X121.09 Y131.695 E.14618
G1 X127.804 Y131.695 E.22272
G1 X120.282 Y123.853 E.36049
G1 X120.282 Y119.898 E.13118
G1 X123.773 Y119.898 E.11582
; WIPE_START
G1 X125.773 Y119.898 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.881 Y123.933 Z19.6 F42000
G1 Z19.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X135.019 Y132.418 E.36124
G1 X135.019 Y135.71 E.10117
G1 X121.482 Y135.71 E.41596
G1 X121.482 Y132.087 E.11131
G1 X128.723 Y132.087 E.22251
G1 X120.674 Y123.695 E.35733
G1 X120.674 Y120.29 E.10462
G1 X135.326 Y120.29 E.45023
G1 X135.326 Y123.933 E.11194
G1 X126.941 Y123.933 E.25764
; WIPE_START
M204 S6000
G1 X128.321 Y125.382 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.921 Y131.472 Z19.6 F42000
G1 X137.398 Y137.398 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.529 Y136.013 Z19.6 F42000
G1 Z19.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40332
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X137.028 Y135.526 E.0363
G1 X137.028 Y134.893 E.03297
G1 X136.253 Y135.649 E.05638
G1 X136.253 Y135.301 E.01814
G1 X135.909 Y135.351 E.01808
G1 X137.028 Y134.259 E.08137
G1 X137.028 Y133.626 E.03297
G1 X135.781 Y134.843 E.09071
G1 X135.781 Y134.21 E.03297
G1 X137.028 Y132.993 E.09071
G1 X137.028 Y132.359 E.03297
G1 X135.781 Y133.576 E.09071
G1 X135.781 Y132.943 E.03297
G1 X137.028 Y131.726 E.09071
G1 X137.028 Y131.093 E.03297
G1 X135.781 Y132.31 E.09071
G1 X135.781 Y132.111 E.01032
G1 X135.565 Y131.887 E.01621
G1 X137.028 Y130.459 E.10639
G1 X137.028 Y129.826 E.03297
G1 X135.252 Y131.559 E.12921
G1 X134.938 Y131.232 E.0236
G1 X137.028 Y129.192 E.15204
G1 X137.028 Y128.559 E.03297
G1 X134.624 Y130.905 E.17486
G1 X134.31 Y130.578 E.0236
G1 X137.028 Y127.926 E.19768
G1 X137.028 Y127.292 E.03297
G1 X133.996 Y130.251 E.2205
G1 X133.683 Y129.924 E.0236
G1 X137.028 Y126.659 E.24332
G1 X137.028 Y126.026 E.03297
G1 X133.369 Y129.596 E.26615
G1 X133.055 Y129.269 E.0236
G1 X137.028 Y125.392 E.28897
G1 X137.028 Y124.759 E.03297
G1 X132.741 Y128.942 E.31179
G1 X132.427 Y128.615 E.0236
G1 X137.028 Y124.125 E.33461
G1 X137.028 Y123.492 E.03297
G1 X132.114 Y128.288 E.35744
G1 X131.8 Y127.961 E.0236
G1 X135.147 Y124.695 E.24341
G1 X134.498 Y124.695 E.03379
G1 X131.486 Y127.633 E.21903
G1 X131.172 Y127.306 E.0236
G1 X133.849 Y124.695 E.19464
G1 X133.199 Y124.695 E.03379
G1 X130.858 Y126.979 E.17026
G1 X130.545 Y126.652 E.0236
G1 X132.55 Y124.695 E.14587
G1 X131.901 Y124.695 E.03379
G1 X130.231 Y126.325 E.12149
G1 X129.917 Y125.998 E.0236
G1 X131.252 Y124.695 E.0971
G1 X130.603 Y124.695 E.03379
G1 X129.603 Y125.67 E.07272
G1 X129.289 Y125.343 E.0236
G1 X130.161 Y124.492 E.06342
M106 S198.9
M106 S255
M204 S10000
G1 X128.859 Y124.713 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51338
; LAYER_HEIGHT: 0.2
G1 F13391.15
M204 S6000
G2 X128.858 Y124.815 I-.029 J.051 E.00935
; WIPE_START
G1 X128.8 Y124.815 E-.18706
G1 X128.771 Y124.764 E-.19098
G1 X128.8 Y124.713 E-.19098
G1 X128.859 Y124.713 E-.19099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.805 Y131.206 Z19.6 F42000
G1 Z19.2
G1 E.8 F1800
; LINE_WIDTH: 0.51342
G1 F13390.011
M204 S6000
G2 X126.803 Y131.307 I-.029 J.051 E.00936
M204 S10000
G1 X125.447 Y131.528 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40191
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X126.317 Y130.679 E.06286
G1 X126.004 Y130.353 E.02336
G1 X125.007 Y131.326 E.07201
G1 X124.36 Y131.326 E.03345
G1 X125.691 Y130.027 E.09615
G1 X125.379 Y129.7 E.02336
G1 X123.713 Y131.326 E.12029
G1 X123.066 Y131.326 E.03345
G1 X125.066 Y129.374 E.14443
G1 X124.753 Y129.048 E.02336
G1 X122.419 Y131.326 E.16857
G1 X121.772 Y131.326 E.03345
G1 X124.44 Y128.722 E.19271
G1 X124.127 Y128.396 E.02336
G1 X118.972 Y133.426 E.37233
G1 X118.972 Y132.795 E.03264
G1 X123.814 Y128.07 E.34974
G1 X123.502 Y127.744 E.02336
G1 X118.972 Y132.164 E.32715
G1 X118.972 Y131.532 E.03264
G1 X123.189 Y127.417 E.30456
G1 X122.876 Y127.091 E.02336
G1 X118.972 Y130.901 E.28196
G1 X118.972 Y130.269 E.03264
G1 X122.563 Y126.765 E.25937
G1 X122.25 Y126.439 E.02336
G1 X118.972 Y129.638 E.23678
G1 X118.972 Y129.007 E.03264
G1 X121.937 Y126.113 E.21419
G1 X121.625 Y125.787 E.02336
G1 X118.972 Y128.375 E.19159
G1 X118.972 Y127.744 E.03264
G1 X121.312 Y125.46 E.169
G1 X120.999 Y125.134 E.02336
G1 X118.972 Y127.112 E.14641
G1 X118.972 Y126.481 E.03264
G1 X120.686 Y124.808 E.12381
G1 X120.373 Y124.482 E.02336
G1 X118.972 Y125.85 E.10122
G1 X118.972 Y125.218 E.03264
G1 X120.06 Y124.156 E.07863
G1 X119.912 Y124.001 E.01108
G1 X119.912 Y123.669 E.01716
G1 X118.972 Y124.587 E.06791
G1 X118.972 Y123.955 E.03264
G1 X119.912 Y123.038 E.06791
G1 X119.912 Y122.406 E.03264
G1 X118.972 Y123.324 E.06791
G1 X118.972 Y122.693 E.03264
G1 X119.912 Y121.775 E.06791
G1 X119.912 Y121.144 E.03264
G1 X118.972 Y122.061 E.06791
G1 X118.972 Y121.43 E.03264
G1 X119.676 Y120.743 E.05085
M106 S198.9
M106 S255
M204 S10000
G1 X120.923 Y132.154 F42000
G1 F3000
M204 S6000
G1 X118.859 Y134.168 E.14908
M106 S198.9
M106 S255
; WIPE_START
G1 X120.29 Y132.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.781 Y134.232 Z19.6 F42000
G1 X135.822 Y135.8 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.4578
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S6000
G1 X135.823 Y136.166 E.01236
M204 S10000
G1 X136.116 Y136.941 F42000
; LINE_WIDTH: 0.533598
G1 F12000
M204 S6000
G1 X135.865 Y136.957 E.01003
; LINE_WIDTH: 0.502753
G1 X135.615 Y136.972 E.0094
; LINE_WIDTH: 0.470495
G1 X128.251 Y136.972 E.25659
; Slow Down Start
; LINE_WIDTH: 0.438909
G1 F3000;_EXTRUDE_SET_SPEED
G1 X120.886 Y136.972 E.23763
G1 X120.187 Y136.999 E.02259
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.420234
;_EXTRUDE_SET_SPEED
G3 X118.994 Y137.006 I-.691 J-15.732 E.03668
G1 X118.994 Y134.331 E.08224
G1 X120.39 Y133.368 E.05215
; Slow Down End
; LINE_WIDTH: 0.41999
G1 F12000
G1 X120.698 Y133.156 E.01148
; LINE_WIDTH: 0.436825
G1 X120.698 Y134.731 E.05055
; LINE_WIDTH: 0.467867
G1 X120.698 Y136.306 E.05454
G1 X120.886 Y136.528 E.01009
; LINE_WIDTH: 0.50266
G1 X128.251 Y136.528 E.27589
; LINE_WIDTH: 0.53332
G1 X135.615 Y136.528 E.29429
; LINE_WIDTH: 0.498002
G1 X135.78 Y136.497 E.00623
G1 X135.823 Y136.226 E.01019
; LINE_WIDTH: 0.480838
G1 X135.833 Y136.264 E.00142
; LINE_WIDTH: 0.523753
G1 X135.843 Y136.303 E.00155
; LINE_WIDTH: 0.463108
G1 X135.935 Y136.372 E.00396
; LINE_WIDTH: 0.434363
G1 X136.028 Y136.441 E.00369
; LINE_WIDTH: 0.534243
G1 X136.111 Y136.406 E.0036
; LINE_WIDTH: 0.506061
G1 X136.241 Y136.352 E.00532
; LINE_WIDTH: 0.471633
G1 X136.371 Y136.297 E.00493
; LINE_WIDTH: 0.421521
G3 X137.006 Y136.088 I1.351 J3.034 E.02065
G1 X137.006 Y137.006 E.02832
; LINE_WIDTH: 0.441495
G1 X136.876 Y137.006 E.00423
; LINE_WIDTH: 0.484505
G1 X136.746 Y137.006 E.00468
; LINE_WIDTH: 0.479446
G3 X136.315 Y136.967 I-.065 J-1.689 E.01544
; LINE_WIDTH: 0.510517
G1 X136.245 Y136.958 E.00268
; LINE_WIDTH: 0.536186
G1 X136.175 Y136.949 E.00282
M204 S10000
G1 X136.666 Y136.616 F42000
; LINE_WIDTH: 0.44654
G1 F12000
M204 S6000
G3 X136.586 Y136.58 I-.049 J.001 E.00641
M204 S10000
G1 X119.371 Y136.629 F42000
; Slow Down Start
; LINE_WIDTH: 0.41999
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X119.371 Y134.529 E.06452
G1 X120.321 Y133.874 E.03545
G1 X120.321 Y136.306 E.07472
G1 X120.39 Y136.375 E.00302
; Slow Down End
G1 F12000
G1 X120.644 Y136.629 E.01103
G1 X119.431 Y136.629 E.03727
M204 S10000
G1 X119.846 Y134.778 F42000
; LINE_WIDTH: 0.61548
G1 F11003.213
M204 S6000
M73 P94 R1
G1 X119.846 Y136.094 E.06139
; WIPE_START
G1 X119.846 Y134.778 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.176 Y130.514 Z19.6 F42000
G1 X135.886 Y123.974 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40332
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X137.231 Y122.661 E.09784
M106 S198.9
M204 S10000
G1 X137.006 Y119.463 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S6000
G1 X137.006 Y118.994 E.0144
; LINE_WIDTH: 0.436825
G1 X136.464 Y119.011 E.01741
; LINE_WIDTH: 0.486773
G1 X135.922 Y119.028 E.01961
G1 X120.078 Y119.028 E.57304
; LINE_WIDTH: 0.470495
G1 X119.77 Y119.011 E.01073
; LINE_WIDTH: 0.421254
G2 X118.994 Y118.994 I-.542 J7.082 E.02395
G1 X118.994 Y120.518 E.04699
G1 X119.89 Y120.536 E.02761
G1 X119.902 Y119.628 E.02799
; LINE_WIDTH: 0.436825
G1 X119.99 Y119.55 E.00378
; LINE_WIDTH: 0.487206
G1 X120.078 Y119.472 E.00426
G1 X135.922 Y119.472 E.5736
; LINE_WIDTH: 0.470495
G1 X136.01 Y119.55 E.0041
; LINE_WIDTH: 0.420265
G1 X136.098 Y119.628 E.00362
G1 X136.11 Y119.694 E.00208
G1 X136.11 Y122.888 E.09819
G1 X137.006 Y122.276 E.03334
G1 X137.006 Y119.523 E.08467
M204 S10000
G1 X136.537 Y119.463 F42000
; Slow Down Start
; LINE_WIDTH: 0.582341
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X136.558 Y119.694 E.01022
G1 X136.558 Y121.98 E.10046
; Slow Down End
; WIPE_START
G1 X136.558 Y119.98 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.926 Y120.024 Z19.6 F42000
G1 X119.442 Y120.079 Z19.6
G1 Z19.2
G1 E.8 F1800
; LINE_WIDTH: 0.5613
G1 F12000
M204 S6000
G1 X119.461 Y119.523 E.02352
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F12000
G1 X119.442 Y120.079 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/100
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
M106 S201.45
M204 S10000
G17
G3 Z19.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z19.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z19.8 F4000
            G39.3 S1
            G0 Z19.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z19.600
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z19.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F12000
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.8 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z19.4
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F12000
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z19.8 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X123.833 Y119.898
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X135.718 Y119.898 E.39426
G1 X135.718 Y124.325 E.14686
G1 X127.801 Y124.325 E.26264
G1 X135.411 Y132.26 E.36471
G1 X135.411 Y136.102 E.12745
G1 X121.09 Y136.102 E.47507
G1 X121.09 Y131.695 E.14618
G1 X127.804 Y131.695 E.22272
G1 X120.282 Y123.853 E.36049
G1 X120.282 Y119.898 E.13118
G1 X123.773 Y119.898 E.11582
; WIPE_START
G1 X125.773 Y119.898 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.881 Y123.933 Z19.8 F42000
G1 Z19.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X135.019 Y132.418 E.36124
G1 X135.019 Y135.71 E.10117
G1 X121.482 Y135.71 E.41596
G1 X121.482 Y132.087 E.11131
G1 X128.723 Y132.087 E.22251
G1 X120.674 Y123.695 E.35733
G1 X120.674 Y120.29 E.10462
G1 X135.326 Y120.29 E.45023
G1 X135.326 Y123.933 E.11194
G1 X126.941 Y123.933 E.25764
; WIPE_START
M204 S6000
G1 X128.321 Y125.382 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.921 Y131.472 Z19.8 F42000
G1 X137.398 Y137.398 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.168 Y137.345 Z19.8 F42000
G1 X120.886 Y136.972 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48733
G1 F14176.098
M204 S6000
G1 X135.615 Y136.972 E.53338
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X136.008 Y136.989 E.01372
; LINE_WIDTH: 0.420339
G1 F15000
G2 X137.006 Y137.006 I.695 J-11.643 E.03069
G1 X137.006 Y118.994 E.55395
; LINE_WIDTH: 0.436825
G1 X136.464 Y119.011 E.01741
; LINE_WIDTH: 0.486773
G1 F14193.892
G1 X135.922 Y119.028 E.01961
G1 X120.078 Y119.028 E.57304
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X119.77 Y119.011 E.01073
; LINE_WIDTH: 0.420252
G1 F15000
G2 X118.994 Y118.994 I-.542 J7.082 E.02389
G1 X118.994 Y137.006 E.55382
G1 X119.998 Y137.006 E.03085
; LINE_WIDTH: 0.436825
G1 X120.412 Y136.99 E.01331
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X120.826 Y136.974 E.01445
M204 S10000
G1 X119.846 Y136.154 F42000
; LINE_WIDTH: 0.61547
G1 F11003.406
M204 S6000
G1 X119.846 Y131.552 E.21472
M204 S10000
G1 X119.447 Y124.045 F42000
; LINE_WIDTH: 0.562221
G1 F12131.701
M204 S6000
G1 X119.442 Y119.694 E.18411
G1 X119.457 Y119.523 E.0073
; WIPE_START
G1 X119.442 Y119.694 E-.06553
G1 X119.444 Y121.522 E-.69447
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.389 Y128.882 Z19.8 F42000
G1 Z19.4
G1 E.8 F1800
; LINE_WIDTH: 0.61334
G1 F11044.494
M204 S6000
G2 X121.395 Y128.996 I-.032 J.059 E.01312
M204 S10000
G1 X122.464 Y129.418 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X120.879 Y127.766 E.07034
G1 X120.879 Y129.419 E.0508
G3 X122.404 Y129.418 I.999 J261.693 E.04685
M204 S10000
G1 X123.348 Y129.795 F42000
G1 F15000
M204 S6000
G1 X120.502 Y126.828 E.12632
G1 X120.502 Y129.872 E.09352
G1 X120.886 Y129.795 E.01203
G1 X123.288 Y129.795 E.0738
M204 S10000
G1 X124.232 Y130.172 F42000
G1 F15000
M204 S6000
G1 X120.125 Y125.89 E.1823
G1 X120.125 Y130.471 E.14074
G1 X120.379 Y130.274 E.00987
G1 X120.886 Y130.172 E.01591
G1 X124.172 Y130.172 E.10097
M204 S10000
G1 X125.117 Y130.549 F42000
G1 F15000
M204 S6000
G1 X119.748 Y124.952 E.23829
G1 X119.748 Y130.798 E.17962
; LINE_WIDTH: 0.444427
G1 X119.773 Y130.972 E.00573
; LINE_WIDTH: 0.493299
G1 F13988.226
G1 X119.797 Y131.145 E.00643
; LINE_WIDTH: 0.542172
G1 F12618.897
G1 X119.822 Y131.318 E.00712
; LINE_WIDTH: 0.591044
G1 F11493.756
G1 X119.846 Y131.492 E.00782
G1 X119.918 Y131.35 E.00708
; LINE_WIDTH: 0.542172
G1 F12618.897
G1 X119.989 Y131.209 E.00645
; LINE_WIDTH: 0.493299
G1 F13988.226
G1 X120.061 Y131.068 E.00582
; LINE_WIDTH: 0.420736
G1 F15000
G1 X120.132 Y130.926 E.00488
G1 X120.524 Y130.622 E.01527
G1 X120.886 Y130.549 E.01138
G1 X125.057 Y130.549 E.12839
M204 S10000
G1 X126.001 Y130.926 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X119.67 Y124.326 E.28101
; LINE_WIDTH: 0.438859
G1 X119.614 Y124.256 E.00289
; LINE_WIDTH: 0.476597
G1 F14526.966
G1 X119.558 Y124.186 E.00317
; LINE_WIDTH: 0.514334
G1 F13364.057
G1 X119.502 Y124.115 E.00344
; LINE_WIDTH: 0.552072
G1 F12373.534
G1 X119.447 Y124.045 E.00372
G1 X119.428 Y124.145 E.00423
; LINE_WIDTH: 0.514334
G1 F13364.057
G1 X119.409 Y124.246 E.00392
; LINE_WIDTH: 0.476597
G1 F14526.966
G1 X119.39 Y124.346 E.0036
; LINE_WIDTH: 0.420068
G1 F15000
G1 X119.371 Y124.446 E.00313
G1 X119.371 Y136.629 E.37441
G1 X120.644 Y136.629 E.03912
G1 X120.321 Y136.306 E.01405
G1 X120.321 Y131.492 E.14794
G1 X120.434 Y131.152 E.01099
G1 X120.669 Y130.97 E.00915
G1 X120.886 Y130.926 E.00682
G1 X125.941 Y130.926 E.15533
; WIPE_START
G1 X123.941 Y130.926 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.596 Y124.878 Z19.8 F42000
G1 X128.72 Y124.717 Z19.8
G1 Z19.4
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X135.751 Y132.048 E.3121
G1 X135.803 Y132.178 E.00432
G1 X135.803 Y136.306 E.12682
; LINE_WIDTH: 0.437668
G1 X135.729 Y136.416 E.00429
; LINE_WIDTH: 0.487207
G1 F14180.044
G1 X135.654 Y136.526 E.00483
G1 X135.615 Y136.528 E.0014
G1 X120.886 Y136.528 E.53323
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X120.792 Y136.417 E.00508
; LINE_WIDTH: 0.420086
G1 F15000
G1 X120.698 Y136.306 E.00448
G1 X120.698 Y131.492 E.14795
G1 X120.736 Y131.379 E.00366
G1 X120.886 Y131.303 E.00518
G1 X126.885 Y131.303 E.18436
G1 X119.942 Y124.065 E.30826
G1 X119.89 Y123.934 E.00432
G1 X119.902 Y119.628 E.13235
; LINE_WIDTH: 0.436825
G1 X119.99 Y119.55 E.00378
; LINE_WIDTH: 0.487206
G1 F14180.059
G1 X120.078 Y119.472 E.00426
G1 X135.922 Y119.472 E.5736
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X136.01 Y119.55 E.0041
; LINE_WIDTH: 0.42015
G1 F15000
G1 X136.098 Y119.628 E.00362
G1 X136.11 Y119.694 E.00207
G1 X136.11 Y124.529 E.1486
G1 X136.035 Y124.679 E.00518
G1 X135.922 Y124.717 E.00367
G1 X128.78 Y124.717 E.21953
M204 S10000
G1 X129.604 Y125.094 F42000
; LINE_WIDTH: 0.433809
G1 F15000
M204 S6000
G1 X136.023 Y131.787 E.29537
G1 X136.198 Y132.178 E.01366
G1 X136.198 Y136.306 E.13147
G1 X136.195 Y136.377 E.00226
G1 X135.974 Y136.61 E.01023
G1 X136.61 Y136.61 E.02023
G2 X136.611 Y132.178 I-461.274 J-2.368 E.14115
G1 X136.629 Y131.543 E.02023
G1 X136.629 Y125.165 E.20316
; LINE_WIDTH: 0.438857
G1 X136.61 Y125.034 E.00428
; LINE_WIDTH: 0.476589
G1 F14527.218
G1 X136.591 Y124.902 E.00469
; LINE_WIDTH: 0.514322
G1 F13364.411
G1 X136.572 Y124.771 E.0051
; LINE_WIDTH: 0.552054
G1 F12373.959
G1 X136.553 Y124.639 E.00551
G1 X136.48 Y124.725 E.00466
; LINE_WIDTH: 0.514322
G1 F13364.411
G1 X136.407 Y124.81 E.00432
; LINE_WIDTH: 0.476589
G1 F14527.218
G1 X136.334 Y124.896 E.00397
; LINE_WIDTH: 0.420305
G1 F15000
G1 X136.261 Y124.981 E.00346
G1 X135.922 Y125.094 E.011
G1 X129.664 Y125.094 E.19244
M204 S10000
G1 X130.488 Y125.471 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X136.252 Y131.48 E.25583
G1 X136.252 Y125.361 E.18801
G1 X135.922 Y125.471 E.01068
M73 P95 R1
G1 X130.548 Y125.471 E.16511
M204 S10000
G1 X131.373 Y125.848 F42000
G1 F15000
M204 S6000
G1 X135.875 Y130.542 E.19985
G1 X135.875 Y125.848 E.14423
G1 X131.433 Y125.848 E.13649
M204 S10000
G1 X132.257 Y126.225 F42000
G1 F15000
M204 S6000
G1 X135.498 Y129.604 E.14386
G1 X135.498 Y126.225 E.10383
G1 X132.317 Y126.225 E.09774
M204 S10000
G1 X133.141 Y126.603 F42000
G1 F15000
M204 S6000
G1 X135.121 Y128.667 E.08788
G1 X135.121 Y126.603 E.06342
G1 X133.201 Y126.603 E.05899
M204 S10000
G1 X134.056 Y126.993 F42000
; LINE_WIDTH: 0.44628
G1 F15000
M204 S6000
G1 X134.73 Y127.696 E.03203
G1 X134.73 Y126.993 E.02312
G1 X134.116 Y126.993 E.0202
; WIPE_START
G1 X134.73 Y126.993 E-.23355
G1 X134.73 Y127.696 E-.26727
G1 X134.258 Y127.204 E-.25918
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.414 Y119.882 Z19.8 F42000
G1 X136.537 Y119.463 Z19.8
G1 Z19.4
G1 E.8 F1800
; LINE_WIDTH: 0.562285
G1 F12130.209
M204 S6000
G1 X136.558 Y119.694 E.00984
G1 X136.556 Y124.579 E.20674
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F12130.209
G1 X136.557 Y122.579 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/100
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
M204 S10000
G17
G3 Z19.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z20 F4000
            G39.3 S1
            G0 Z20 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z19.800
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z19.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F12130.209
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z19.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F12130.209
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X123.833 Y119.898
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X135.718 Y119.898 E.39426
G1 X135.718 Y124.325 E.14686
G1 X127.801 Y124.325 E.26264
G1 X135.411 Y132.26 E.36471
G1 X135.411 Y136.102 E.12745
G1 X121.09 Y136.102 E.47507
G1 X121.09 Y131.695 E.14618
G1 X127.804 Y131.695 E.22272
G1 X120.282 Y123.853 E.36049
G1 X120.282 Y119.898 E.13118
G1 X123.773 Y119.898 E.11582
; WIPE_START
G1 X125.773 Y119.898 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.881 Y123.933 Z20 F42000
G1 Z19.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X135.019 Y132.418 E.36124
G1 X135.019 Y135.71 E.10117
G1 X121.482 Y135.71 E.41596
G1 X121.482 Y132.087 E.11131
G1 X128.723 Y132.087 E.22251
G1 X120.674 Y123.695 E.35733
G1 X120.674 Y120.29 E.10462
G1 X135.326 Y120.29 E.45023
G1 X135.326 Y123.933 E.11194
G1 X126.941 Y123.933 E.25764
; WIPE_START
M204 S6000
G1 X128.321 Y125.382 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.921 Y131.472 Z20 F42000
G1 X137.398 Y137.398 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.168 Y137.345 Z20 F42000
G1 X120.886 Y136.972 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48733
G1 F14176.098
M204 S6000
G1 X135.615 Y136.972 E.53338
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X136.008 Y136.989 E.01372
; LINE_WIDTH: 0.420339
G1 F15000
G2 X137.006 Y137.006 I.695 J-11.643 E.03069
G1 X137.006 Y118.994 E.55395
; LINE_WIDTH: 0.436825
G1 X136.464 Y119.011 E.01741
; LINE_WIDTH: 0.486773
G1 F14193.892
G1 X135.922 Y119.028 E.01961
G1 X120.078 Y119.028 E.57304
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X119.77 Y119.011 E.01073
; LINE_WIDTH: 0.420252
G1 F15000
G2 X118.994 Y118.994 I-.542 J7.082 E.02389
G1 X118.994 Y137.006 E.55382
G1 X119.998 Y137.006 E.03085
; LINE_WIDTH: 0.436825
G1 X120.412 Y136.99 E.01331
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X120.826 Y136.974 E.01445
M204 S10000
G1 X119.846 Y136.154 F42000
; LINE_WIDTH: 0.61547
G1 F11003.406
M204 S6000
G1 X119.846 Y131.552 E.21472
M204 S10000
G1 X119.447 Y124.045 F42000
; LINE_WIDTH: 0.562221
G1 F12131.701
M204 S6000
G1 X119.442 Y119.694 E.18411
G1 X119.457 Y119.523 E.0073
; WIPE_START
G1 X119.442 Y119.694 E-.06553
G1 X119.444 Y121.522 E-.69447
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.389 Y128.882 Z20 F42000
G1 Z19.6
G1 E.8 F1800
; LINE_WIDTH: 0.61334
G1 F11044.494
M204 S6000
G2 X121.395 Y128.996 I-.032 J.059 E.01312
M204 S10000
G1 X122.464 Y129.418 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X120.879 Y127.766 E.07034
G1 X120.879 Y129.419 E.0508
G3 X122.404 Y129.418 I.999 J261.693 E.04685
M204 S10000
G1 X123.348 Y129.795 F42000
G1 F15000
M204 S6000
G1 X120.502 Y126.828 E.12632
G1 X120.502 Y129.872 E.09352
G1 X120.886 Y129.795 E.01203
G1 X123.288 Y129.795 E.0738
M204 S10000
G1 X124.232 Y130.172 F42000
G1 F15000
M204 S6000
G1 X120.125 Y125.89 E.1823
G1 X120.125 Y130.471 E.14074
G1 X120.379 Y130.274 E.00987
G1 X120.886 Y130.172 E.01591
G1 X124.172 Y130.172 E.10097
M204 S10000
G1 X125.117 Y130.549 F42000
G1 F15000
M204 S6000
G1 X119.748 Y124.952 E.23829
G1 X119.748 Y130.798 E.17962
; LINE_WIDTH: 0.444427
G1 X119.773 Y130.972 E.00573
; LINE_WIDTH: 0.493299
G1 F13988.226
G1 X119.797 Y131.145 E.00643
; LINE_WIDTH: 0.542172
G1 F12618.897
G1 X119.822 Y131.318 E.00712
; LINE_WIDTH: 0.591044
G1 F11493.756
G1 X119.846 Y131.492 E.00782
G1 X119.918 Y131.35 E.00708
; LINE_WIDTH: 0.542172
G1 F12618.897
G1 X119.989 Y131.209 E.00645
; LINE_WIDTH: 0.493299
G1 F13988.226
G1 X120.061 Y131.068 E.00582
; LINE_WIDTH: 0.420736
G1 F15000
G1 X120.132 Y130.926 E.00488
G1 X120.524 Y130.622 E.01527
G1 X120.886 Y130.549 E.01138
G1 X125.057 Y130.549 E.12839
M204 S10000
G1 X126.001 Y130.926 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X119.67 Y124.326 E.28101
; LINE_WIDTH: 0.438859
G1 X119.614 Y124.256 E.00289
; LINE_WIDTH: 0.476597
G1 F14526.966
G1 X119.558 Y124.186 E.00317
; LINE_WIDTH: 0.514334
G1 F13364.057
G1 X119.502 Y124.115 E.00344
; LINE_WIDTH: 0.552072
G1 F12373.534
G1 X119.447 Y124.045 E.00372
G1 X119.428 Y124.145 E.00423
; LINE_WIDTH: 0.514334
G1 F13364.057
G1 X119.409 Y124.246 E.00392
; LINE_WIDTH: 0.476597
G1 F14526.966
G1 X119.39 Y124.346 E.0036
; LINE_WIDTH: 0.420068
G1 F15000
G1 X119.371 Y124.446 E.00313
G1 X119.371 Y136.629 E.37441
G1 X120.644 Y136.629 E.03912
G1 X120.321 Y136.306 E.01405
G1 X120.321 Y131.492 E.14794
G1 X120.434 Y131.152 E.01099
G1 X120.669 Y130.97 E.00915
G1 X120.886 Y130.926 E.00682
G1 X125.941 Y130.926 E.15533
; WIPE_START
G1 X123.941 Y130.926 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.596 Y124.878 Z20 F42000
G1 X128.72 Y124.717 Z20
G1 Z19.6
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X135.751 Y132.048 E.3121
G1 X135.803 Y132.178 E.00432
G1 X135.803 Y136.306 E.12682
; LINE_WIDTH: 0.437668
G1 X135.729 Y136.416 E.00429
; LINE_WIDTH: 0.487207
G1 F14180.044
G1 X135.654 Y136.526 E.00483
G1 X135.615 Y136.528 E.0014
G1 X120.886 Y136.528 E.53323
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X120.792 Y136.417 E.00508
; LINE_WIDTH: 0.420086
G1 F15000
G1 X120.698 Y136.306 E.00448
G1 X120.698 Y131.492 E.14795
G1 X120.736 Y131.379 E.00366
G1 X120.886 Y131.303 E.00518
G1 X126.885 Y131.303 E.18436
G1 X119.942 Y124.065 E.30826
G1 X119.89 Y123.934 E.00432
G1 X119.902 Y119.628 E.13235
; LINE_WIDTH: 0.436825
G1 X119.99 Y119.55 E.00378
; LINE_WIDTH: 0.487206
G1 F14180.059
G1 X120.078 Y119.472 E.00426
G1 X135.922 Y119.472 E.5736
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X136.01 Y119.55 E.0041
; LINE_WIDTH: 0.42015
G1 F15000
G1 X136.098 Y119.628 E.00362
G1 X136.11 Y119.694 E.00207
G1 X136.11 Y124.529 E.1486
G1 X136.035 Y124.679 E.00518
M73 P95 R0
G1 X135.922 Y124.717 E.00367
G1 X128.78 Y124.717 E.21953
M204 S10000
G1 X129.604 Y125.094 F42000
; LINE_WIDTH: 0.433809
G1 F15000
M204 S6000
G1 X136.023 Y131.787 E.29537
G1 X136.198 Y132.178 E.01366
G1 X136.198 Y136.306 E.13147
G1 X136.195 Y136.377 E.00226
G1 X135.974 Y136.61 E.01023
G1 X136.61 Y136.61 E.02023
G2 X136.611 Y132.178 I-461.274 J-2.368 E.14115
G1 X136.629 Y131.543 E.02023
G1 X136.629 Y125.165 E.20316
; LINE_WIDTH: 0.438857
G1 X136.61 Y125.034 E.00428
; LINE_WIDTH: 0.476589
G1 F14527.218
G1 X136.591 Y124.902 E.00469
; LINE_WIDTH: 0.514322
G1 F13364.411
G1 X136.572 Y124.771 E.0051
; LINE_WIDTH: 0.552054
G1 F12373.959
G1 X136.553 Y124.639 E.00551
G1 X136.48 Y124.725 E.00466
; LINE_WIDTH: 0.514322
G1 F13364.411
G1 X136.407 Y124.81 E.00432
; LINE_WIDTH: 0.476589
G1 F14527.218
G1 X136.334 Y124.896 E.00397
; LINE_WIDTH: 0.420305
G1 F15000
G1 X136.261 Y124.981 E.00346
G1 X135.922 Y125.094 E.011
G1 X129.664 Y125.094 E.19244
M204 S10000
G1 X130.488 Y125.471 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X136.252 Y131.48 E.25583
G1 X136.252 Y125.361 E.18801
G1 X135.922 Y125.471 E.01068
G1 X130.548 Y125.471 E.16511
M204 S10000
G1 X131.373 Y125.848 F42000
G1 F15000
M204 S6000
G1 X135.875 Y130.542 E.19985
G1 X135.875 Y125.848 E.14423
G1 X131.433 Y125.848 E.13649
M204 S10000
G1 X132.257 Y126.225 F42000
G1 F15000
M204 S6000
G1 X135.498 Y129.604 E.14386
G1 X135.498 Y126.225 E.10383
G1 X132.317 Y126.225 E.09774
M204 S10000
G1 X133.141 Y126.603 F42000
G1 F15000
M204 S6000
G1 X135.121 Y128.667 E.08788
G1 X135.121 Y126.603 E.06342
G1 X133.201 Y126.603 E.05899
M204 S10000
G1 X134.056 Y126.993 F42000
; LINE_WIDTH: 0.44628
G1 F15000
M204 S6000
G1 X134.73 Y127.696 E.03203
G1 X134.73 Y126.993 E.02312
G1 X134.116 Y126.993 E.0202
; WIPE_START
G1 X134.73 Y126.993 E-.23355
G1 X134.73 Y127.696 E-.26727
G1 X134.258 Y127.204 E-.25918
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.414 Y119.882 Z20 F42000
G1 X136.537 Y119.463 Z20
G1 Z19.6
G1 E.8 F1800
; LINE_WIDTH: 0.562285
G1 F12130.209
M204 S6000
G1 X136.558 Y119.694 E.00984
G1 X136.556 Y124.579 E.20674
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F12130.209
G1 X136.557 Y122.579 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/100
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
M204 S10000
G17
G3 Z20 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z20.2 F4000
            G39.3 S1
            G0 Z20.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z20.000
M204 S10000
M73 P96 R0
G1 X40.52 Y239.602 F42000
G1 Z19.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F12130.209
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.2 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z19.8
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F12130.209
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.2 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X123.833 Y119.898
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
M204 S6000
G1 X135.718 Y119.898 E.39426
G1 X135.718 Y124.325 E.14686
G1 X127.801 Y124.325 E.26264
G1 X135.411 Y132.26 E.36471
G1 X135.411 Y136.102 E.12745
G1 X121.09 Y136.102 E.47507
G1 X121.09 Y131.695 E.14618
G1 X127.804 Y131.695 E.22272
G1 X120.282 Y123.853 E.36049
G1 X120.282 Y119.898 E.13118
G1 X123.773 Y119.898 E.11582
; WIPE_START
G1 X125.773 Y119.898 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.881 Y123.933 Z20.2 F42000
G1 Z19.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X135.019 Y132.418 E.36124
G1 X135.019 Y135.71 E.10117
G1 X121.482 Y135.71 E.41596
G1 X121.482 Y132.087 E.11131
G1 X128.723 Y132.087 E.22251
G1 X120.674 Y123.695 E.35733
G1 X120.674 Y120.29 E.10462
G1 X135.326 Y120.29 E.45023
G1 X135.326 Y123.933 E.11194
G1 X126.941 Y123.933 E.25764
; WIPE_START
M204 S6000
G1 X128.321 Y125.382 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.921 Y131.472 Z20.2 F42000
G1 X137.398 Y137.398 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
M204 S6000
G1 X118.602 Y137.398 E.62349
G1 X118.602 Y118.602 E.62349
G1 X137.398 Y118.602 E.62349
G1 X137.398 Y137.338 E.6215
M204 S250
G1 X137.79 Y137.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
; WIPE_START
M204 S6000
G1 X135.79 Y137.736 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.168 Y137.345 Z20.2 F42000
G1 X120.886 Y136.972 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48733
G1 F14176.098
M204 S6000
G1 X135.615 Y136.972 E.53338
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X136.008 Y136.989 E.01372
; LINE_WIDTH: 0.420339
G1 F15000
G2 X137.006 Y137.006 I.695 J-11.643 E.03069
G1 X137.006 Y118.994 E.55395
; LINE_WIDTH: 0.436825
G1 X136.464 Y119.011 E.01741
; LINE_WIDTH: 0.486773
G1 F14193.892
G1 X135.922 Y119.028 E.01961
G1 X120.078 Y119.028 E.57304
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X119.77 Y119.011 E.01073
; LINE_WIDTH: 0.420252
G1 F15000
G2 X118.994 Y118.994 I-.542 J7.082 E.02389
G1 X118.994 Y137.006 E.55382
G1 X119.998 Y137.006 E.03085
; LINE_WIDTH: 0.436825
G1 X120.412 Y136.99 E.01331
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X120.826 Y136.974 E.01445
M204 S10000
G1 X119.846 Y136.154 F42000
; LINE_WIDTH: 0.61547
G1 F11003.406
M204 S6000
G1 X119.846 Y131.552 E.21472
M204 S10000
G1 X119.447 Y124.045 F42000
; LINE_WIDTH: 0.562221
G1 F12131.701
M204 S6000
G1 X119.442 Y119.694 E.18411
G1 X119.457 Y119.523 E.0073
; WIPE_START
G1 X119.442 Y119.694 E-.06553
G1 X119.444 Y121.522 E-.69447
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.389 Y128.882 Z20.2 F42000
G1 Z19.8
G1 E.8 F1800
; LINE_WIDTH: 0.61334
G1 F11044.494
M204 S6000
G2 X121.395 Y128.996 I-.032 J.059 E.01312
M204 S10000
G1 X122.464 Y129.418 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X120.879 Y127.766 E.07034
G1 X120.879 Y129.419 E.0508
G3 X122.404 Y129.418 I.999 J261.693 E.04685
M204 S10000
G1 X123.348 Y129.795 F42000
G1 F15000
M204 S6000
G1 X120.502 Y126.828 E.12632
G1 X120.502 Y129.872 E.09352
G1 X120.886 Y129.795 E.01203
G1 X123.288 Y129.795 E.0738
M204 S10000
G1 X124.232 Y130.172 F42000
G1 F15000
M204 S6000
G1 X120.125 Y125.89 E.1823
G1 X120.125 Y130.471 E.14074
G1 X120.379 Y130.274 E.00987
G1 X120.886 Y130.172 E.01591
G1 X124.172 Y130.172 E.10097
M204 S10000
G1 X125.117 Y130.549 F42000
G1 F15000
M204 S6000
G1 X119.748 Y124.952 E.23829
G1 X119.748 Y130.798 E.17962
; LINE_WIDTH: 0.444427
G1 X119.773 Y130.972 E.00573
; LINE_WIDTH: 0.493299
G1 F13988.226
G1 X119.797 Y131.145 E.00643
; LINE_WIDTH: 0.542172
G1 F12618.897
G1 X119.822 Y131.318 E.00712
; LINE_WIDTH: 0.591044
G1 F11493.756
G1 X119.846 Y131.492 E.00782
G1 X119.918 Y131.35 E.00708
; LINE_WIDTH: 0.542172
G1 F12618.897
G1 X119.989 Y131.209 E.00645
; LINE_WIDTH: 0.493299
G1 F13988.226
G1 X120.061 Y131.068 E.00582
; LINE_WIDTH: 0.420736
G1 F15000
G1 X120.132 Y130.926 E.00488
G1 X120.524 Y130.622 E.01527
G1 X120.886 Y130.549 E.01138
G1 X125.057 Y130.549 E.12839
M204 S10000
G1 X126.001 Y130.926 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X119.67 Y124.326 E.28101
; LINE_WIDTH: 0.438859
G1 X119.614 Y124.256 E.00289
; LINE_WIDTH: 0.476597
G1 F14526.966
G1 X119.558 Y124.186 E.00317
; LINE_WIDTH: 0.514334
G1 F13364.057
G1 X119.502 Y124.115 E.00344
; LINE_WIDTH: 0.552072
G1 F12373.534
G1 X119.447 Y124.045 E.00372
G1 X119.428 Y124.145 E.00423
; LINE_WIDTH: 0.514334
G1 F13364.057
G1 X119.409 Y124.246 E.00392
; LINE_WIDTH: 0.476597
G1 F14526.966
G1 X119.39 Y124.346 E.0036
; LINE_WIDTH: 0.420068
G1 F15000
G1 X119.371 Y124.446 E.00313
G1 X119.371 Y136.629 E.37441
G1 X120.644 Y136.629 E.03912
G1 X120.321 Y136.306 E.01405
G1 X120.321 Y131.492 E.14794
G1 X120.434 Y131.152 E.01099
G1 X120.669 Y130.97 E.00915
G1 X120.886 Y130.926 E.00682
G1 X125.941 Y130.926 E.15533
; WIPE_START
G1 X123.941 Y130.926 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.596 Y124.878 Z20.2 F42000
G1 X128.72 Y124.717 Z20.2
G1 Z19.8
G1 E.8 F1800
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X135.751 Y132.048 E.3121
G1 X135.803 Y132.178 E.00432
G1 X135.803 Y136.306 E.12682
; LINE_WIDTH: 0.437668
G1 X135.729 Y136.416 E.00429
; LINE_WIDTH: 0.487207
G1 F14180.044
G1 X135.654 Y136.526 E.00483
G1 X135.615 Y136.528 E.0014
G1 X120.886 Y136.528 E.53323
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X120.792 Y136.417 E.00508
; LINE_WIDTH: 0.420086
G1 F15000
G1 X120.698 Y136.306 E.00448
G1 X120.698 Y131.492 E.14795
G1 X120.736 Y131.379 E.00366
G1 X120.886 Y131.303 E.00518
G1 X126.885 Y131.303 E.18436
G1 X119.942 Y124.065 E.30826
G1 X119.89 Y123.934 E.00432
G1 X119.902 Y119.628 E.13235
; LINE_WIDTH: 0.436825
G1 X119.99 Y119.55 E.00378
; LINE_WIDTH: 0.487206
G1 F14180.059
G1 X120.078 Y119.472 E.00426
G1 X135.922 Y119.472 E.5736
; LINE_WIDTH: 0.470495
G1 F14734.257
G1 X136.01 Y119.55 E.0041
; LINE_WIDTH: 0.42015
G1 F15000
G1 X136.098 Y119.628 E.00362
G1 X136.11 Y119.694 E.00207
G1 X136.11 Y124.529 E.1486
G1 X136.035 Y124.679 E.00518
G1 X135.922 Y124.717 E.00367
G1 X128.78 Y124.717 E.21953
M204 S10000
G1 X129.604 Y125.094 F42000
; LINE_WIDTH: 0.433809
G1 F15000
M204 S6000
G1 X136.023 Y131.787 E.29537
G1 X136.198 Y132.178 E.01366
G1 X136.198 Y136.306 E.13147
G1 X136.195 Y136.377 E.00226
G1 X135.974 Y136.61 E.01023
G1 X136.61 Y136.61 E.02023
G2 X136.611 Y132.178 I-461.274 J-2.368 E.14115
G1 X136.629 Y131.543 E.02023
G1 X136.629 Y125.165 E.20316
; LINE_WIDTH: 0.438857
G1 X136.61 Y125.034 E.00428
; LINE_WIDTH: 0.476589
G1 F14527.218
G1 X136.591 Y124.902 E.00469
; LINE_WIDTH: 0.514322
G1 F13364.411
G1 X136.572 Y124.771 E.0051
; LINE_WIDTH: 0.552054
G1 F12373.959
G1 X136.553 Y124.639 E.00551
G1 X136.48 Y124.725 E.00466
; LINE_WIDTH: 0.514322
G1 F13364.411
G1 X136.407 Y124.81 E.00432
; LINE_WIDTH: 0.476589
G1 F14527.218
G1 X136.334 Y124.896 E.00397
; LINE_WIDTH: 0.420305
G1 F15000
G1 X136.261 Y124.981 E.00346
G1 X135.922 Y125.094 E.011
G1 X129.664 Y125.094 E.19244
M204 S10000
G1 X130.488 Y125.471 F42000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S6000
G1 X136.252 Y131.48 E.25583
G1 X136.252 Y125.361 E.18801
G1 X135.922 Y125.471 E.01068
G1 X130.548 Y125.471 E.16511
M204 S10000
G1 X131.373 Y125.848 F42000
G1 F15000
M204 S6000
G1 X135.875 Y130.542 E.19985
G1 X135.875 Y125.848 E.14423
G1 X131.433 Y125.848 E.13649
M204 S10000
G1 X132.257 Y126.225 F42000
G1 F15000
M204 S6000
G1 X135.498 Y129.604 E.14386
G1 X135.498 Y126.225 E.10383
G1 X132.317 Y126.225 E.09774
M204 S10000
G1 X133.141 Y126.603 F42000
G1 F15000
M204 S6000
G1 X135.121 Y128.667 E.08788
G1 X135.121 Y126.603 E.06342
G1 X133.201 Y126.603 E.05899
M204 S10000
G1 X134.056 Y126.993 F42000
; LINE_WIDTH: 0.44628
G1 F15000
M204 S6000
G1 X134.73 Y127.696 E.03203
G1 X134.73 Y126.993 E.02312
G1 X134.116 Y126.993 E.0202
; WIPE_START
G1 X134.73 Y126.993 E-.23355
G1 X134.73 Y127.696 E-.26727
G1 X134.258 Y127.204 E-.25918
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.414 Y119.882 Z20.2 F42000
G1 X136.537 Y119.463 Z20.2
G1 Z19.8
G1 E.8 F1800
; LINE_WIDTH: 0.562285
G1 F12130.209
M204 S6000
G1 X136.558 Y119.694 E.00984
G1 X136.556 Y124.579 E.20674
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F12130.209
G1 X136.557 Y122.579 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/100
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
M204 S10000
G17
G3 Z20.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z20.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z20.4 F4000
            G39.3 S1
            G0 Z20.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 Z20.200
M204 S10000
G1 X40.52 Y239.602 F42000
G1 Z20
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X41.020 Y239.602 
M204 S6000
G1  X31.019  E0.3801 F5400
G1  Y232.234  E0.2800
G1  X41.020  E0.3801
G1  Y239.602  E0.2800
; WIPE_TOWER_END

; WIPE_START
G1 F12130.209
M204 S6000
G1 X41.02 Y237.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.4 I1.217 J0 P1  F42000
M204 S10000
G1 X40.52 Y239.102
G1 Z20
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X31.519 Y239.102  E0.3421 F5400
G1  Y232.734  E0.2420
G1  X40.520  E0.3421
G1  Y239.102  E0.2420
; WIPE_TOWER_END

; WIPE_START
G1 F12130.209
M204 S6000
G1 X38.52 Y239.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.4 I1.217 J0 P1  F42000
; OBJECT_ID: 99
M204 S10000
G1 X126.881 Y123.933
G1 Z20
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G1 X135.019 Y132.418 E.36124
G1 X135.019 Y135.71 E.10117
G1 X121.482 Y135.71 E.41596
G1 X121.482 Y132.087 E.11131
G1 X128.723 Y132.087 E.22251
G1 X120.674 Y123.695 E.35733
G1 X120.674 Y120.29 E.10462
G1 X135.326 Y120.29 E.45023
G1 X135.326 Y123.933 E.11194
G1 X126.941 Y123.933 E.25764
; WIPE_START
M204 S6000
G1 X128.321 Y125.382 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.951 Y131.449 Z20.4 F42000
G1 X137.79 Y137.79 Z20.4
G1 Z20
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X118.21 Y137.79 E.60164
G1 X118.21 Y118.21 E.60164
G1 X137.79 Y118.21 E.60164
G1 X137.79 Y137.73 E.5998
M204 S10000
G1 X136.815 Y137.583 F42000
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X137.583 Y136.815 E.03337
G1 X137.583 Y136.281
G1 X136.281 Y137.583 E.05654
G1 X135.748 Y137.583
G1 X137.583 Y135.748 E.07972
G1 X137.583 Y135.215
G1 X135.215 Y137.583 E.10289
G1 X134.682 Y137.583
G1 X137.583 Y134.682 E.12606
G1 X137.583 Y134.148
G1 X134.148 Y137.583 E.14923
G1 X133.615 Y137.583
G1 X137.583 Y133.615 E.17241
G1 X137.583 Y133.082
G1 X135.227 Y135.438 E.10237
G1 X135.227 Y134.905
G1 X137.583 Y132.549 E.10237
G1 X137.583 Y132.015
G1 X135.227 Y134.371 E.10237
G1 X135.227 Y133.838
G1 X137.583 Y131.482 E.10238
G1 X137.583 Y130.949
G1 X135.227 Y133.305 E.10238
G1 X135.227 Y132.771
G1 X137.583 Y130.416 E.10238
G1 X137.583 Y129.882
G1 X135.18 Y132.285 E.10442
G1 X134.919 Y132.013
G1 X137.583 Y129.349 E.11576
G1 X137.583 Y128.816
G1 X134.658 Y131.741 E.12711
G1 X134.397 Y131.469
G1 X137.583 Y128.283 E.13845
G1 X137.583 Y127.749
G1 X134.135 Y131.196 E.1498
G1 X133.874 Y130.924
G1 X137.583 Y127.216 E.16114
G1 X137.583 Y126.683
G1 X133.613 Y130.652 E.17249
G1 X133.352 Y130.38
G1 X137.583 Y126.15 E.18383
G1 X137.583 Y125.616
G1 X133.091 Y130.108 E.19517
G1 X132.83 Y129.836
G1 X137.583 Y125.083 E.20652
G1 X137.583 Y124.55
G1 X132.569 Y129.563 E.21786
G1 X132.308 Y129.291
G1 X137.583 Y124.017 E.22921
G1 X137.583 Y123.483
G1 X132.047 Y129.019 E.24055
G1 X131.786 Y128.747
G1 X137.583 Y122.95 E.2519
G1 X137.583 Y122.417
G1 X131.525 Y128.475 E.26324
G1 X131.264 Y128.202
G1 X135.326 Y124.14 E.17651
G1 X134.792 Y124.14
G1 X131.003 Y127.93 E.16468
G1 X130.742 Y127.658
G1 X134.259 Y124.14 E.15286
G1 X133.726 Y124.14
G1 X130.481 Y127.386 E.14103
G1 X130.219 Y127.114
G1 X133.193 Y124.14 E.1292
G1 X132.659 Y124.14
M73 P97 R0
G1 X129.958 Y126.841 E.11737
G1 X129.697 Y126.569
G1 X132.126 Y124.14 E.10554
G1 X131.593 Y124.14
G1 X129.436 Y126.297 E.09372
G1 X129.175 Y126.025
G1 X131.06 Y124.14 E.08189
G1 X130.526 Y124.14
G1 X128.914 Y125.753 E.07006
G1 X128.653 Y125.48
G1 X129.993 Y124.14 E.05823
G1 X129.46 Y124.14
G1 X128.392 Y125.208 E.0464
G1 X128.131 Y124.936
G1 X128.927 Y124.14 E.03458
G1 X128.393 Y124.14
G1 X127.87 Y124.664 E.02275
; WIPE_START
M204 S6000
G1 X128.393 Y124.14 E-.28132
G1 X128.927 Y124.14 E-.20264
G1 X128.413 Y124.654 E-.27604
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.534 Y123.932 Z20.4 F42000
G1 Z20
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X137.583 Y121.883 E.08904
G1 X137.583 Y121.35
G1 X135.534 Y123.399 E.08904
G1 X135.534 Y122.866
G1 X137.583 Y120.817 E.08904
G1 X137.583 Y120.284
G1 X135.534 Y122.333 E.08904
G1 X135.534 Y121.799
G1 X137.583 Y119.75 E.08904
G1 X137.583 Y119.217
G1 X135.534 Y121.266 E.08904
G1 X135.534 Y120.733
G1 X137.583 Y118.684 E.08904
G1 X137.316 Y118.417
G1 X135.534 Y120.2 E.07745
G1 X135.117 Y120.083
G1 X136.783 Y118.417 E.07236
G1 X136.249 Y118.417
G1 X134.584 Y120.083 E.07236
G1 X134.051 Y120.083
G1 X135.716 Y118.417 E.07236
G1 X135.183 Y118.417
G1 X133.518 Y120.083 E.07236
G1 X132.984 Y120.083
G1 X134.65 Y118.417 E.07236
G1 X134.116 Y118.417
G1 X132.451 Y120.083 E.07236
G1 X131.918 Y120.083
G1 X133.583 Y118.417 E.07236
G1 X133.05 Y118.417
G1 X131.385 Y120.083 E.07236
G1 X130.851 Y120.083
G1 X132.517 Y118.417 E.07236
G1 X131.983 Y118.417
G1 X130.318 Y120.083 E.07236
G1 X129.785 Y120.083
G1 X131.45 Y118.417 E.07236
G1 X130.917 Y118.417
G1 X129.252 Y120.083 E.07236
G1 X128.718 Y120.083
G1 X130.384 Y118.417 E.07236
G1 X129.85 Y118.417
G1 X128.185 Y120.083 E.07236
G1 X127.652 Y120.083
G1 X129.317 Y118.417 E.07236
G1 X128.784 Y118.417
G1 X127.119 Y120.083 E.07236
G1 X126.585 Y120.083
G1 X128.251 Y118.417 E.07236
G1 X127.717 Y118.417
G1 X126.052 Y120.083 E.07236
G1 X125.519 Y120.083
G1 X127.184 Y118.417 E.07236
G1 X126.651 Y118.417
G1 X124.986 Y120.083 E.07236
G1 X124.452 Y120.083
G1 X126.118 Y118.417 E.07236
G1 X125.584 Y118.417
G1 X123.919 Y120.083 E.07236
G1 X123.386 Y120.083
G1 X125.051 Y118.417 E.07236
G1 X124.518 Y118.417
G1 X122.853 Y120.083 E.07236
G1 X122.319 Y120.083
G1 X123.984 Y118.417 E.07236
G1 X123.451 Y118.417
G1 X121.786 Y120.083 E.07236
G1 X121.253 Y120.083
G1 X122.918 Y118.417 E.07236
G1 X122.385 Y118.417
G1 X120.719 Y120.083 E.07236
; WIPE_START
M204 S6000
G1 X122.134 Y118.668 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.261 Y125.631 Z20.4 F42000
G1 X127.918 Y131.548 Z20.4
G1 Z20
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X127.586 Y131.88 E.01444
G1 X127.053 Y131.88
G1 X127.657 Y131.275 E.02627
G1 X127.396 Y131.003
G1 X126.52 Y131.88 E.0381
G1 X125.986 Y131.88
G1 X127.135 Y130.731 E.04993
G1 X126.874 Y130.459
G1 X125.453 Y131.88 E.06175
G1 X124.92 Y131.88
G1 X126.613 Y130.187 E.07358
G1 X126.352 Y129.915
G1 X124.387 Y131.88 E.08541
G1 X123.853 Y131.88
G1 X126.091 Y129.642 E.09724
G1 X125.83 Y129.37
G1 X123.32 Y131.88 E.10906
G1 X122.787 Y131.88
G1 X125.569 Y129.098 E.12089
G1 X125.308 Y128.826
G1 X122.253 Y131.88 E.13272
G1 X121.72 Y131.88
G1 X125.047 Y128.554 E.14455
; WIPE_START
M204 S6000
G1 X123.632 Y129.968 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.575 Y134.757 Z20.4 F42000
G1 X133.082 Y137.583 Z20.4
G1 Z20
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X134.747 Y135.917 E.07236
G1 X134.214 Y135.917
G1 X132.549 Y137.583 E.07236
G1 X132.015 Y137.583
G1 X133.681 Y135.917 E.07236
G1 X133.147 Y135.917
G1 X131.482 Y137.583 E.07236
G1 X130.949 Y137.583
G1 X132.614 Y135.917 E.07236
G1 X132.081 Y135.917
G1 X130.416 Y137.583 E.07236
G1 X129.882 Y137.583
G1 X131.548 Y135.917 E.07236
G1 X131.014 Y135.917
G1 X129.349 Y137.583 E.07236
G1 X128.816 Y137.583
G1 X130.481 Y135.917 E.07236
G1 X129.948 Y135.917
G1 X128.283 Y137.583 E.07236
G1 X127.749 Y137.583
G1 X129.415 Y135.917 E.07236
G1 X128.881 Y135.917
G1 X127.216 Y137.583 E.07236
G1 X126.683 Y137.583
G1 X128.348 Y135.917 E.07236
G1 X127.815 Y135.917
G1 X126.15 Y137.583 E.07236
G1 X125.616 Y137.583
G1 X127.282 Y135.917 E.07236
G1 X126.748 Y135.917
G1 X125.083 Y137.583 E.07236
G1 X124.55 Y137.583
G1 X126.215 Y135.917 E.07236
G1 X125.682 Y135.917
G1 X124.017 Y137.583 E.07236
G1 X123.483 Y137.583
G1 X125.148 Y135.917 E.07236
G1 X124.615 Y135.917
G1 X122.95 Y137.583 E.07236
G1 X122.417 Y137.583
G1 X124.082 Y135.917 E.07236
G1 X123.549 Y135.917
G1 X121.883 Y137.583 E.07236
G1 X121.35 Y137.583
G1 X123.015 Y135.917 E.07236
G1 X122.482 Y135.917
G1 X120.817 Y137.583 E.07236
G1 X120.284 Y137.583
G1 X121.949 Y135.917 E.07236
G1 X121.416 Y135.917
G1 X119.75 Y137.583 E.07236
G1 X119.217 Y137.583
G1 X121.275 Y135.525 E.08941
G1 X121.275 Y134.992
G1 X118.684 Y137.583 E.11258
G1 X118.417 Y137.316
G1 X121.275 Y134.459 E.12416
G1 X121.275 Y133.925
G1 X118.417 Y136.783 E.12416
G1 X118.417 Y136.249
G1 X121.275 Y133.392 E.12416
G1 X121.275 Y132.859
G1 X118.417 Y135.716 E.12416
G1 X118.417 Y135.183
G1 X121.275 Y132.326 E.12416
; WIPE_START
M204 S6000
G1 X119.86 Y133.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.417 Y134.65 Z20.4 F42000
G1 Z20
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X124.786 Y128.281 E.27673
G1 X124.524 Y128.009
G1 X118.417 Y134.116 E.26538
G1 X118.417 Y133.583
G1 X124.263 Y127.737 E.25404
G1 X124.002 Y127.465
G1 X118.417 Y133.05 E.24269
G1 X118.417 Y132.517
G1 X123.741 Y127.193 E.23135
G1 X123.48 Y126.921
G1 X118.417 Y131.983 E.22
G1 X118.417 Y131.45
G1 X123.219 Y126.648 E.20866
G1 X122.958 Y126.376
G1 X118.417 Y130.917 E.19732
G1 X118.417 Y130.384
G1 X122.697 Y126.104 E.18597
G1 X122.436 Y125.832
G1 X118.417 Y129.85 E.17463
G1 X118.417 Y129.317
G1 X122.175 Y125.56 E.16328
G1 X121.914 Y125.287
G1 X118.417 Y128.784 E.15194
G1 X118.417 Y128.251
G1 X121.653 Y125.015 E.14059
G1 X121.392 Y124.743
G1 X118.417 Y127.717 E.12925
G1 X118.417 Y127.184
G1 X121.131 Y124.471 E.1179
G1 X120.869 Y124.199
G1 X118.417 Y126.651 E.10656
G1 X118.417 Y126.118
G1 X120.608 Y123.926 E.09521
G1 X120.466 Y123.535
G1 X118.417 Y125.584 E.08904
G1 X118.417 Y125.051
G1 X120.466 Y123.002 E.08904
G1 X120.466 Y122.469
G1 X118.417 Y124.518 E.08904
G1 X118.417 Y123.984
G1 X120.466 Y121.936 E.08904
G1 X120.466 Y121.402
G1 X118.417 Y123.451 E.08904
G1 X118.417 Y122.918
G1 X120.466 Y120.869 E.08904
G1 X120.466 Y120.336
G1 X118.417 Y122.385 E.08904
G1 X118.417 Y121.851
G1 X121.851 Y118.417 E.14923
G1 X121.318 Y118.417
G1 X118.417 Y121.318 E.12606
G1 X118.417 Y120.785
G1 X120.785 Y118.417 E.10288
G1 X120.252 Y118.417
G1 X118.417 Y120.252 E.07971
G1 X118.417 Y119.718
G1 X119.718 Y118.417 E.05654
G1 X119.185 Y118.417
G1 X118.417 Y119.185 E.03336
; WIPE_START
M204 S6000
G1 X119.185 Y118.417 E-.41262
G1 X119.718 Y118.417 E-.20264
G1 X119.449 Y118.687 E-.14474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.696 Y121.082 Z20.4 F42000
G1 X135.639 Y124.038 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.122595
G1 F15000
M204 S6000
G1 X135.431 Y124.246 E.00191
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X135.639 Y124.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z20.4 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20231229 =====================
G392 S0 ;turn off nozzle clog detect

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z20.5 F900 ; lower z a little
G1 X0 Y128 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X267 F15000
T255
G1 X-28.5 F18000
M73 P98 R0
G1 X-48.2 F3000
G1 X-28.5 F18000
G1 X-48.2 F3000
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z120 F600
    G1 Z118

M400 P100
M17 R ; restore z current

G90
G1 X-48 Y180 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N80
M1006 A44 B20 L100 C49 D20 M80 E41 F20 N80
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N80
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W
;=====printer finish  sound=========

;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M400
M18 X Y Z

M73 P100 R0
; EXECUTABLE_BLOCK_END

