{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 3,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 409.0, 84.0, 1136.0, 1171.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 8.0, 8.0 ],
		"gridsnaponopen" : 2,
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
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-4",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui-strum.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 264.0, 328.0, 280.0, 280.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 720.0, 0.0, 240.0, 248.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-11",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui-split.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 552.0, 336.0, 264.0, 304.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 960.0, 0.0, 240.0, 248.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-10",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui-set.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 552.0, 8.0, 256.0, 304.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 480.0, 0.0, 240.0, 248.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-8",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui-slide.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 0.0, 8.0, 256.0, 280.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 240.0, 248.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-3",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui-swap.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 264.0, 8.0, 272.0, 280.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 240.0, 0.0, 240.0, 248.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 136.0, 376.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-1",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 136.0, 328.0, 30.0, 30.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-3::obj-11" : [ "live.text[13]", "live.text", 0 ],
			"obj-11::obj-2" : [ "live.tab[2]", "live.tab", 0 ],
			"obj-4::obj-11::obj-11" : [ "velocity range[28]", "velrange", 0 ],
			"obj-10::obj-4::obj-198" : [ "velocity range[29]", "velrange", 0 ],
			"obj-10::obj-11" : [ "live.text[2]", "live.text", 0 ],
			"obj-4::obj-11::obj-50" : [ "pitchrange", "pitchrange", 0 ],
			"obj-11::obj-62" : [ "live.text[10]", "live.text[6]", 0 ],
			"obj-4::obj-11::obj-132" : [ "velocity range[27]", "velrange", 0 ],
			"obj-8::obj-35" : [ "live.tab[1]", "live.tab", 0 ],
			"obj-8::obj-11::obj-131" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-11::obj-5::obj-144" : [ "velocity range[19]", "velrange", 0 ],
			"obj-11::obj-25" : [ "velocity range[9]", "velrange", 0 ],
			"obj-11::obj-5::obj-21" : [ "velocity range[2]", "velrange", 0 ],
			"obj-3::obj-6" : [ "live.text[9]", "live.text[6]", 0 ],
			"obj-10::obj-4::obj-199" : [ "live.text[24]", "live.text[2]", 0 ],
			"obj-4::obj-11::obj-131" : [ "live.menu[12]", "live.menu", 0 ],
			"obj-3::obj-156" : [ "live.text[20]", "live.text[6]", 0 ],
			"obj-3::obj-10" : [ "live.text[1]", "live.text", 0 ],
			"obj-4::obj-11::obj-98" : [ "live.text[25]", "live.text[2]", 0 ],
			"obj-10::obj-179" : [ "live.menu[18]", "live.menu[1]", 0 ],
			"obj-11::obj-5::obj-198" : [ "velocity range[24]", "velrange", 0 ],
			"obj-4::obj-11::obj-135" : [ "velocity range[17]", "velrange", 0 ],
			"obj-11::obj-5::obj-199" : [ "live.text[23]", "live.text[2]", 0 ],
			"obj-10::obj-4::obj-4" : [ "live.text[12]", "live.text[2]", 0 ],
			"obj-8::obj-11::obj-132" : [ "velocity range[16]", "velrange", 0 ],
			"obj-4::obj-35" : [ "live.tab[3]", "live.tab", 0 ],
			"obj-10::obj-4::obj-201" : [ "live.menu[21]", "live.menu[1]", 0 ],
			"obj-10::obj-4::obj-2" : [ "live.menu[6]", "live.menu", 0 ],
			"obj-10::obj-4::obj-192" : [ "velocity range[22]", "velrange", 0 ],
			"obj-3::obj-110" : [ "live.text[16]", "live.text[6]", 0 ],
			"obj-8::obj-11::obj-135" : [ "velocity range[1]", "velrange", 0 ],
			"obj-8::obj-22" : [ "live.tab", "live.tab", 0 ],
			"obj-4::obj-11::obj-107" : [ "live.text[26]", "live.text[2]", 0 ],
			"obj-3::obj-44" : [ "live.text[6]", "live.text[6]", 0 ],
			"obj-4::obj-11::obj-134" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-8::obj-11::obj-11" : [ "velocity range[5]", "velrange", 0 ],
			"obj-11::obj-5::obj-197" : [ "live.menu[20]", "live.menu", 0 ],
			"obj-8::obj-11::obj-50" : [ "velocity range[7]", "velrange", 0 ],
			"obj-11::obj-5::obj-142" : [ "velocity range[18]", "velrange", 0 ],
			"obj-11::obj-5::obj-27" : [ "live.text[15]", "live.text[2]", 0 ],
			"obj-11::obj-5::obj-141" : [ "velocity range[12]", "velrange", 0 ],
			"obj-8::obj-11::obj-98" : [ "live.text[11]", "live.text[2]", 0 ],
			"obj-10::obj-4::obj-197" : [ "live.menu[22]", "live.menu", 0 ],
			"obj-10::obj-4::obj-3" : [ "velocity range[26]", "velrange", 0 ],
			"obj-11::obj-15" : [ "live.menu[24]", "live.menu[5]", 0 ],
			"obj-8::obj-42" : [ "live.menu[2]", "live.menu[1]", 0 ],
			"obj-8::obj-11::obj-107" : [ "live.text[14]", "live.text[2]", 0 ],
			"obj-10::obj-4::obj-194" : [ "velocity range[23]", "velrange", 0 ],
			"obj-8::obj-11::obj-134" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-3::obj-7" : [ "live.text", "live.text", 0 ],
			"obj-11::obj-5::obj-20" : [ "velocity range[25]", "velrange", 0 ],
			"parameterbanks" : 			{

			}
,
			"parameter_overrides" : 			{
				"obj-11::obj-2" : 				{
					"parameter_longname" : "live.tab[2]"
				}
,
				"obj-4::obj-11::obj-11" : 				{
					"parameter_longname" : "velocity range[28]"
				}
,
				"obj-10::obj-4::obj-198" : 				{
					"parameter_longname" : "velocity range[29]"
				}
,
				"obj-10::obj-11" : 				{
					"parameter_longname" : "live.text[2]",
					"parameter_shortname" : "live.text"
				}
,
				"obj-4::obj-11::obj-132" : 				{
					"parameter_longname" : "velocity range[27]"
				}
,
				"obj-10::obj-4::obj-199" : 				{
					"parameter_longname" : "live.text[24]"
				}
,
				"obj-4::obj-11::obj-131" : 				{
					"parameter_longname" : "live.menu[12]"
				}
,
				"obj-4::obj-11::obj-98" : 				{
					"parameter_longname" : "live.text[25]"
				}
,
				"obj-10::obj-179" : 				{
					"parameter_longname" : "live.menu[18]",
					"parameter_shortname" : "live.menu[1]"
				}
,
				"obj-10::obj-4::obj-4" : 				{
					"parameter_longname" : "live.text[12]"
				}
,
				"obj-4::obj-35" : 				{
					"parameter_longname" : "live.tab[3]"
				}
,
				"obj-10::obj-4::obj-201" : 				{
					"parameter_longname" : "live.menu[21]",
					"parameter_shortname" : "live.menu[1]"
				}
,
				"obj-10::obj-4::obj-2" : 				{
					"parameter_longname" : "live.menu[6]"
				}
,
				"obj-10::obj-4::obj-192" : 				{
					"parameter_longname" : "velocity range[22]",
					"parameter_shortname" : "velrange"
				}
,
				"obj-8::obj-11::obj-135" : 				{
					"parameter_longname" : "velocity range[1]"
				}
,
				"obj-4::obj-11::obj-107" : 				{
					"parameter_longname" : "live.text[26]"
				}
,
				"obj-4::obj-11::obj-134" : 				{
					"parameter_longname" : "live.menu[7]"
				}
,
				"obj-8::obj-11::obj-50" : 				{
					"parameter_longname" : "velocity range[7]",
					"parameter_shortname" : "velrange"
				}
,
				"obj-11::obj-5::obj-27" : 				{
					"parameter_longname" : "live.text[15]"
				}
,
				"obj-10::obj-4::obj-197" : 				{
					"parameter_longname" : "live.menu[22]"
				}
,
				"obj-10::obj-4::obj-3" : 				{
					"parameter_longname" : "velocity range[26]"
				}
,
				"obj-11::obj-15" : 				{
					"parameter_longname" : "live.menu[24]"
				}
,
				"obj-8::obj-42" : 				{
					"parameter_longname" : "live.menu[2]"
				}
,
				"obj-10::obj-4::obj-194" : 				{
					"parameter_longname" : "velocity range[23]",
					"parameter_shortname" : "velrange"
				}
,
				"obj-11::obj-5::obj-20" : 				{
					"parameter_longname" : "velocity range[25]"
				}

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "ui-swap.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-slide.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-slide-range.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "covert-to-beats.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "icon-clip.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-reflect.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-rotate.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-remove.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-anchor-start.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-anchor-mid.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-anchor-end.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "ui-set.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-set-value.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-split.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-split-into.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "icon-envelope-none.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-envelope-fade-in.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-envelope-fade-out.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-envelope-ramp-up.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-envelope-ramp-down.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "ui-strum.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
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
