/datum/signal_ability/flicker
	name = "Flicker"
	id = "flicker"
	desc = "Causes a targeted light to flicker"
	energy_cost = 20

	target_types = list(/obj/machinery/light)

	targeting_method	=	TARGET_CLICK


/datum/signal_ability/flicker/on_cast(var/atom/target, var/mob/user, var/list/data)
	var/obj/machinery/light/L = target
	L.flicker()


/datum/signal_ability/flicker/mass
	name = "Flicker, Mass"
	id = "flickermass"
	desc = "Causes all lights in an area to flicker"
	energy_cost = 120

	target_types = list(/turf)

	targeting_method	=	TARGET_CLICK

/datum/signal_ability/flicker/mass/on_cast(var/atom/target, var/mob/user, var/list/data)
	var/list/lights = list()
	for (var/obj/machinery/light/L in view(world.view, target))
		lights |= L

	var/area/A = get_area(target)
	for (var/obj/machinery/light/L in A)
		lights |= L


	for (var/obj/machinery/light/L as anything in lights)
		L.flicker()