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
		"rect" : [ 180.0, 841.0, 1136.0, 450.0 ],
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
					"id" : "obj-11",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui-split.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 816.0, 8.0, 264.0, 304.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 728.0, 1.0, 260.383179, 276.0 ],
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
					"presentation_rect" : [ 480.0, -1.0, 241.0, 298.0 ],
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
					"presentation_rect" : [ 0.383179, 0.0, 231.616821, 248.0 ],
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
					"presentation_rect" : [ 241.0, 4.0, 240.0, 272.0 ],
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
					"style" : "",
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
					"patching_rect" : [ 136.0, 328.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.603922, 0.631373, 0.576471, 0.0 ],
					"id" : "obj-6",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 560.0, 320.0, 64.0, 64.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 482.0, 0.0, 240.0, 300.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.603922, 0.631373, 0.576471, 0.0 ],
					"id" : "obj-7",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 824.0, 328.0, 64.0, 64.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 724.383179, 0.0, 240.0, 300.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.603922, 0.631373, 0.576471, 0.0 ],
					"id" : "obj-4",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 32.0, 320.0, 64.0, 64.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.383179, 0.0, 240.0, 300.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.603922, 0.631373, 0.576471, 0.0 ],
					"id" : "obj-5",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 256.0, 312.0, 64.0, 64.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 240.0, 0.0, 240.0, 300.0 ],
					"proportion" : 0.39,
					"style" : ""
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
			"obj-8::obj-42" : [ "live.menu[2]", "live.menu[1]", 0 ],
			"obj-10::obj-11" : [ "live.text", "live.text", 0 ],
			"obj-10::obj-4::obj-199" : [ "live.text[24]", "live.text[2]", 0 ],
			"obj-10::obj-4::obj-201" : [ "live.menu[21]", "live.menu[1]", 0 ],
			"obj-10::obj-34" : [ "live.grid", "live.grid", 0 ],
			"obj-8::obj-11::obj-135" : [ "velocity range[1]", "velrange", 0 ],
			"obj-8::obj-11::obj-131" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-11::obj-154" : [ "live.text[18]", "live.text[2]", 0 ],
			"obj-3::obj-44" : [ "live.text[6]", "live.text[6]", 0 ],
			"obj-3::obj-139" : [ "live.menu[13]", "live.menu[5]", 0 ],
			"obj-8::obj-11::obj-132" : [ "velocity range[16]", "velrange", 0 ],
			"obj-10::obj-28::obj-199" : [ "live.text[2]", "live.text[2]", 0 ],
			"obj-10::obj-28::obj-1" : [ "velocity range[3]", "velrange", 0 ],
			"obj-8::obj-11::obj-134" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-3::obj-31::obj-168" : [ "velocity range[10]", "velrange", 0 ],
			"obj-8::obj-11::obj-11" : [ "velocity range[5]", "velrange", 0 ],
			"obj-3::obj-22" : [ "live.menu[1]", "live.menu[5]", 0 ],
			"obj-3::obj-110" : [ "live.text[16]", "live.text[6]", 0 ],
			"obj-10::obj-179" : [ "live.menu[18]", "live.menu[1]", 0 ],
			"obj-11::obj-25" : [ "velocity range[9]", "velrange", 0 ],
			"obj-11::obj-171" : [ "live.menu[23]", "live.menu[5]", 0 ],
			"obj-10::obj-4::obj-194" : [ "velocity range[23]", "velrange", 0 ],
			"obj-8::obj-45" : [ "live.menu[5]", "live.menu[5]", 0 ],
			"obj-10::obj-28::obj-198" : [ "velocity range[2]", "velrange", 0 ],
			"obj-10::obj-4::obj-192" : [ "velocity range[22]", "velrange", 0 ],
			"obj-10::obj-28::obj-197" : [ "live.menu[16]", "live.menu", 0 ],
			"obj-10::obj-45" : [ "live.menu[3]", "live.menu[1]", 0 ],
			"obj-3::obj-31::obj-164" : [ "live.menu[14]", "live.menu[5]", 0 ],
			"obj-11::obj-62" : [ "live.text[10]", "live.text[6]", 0 ],
			"obj-11::obj-15" : [ "live.menu[24]", "live.menu[5]", 0 ],
			"obj-3::obj-31::obj-169" : [ "live.text[13]", "live.text[2]", 0 ],
			"obj-10::obj-4::obj-197" : [ "live.menu[22]", "live.menu", 0 ],
			"obj-10::obj-4::obj-198" : [ "velocity range[29]", "velrange", 0 ],
			"obj-3::obj-31::obj-5" : [ "offset", "offset", 0 ],
			"obj-3::obj-31::obj-167" : [ "live.menu[15]", "live.menu", 0 ],
			"obj-8::obj-11::obj-98" : [ "live.text[11]", "live.text[2]", 0 ],
			"obj-8::obj-11::obj-107" : [ "live.text[14]", "live.text[2]", 0 ],
			"obj-10::obj-38" : [ " ", "Pattern Length", 0 ],
			"obj-3::obj-156" : [ "live.text[20]", "live.text[6]", 0 ],
			"obj-10::obj-4::obj-2" : [ "live.menu[6]", "live.menu", 0 ],
			"obj-8::obj-11::obj-50" : [ "velocity range[7]", "velrange", 0 ],
			"obj-10::obj-4::obj-4" : [ "live.text[1]", "live.text[2]", 0 ],
			"obj-10::obj-4::obj-3" : [ "velocity range[26]", "velrange", 0 ],
			"obj-3::obj-6" : [ "live.text[9]", "live.text[6]", 0 ],
			"obj-3::obj-31::obj-172" : [ "velocity range[28]", "velrange", 0 ],
			"obj-8::obj-111" : [ "live.menu[8]", "live.menu[5]", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "ui-swap.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-swap-grouping.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "covert-to-beats.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-slide.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-slide-range.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-set.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-set-pattern-unit.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-set-value.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-split.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/device",
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
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
