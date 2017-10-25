{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 505.0, 453.0, 1079.0, 791.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 501.950012, 633.0, 92.0, 22.0 ],
					"style" : "",
					"text" : "r ---is_midi_clip"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 24.0,
					"id" : "obj-21",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 524.865295, 716.0, 211.950012, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 9.200012, 89.5, 210.0, 34.0 ],
					"style" : "",
					"text" : "Select a MIDI clip",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.101961, 0.0, 0.0, 0.85098 ],
					"id" : "obj-2",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 501.950012, 712.0, 220.448669, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ -0.549988, 0.0, 249.5, 224.0 ],
					"proportion" : 0.292271,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 501.950012, 676.0, 63.0, 22.0 ],
					"style" : "",
					"text" : "hidden $1"
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-102",
					"linecount" : 4,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 696.650024, 74.0, 123.0, 64.0 ],
					"presentation" : 1,
					"presentation_linecount" : 4,
					"presentation_rect" : [ 203.200012, 60.5, 123.0, 64.0 ],
					"style" : "",
					"text" : "window flags menu, window flags nofloat, window flags grow, window exec"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 36.0, 138.0, 43.0, 22.0 ],
					"style" : "",
					"text" : "* -240"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 93.0, 255.0, 66.0, 22.0 ],
					"style" : "",
					"text" : "offset $1 0"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-1",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 101.0, 336.5, 234.0, 292.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 56.200012, 13.125, 239.0, 289.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"bordercolor" : [ 0.862745, 0.870588, 0.878431, 0.0 ],
					"focusbordercolor" : [ 0.862745, 0.870588, 0.878431, 0.0 ],
					"fontface" : 3,
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "live.tab",
					"num_lines_patching" : 1,
					"num_lines_presentation" : 4,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 36.0, 54.0, 213.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 13.450012, 9.5, 45.0, 137.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.tab[2]",
							"parameter_shortname" : "live.tab",
							"parameter_type" : 2,
							"parameter_enum" : [ "slide", "swap", "set", "chop" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0 ],
							"parameter_unitstyle" : 0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.tab[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-105",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 709.150024, 47.0, 98.0, 20.0 ],
					"style" : "",
					"text" : "for developing:"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 623.315308, 248.0, 38.0, 22.0 ],
					"style" : "",
					"text" : "- 100"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 584.815308, 248.0, 31.0, 22.0 ],
					"style" : "",
					"text" : "- 75"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 702.232056, 302.5, 41.0, 22.0 ],
					"style" : "",
					"text" : "+ 400"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 650.398682, 302.5, 41.0, 22.0 ],
					"style" : "",
					"text" : "+ 400"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 584.815308, 302.5, 29.5, 22.0 ],
					"style" : "",
					"text" : "t i i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 584.981934, 345.5, 136.250122, 22.0 ],
					"style" : "",
					"text" : "pack i i i i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 546.315308, 175.5, 24.0, 22.0 ],
					"style" : "",
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "int", "int", "int", "int", "int" ],
					"patching_rect" : [ 546.315308, 209.5, 173.000061, 22.0 ],
					"style" : "",
					"text" : "mousestate"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-73",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 583.315308, 138.5, 61.0, 34.0 ],
					"style" : "",
					"text" : "open this window"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-74",
					"linecount" : 5,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 584.981934, 378.5, 147.0, 77.0 ],
					"style" : "",
					"text" : "window flags nomenu, window flags float, window flags nogrow, window size $1 $2 $3 $4, window exec, front"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 584.981934, 478.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-77",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 546.315308, 128.5, 34.0, 34.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.462745, 0.470588, 0.490196, 1.0 ],
					"id" : "obj-66",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 116.0, 92.0, 128.0, 128.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 56.200012, 11.5, 243.0, 298.25 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"order" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 1 ],
					"order" : 1,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"order" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"order" : 1,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 1,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"order" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 3 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 2 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-69", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-69", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-1::obj-3::obj-110" : [ "live.text[26]", "live.text[6]", 0 ],
			"obj-1::obj-3::obj-168" : [ "velocity range[20]", "velrange", 0 ],
			"obj-1::obj-8::obj-134" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-1::obj-8::obj-107" : [ "live.text[14]", "live.text[2]", 0 ],
			"obj-1::obj-3::obj-156" : [ "live.text[25]", "live.text[6]", 0 ],
			"obj-1::obj-8::obj-50" : [ "velocity range[7]", "velrange", 0 ],
			"obj-1::obj-8::obj-135" : [ "velocity range[17]", "velrange", 0 ],
			"obj-1::obj-3::obj-40" : [ "live.text[31]", "live.text[2]", 0 ],
			"obj-1::obj-8::obj-131" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-1::obj-11::obj-108" : [ "live.text[15]", "live.text[2]", 0 ],
			"obj-1::obj-11::obj-15" : [ "live.menu[6]", "live.menu[5]", 0 ],
			"obj-1::obj-11::obj-144" : [ "velocity range[19]", "velrange", 0 ],
			"obj-1::obj-8::obj-42" : [ "live.menu[1]", "live.menu[1]", 0 ],
			"obj-1::obj-10::obj-197" : [ "live.menu[20]", "live.menu", 0 ],
			"obj-1::obj-11::obj-104" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-1::obj-8::obj-45" : [ "live.menu[5]", "live.menu[5]", 0 ],
			"obj-1::obj-11::obj-143" : [ "live.text[12]", "live.text[2]", 0 ],
			"obj-1::obj-10::obj-198" : [ "velocity range[24]", "velrange", 0 ],
			"obj-1::obj-11::obj-106" : [ "velocity range[15]", "velrange", 0 ],
			"obj-1::obj-11::obj-142" : [ "velocity range[18]", "velrange", 0 ],
			"obj-1::obj-11::obj-141" : [ "velocity range[12]", "velrange", 0 ],
			"obj-1::obj-3::obj-139" : [ "live.menu[24]", "live.menu[5]", 0 ],
			"obj-1::obj-10::obj-189" : [ "live.menu[19]", "live.menu", 0 ],
			"obj-1::obj-3::obj-64" : [ "live.text[27]", "live.text[2]", 0 ],
			"obj-1::obj-10::obj-190" : [ "velocity range[21]", "velrange", 0 ],
			"obj-1::obj-3::obj-65" : [ "live.text[28]", "live.text[2]", 0 ],
			"obj-1::obj-10::obj-201" : [ "live.menu[21]", "live.menu[1]", 0 ],
			"obj-1::obj-10::obj-191" : [ "live.text[21]", "live.text[2]", 0 ],
			"obj-1::obj-11::obj-171" : [ "live.menu[16]", "live.menu[5]", 0 ],
			"obj-1::obj-3::obj-44" : [ "live.text[29]", "live.text[6]", 0 ],
			"obj-1::obj-10::obj-192" : [ "velocity range[22]", "velrange", 0 ],
			"obj-1::obj-11::obj-155" : [ "live.text[19]", "live.text[2]", 0 ],
			"obj-1::obj-3::obj-43" : [ "live.text[30]", "live.text[2]", 0 ],
			"obj-1::obj-10::obj-179" : [ "live.menu[18]", "live.menu[1]", 0 ],
			"obj-1::obj-3::obj-169" : [ "live.text[24]", "live.text[2]", 0 ],
			"obj-1::obj-11::obj-154" : [ "live.text[18]", "live.text[2]", 0 ],
			"obj-20" : [ "live.tab[2]", "live.tab", 0 ],
			"obj-1::obj-3::obj-164" : [ "live.menu[23]", "live.menu[5]", 0 ],
			"obj-1::obj-11::obj-62" : [ "live.text[10]", "live.text[6]", 0 ],
			"obj-1::obj-11::obj-25" : [ "velocity range[9]", "velrange", 0 ],
			"obj-1::obj-8::obj-132" : [ "velocity range[16]", "velrange", 0 ],
			"obj-1::obj-8::obj-11" : [ "velocity range[5]", "velrange", 0 ],
			"obj-1::obj-8::obj-111" : [ "live.menu[8]", "live.menu[5]", 0 ],
			"obj-1::obj-10::obj-199" : [ "live.text[23]", "live.text[2]", 0 ],
			"obj-1::obj-3::obj-172" : [ "velocity range[13]", "velrange", 0 ],
			"obj-1::obj-10::obj-195" : [ "live.text[22]", "live.text[6]", 0 ],
			"obj-1::obj-8::obj-98" : [ "live.text[11]", "live.text[2]", 0 ],
			"obj-1::obj-3::obj-167" : [ "live.menu[22]", "live.menu", 0 ],
			"obj-1::obj-10::obj-194" : [ "velocity range[23]", "velrange", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "ui.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/sculptor-device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-swap.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/sculptor-device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-slide.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/sculptor-device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-set.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/sculptor-device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-chop.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/sculptor-device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "newobjBlue-1",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-1",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-1",
				"default" : 				{
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ],
					"fontsize" : [ 12.059008 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
