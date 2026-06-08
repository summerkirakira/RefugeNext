import 'package:starcitizen_wiki_api/src/model/affiliation.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_bullet_electron.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_bullet_impulse_falloff.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_damage_drop_min_damage.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_damage_drop_min_distance.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_damage_drop_per_meter.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_damage_falloff.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_damage_falloffs.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_detonation_damage_map.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_explosion_radius.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_impact_damage_map.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_penetration.dart';
import 'package:starcitizen_wiki_api/src/model/area_boost.dart';
import 'package:starcitizen_wiki_api/src/model/area_exception.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_aspect.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_aspect_group.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_aspect_input.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_aspect_selection_group.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_aspects.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_dismantle.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_dismantle_return_summary.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_ingredient.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_modifier_quality_range.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_modifier_range.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_modifier_value_segments_inner.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_output.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_requirement_child.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_requirement_group.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_requirement_node.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_summary_property.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_tier.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_unlocking_mission.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_unlocking_missions_grouped.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_unlocking_missions_grouped_entry.dart';
import 'package:starcitizen_wiki_api/src/model/bomb.dart';
import 'package:starcitizen_wiki_api/src/model/bomb_damage_map.dart';
import 'package:starcitizen_wiki_api/src/model/bomb_delays.dart';
import 'package:starcitizen_wiki_api/src/model/bomb_explosion.dart';
import 'package:starcitizen_wiki_api/src/model/canonical_resource_meta.dart';
import 'package:starcitizen_wiki_api/src/model/cargo_grid.dart';
import 'package:starcitizen_wiki_api/src/model/celestial_object.dart';
import 'package:starcitizen_wiki_api/src/model/celestial_object_sensor.dart';
import 'package:starcitizen_wiki_api/src/model/celestial_object_starsystem.dart';
import 'package:starcitizen_wiki_api/src/model/clothing.dart';
import 'package:starcitizen_wiki_api/src/model/clothing_resistances_inner.dart';
import 'package:starcitizen_wiki_api/src/model/clustering.dart';
import 'package:starcitizen_wiki_api/src/model/clustering_param.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_image.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_image_base_image.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_image_comm_links_inner.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_image_duplicates_inner.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_image_tags_inner.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_link.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_deposit_group.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_index_location.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_index_location_entry.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_link.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_link_images_inner.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_link_refined_version.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_show.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_show_all_of_blueprints.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_show_all_of_items.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_show_all_of_uex_prices.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_show_location.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_system_group.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_version_entry.dart';
import 'package:starcitizen_wiki_api/src/model/cooler.dart';
import 'package:starcitizen_wiki_api/src/model/counter_measure.dart';
import 'package:starcitizen_wiki_api/src/model/counter_measure_signature.dart';
import 'package:starcitizen_wiki_api/src/model/deposit_base.dart';
import 'package:starcitizen_wiki_api/src/model/emp.dart';
import 'package:starcitizen_wiki_api/src/model/error_response.dart';
import 'package:starcitizen_wiki_api/src/model/faction.dart';
import 'package:starcitizen_wiki_api/src/model/faction_index.dart';
import 'package:starcitizen_wiki_api/src/model/faction_reputation_ladder.dart';
import 'package:starcitizen_wiki_api/src/model/faction_standing.dart';
import 'package:starcitizen_wiki_api/src/model/filter_value.dart';
import 'package:starcitizen_wiki_api/src/model/filter_value_value.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_boost_activation.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_boost_capacitor.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_boost_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_collision_detection.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_gravlev.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_precision_mode.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_recall_params.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_signed_axis_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_thruster_decay.dart';
import 'package:starcitizen_wiki_api/src/model/flight_no_fuel_params.dart';
import 'package:starcitizen_wiki_api/src/model/food.dart';
import 'package:starcitizen_wiki_api/src/model/food_consumption.dart';
import 'package:starcitizen_wiki_api/src/model/food_container.dart';
import 'package:starcitizen_wiki_api/src/model/fuel_intake.dart';
import 'package:starcitizen_wiki_api/src/model/fuel_tank.dart';
import 'package:starcitizen_wiki_api/src/model/galactapedia_article.dart';
import 'package:starcitizen_wiki_api/src/model/galactapedia_article_translations.dart';
import 'package:starcitizen_wiki_api/src/model/galactapedia_category.dart';
import 'package:starcitizen_wiki_api/src/model/galactapedia_property.dart';
import 'package:starcitizen_wiki_api/src/model/galactapedia_related_article.dart';
import 'package:starcitizen_wiki_api/src/model/galactapedia_tag.dart';
import 'package:starcitizen_wiki_api/src/model/game_item.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_blueprint_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_clothing.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_description.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_entity_tag_map_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_images_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_item_uex_prices.dart';
import 'package:starcitizen_wiki_api/src/model/game_port_item.dart';
import 'package:starcitizen_wiki_api/src/model/game_port_item_summary.dart';
import 'package:starcitizen_wiki_api/src/model/game_port_item_summary_manufacturer.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_affiliation.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_amenity.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_asteroid_ring.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_child_summary.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_images_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_jurisdiction.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_linked_summary.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_mission_group.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_quantum_travel.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_radar_contact_type.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_tag.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_type.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_afterburner.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_agility.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_agility_acceleration.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_cargo_limits.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_cargo_limits_max.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_cargo_limits_min.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_cooling.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_crew.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_cross_section.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_damage_limits.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_dimension.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_drive.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_drive_agility.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_drive_wheels.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_emission.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_fuel.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_fuel_usage.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_game_description.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_hardpoint.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_hardpoint_item.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_images_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_insurance.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_part.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_penetration_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_port.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_port_attached_vehicle.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_port_compatible_types_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_port_equipped_item.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_port_sizes.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_power.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_power_pools_value.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_propulsion.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_propulsion_thrust_capacity.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_propulsion_thrusters_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_quantum.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_seating.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_biochemical.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_distortion.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_energy.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_physical.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_stun.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_thermal.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_biochemical.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_distortion.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_energy.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_physical.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_stun.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_thermal.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_signature.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_sizes.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_speed.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_turret.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_turret_mounts_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_turret_weapons_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_turrets.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_uex_prices.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weapon_snapshot.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weaponry.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weaponry_fixed_weapons.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weaponry_fixed_weapons_weapons_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weaponry_missiles.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weaponry_missiles_damage.dart';
import 'package:starcitizen_wiki_api/src/model/game_version.dart';
import 'package:starcitizen_wiki_api/src/model/get_authenticated_user200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_blueprint200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_celestial_object200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_comm_link200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_comm_link_image200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_commodity200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_default_game_version200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_faction200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_galactapedia_article200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_ground_vehicle200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_ground_vehicle200_response_data.dart';
import 'package:starcitizen_wiki_api/src/model/get_latest_stats200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_location200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_manufacturer200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_mission200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_ship_matrix_vehicle200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_starsystem200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_version_changelog200_response.dart';
import 'package:starcitizen_wiki_api/src/model/get_weapon200_response.dart';
import 'package:starcitizen_wiki_api/src/model/grenade.dart';
import 'package:starcitizen_wiki_api/src/model/grenade_aoe.dart';
import 'package:starcitizen_wiki_api/src/model/hacking_chip.dart';
import 'package:starcitizen_wiki_api/src/model/harvestable_setup.dart';
import 'package:starcitizen_wiki_api/src/model/item_blueprint_link.dart';
import 'package:starcitizen_wiki_api/src/model/item_description_data.dart';
import 'package:starcitizen_wiki_api/src/model/item_dimension.dart';
import 'package:starcitizen_wiki_api/src/model/item_dimension_block.dart';
import 'package:starcitizen_wiki_api/src/model/item_dimension_true_dimension.dart';
import 'package:starcitizen_wiki_api/src/model/item_distortion.dart';
import 'package:starcitizen_wiki_api/src/model/item_durability.dart';
import 'package:starcitizen_wiki_api/src/model/item_durability_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/item_emission.dart';
import 'package:starcitizen_wiki_api/src/model/item_heat_connection.dart';
import 'package:starcitizen_wiki_api/src/model/item_inventory.dart';
import 'package:starcitizen_wiki_api/src/model/item_inventory_max_size.dart';
import 'package:starcitizen_wiki_api/src/model/item_inventory_min_size.dart';
import 'package:starcitizen_wiki_api/src/model/item_link.dart';
import 'package:starcitizen_wiki_api/src/model/item_port.dart';
import 'package:starcitizen_wiki_api/src/model/item_port_sizes.dart';
import 'package:starcitizen_wiki_api/src/model/item_port_type.dart';
import 'package:starcitizen_wiki_api/src/model/item_power_connection.dart';
import 'package:starcitizen_wiki_api/src/model/item_related_items.dart';
import 'package:starcitizen_wiki_api/src/model/item_related_link.dart';
import 'package:starcitizen_wiki_api/src/model/item_related_link_ext.dart';
import 'package:starcitizen_wiki_api/src/model/item_related_link_manufacturer.dart';
import 'package:starcitizen_wiki_api/src/model/item_temperature.dart';
import 'package:starcitizen_wiki_api/src/model/jump_drive.dart';
import 'package:starcitizen_wiki_api/src/model/jumppoint.dart';
import 'package:starcitizen_wiki_api/src/model/jumppoint_entry.dart';
import 'package:starcitizen_wiki_api/src/model/list_blueprint_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_blueprint_filters200_response_filters.dart';
import 'package:starcitizen_wiki_api/src/model/list_blueprints200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_celestial_objects200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_comm_link_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_comm_link_filters200_response_filters.dart';
import 'package:starcitizen_wiki_api/src/model/list_comm_link_images200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_comm_links200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_commodities200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_commodity_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_commodity_filters200_response_filters.dart';
import 'package:starcitizen_wiki_api/src/model/list_factions200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_galactapedia_articles200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_galactapedia_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_galactapedia_filters200_response_filters.dart';
import 'package:starcitizen_wiki_api/src/model/list_game_versions200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_ground_vehicles200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_item_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_item_filters200_response_filters.dart';
import 'package:starcitizen_wiki_api/src/model/list_location_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_location_filters200_response_filters.dart';
import 'package:starcitizen_wiki_api/src/model/list_location_positions200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_location_positions200_response_connections_inner.dart';
import 'package:starcitizen_wiki_api/src/model/list_location_positions200_response_data_inner.dart';
import 'package:starcitizen_wiki_api/src/model/list_locations200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_manufacturers200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_mission_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_mission_filters200_response_filters.dart';
import 'package:starcitizen_wiki_api/src/model/list_missions200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_ship_matrix_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_ship_matrix_filters200_response_filters.dart';
import 'package:starcitizen_wiki_api/src/model/list_ship_matrix_vehicles200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_starsystem_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_starsystem_filters200_response_filters.dart';
import 'package:starcitizen_wiki_api/src/model/list_starsystems200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_stats200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_vehicle_filters200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_vehicle_filters200_response_filters.dart';
import 'package:starcitizen_wiki_api/src/model/list_version_changelog_changes200_response.dart';
import 'package:starcitizen_wiki_api/src/model/list_weapons200_response.dart';
import 'package:starcitizen_wiki_api/src/model/manufacturer.dart';
import 'package:starcitizen_wiki_api/src/model/manufacturer_link.dart';
import 'package:starcitizen_wiki_api/src/model/material_entry.dart';
import 'package:starcitizen_wiki_api/src/model/medicine.dart';
import 'package:starcitizen_wiki_api/src/model/medicine_all_of_consumption.dart';
import 'package:starcitizen_wiki_api/src/model/medicine_all_of_container.dart';
import 'package:starcitizen_wiki_api/src/model/melee_weapon.dart';
import 'package:starcitizen_wiki_api/src/model/melee_weapon_attack_damages.dart';
import 'package:starcitizen_wiki_api/src/model/melee_weapon_attack_mode.dart';
import 'package:starcitizen_wiki_api/src/model/metadata.dart';
import 'package:starcitizen_wiki_api/src/model/mining_laser.dart';
import 'package:starcitizen_wiki_api/src/model/mining_laser_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/mining_laser_power_band.dart';
import 'package:starcitizen_wiki_api/src/model/mining_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/mining_modifier_power_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/mining_modifier_value.dart';
import 'package:starcitizen_wiki_api/src/model/mining_module.dart';
import 'package:starcitizen_wiki_api/src/model/mining_module_modifiers.dart';
import 'package:starcitizen_wiki_api/src/model/mining_module_usage.dart';
import 'package:starcitizen_wiki_api/src/model/missile.dart';
import 'package:starcitizen_wiki_api/src/model/missile_delays.dart';
import 'package:starcitizen_wiki_api/src/model/missile_explosion.dart';
import 'package:starcitizen_wiki_api/src/model/missile_flight.dart';
import 'package:starcitizen_wiki_api/src/model/missile_rack.dart';
import 'package:starcitizen_wiki_api/src/model/missile_target_lock.dart';
import 'package:starcitizen_wiki_api/src/model/mission.dart';
import 'package:starcitizen_wiki_api/src/model/mission_blueprint_item.dart';
import 'package:starcitizen_wiki_api/src/model/mission_blueprint_pool.dart';
import 'package:starcitizen_wiki_api/src/model/mission_broker_reputation_prerequisites.dart';
import 'package:starcitizen_wiki_api/src/model/mission_chain_link.dart';
import 'package:starcitizen_wiki_api/src/model/mission_chain_variant.dart';
import 'package:starcitizen_wiki_api/src/model/mission_combat.dart';
import 'package:starcitizen_wiki_api/src/model/mission_combat_aggregated_spawns_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_combat_spawns_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_combat_summary.dart';
import 'package:starcitizen_wiki_api/src/model/mission_combat_summary_by_group_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_combat_summary_total.dart';
import 'package:starcitizen_wiki_api/src/model/mission_completion_tag.dart';
import 'package:starcitizen_wiki_api/src/model/mission_completion_tag_mission.dart';
import 'package:starcitizen_wiki_api/src/model/mission_cooldown.dart';
import 'package:starcitizen_wiki_api/src/model/mission_deadline.dart';
import 'package:starcitizen_wiki_api/src/model/mission_entity_spawns_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_faction.dart';
import 'package:starcitizen_wiki_api/src/model/mission_faction_reputation_scope.dart';
import 'package:starcitizen_wiki_api/src/model/mission_faction_standing.dart';
import 'package:starcitizen_wiki_api/src/model/mission_hauling_order.dart';
import 'package:starcitizen_wiki_api/src/model/mission_hauling_order_item.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_blueprint.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_faction.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_hauling_summary_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_min_standing.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_reputation_gained_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_variants_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_item_counts.dart';
import 'package:starcitizen_wiki_api/src/model/mission_lifetime.dart';
import 'package:starcitizen_wiki_api/src/model/mission_prerequisite_group.dart';
import 'package:starcitizen_wiki_api/src/model/mission_prerequisite_group_required_tags_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_reputation.dart';
import 'package:starcitizen_wiki_api/src/model/mission_reward_item.dart';
import 'package:starcitizen_wiki_api/src/model/mission_starmap_location.dart';
import 'package:starcitizen_wiki_api/src/model/mission_starmap_location_group.dart';
import 'package:starcitizen_wiki_api/src/model/mission_summary.dart';
import 'package:starcitizen_wiki_api/src/model/mission_unlock_group.dart';
import 'package:starcitizen_wiki_api/src/model/not_found_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/pagination_links.dart';
import 'package:starcitizen_wiki_api/src/model/pagination_meta.dart';
import 'package:starcitizen_wiki_api/src/model/pagination_meta_links_inner.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon_charge.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon_charge_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon_damage.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon_damage_vector.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon_mode.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon_spread.dart';
import 'package:starcitizen_wiki_api/src/model/power_plant.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_drive.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_drive_jump_profile.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_drive_thermal_energy_draw.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_drive_travel_time10gm.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_interdiction_generator.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_interdiction_generator_jamming.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_interdiction_generator_power_fractions.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_interdiction_generator_pulse.dart';
import 'package:starcitizen_wiki_api/src/model/radar.dart';
import 'package:starcitizen_wiki_api/src/model/radar_aim_assist_block.dart';
import 'package:starcitizen_wiki_api/src/model/radar_sensitivity_block.dart';
import 'package:starcitizen_wiki_api/src/model/radiation_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/rate_limit_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/resource_container.dart';
import 'package:starcitizen_wiki_api/src/model/resource_container_capacity.dart';
import 'package:starcitizen_wiki_api/src/model/resource_container_commodity_link.dart';
import 'package:starcitizen_wiki_api/src/model/resource_container_composition_entry.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_delta.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_delta_composition_inner.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_generation.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_repair.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_state.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_state_power_ranges_inner.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_state_signature.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_usage.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_usage_coolant.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_usage_power.dart';
import 'package:starcitizen_wiki_api/src/model/reverse_image_link_search200_response.dart';
import 'package:starcitizen_wiki_api/src/model/reverse_image_link_search_request.dart';
import 'package:starcitizen_wiki_api/src/model/reverse_image_search200_response.dart';
import 'package:starcitizen_wiki_api/src/model/salvage_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/search_celestial_objects_deprecated200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_celestial_objects_deprecated_request.dart';
import 'package:starcitizen_wiki_api/src/model/search_comm_link_images_request.dart';
import 'package:starcitizen_wiki_api/src/model/search_comm_links_deprecated_request.dart';
import 'package:starcitizen_wiki_api/src/model/search_galactapedia_deprecated200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_game_data200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_game_data200_response_data_inner.dart';
import 'package:starcitizen_wiki_api/src/model/search_game_data200_response_data_inner_results_inner.dart';
import 'package:starcitizen_wiki_api/src/model/search_ship_matrix_vehicles_deprecated200_response.dart';
import 'package:starcitizen_wiki_api/src/model/search_starsystems_deprecated200_response.dart';
import 'package:starcitizen_wiki_api/src/model/seat.dart';
import 'package:starcitizen_wiki_api/src/model/seat_axis.dart';
import 'package:starcitizen_wiki_api/src/model/seat_ejection.dart';
import 'package:starcitizen_wiki_api/src/model/self_destruct.dart';
import 'package:starcitizen_wiki_api/src/model/shield.dart';
import 'package:starcitizen_wiki_api/src/model/shield_controller.dart';
import 'package:starcitizen_wiki_api/src/model/shield_damage_map.dart';
import 'package:starcitizen_wiki_api/src/model/shield_damage_range.dart';
import 'package:starcitizen_wiki_api/src/model/shield_regen_delay.dart';
import 'package:starcitizen_wiki_api/src/model/shield_reserve_pool.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_agility.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_agility_acceleration.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_dimension.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_manufacturer.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_sizes.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_speed.dart';
import 'package:starcitizen_wiki_api/src/model/shipmatrix_manufacturer_link.dart';
import 'package:starcitizen_wiki_api/src/model/shipmatrix_vehicle_link.dart';
import 'package:starcitizen_wiki_api/src/model/starmap_location_link.dart';
import 'package:starcitizen_wiki_api/src/model/starmap_location_mining_type_group.dart';
import 'package:starcitizen_wiki_api/src/model/starmap_location_resource.dart';
import 'package:starcitizen_wiki_api/src/model/starsystem.dart';
import 'package:starcitizen_wiki_api/src/model/starsystem_aggregated.dart';
import 'package:starcitizen_wiki_api/src/model/starsystem_celestial_object.dart';
import 'package:starcitizen_wiki_api/src/model/starsystem_celestial_object_celestial_object.dart';
import 'package:starcitizen_wiki_api/src/model/starsystem_jumppoints.dart';
import 'package:starcitizen_wiki_api/src/model/starsystem_jumppoints_jumppoints.dart';
import 'package:starcitizen_wiki_api/src/model/starsystem_position.dart';
import 'package:starcitizen_wiki_api/src/model/stat.dart';
import 'package:starcitizen_wiki_api/src/model/suit_armor.dart';
import 'package:starcitizen_wiki_api/src/model/suit_armor_damage_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/suit_armor_damage_resistance_map.dart';
import 'package:starcitizen_wiki_api/src/model/suit_armor_type_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/temperature_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/thruster.dart';
import 'package:starcitizen_wiki_api/src/model/thruster_backwash.dart';
import 'package:starcitizen_wiki_api/src/model/thruster_fuel.dart';
import 'package:starcitizen_wiki_api/src/model/thruster_handling.dart';
import 'package:starcitizen_wiki_api/src/model/thruster_performance.dart';
import 'package:starcitizen_wiki_api/src/model/tractor_beam.dart';
import 'package:starcitizen_wiki_api/src/model/tractor_beam_cargo_mode_override.dart';
import 'package:starcitizen_wiki_api/src/model/tractor_beam_force.dart';
import 'package:starcitizen_wiki_api/src/model/tractor_beam_range.dart';
import 'package:starcitizen_wiki_api/src/model/tractor_beam_tether.dart';
import 'package:starcitizen_wiki_api/src/model/tractor_beam_towing.dart';
import 'package:starcitizen_wiki_api/src/model/translation.dart';
import 'package:starcitizen_wiki_api/src/model/turret.dart';
import 'package:starcitizen_wiki_api/src/model/turret_axis.dart';
import 'package:starcitizen_wiki_api/src/model/uex_price.dart';
import 'package:starcitizen_wiki_api/src/model/unauthenticated_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/validation_error_response.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor_damage_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor_deflection.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor_penetration_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor_resistance_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor_signal_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_component.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_link.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_loaner.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_relay_entry.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_relay_entry_connected_hardpoints_inner.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_relay_entry_connected_hardpoints_inner_items_inner.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_relay_network.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_relay_network_links_inner.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_sku.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_suit_storage.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_suit_storage_by_locker_inner.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_barrel_spin_time.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_capacitor.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_charge.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_charge_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_damage.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_damage_entry.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_damage_types.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_heat.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_magazine_volume.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_mode.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_spread.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_storage.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_storage_by_locker_inner.dart';
import 'package:starcitizen_wiki_api/src/model/version_changelog.dart';
import 'package:starcitizen_wiki_api/src/model/version_changelog_summary_value.dart';
import 'package:starcitizen_wiki_api/src/model/version_diff_entry.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_barrel_attachment.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_flashlight_profile.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_iron_sight.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_laser_pointer.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_magazine.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_rgb_color.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_damage.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_damage_entry.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_aim.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_base.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_recoil.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_regen.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_salvage.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_spread.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_zeroing.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_rack.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

  ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType, {bool growable= true}) {
      switch (targetType) {
        case 'String':
          return '$value' as ReturnType;
        case 'int':
          return (value is int ? value : int.parse('$value')) as ReturnType;
        case 'bool':
          if (value is bool) {
            return value as ReturnType;
          }
          final valueString = '$value'.toLowerCase();
          return (valueString == 'true' || valueString == '1') as ReturnType;
        case 'double':
          return (value is double ? value : double.parse('$value')) as ReturnType;
        case 'Affiliation':
          return Affiliation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Ammunition':
          return Ammunition.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AmmunitionBulletElectron':
          return AmmunitionBulletElectron.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AmmunitionBulletImpulseFalloff':
          return AmmunitionBulletImpulseFalloff.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AmmunitionDamageDropMinDamage':
          return AmmunitionDamageDropMinDamage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AmmunitionDamageDropMinDistance':
          return AmmunitionDamageDropMinDistance.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AmmunitionDamageDropPerMeter':
          return AmmunitionDamageDropPerMeter.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AmmunitionDamageFalloff':
          return AmmunitionDamageFalloff.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AmmunitionDamageFalloffs':
          return AmmunitionDamageFalloffs.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AmmunitionDetonationDamageMap':
          return AmmunitionDetonationDamageMap.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AmmunitionExplosionRadius':
          return AmmunitionExplosionRadius.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AmmunitionImpactDamageMap':
          return AmmunitionImpactDamageMap.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AmmunitionPenetration':
          return AmmunitionPenetration.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AreaBoost':
          return AreaBoost.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AreaException':
          return AreaException.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Blueprint':
          return Blueprint.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintAspect':
          return BlueprintAspect.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintAspectGroup':
          return BlueprintAspectGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintAspectInput':
          return BlueprintAspectInput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintAspectSelectionGroup':
          return BlueprintAspectSelectionGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintAspects':
          return BlueprintAspects.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintDismantle':
          return BlueprintDismantle.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintDismantleReturnSummary':
          return BlueprintDismantleReturnSummary.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintIngredient':
          return BlueprintIngredient.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintModifier':
          return BlueprintModifier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintModifierQualityRange':
          return BlueprintModifierQualityRange.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintModifierRange':
          return BlueprintModifierRange.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintModifierValueSegmentsInner':
          return BlueprintModifierValueSegmentsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintOutput':
          return BlueprintOutput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintRequirementChild':
          return BlueprintRequirementChild.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintRequirementGroup':
          return BlueprintRequirementGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintRequirementNode':
          return BlueprintRequirementNode.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintSummaryProperty':
          return BlueprintSummaryProperty.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintTier':
          return BlueprintTier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintUnlockingMission':
          return BlueprintUnlockingMission.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintUnlockingMissionsGrouped':
          return BlueprintUnlockingMissionsGrouped.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BlueprintUnlockingMissionsGroupedEntry':
          return BlueprintUnlockingMissionsGroupedEntry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Bomb':
          return Bomb.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BombDamageMap':
          return BombDamageMap.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BombDelays':
          return BombDelays.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BombExplosion':
          return BombExplosion.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CanonicalResourceMeta':
          return CanonicalResourceMeta.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CargoGrid':
          return CargoGrid.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CelestialObject':
          return CelestialObject.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CelestialObjectSensor':
          return CelestialObjectSensor.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CelestialObjectStarsystem':
          return CelestialObjectStarsystem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Clothing':
          return Clothing.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClothingResistancesInner':
          return ClothingResistancesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Clustering':
          return Clustering.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClusteringParam':
          return ClusteringParam.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommLink':
          return CommLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommLinkImage':
          return CommLinkImage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommLinkImageBaseImage':
          return CommLinkImageBaseImage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommLinkImageCommLinksInner':
          return CommLinkImageCommLinksInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommLinkImageDuplicatesInner':
          return CommLinkImageDuplicatesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommLinkImageTagsInner':
          return CommLinkImageTagsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommLinkLink':
          return CommLinkLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityDepositGroup':
          return CommodityDepositGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityIndexLocation':
          return CommodityIndexLocation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityIndexLocationEntry':
          return CommodityIndexLocationEntry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityLink':
          return CommodityLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityLinkImagesInner':
          return CommodityLinkImagesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityLinkRefinedVersion':
          return CommodityLinkRefinedVersion.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityShow':
          return CommodityShow.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityShowAllOfBlueprints':
          return CommodityShowAllOfBlueprints.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityShowAllOfItems':
          return CommodityShowAllOfItems.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityShowAllOfUexPrices':
          return CommodityShowAllOfUexPrices.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityShowLocation':
          return CommodityShowLocation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommoditySystemGroup':
          return CommoditySystemGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CommodityVersionEntry':
          return CommodityVersionEntry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Cooler':
          return Cooler.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CounterMeasure':
          return CounterMeasure.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CounterMeasureSignature':
          return CounterMeasureSignature.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DepositBase':
          return DepositBase.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Emp':
          return Emp.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ErrorResponse':
          return ErrorResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Faction':
          return Faction.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FactionIndex':
          return FactionIndex.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FactionReputationLadder':
          return FactionReputationLadder.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FactionStanding':
          return FactionStanding.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FilterValue':
          return FilterValue.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FilterValueValue':
          return FilterValueValue.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightController':
          return FlightController.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightControllerBoostActivation':
          return FlightControllerBoostActivation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightControllerBoostCapacitor':
          return FlightControllerBoostCapacitor.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightControllerBoostMultiplier':
          return FlightControllerBoostMultiplier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightControllerCollisionDetection':
          return FlightControllerCollisionDetection.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightControllerGravlev':
          return FlightControllerGravlev.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightControllerMultiplier':
          return FlightControllerMultiplier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightControllerPrecisionMode':
          return FlightControllerPrecisionMode.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightControllerRecallParams':
          return FlightControllerRecallParams.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightControllerSignedAxisMultiplier':
          return FlightControllerSignedAxisMultiplier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightControllerThrusterDecay':
          return FlightControllerThrusterDecay.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FlightNoFuelParams':
          return FlightNoFuelParams.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Food':
          return Food.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FoodConsumption':
          return FoodConsumption.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FoodContainer':
          return FoodContainer.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FuelIntake':
          return FuelIntake.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FuelTank':
          return FuelTank.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GalactapediaArticle':
          return GalactapediaArticle.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GalactapediaArticleTranslations':
          return GalactapediaArticleTranslations.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GalactapediaCategory':
          return GalactapediaCategory.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GalactapediaProperty':
          return GalactapediaProperty.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GalactapediaRelatedArticle':
          return GalactapediaRelatedArticle.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GalactapediaTag':
          return GalactapediaTag.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameItem':
          return GameItem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameItemBlueprintInner':
          return GameItemBlueprintInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameItemClothing':
          return GameItemClothing.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameItemDescription':
          return GameItemDescription.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameItemEntityTagMapInner':
          return GameItemEntityTagMapInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameItemImagesInner':
          return GameItemImagesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameItemUexPrices':
          return GameItemUexPrices.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GamePortItem':
          return GamePortItem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GamePortItemSummary':
          return GamePortItemSummary.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GamePortItemSummaryManufacturer':
          return GamePortItemSummaryManufacturer.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocation':
          return GameStarmapLocation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationAffiliation':
          return GameStarmapLocationAffiliation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationAmenity':
          return GameStarmapLocationAmenity.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationAsteroidRing':
          return GameStarmapLocationAsteroidRing.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationChildSummary':
          return GameStarmapLocationChildSummary.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationImagesInner':
          return GameStarmapLocationImagesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationJurisdiction':
          return GameStarmapLocationJurisdiction.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationLinkedSummary':
          return GameStarmapLocationLinkedSummary.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationMissionGroup':
          return GameStarmapLocationMissionGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationQuantumTravel':
          return GameStarmapLocationQuantumTravel.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationRadarContactType':
          return GameStarmapLocationRadarContactType.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationTag':
          return GameStarmapLocationTag.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameStarmapLocationType':
          return GameStarmapLocationType.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicle':
          return GameVehicle.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleAfterburner':
          return GameVehicleAfterburner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleAgility':
          return GameVehicleAgility.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleAgilityAcceleration':
          return GameVehicleAgilityAcceleration.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleCargoLimits':
          return GameVehicleCargoLimits.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleCargoLimitsMax':
          return GameVehicleCargoLimitsMax.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleCargoLimitsMin':
          return GameVehicleCargoLimitsMin.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleCooling':
          return GameVehicleCooling.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleCrew':
          return GameVehicleCrew.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleCrossSection':
          return GameVehicleCrossSection.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleDamageLimits':
          return GameVehicleDamageLimits.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleDimension':
          return GameVehicleDimension.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleDrive':
          return GameVehicleDrive.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleDriveAgility':
          return GameVehicleDriveAgility.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleDriveWheels':
          return GameVehicleDriveWheels.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleEmission':
          return GameVehicleEmission.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleFuel':
          return GameVehicleFuel.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleFuelUsage':
          return GameVehicleFuelUsage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleGameDescription':
          return GameVehicleGameDescription.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleHardpoint':
          return GameVehicleHardpoint.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleHardpointItem':
          return GameVehicleHardpointItem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleImagesInner':
          return GameVehicleImagesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleInsurance':
          return GameVehicleInsurance.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePart':
          return GameVehiclePart.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePenetrationMultiplier':
          return GameVehiclePenetrationMultiplier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePort':
          return GameVehiclePort.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePortAttachedVehicle':
          return GameVehiclePortAttachedVehicle.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePortCompatibleTypesInner':
          return GameVehiclePortCompatibleTypesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePortEquippedItem':
          return GameVehiclePortEquippedItem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePortSizes':
          return GameVehiclePortSizes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePower':
          return GameVehiclePower.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePowerPoolsValue':
          return GameVehiclePowerPoolsValue.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePropulsion':
          return GameVehiclePropulsion.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePropulsionThrustCapacity':
          return GameVehiclePropulsionThrustCapacity.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehiclePropulsionThrustersInner':
          return GameVehiclePropulsionThrustersInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleQuantum':
          return GameVehicleQuantum.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleSeating':
          return GameVehicleSeating.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShield':
          return GameVehicleShield.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldAbsorption':
          return GameVehicleShieldAbsorption.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldAbsorptionBiochemical':
          return GameVehicleShieldAbsorptionBiochemical.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldAbsorptionDistortion':
          return GameVehicleShieldAbsorptionDistortion.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldAbsorptionEnergy':
          return GameVehicleShieldAbsorptionEnergy.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldAbsorptionPhysical':
          return GameVehicleShieldAbsorptionPhysical.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldAbsorptionStun':
          return GameVehicleShieldAbsorptionStun.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldAbsorptionThermal':
          return GameVehicleShieldAbsorptionThermal.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldResistance':
          return GameVehicleShieldResistance.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldResistanceBiochemical':
          return GameVehicleShieldResistanceBiochemical.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldResistanceDistortion':
          return GameVehicleShieldResistanceDistortion.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldResistanceEnergy':
          return GameVehicleShieldResistanceEnergy.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldResistancePhysical':
          return GameVehicleShieldResistancePhysical.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldResistanceStun':
          return GameVehicleShieldResistanceStun.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleShieldResistanceThermal':
          return GameVehicleShieldResistanceThermal.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleSignature':
          return GameVehicleSignature.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleSizes':
          return GameVehicleSizes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleSpeed':
          return GameVehicleSpeed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleTurret':
          return GameVehicleTurret.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleTurretMountsInner':
          return GameVehicleTurretMountsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleTurretWeaponsInner':
          return GameVehicleTurretWeaponsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleTurrets':
          return GameVehicleTurrets.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleUexPrices':
          return GameVehicleUexPrices.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleWeaponSnapshot':
          return GameVehicleWeaponSnapshot.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleWeaponry':
          return GameVehicleWeaponry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleWeaponryFixedWeapons':
          return GameVehicleWeaponryFixedWeapons.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleWeaponryFixedWeaponsWeaponsInner':
          return GameVehicleWeaponryFixedWeaponsWeaponsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleWeaponryMissiles':
          return GameVehicleWeaponryMissiles.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVehicleWeaponryMissilesDamage':
          return GameVehicleWeaponryMissilesDamage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameVersion':
          return GameVersion.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetAuthenticatedUser200Response':
          return GetAuthenticatedUser200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetBlueprint200Response':
          return GetBlueprint200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetCelestialObject200Response':
          return GetCelestialObject200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetCommLink200Response':
          return GetCommLink200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetCommLinkImage200Response':
          return GetCommLinkImage200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetCommodity200Response':
          return GetCommodity200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetDefaultGameVersion200Response':
          return GetDefaultGameVersion200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetFaction200Response':
          return GetFaction200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetGalactapediaArticle200Response':
          return GetGalactapediaArticle200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetGroundVehicle200Response':
          return GetGroundVehicle200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetGroundVehicle200ResponseData':
          return GetGroundVehicle200ResponseData.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetLatestStats200Response':
          return GetLatestStats200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetLocation200Response':
          return GetLocation200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetManufacturer200Response':
          return GetManufacturer200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetMission200Response':
          return GetMission200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetShipMatrixVehicle200Response':
          return GetShipMatrixVehicle200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetStarsystem200Response':
          return GetStarsystem200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetVersionChangelog200Response':
          return GetVersionChangelog200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetWeapon200Response':
          return GetWeapon200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Grenade':
          return Grenade.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GrenadeAoe':
          return GrenadeAoe.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HackingChip':
          return HackingChip.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HarvestableSetup':
          return HarvestableSetup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemBlueprintLink':
          return ItemBlueprintLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemDescriptionData':
          return ItemDescriptionData.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemDimension':
          return ItemDimension.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemDimensionBlock':
          return ItemDimensionBlock.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemDimensionTrueDimension':
          return ItemDimensionTrueDimension.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemDistortion':
          return ItemDistortion.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemDurability':
          return ItemDurability.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemDurabilityResistance':
          return ItemDurabilityResistance.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemEmission':
          return ItemEmission.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemHeatConnection':
          return ItemHeatConnection.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemInventory':
          return ItemInventory.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemInventoryMaxSize':
          return ItemInventoryMaxSize.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemInventoryMinSize':
          return ItemInventoryMinSize.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemLink':
          return ItemLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemPort':
          return ItemPort.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemPortSizes':
          return ItemPortSizes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemPortType':
          return ItemPortType.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemPowerConnection':
          return ItemPowerConnection.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemRelatedItems':
          return ItemRelatedItems.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemRelatedLink':
          return ItemRelatedLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemRelatedLinkExt':
          return ItemRelatedLinkExt.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemRelatedLinkManufacturer':
          return ItemRelatedLinkManufacturer.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ItemTemperature':
          return ItemTemperature.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JumpDrive':
          return JumpDrive.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Jumppoint':
          return Jumppoint.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JumppointEntry':
          return JumppointEntry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListBlueprintFilters200Response':
          return ListBlueprintFilters200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListBlueprintFilters200ResponseFilters':
          return ListBlueprintFilters200ResponseFilters.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListBlueprints200Response':
          return ListBlueprints200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListCelestialObjects200Response':
          return ListCelestialObjects200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListCommLinkFilters200Response':
          return ListCommLinkFilters200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListCommLinkFilters200ResponseFilters':
          return ListCommLinkFilters200ResponseFilters.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListCommLinkImages200Response':
          return ListCommLinkImages200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListCommLinks200Response':
          return ListCommLinks200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListCommodities200Response':
          return ListCommodities200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListCommodityFilters200Response':
          return ListCommodityFilters200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListCommodityFilters200ResponseFilters':
          return ListCommodityFilters200ResponseFilters.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListFactions200Response':
          return ListFactions200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListGalactapediaArticles200Response':
          return ListGalactapediaArticles200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListGalactapediaFilters200Response':
          return ListGalactapediaFilters200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListGalactapediaFilters200ResponseFilters':
          return ListGalactapediaFilters200ResponseFilters.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListGameVersions200Response':
          return ListGameVersions200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListGroundVehicles200Response':
          return ListGroundVehicles200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListItemFilters200Response':
          return ListItemFilters200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListItemFilters200ResponseFilters':
          return ListItemFilters200ResponseFilters.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListLocationFilters200Response':
          return ListLocationFilters200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListLocationFilters200ResponseFilters':
          return ListLocationFilters200ResponseFilters.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListLocationPositions200Response':
          return ListLocationPositions200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListLocationPositions200ResponseConnectionsInner':
          return ListLocationPositions200ResponseConnectionsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListLocationPositions200ResponseDataInner':
          return ListLocationPositions200ResponseDataInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListLocations200Response':
          return ListLocations200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListManufacturers200Response':
          return ListManufacturers200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListMissionFilters200Response':
          return ListMissionFilters200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListMissionFilters200ResponseFilters':
          return ListMissionFilters200ResponseFilters.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListMissions200Response':
          return ListMissions200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListShipMatrixFilters200Response':
          return ListShipMatrixFilters200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListShipMatrixFilters200ResponseFilters':
          return ListShipMatrixFilters200ResponseFilters.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListShipMatrixVehicles200Response':
          return ListShipMatrixVehicles200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListStarsystemFilters200Response':
          return ListStarsystemFilters200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListStarsystemFilters200ResponseFilters':
          return ListStarsystemFilters200ResponseFilters.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListStarsystems200Response':
          return ListStarsystems200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListStats200Response':
          return ListStats200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListVehicleFilters200Response':
          return ListVehicleFilters200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListVehicleFilters200ResponseFilters':
          return ListVehicleFilters200ResponseFilters.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListVersionChangelogChanges200Response':
          return ListVersionChangelogChanges200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListWeapons200Response':
          return ListWeapons200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Manufacturer':
          return Manufacturer.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ManufacturerLink':
          return ManufacturerLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MaterialEntry':
          return MaterialEntry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Medicine':
          return Medicine.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MedicineAllOfConsumption':
          return MedicineAllOfConsumption.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MedicineAllOfContainer':
          return MedicineAllOfContainer.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MeleeWeapon':
          return MeleeWeapon.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MeleeWeaponAttackDamages':
          return MeleeWeaponAttackDamages.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MeleeWeaponAttackMode':
          return MeleeWeaponAttackMode.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Metadata':
          return Metadata.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MiningLaser':
          return MiningLaser.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MiningLaserModifier':
          return MiningLaserModifier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MiningLaserPowerBand':
          return MiningLaserPowerBand.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MiningModifier':
          return MiningModifier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MiningModifierPowerModifier':
          return MiningModifierPowerModifier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MiningModifierValue':
          return MiningModifierValue.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MiningModule':
          return MiningModule.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MiningModuleModifiers':
          return MiningModuleModifiers.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MiningModuleUsage':
          return MiningModuleUsage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Missile':
          return Missile.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissileDelays':
          return MissileDelays.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissileExplosion':
          return MissileExplosion.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissileFlight':
          return MissileFlight.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissileRack':
          return MissileRack.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissileTargetLock':
          return MissileTargetLock.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Mission':
          return Mission.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionBlueprintItem':
          return MissionBlueprintItem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionBlueprintPool':
          return MissionBlueprintPool.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionBrokerReputationPrerequisites':
          return MissionBrokerReputationPrerequisites.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionChainLink':
          return MissionChainLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionChainVariant':
          return MissionChainVariant.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionCombat':
          return MissionCombat.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionCombatAggregatedSpawnsInner':
          return MissionCombatAggregatedSpawnsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionCombatSpawnsInner':
          return MissionCombatSpawnsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionCombatSummary':
          return MissionCombatSummary.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionCombatSummaryByGroupInner':
          return MissionCombatSummaryByGroupInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionCombatSummaryTotal':
          return MissionCombatSummaryTotal.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionCompletionTag':
          return MissionCompletionTag.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionCompletionTagMission':
          return MissionCompletionTagMission.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionCooldown':
          return MissionCooldown.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionDeadline':
          return MissionDeadline.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionEntitySpawnsInner':
          return MissionEntitySpawnsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionFaction':
          return MissionFaction.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionFactionReputationScope':
          return MissionFactionReputationScope.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionFactionStanding':
          return MissionFactionStanding.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionHaulingOrder':
          return MissionHaulingOrder.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionHaulingOrderItem':
          return MissionHaulingOrderItem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionIndex':
          return MissionIndex.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionIndexBlueprint':
          return MissionIndexBlueprint.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionIndexFaction':
          return MissionIndexFaction.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionIndexHaulingSummaryInner':
          return MissionIndexHaulingSummaryInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionIndexMinStanding':
          return MissionIndexMinStanding.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionIndexReputationGainedInner':
          return MissionIndexReputationGainedInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionIndexVariantsInner':
          return MissionIndexVariantsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionItemCounts':
          return MissionItemCounts.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionLifetime':
          return MissionLifetime.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionPrerequisiteGroup':
          return MissionPrerequisiteGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionPrerequisiteGroupRequiredTagsInner':
          return MissionPrerequisiteGroupRequiredTagsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionReputation':
          return MissionReputation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionRewardItem':
          return MissionRewardItem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionStarmapLocation':
          return MissionStarmapLocation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionStarmapLocationGroup':
          return MissionStarmapLocationGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionSummary':
          return MissionSummary.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MissionUnlockGroup':
          return MissionUnlockGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NotFoundErrorResponse':
          return NotFoundErrorResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaginationLinks':
          return PaginationLinks.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaginationMeta':
          return PaginationMeta.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaginationMetaLinksInner':
          return PaginationMetaLinksInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PersonalWeapon':
          return PersonalWeapon.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PersonalWeaponCharge':
          return PersonalWeaponCharge.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PersonalWeaponChargeModifier':
          return PersonalWeaponChargeModifier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PersonalWeaponDamage':
          return PersonalWeaponDamage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PersonalWeaponDamageVector':
          return PersonalWeaponDamageVector.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PersonalWeaponMode':
          return PersonalWeaponMode.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PersonalWeaponSpread':
          return PersonalWeaponSpread.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PowerPlant':
          return PowerPlant.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QuantumDrive':
          return QuantumDrive.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QuantumDriveJumpProfile':
          return QuantumDriveJumpProfile.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QuantumDriveThermalEnergyDraw':
          return QuantumDriveThermalEnergyDraw.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QuantumDriveTravelTime10gm':
          return QuantumDriveTravelTime10gm.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QuantumInterdictionGenerator':
          return QuantumInterdictionGenerator.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QuantumInterdictionGeneratorJamming':
          return QuantumInterdictionGeneratorJamming.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QuantumInterdictionGeneratorPowerFractions':
          return QuantumInterdictionGeneratorPowerFractions.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'QuantumInterdictionGeneratorPulse':
          return QuantumInterdictionGeneratorPulse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Radar':
          return Radar.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RadarAimAssistBlock':
          return RadarAimAssistBlock.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RadarSensitivityBlock':
          return RadarSensitivityBlock.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RadiationResistance':
          return RadiationResistance.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RateLimitErrorResponse':
          return RateLimitErrorResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceContainer':
          return ResourceContainer.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceContainerCapacity':
          return ResourceContainerCapacity.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceContainerCommodityLink':
          return ResourceContainerCommodityLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceContainerCompositionEntry':
          return ResourceContainerCompositionEntry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceNetwork':
          return ResourceNetwork.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceNetworkDelta':
          return ResourceNetworkDelta.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceNetworkDeltaCompositionInner':
          return ResourceNetworkDeltaCompositionInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceNetworkGeneration':
          return ResourceNetworkGeneration.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceNetworkRepair':
          return ResourceNetworkRepair.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceNetworkState':
          return ResourceNetworkState.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceNetworkStatePowerRangesInner':
          return ResourceNetworkStatePowerRangesInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceNetworkStateSignature':
          return ResourceNetworkStateSignature.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceNetworkUsage':
          return ResourceNetworkUsage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceNetworkUsageCoolant':
          return ResourceNetworkUsageCoolant.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResourceNetworkUsagePower':
          return ResourceNetworkUsagePower.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReverseImageLinkSearch200Response':
          return ReverseImageLinkSearch200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReverseImageLinkSearchRequest':
          return ReverseImageLinkSearchRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReverseImageSearch200Response':
          return ReverseImageSearch200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SalvageModifier':
          return SalvageModifier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchCelestialObjectsDeprecated200Response':
          return SearchCelestialObjectsDeprecated200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchCelestialObjectsDeprecatedRequest':
          return SearchCelestialObjectsDeprecatedRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchCommLinkImagesRequest':
          return SearchCommLinkImagesRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchCommLinksDeprecatedRequest':
          return SearchCommLinksDeprecatedRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchGalactapediaDeprecated200Response':
          return SearchGalactapediaDeprecated200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchGameData200Response':
          return SearchGameData200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchGameData200ResponseDataInner':
          return SearchGameData200ResponseDataInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchGameData200ResponseDataInnerResultsInner':
          return SearchGameData200ResponseDataInnerResultsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchShipMatrixVehiclesDeprecated200Response':
          return SearchShipMatrixVehiclesDeprecated200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchStarsystemsDeprecated200Response':
          return SearchStarsystemsDeprecated200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Seat':
          return Seat.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SeatAxis':
          return SeatAxis.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SeatEjection':
          return SeatEjection.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SelfDestruct':
          return SelfDestruct.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Shield':
          return Shield.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShieldController':
          return ShieldController.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShieldDamageMap':
          return ShieldDamageMap.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShieldDamageRange':
          return ShieldDamageRange.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShieldRegenDelay':
          return ShieldRegenDelay.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShieldReservePool':
          return ShieldReservePool.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShipMatrixVehicle':
          return ShipMatrixVehicle.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShipMatrixVehicleAgility':
          return ShipMatrixVehicleAgility.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShipMatrixVehicleAgilityAcceleration':
          return ShipMatrixVehicleAgilityAcceleration.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShipMatrixVehicleDimension':
          return ShipMatrixVehicleDimension.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShipMatrixVehicleManufacturer':
          return ShipMatrixVehicleManufacturer.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShipMatrixVehicleSizes':
          return ShipMatrixVehicleSizes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShipMatrixVehicleSpeed':
          return ShipMatrixVehicleSpeed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShipmatrixManufacturerLink':
          return ShipmatrixManufacturerLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ShipmatrixVehicleLink':
          return ShipmatrixVehicleLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StarmapLocationLink':
          return StarmapLocationLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StarmapLocationMiningTypeGroup':
          return StarmapLocationMiningTypeGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StarmapLocationResource':
          return StarmapLocationResource.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Starsystem':
          return Starsystem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StarsystemAggregated':
          return StarsystemAggregated.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StarsystemCelestialObject':
          return StarsystemCelestialObject.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StarsystemCelestialObjectCelestialObject':
          return StarsystemCelestialObjectCelestialObject.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StarsystemJumppoints':
          return StarsystemJumppoints.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StarsystemJumppointsJumppoints':
          return StarsystemJumppointsJumppoints.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StarsystemPosition':
          return StarsystemPosition.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Stat':
          return Stat.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SuitArmor':
          return SuitArmor.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SuitArmorDamageResistance':
          return SuitArmorDamageResistance.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SuitArmorDamageResistanceMap':
          return SuitArmorDamageResistanceMap.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SuitArmorTypeResistance':
          return SuitArmorTypeResistance.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TemperatureResistance':
          return TemperatureResistance.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Thruster':
          return Thruster.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ThrusterBackwash':
          return ThrusterBackwash.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ThrusterFuel':
          return ThrusterFuel.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ThrusterHandling':
          return ThrusterHandling.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ThrusterPerformance':
          return ThrusterPerformance.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TractorBeam':
          return TractorBeam.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TractorBeamCargoModeOverride':
          return TractorBeamCargoModeOverride.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TractorBeamForce':
          return TractorBeamForce.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TractorBeamRange':
          return TractorBeamRange.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TractorBeamTether':
          return TractorBeamTether.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TractorBeamTowing':
          return TractorBeamTowing.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Translation':
          return Translation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Turret':
          return Turret.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TurretAxis':
          return TurretAxis.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UexPrice':
          return UexPrice.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UnauthenticatedErrorResponse':
          return UnauthenticatedErrorResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ValidationErrorResponse':
          return ValidationErrorResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleArmor':
          return VehicleArmor.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleArmorDamageMultiplier':
          return VehicleArmorDamageMultiplier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleArmorDeflection':
          return VehicleArmorDeflection.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleArmorPenetrationResistance':
          return VehicleArmorPenetrationResistance.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleArmorResistanceMultiplier':
          return VehicleArmorResistanceMultiplier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleArmorSignalMultiplier':
          return VehicleArmorSignalMultiplier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleComponent':
          return VehicleComponent.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleLink':
          return VehicleLink.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleLoaner':
          return VehicleLoaner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleRelayEntry':
          return VehicleRelayEntry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleRelayEntryConnectedHardpointsInner':
          return VehicleRelayEntryConnectedHardpointsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleRelayEntryConnectedHardpointsInnerItemsInner':
          return VehicleRelayEntryConnectedHardpointsInnerItemsInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleRelayNetwork':
          return VehicleRelayNetwork.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleRelayNetworkLinksInner':
          return VehicleRelayNetworkLinksInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleSku':
          return VehicleSku.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleSuitStorage':
          return VehicleSuitStorage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleSuitStorageByLockerInner':
          return VehicleSuitStorageByLockerInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeapon':
          return VehicleWeapon.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponBarrelSpinTime':
          return VehicleWeaponBarrelSpinTime.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponCapacitor':
          return VehicleWeaponCapacitor.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponCharge':
          return VehicleWeaponCharge.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponChargeModifier':
          return VehicleWeaponChargeModifier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponDamage':
          return VehicleWeaponDamage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponDamageEntry':
          return VehicleWeaponDamageEntry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponDamageTypes':
          return VehicleWeaponDamageTypes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponHeat':
          return VehicleWeaponHeat.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponMagazineVolume':
          return VehicleWeaponMagazineVolume.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponMode':
          return VehicleWeaponMode.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponSpread':
          return VehicleWeaponSpread.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponStorage':
          return VehicleWeaponStorage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VehicleWeaponStorageByLockerInner':
          return VehicleWeaponStorageByLockerInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionChangelog':
          return VersionChangelog.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionChangelogSummaryValue':
          return VersionChangelogSummaryValue.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VersionDiffEntry':
          return VersionDiffEntry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponAttachment':
          return WeaponAttachment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponAttachmentBarrelAttachment':
          return WeaponAttachmentBarrelAttachment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponAttachmentFlashlightProfile':
          return WeaponAttachmentFlashlightProfile.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponAttachmentIronSight':
          return WeaponAttachmentIronSight.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponAttachmentLaserPointer':
          return WeaponAttachmentLaserPointer.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponAttachmentMagazine':
          return WeaponAttachmentMagazine.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponAttachmentRgbColor':
          return WeaponAttachmentRgbColor.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponDamage':
          return WeaponDamage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponDamageEntry':
          return WeaponDamageEntry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponModifier':
          return WeaponModifier.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponModifierAim':
          return WeaponModifierAim.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponModifierBase':
          return WeaponModifierBase.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponModifierRecoil':
          return WeaponModifierRecoil.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponModifierRegen':
          return WeaponModifierRegen.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponModifierSalvage':
          return WeaponModifierSalvage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponModifierSpread':
          return WeaponModifierSpread.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponModifierZeroing':
          return WeaponModifierZeroing.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WeaponRack':
          return WeaponRack.fromJson(value as Map<String, dynamic>) as ReturnType;
        default:
          RegExpMatch? match;

          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toList(growable: growable) as ReturnType;
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toSet() as ReturnType;
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match![1]!.trim(); // ignore: parameter_assignments
            return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable)),
            ) as ReturnType;
          }
          break;
    }
    throw Exception('Cannot deserialize');
  }