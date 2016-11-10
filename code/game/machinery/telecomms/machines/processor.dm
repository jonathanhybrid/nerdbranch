
/*
	The processor is a very simple machine that decompresses subspace signals and
	transfers them back to the original bus. It is essential in producing audible
	data.

	Link to servers if bus is not present
*/

/obj/machinery/telecomms/processor
	name = "processor unit"
	icon_state = "processor"
	desc = "This machine is used to process large quantities of information."
	density = 1
	anchored = 1
	use_power = 1
	idle_power_usage = 30
	machinetype = 3
	//heatgen = 100
	//delay = 5
	circuitboard = "/obj/item/weapon/circuitboard/telecomms/processor"
	var/process_mode = 1 // 1 = Uncompress Signals, 0 = Compress Signals

/obj/machinery/telecomms/processor/receive_information(datum/signal/signal, obj/machinery/telecomms/machine_from)

	if(is_freq_listening(signal))

		if(process_mode)
			signal.data["compression"] = 0 // uncompress subspace signal
		else
			signal.data["compression"] = 100 // even more compressed signal

		if(istype(machine_from, /obj/machinery/telecomms/bus))
			relay_direct_information(signal, machine_from) // send the signal back to the machine
		else // no bus detected - send the signal to servers instead
			signal.data["slow"] += rand(5, 10) // slow the signal down
			relay_information(signal, "/obj/machinery/telecomms/server")

/obj/machinery/telecomms/processor/New()
	..()
	component_parts = list()
	component_parts += new /obj/item/weapon/circuitboard/telecomms/processor(null)
	component_parts += new /obj/item/weapon/stock_parts/subspace/filter(null)
	component_parts += new /obj/item/weapon/stock_parts/subspace/treatment(null)
	component_parts += new /obj/item/weapon/stock_parts/subspace/treatment(null)
	component_parts += new /obj/item/weapon/stock_parts/subspace/analyzer(null)
	component_parts += new /obj/item/weapon/stock_parts/subspace/amplifier(null)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(null)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(null)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(null)
	component_parts += new /obj/item/stack/cable_coil(null, 2)
	RefreshParts()






//Preset Processors

/obj/machinery/telecomms/processor/preset_one
	id = "Processor 1"
	network = "tcommsat"
	autolinkers = list("processor1") // processors are sort of isolated; they don't need backward links

/obj/machinery/telecomms/processor/preset_two
	id = "Processor 2"
	network = "tcommsat"
	autolinkers = list("processor2")

/obj/machinery/telecomms/processor/preset_three
	id = "Processor 3"
	network = "tcommsat"
	autolinkers = list("processor3")

/obj/machinery/telecomms/processor/preset_four
	id = "Processor 4"
	network = "tcommsat"
	autolinkers = list("processor4")

